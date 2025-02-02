unit viaCep;

interface

uses
  System.JSON, System.Net.HttpClient, System.RegularExpressions, Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TCep = class(TForm)
    FDConnection1: TFDConnection;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    FDTable1: TFDTable;
    DataSource1: TDataSource;
    EditCEP: TEdit;
    ButtonBuscarCEP: TButton;
    LabelLogradouro: TLabel;
    LabelComplemento: TLabel;
    LabelBairro: TLabel;
    LabelLocalidade: TLabel;
    LabelUF: TLabel;
    LabelIBGE: TLabel;
    LabelGia: TLabel;
    LabelDDD: TLabel;
    LabelSiafi: TLabel;
    LabelCEP: TLabel;
    Label1: TLabel;
    procedure ButtonBuscarCEPClick(Sender: TObject);
  private
    procedure ConsultarCep(CEP: string);
  public
  end;

var
  Cep: TCep;

implementation

{$R *.dfm}

procedure TCep.ButtonBuscarCEPClick(Sender: TObject);
begin
  ConsultarCep(EditCEP.Text);
end;

procedure TCep.ConsultarCep(CEP: string);
var
  HttpClient: THTTPClient;
  Response: IHTTPResponse;
  JSONObj: TJSONObject;
  URL, Logradouro, Complemento, Bairro, Localidade, UF, Ibge, Gia, Ddd, Siafi: string;
begin
  CEP := TRegEx.Replace(CEP, '[^\d]', '');

  if Length(CEP) <> 8 then
  begin
    ShowMessage('CEP inv�lido. Por favor, insira um CEP com 8 d�gitos.');
    Exit;
  end;

  URL := 'https://viacep.com.br/ws/' + CEP + '/json/';

  HttpClient := THTTPClient.Create;
  try
    Response := HttpClient.Get(URL);

    if Response.StatusCode = 200 then
    begin

      JSONObj := TJSONObject.ParseJSONValue(Response.ContentAsString) as TJSONObject;

      if Assigned(JSONObj) then
      begin
        Logradouro := JSONObj.GetValue<string>('logradouro');
        Complemento := JSONObj.GetValue<string>('complemento');
        Bairro := JSONObj.GetValue<string>('bairro');
        Localidade := JSONObj.GetValue<string>('localidade');
        UF := JSONObj.GetValue<string>('uf');
        Ibge := JSONObj.GetValue<string>('ibge');
        Gia := JSONObj.GetValue<string>('gia');
        Ddd := JSONObj.GetValue<string>('ddd');
        Siafi := JSONObj.GetValue<string>('siafi');

        LabelCEP.Caption := 'Cep: ' + CEP;
        LabelLogradouro.Caption := 'Logradouro: ' + Logradouro;
        LabelComplemento.Caption := 'Complemento: ' + Complemento;
        LabelBairro.Caption := 'Bairro: ' + Bairro;
        LabelLocalidade.Caption := 'Localidade: ' + Localidade;
        LabelUF.Caption := 'UF: ' + UF;
        LabelIBGE.Caption := 'IBGE: ' + Ibge;
        LabelGia.Caption := 'GIA: ' + Gia;
        LabelDDD.Caption := 'DDD: ' + Ddd;
        LabelSiafi.Caption := 'Siafi: ' + Siafi;

        FDTable1.Close;
        FDTable1.TableName := 'TspdCep';
        FDTable1.Open;
        if FDTable1.Locate('cep', CEP, []) then
        begin
          FDTable1.Edit;
        end
        else
        begin
          FDTable1.Append;
        end;

        FDTable1.FieldByName('cep').AsString := CEP;
        FDTable1.FieldByName('logradouro').AsString := Logradouro;
        FDTable1.FieldByName('complemento').AsString := Complemento;
        FDTable1.FieldByName('bairro').AsString := Bairro;
        FDTable1.FieldByName('localidade').AsString := Localidade;
        FDTable1.FieldByName('uf').AsString := UF;
        FDTable1.FieldByName('ibge').AsString := Ibge;
        FDTable1.FieldByName('gia').AsString := Gia;
        FDTable1.FieldByName('ddd').AsString := Ddd;
        FDTable1.FieldByName('siafi').AsString := Siafi;
        FDTable1.Post;
      end;
    end
    else
    begin
      ShowMessage('Erro ao consultar o CEP: ' + IntToStr(Response.StatusCode));
    end;
  finally
    HttpClient.Free;
  end;
end;

end.

