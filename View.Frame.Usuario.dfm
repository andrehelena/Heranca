object Frame_Usuario: TFrame_Usuario
  Left = 0
  Top = 0
  Width = 348
  Height = 129
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Tahoma'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object LabeledEdit_Usuario: TLabeledEdit
    Left = 6
    Top = 26
    Width = 271
    Height = 31
    EditLabel.Width = 62
    EditLabel.Height = 23
    EditLabel.Caption = 'Usu'#225'rio'
    TabOrder = 0
  end
  object Button_Consulta: TButton
    Left = 283
    Top = 26
    Width = 49
    Height = 31
    Caption = 'Psq'
    TabOrder = 1
    OnClick = Button_ConsultaClick
  end
  object LabeledEdit_Nome: TLabeledEdit
    Left = 6
    Top = 86
    Width = 271
    Height = 31
    EditLabel.Width = 49
    EditLabel.Height = 23
    EditLabel.Caption = 'Nome'
    TabOrder = 2
  end
end
