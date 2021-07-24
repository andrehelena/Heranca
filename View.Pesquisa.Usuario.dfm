inherited Form_PesquisaUsuario: TForm_PesquisaUsuario
  Caption = 'Pesquisa de usu'#225'rio'
  PixelsPerInch = 96
  TextHeight = 23
  inherited Panel_FundoTotal: TPanel
    inherited Panel_Fundo: TPanel
      inherited DBGrid1: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'Login'
            Width = 123
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Nome'
            Width = 350
            Visible = True
          end>
      end
    end
  end
end
