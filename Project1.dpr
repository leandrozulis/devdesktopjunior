program Project1;

uses
  Vcl.Forms,
  viaCep in 'viaCep.pas' {Cep},
  test_viaCep in 'test_viaCep.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TCep, Cep);
  Application.Run;
end.
