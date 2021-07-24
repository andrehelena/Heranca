unit View.Pesquisa.Pedidos;

interface

uses
	Winapi.Windows,
	Winapi.Messages,
	System.SysUtils,
	System.Variants,
	System.Classes,
	Vcl.Graphics,
	Vcl.Controls,
	Vcl.Forms,
	Vcl.Dialogs,
	View.Padrao.Pesquisa,
	Data.DB,
	FireDAC.Stan.Intf,
	FireDAC.Stan.Option,
	FireDAC.Stan.Param,
	FireDAC.Stan.Error,
	FireDAC.DatS,
	FireDAC.Phys.Intf,
	FireDAC.DApt.Intf,
	FireDAC.Stan.Async,
	FireDAC.DApt,
	FireDAC.Comp.DataSet,
	FireDAC.Comp.Client,
	Vcl.StdCtrls,
	Vcl.Grids,
	Vcl.DBGrids,
	Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Buttons;

type
	TForm_Pesquisa_Pedidos = class(TForm_Padrao_Pesquisa)

    FDQuery_PedidoItens: TFDQuery;
    DataSource_PedidoItens: TDataSource;
    FDQuery_PedidoItensIDItens: TIntegerField;
    FDQuery_PedidoItensID_Produto: TIntegerField;
    FDQuery_PedidoItensDescricao: TStringField;
    FDQuery_PedidoItensQuantidade: TSingleField;
    FDQuery_PedidoItensValor: TSingleField;
    FDQuery_PedidoItensTotal: TSingleField;
    FDQuery_PedidoItensObservacao: TStringField;
    FDQuery_PedidoItensID: TIntegerField;
    FDQuery_PedidoItensImagem: TBlobField;
    FileSaveDialog1: TFileSaveDialog;
    DBGrid2: TDBGrid;
    Splitter1: TSplitter;
    DBImage1: TDBImage;
    Splitter2: TSplitter;
		procedure FormCreate(Sender : TObject);
		procedure Button_AtualizarClick(Sender : TObject);
    procedure DBImage1Click(Sender: TObject);
		private
			SQLPedidos     : String;
			SQLPedidoItens : String;

		public
			{ Public declarations }
	end;

var
	Form_Pesquisa_Pedidos : TForm_Pesquisa_Pedidos;

implementation

uses
  Data.Module.Conexao;

{$R *.dfm}


procedure TForm_Pesquisa_Pedidos.Button_AtualizarClick(Sender : TObject);
begin
	// inherited;
  ExecutaSQL(SQLPedidos,FDQuery_Pesquisa);
  ExecutaSQL(SQLPedidoItens,FDQuery_PedidoItens);
end;

procedure TForm_Pesquisa_Pedidos.DBImage1Click(Sender: TObject);
begin
  inherited;
	if (FileSaveDialog1.Execute) then
  	FDQuery_PedidoItensImagem.SaveToFile(FileSaveDialog1.FileName);
end;

procedure TForm_Pesquisa_Pedidos.FormCreate(Sender : TObject);
begin
	inherited;
	SQL_Consulta := 'SELECT P.ID, Total, Observacao, Nome, Fantasia,ID_Produto  ' +
		'FROM Pedidos P ' +
		'INNER JOIN Pessoas Pes ON Pes.ID = P.ID_Cliente ' +
		'INNER JOIN Empresas E ON E.ID = P.ID_Empresa ';
	SQLPedidos := 'SELECT P.ID, P.Total, Observacao, Nome, Fantasia ' +
		'FROM Pedidos P ' +
		'INNER JOIN Pessoas Pes ON Pes.ID = P.ID_Cliente ' +
		'INNER JOIN Empresas E ON E.ID = P.ID_Empresa ';
	SQLPedidoItens := 'SELECT PIt.ID AS IDItens, ID_Produto,  ' +
		' Descricao,Quantidade, Valor, PIt.Total, Observacao, ID_Pedido AS ID, Prod.Imagem  ' +
		'FROM PedidosItens PIt ' +
		'INNER JOIN Pedidos P ON P.ID = PIt.ID_Pedido ' +
		'INNER JOIN Pessoas Pes ON Pes.ID = P.ID_Cliente ' +
		'INNER JOIN Produtos Prod ON Prod.ID = PIt.ID_Produto ' +
		'WHERE ID_Pedido = :ID';
end;

end.
