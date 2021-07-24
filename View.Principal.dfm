inherited Form_Principal: TForm_Principal
  Caption = 'Aplica'#231#227'o Heran'#231'a Tela'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Image1: TImage
    Transparent = True
  end
  inherited Panel1: TPanel
    Color = clBtnShadow
    ParentBackground = False
  end
  inherited MainMenu1: TMainMenu
    inherited Cadastro1: TMenuItem
      object Usuario1: TMenuItem
        Caption = 'Usuario'
        OnClick = Usuario1Click
      end
      object JSONExemplo1: TMenuItem
        Caption = 'JSON - Exemplo'
        OnClick = JSONExemplo1Click
      end
    end
    inherited Pesquisa1: TMenuItem
      object Pedidos1: TMenuItem
        Caption = 'Pedidos'
        OnClick = Pedidos1Click
      end
    end
  end
end
