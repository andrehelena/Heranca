object Form_Padrao: TForm_Padrao
  Left = 0
  Top = 0
  Caption = 'Form_Padrao'
  ClientHeight = 558
  ClientWidth = 929
  Color = clBtnFace
  DefaultMonitor = dmMainForm
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 0
    Top = 57
    Width = 929
    Height = 501
    Align = alClient
    Stretch = True
    ExplicitLeft = 1
    ExplicitTop = 62
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 929
    Height = 57
    Align = alTop
    TabOrder = 0
    object SpeedButton1: TSpeedButton
      Left = 1
      Top = 1
      Width = 64
      Height = 55
      Align = alLeft
      Caption = 'Exit'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = SpeedButton1Click
      ExplicitLeft = 0
      ExplicitTop = -4
    end
  end
  object MainMenu1: TMainMenu
    Left = 560
    Top = 16
    object Cadastro1: TMenuItem
      Caption = 'Cadastro'
    end
    object Pesquisa1: TMenuItem
      Caption = 'Pesquisa'
    end
    object Sair1: TMenuItem
      Caption = 'Sair'
      OnClick = Sair1Click
    end
  end
end
