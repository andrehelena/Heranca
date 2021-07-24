inherited Form_Cadastro_Usuario: TForm_Cadastro_Usuario
  Caption = 'Form_Cadastro_Usuario'
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 23
  inherited Panel_FundoTotal: TPanel
    ParentBackground = False
    ParentColor = False
    inherited Panel_Inferior: TPanel
      inherited Panel_Sair: TPanel
        inherited Button_Sair: TSpeedButton
          Caption = '&Sair'
          OnClick = Button_SairClick
        end
      end
      inherited Panel_Pesquisar: TPanel
        inherited Button_Pesquisar: TSpeedButton
          OnClick = Button_PesquisarClick
        end
      end
      inherited Panel_Confirma: TPanel
        inherited Button_Confirma: TSpeedButton
          Caption = '&Confirmar'
        end
      end
    end
    inherited Panel_Fundo: TPanel
      inline Frame_CadUsuario: TFrame_Usuario
        Left = 39
        Top = 16
        Width = 348
        Height = 129
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        ExplicitLeft = 39
        ExplicitTop = 16
        inherited Button_Consulta: TButton
          Visible = False
          OnClick = Frame_CadUsuarioButton_ConsultaClick
        end
      end
      object DBComboBox1: TDBComboBox
        Left = 45
        Top = 151
        Width = 145
        Height = 31
        DataField = 'UF_Nome'
        DataSource = DataSource_Estados
        TabOrder = 1
        Visible = False
      end
      object DBComboBox2: TDBComboBox
        Left = 213
        Top = 151
        Width = 145
        Height = 31
        DataField = 'Cid_Nome'
        DataSource = DataSource_Cidades
        TabOrder = 2
        Visible = False
      end
      object Panel1: TPanel
        Left = 446
        Top = 138
        Width = 95
        Height = 59
        BevelOuter = bvNone
        TabOrder = 3
        Visible = False
        object Shape1: TShape
          Left = 0
          Top = 0
          Width = 95
          Height = 59
          Align = alClient
          Pen.Color = clRed
          Shape = stRoundRect
          ExplicitLeft = 40
          ExplicitWidth = 65
          ExplicitHeight = 65
        end
        object SpeedButton1: TSpeedButton
          Left = 0
          Top = 0
          Width = 95
          Height = 59
          Align = alClient
          Caption = 'Load'
          Flat = True
          OnClick = SpeedButton1Click
          ExplicitTop = 1
        end
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 45
        Top = 188
        Width = 145
        Height = 31
        KeyField = 'UF_Sigla'
        ListField = 'UF_Nome'
        ListSource = DataSource_Estados
        TabOrder = 4
        Visible = False
      end
      object DBLookupComboBox2: TDBLookupComboBox
        Left = 213
        Top = 188
        Width = 145
        Height = 31
        KeyField = 'Cid_Codigo'
        ListField = 'Cid_Nome'
        ListSource = DataSource_Cidades
        TabOrder = 5
        Visible = False
      end
    end
  end
  object FDQuery_Estados: TFDQuery
    Left = 64
    Top = 264
  end
  object FDQuery_Cidades: TFDQuery
    MasterSource = DataSource_Estados
    MasterFields = 'UF_Sigla'
    Left = 280
    Top = 272
  end
  object DataSource_Estados: TDataSource
    DataSet = FDQuery_Estados
    Left = 56
    Top = 320
  end
  object DataSource_Cidades: TDataSource
    DataSet = FDQuery_Cidades
    Left = 280
    Top = 328
  end
end
