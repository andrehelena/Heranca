inherited Form_Pesquisa_Pedidos: TForm_Pesquisa_Pedidos
  Caption = 'Pesquisa de pedidos'
  ClientHeight = 730
  ClientWidth = 948
  Position = poMainFormCenter
  OnCreate = FormCreate
  ExplicitWidth = 964
  ExplicitHeight = 769
  PixelsPerInch = 96
  TextHeight = 23
  inherited Panel_FundoTotal: TPanel
    Width = 948
    Height = 730
    ExplicitWidth = 948
    ExplicitHeight = 730
    inherited Shape_FundoTotal: TShape
      Width = 948
      Height = 730
      ExplicitWidth = 946
      ExplicitHeight = 728
    end
    inherited Panel_Fundo: TPanel
      Left = 30
      Top = 30
      Width = 887
      Height = 601
      ExplicitLeft = 30
      ExplicitTop = 30
      ExplicitWidth = 887
      ExplicitHeight = 601
      object Splitter1: TSplitter [0]
        Left = 0
        Top = 305
        Width = 887
        Height = 5
        Cursor = crVSplit
        Align = alTop
        Color = 13828095
        ParentColor = False
        ExplicitTop = 257
      end
      object Splitter2: TSplitter [1]
        Left = 571
        Top = 310
        Width = 5
        Height = 291
        Align = alRight
        Color = 13303780
        ParentColor = False
        ExplicitLeft = 772
        ExplicitTop = 267
        ExplicitHeight = 334
      end
      inherited DBGrid1: TDBGrid
        Width = 887
        Height = 305
        Align = alTop
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Title.Caption = 'C'#243'digo'
            Width = 72
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Total'
            Width = 96
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Observacao'
            Title.Caption = 'Observa'#231#227'o'
            Width = 259
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Nome'
            Width = 209
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Fantasia'
            Title.Caption = 'Empresa'
            Width = 201
            Visible = True
          end>
      end
      object DBGrid2: TDBGrid
        Left = 0
        Top = 310
        Width = 571
        Height = 291
        Align = alClient
        BorderStyle = bsNone
        DataSource = DataSource_PedidoItens
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -19
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'IDItens'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ID_Produto'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Descricao'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Quantidade'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Valor'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Total'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Observacao'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ID'
            Visible = True
          end>
      end
      object DBImage1: TDBImage
        Left = 576
        Top = 310
        Width = 311
        Height = 291
        Align = alRight
        BorderStyle = bsNone
        DataField = 'Imagem'
        DataSource = DataSource_PedidoItens
        TabOrder = 2
        OnClick = DBImage1Click
      end
    end
    inherited Panel_Inferior: TPanel
      Left = 40
      Top = 637
      Width = 865
      ExplicitLeft = 40
      ExplicitTop = 637
      ExplicitWidth = 865
      inherited Panel_Confirmar: TPanel
        Left = 270
        ExplicitLeft = 270
      end
      inherited Panel_Sair: TPanel
        Left = 476
        ExplicitLeft = 476
      end
      inherited Panel_Atualizar: TPanel
        Left = 373
        ExplicitLeft = 373
      end
    end
  end
  inherited FDQuery_Pesquisa: TFDQuery
    Left = 432
    Top = 176
  end
  inherited DataSource_Pesquisa: TDataSource
    Left = 440
    Top = 112
  end
  object FDQuery_PedidoItens: TFDQuery
    MasterSource = DataSource_Pesquisa
    MasterFields = 'ID'
    Left = 512
    Top = 368
    object FDQuery_PedidoItensIDItens: TIntegerField
      FieldName = 'IDItens'
    end
    object FDQuery_PedidoItensID_Produto: TIntegerField
      FieldName = 'ID_Produto'
    end
    object FDQuery_PedidoItensDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
    object FDQuery_PedidoItensQuantidade: TSingleField
      FieldName = 'Quantidade'
    end
    object FDQuery_PedidoItensValor: TSingleField
      FieldName = 'Valor'
    end
    object FDQuery_PedidoItensTotal: TSingleField
      FieldName = 'Total'
    end
    object FDQuery_PedidoItensObservacao: TStringField
      FieldName = 'Observacao'
      Size = 50
    end
    object FDQuery_PedidoItensID: TIntegerField
      FieldName = 'ID'
    end
    object FDQuery_PedidoItensImagem: TBlobField
      FieldName = 'Imagem'
    end
  end
  object DataSource_PedidoItens: TDataSource
    DataSet = FDQuery_PedidoItens
    Left = 608
    Top = 408
  end
  object FileSaveDialog1: TFileSaveDialog
    FavoriteLinks = <>
    FileTypes = <>
    Options = []
    Left = 752
    Top = 376
  end
end
