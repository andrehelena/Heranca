inherited Form_PesquisaProduto: TForm_PesquisaProduto
  Caption = 'Form_PesquisaProduto'
  PixelsPerInch = 96
  TextHeight = 23
  inherited Panel_FundoTotal: TPanel
    inherited Panel_Fundo: TPanel
      inherited DBGrid1: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Width = 81
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Descricao'
            Width = 367
            Visible = True
          end>
      end
    end
  end
end
