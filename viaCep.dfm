object Cep: TCep
  Left = 0
  Top = 0
  Caption = 'Cep'
  ClientHeight = 441
  ClientWidth = 741
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -27
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 37
  object LabelCEP: TLabel
    Left = 16
    Top = 166
    Width = 5
    Height = 28
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object LabelLogradouro: TLabel
    Left = 16
    Top = 200
    Width = 5
    Height = 28
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object LabelComplemento: TLabel
    Left = 16
    Top = 232
    Width = 5
    Height = 28
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object LabelBairro: TLabel
    Left = 16
    Top = 264
    Width = 5
    Height = 28
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object LabelLocalidade: TLabel
    Left = 16
    Top = 296
    Width = 5
    Height = 28
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object LabelUf: TLabel
    Left = 476
    Top = 294
    Width = 5
    Height = 28
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object LabelIbge: TLabel
    Left = 476
    Top = 198
    Width = 5
    Height = 28
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object LabelGia: TLabel
    Left = 476
    Top = 227
    Width = 5
    Height = 28
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object LabelDdd: TLabel
    Left = 476
    Top = 262
    Width = 5
    Height = 28
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object LabelSiafi: TLabel
    Left = 477
    Top = 166
    Width = 5
    Height = 28
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 16
    Top = 13
    Width = 167
    Height = 37
    Caption = 'Consulta CEP'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
  end
  object EditCEP: TEdit
    Left = 16
    Top = 56
    Width = 233
    Height = 45
    TabOrder = 0
  end
  object ButtonBuscarCEP: TButton
    Left = 280
    Top = 56
    Width = 145
    Height = 45
    Caption = 'Buscar CEP'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = ButtonBuscarCEPClick
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=viaCep'
      'User_Name=postgres'
      'Password=lele'
      'DriverID=PG')
    Connected = True
    Left = 664
    Top = 24
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorLib = 'C:\Program Files (x86)\PostgreSQL\psqlODBC\bin\libpq.dll'
    Left = 664
    Top = 88
  end
  object FDTable1: TFDTable
    Active = True
    IndexFieldNames = 'id'
    Connection = FDConnection1
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'tspdcep'
    Left = 664
    Top = 144
  end
  object DataSource1: TDataSource
    DataSet = FDTable1
    Left = 664
    Top = 200
  end
end
