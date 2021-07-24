inherited Form_Cadastro_Produto: TForm_Cadastro_Produto
  Caption = 'Cadastro produto'
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 23
  inherited Panel_FundoTotal: TPanel
    inherited Panel_Inferior: TPanel
      inherited Panel_Sair: TPanel
        inherited Button_Sair: TSpeedButton
          OnClick = Button_SairClick
        end
      end
      inherited Panel_Pesquisar: TPanel
        inherited Button_Pesquisar: TSpeedButton
          OnClick = Button_PesquisarClick
        end
      end
    end
    inherited Panel_Fundo: TPanel
      object Shape1: TShape
        Left = 339
        Top = 74
        Width = 260
        Height = 189
      end
      object Image_Produto: TImage
        Left = 344
        Top = 80
        Width = 249
        Height = 177
        PopupMenu = PopupMenu1
        Stretch = True
        OnClick = Image_ProdutoClick
      end
      object Label1: TLabel
        Left = 344
        Top = 46
        Width = 169
        Height = 23
        Caption = 'Imagem do produto'
      end
      object Edit_Codigo: TLabeledEdit
        Left = 40
        Top = 48
        Width = 121
        Height = 31
        EditLabel.Width = 57
        EditLabel.Height = 23
        EditLabel.Caption = 'C'#243'digo'
        NumbersOnly = True
        TabOrder = 0
        OnEnter = Edit_CodigoEnter
        OnExit = Edit_CodigoExit
      end
      object Edit_Descricao: TLabeledEdit
        Left = 40
        Top = 128
        Width = 263
        Height = 31
        EditLabel.Width = 80
        EditLabel.Height = 23
        EditLabel.Caption = 'Descri'#231#227'o'
        TabOrder = 1
      end
    end
  end
  object FileOpenDialog1: TFileOpenDialog
    FavoriteLinks = <>
    FileTypes = <>
    Options = []
    Left = 412
    Top = 150
  end
  object FileSaveDialog1: TFileSaveDialog
    FavoriteLinks = <>
    FileTypes = <>
    Options = []
    Left = 271
    Top = 224
  end
  object PopupMenu1: TPopupMenu
    Left = 292
    Top = 278
    object Salvarimagem1: TMenuItem
      Caption = 'Extrair imagem...'
      OnClick = Salvarimagem1Click
    end
    object Removerimagem1: TMenuItem
      Caption = 'Remover imagem...'
      OnClick = Removerimagem1Click
    end
  end
end
