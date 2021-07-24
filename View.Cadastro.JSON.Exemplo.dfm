inherited Form_JSON_Exemplo: TForm_JSON_Exemplo
  Caption = 'JSON - Exemplo'
  ClientHeight = 721
  ClientWidth = 1049
  OnClose = FormClose
  ExplicitWidth = 1065
  ExplicitHeight = 760
  PixelsPerInch = 96
  TextHeight = 23
  inherited Panel_FundoTotal: TPanel
    Width = 1049
    Height = 721
    ExplicitWidth = 1038
    ExplicitHeight = 686
    inherited Shape_FundoTotal: TShape
      Width = 1049
      Height = 721
    end
    inherited Panel_Inferior: TPanel
      Left = 28
      Top = 622
      Width = 996
      Height = 66
      ExplicitLeft = 28
      ExplicitTop = 622
      ExplicitWidth = 996
      ExplicitHeight = 66
      inherited Panel_Sair: TPanel
        inherited Button_Sair: TSpeedButton
          OnClick = Button_SairClick
        end
      end
    end
    inherited Panel_Fundo: TPanel
      Left = 28
      Top = 28
      Width = 990
      Height = 581
      ExplicitLeft = 28
      ExplicitTop = 28
      ExplicitWidth = 990
      ExplicitHeight = 581
      object Label1: TLabel
        Left = 31
        Top = 11
        Width = 110
        Height = 23
        Caption = 'Consulta SQL'
      end
      object Label2: TLabel
        Left = 543
        Top = 11
        Width = 51
        Height = 23
        Caption = 'JSON '
      end
      object Memo_SQL: TMemo
        Left = 17
        Top = 40
        Width = 442
        Height = 539
        TabOrder = 0
      end
      object Memo_JSON: TMemo
        Left = 520
        Top = 40
        Width = 470
        Height = 539
        TabOrder = 1
      end
    end
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 512
    Top = 352
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 488
    Top = 416
  end
end
