object Form_Padrao_Form: TForm_Padrao_Form
  Left = 0
  Top = 0
  Caption = 'Formul'#225'rio Padr'#227'o'
  ClientHeight = 455
  ClientWidth = 643
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Visible = True
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 23
  object Panel_FundoTotal: TPanel
    Left = 0
    Top = 0
    Width = 643
    Height = 455
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object Shape_FundoTotal: TShape
      Left = 0
      Top = 0
      Width = 643
      Height = 455
      Align = alClient
      Brush.Style = bsClear
      Shape = stRoundRect
      ExplicitLeft = 2
      ExplicitTop = 2
      ExplicitWidth = 641
      ExplicitHeight = 453
    end
    object Panel_Fundo: TPanel
      Left = 12
      Top = 22
      Width = 617
      Height = 335
      Align = alCustom
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
    end
    object Panel_Inferior: TPanel
      Left = 12
      Top = 357
      Width = 617
      Height = 69
      Align = alCustom
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 1
    end
  end
end
