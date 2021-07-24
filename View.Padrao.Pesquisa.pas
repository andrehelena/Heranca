unit View.Padrao.Pesquisa;

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
	View.Padrao.Form,
	Vcl.ExtCtrls,
	Vcl.StdCtrls,
	Data.DB,
	Vcl.Grids,
	Vcl.DBGrids,
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
	Data.Module.Conexao,
	Vcl.Buttons;

type
	TForm_Padrao_Pesquisa = class(TForm_Padrao_Form)
		FDQuery_Pesquisa : TFDQuery;
		DataSource_Pesquisa : TDataSource;
		Panel_Confirmar : TPanel;
		Shape_Confirma : TShape;
		Button_Confirmar : TSpeedButton;
		Panel_Sair : TPanel;
		Shape_Sair : TShape;
		Button_Sair : TSpeedButton;
		Panel_Atualizar : TPanel;
		Shape_Excluir : TShape;
		Button_Atualizar : TSpeedButton;
		DBGrid1 : TDBGrid;
		procedure Button_AtualizarClick(Sender : TObject);
		procedure Button_ConfirmarClick(Sender : TObject);
		procedure Button_SairClick(Sender : TObject);
		private
			procedure CreateParams(var Params: TCreateParams); override;
		public
			SQL_Consulta : String;
	end;

var
	Form_Padrao_Pesquisa : TForm_Padrao_Pesquisa;

implementation

{$R *.dfm}


procedure TForm_Padrao_Pesquisa.Button_AtualizarClick(Sender : TObject);
begin
	inherited;
	ExecutaSQL(SQL_Consulta, FDQuery_Pesquisa);
end;

procedure TForm_Padrao_Pesquisa.Button_ConfirmarClick(Sender : TObject);
begin
	inherited;
	ModalResult := mrOk;
end;

procedure TForm_Padrao_Pesquisa.Button_SairClick(Sender : TObject);
begin
	inherited;
	Close;
end;

procedure TForm_Padrao_Pesquisa.CreateParams(var Params: TCreateParams);
begin
  inherited;
//	Params.Style := WS_CHILDWINDOW;
end;

end.
