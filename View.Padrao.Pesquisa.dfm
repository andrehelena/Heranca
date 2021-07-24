inherited Form_Padrao_Pesquisa: TForm_Padrao_Pesquisa
  Caption = 'Form_Padrao_Pesquisa'
  DefaultMonitor = dmDesktop
  FormStyle = fsNormal
  Position = poDesktopCenter
  Visible = False
  PixelsPerInch = 96
  TextHeight = 23
  inherited Panel_FundoTotal: TPanel
    inherited Panel_Fundo: TPanel
      Top = 26
      ExplicitTop = 26
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 617
        Height = 335
        Align = alClient
        BorderStyle = bsNone
        DataSource = DataSource_Pesquisa
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -19
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
    inherited Panel_Inferior: TPanel
      object Panel_Confirmar: TPanel
        Left = 152
        Top = 6
        Width = 95
        Height = 59
        BevelOuter = bvNone
        TabOrder = 0
        object Shape_Confirma: TShape
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
        object Button_Confirmar: TSpeedButton
          Left = 0
          Top = 0
          Width = 95
          Height = 59
          Align = alClient
          Caption = 'Confirmar'
          Flat = True
          OnClick = Button_ConfirmarClick
          ExplicitLeft = 56
          ExplicitTop = 16
          ExplicitWidth = 23
          ExplicitHeight = 22
        end
      end
      object Panel_Sair: TPanel
        Left = 358
        Top = 6
        Width = 95
        Height = 59
        BevelOuter = bvNone
        TabOrder = 1
        object Shape_Sair: TShape
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
        object Button_Sair: TSpeedButton
          Left = 0
          Top = 0
          Width = 95
          Height = 59
          Align = alClient
          Caption = 'Sair'
          Flat = True
          OnClick = Button_SairClick
          ExplicitLeft = 56
          ExplicitTop = 16
          ExplicitWidth = 23
          ExplicitHeight = 22
        end
      end
      object Panel_Atualizar: TPanel
        Left = 255
        Top = 6
        Width = 95
        Height = 59
        BevelOuter = bvNone
        TabOrder = 2
        object Shape_Excluir: TShape
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
        object Button_Atualizar: TSpeedButton
          Left = 0
          Top = 0
          Width = 95
          Height = 59
          Align = alClient
          Caption = 'Atualizar'
          Flat = True
          OnClick = Button_AtualizarClick
          ExplicitLeft = 24
          ExplicitTop = 4
        end
      end
    end
  end
  object FDQuery_Pesquisa: TFDQuery
    Left = 312
    Top = 232
  end
  object DataSource_Pesquisa: TDataSource
    DataSet = FDQuery_Pesquisa
    Left = 328
    Top = 136
  end
end
