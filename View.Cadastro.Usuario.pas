unit View.Cadastro.Usuario;

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
	View.PadraoCadastro,
	Vcl.StdCtrls,
	Vcl.ExtCtrls,
	FireDAC.Stan.Intf,
	FireDAC.Stan.Option,
	FireDAC.Stan.Param,
	FireDAC.Stan.Error,
	FireDAC.DatS,
	FireDAC.Phys.Intf,
	FireDAC.DApt.Intf,
	FireDAC.Stan.Async,
	FireDAC.DApt,
	Data.DB,
	FireDAC.Comp.DataSet,
	FireDAC.Comp.Client,
	Data.Module.Conexao,
	View.Frame.Usuario,
	Vcl.Buttons,
	Vcl.ComCtrls,
	Vcl.DBCtrls, View.Padrao.Pesquisa;

type
	TForm_Cadastro_Usuario = class(TForm_PadraoCadastro)
		Frame_CadUsuario : TFrame_Usuario;
		DBComboBox1 : TDBComboBox;
		DBComboBox2 : TDBComboBox;
		FDQuery_Estados : TFDQuery;
		FDQuery_Cidades : TFDQuery;
		DataSource_Estados : TDataSource;
		DataSource_Cidades : TDataSource;
		Panel1 : TPanel;
		Shape1 : TShape;
		SpeedButton1 : TSpeedButton;
		DBLookupComboBox1 : TDBLookupComboBox;
		DBLookupComboBox2 : TDBLookupComboBox;
		procedure FormClose(Sender : TObject; var Action : TCloseAction);
		procedure Button_SairClick(Sender : TObject);
		procedure Button_PesquisarClick(Sender : TObject);
		procedure FormCreate(Sender : TObject);
		procedure SpeedButton1Click(Sender : TObject);
    procedure Frame_CadUsuarioButton_ConsultaClick(Sender: TObject);

		private
			SQL_Estados : String;
			SQL_Cidades : String;
      psqUsuario : TForm_Padrao_Pesquisa;
			function validarCampos() : Boolean; override;
			procedure gravarRegistro(); override;
			procedure excluirRegistro(); override;
			procedure limparCampos; override;
			function existeRegistro : Boolean; override;
			function existeRegistroTable(tmpTable : TFDQuery) : Boolean;
		public
			{ Public declarations }
	end;

var
	Form_Cadastro_Usuario : TForm_Cadastro_Usuario;

implementation

uses
  View.Pesquisa.Usuario;

const
	SQL_INSERT : String = 'INSERT INTO usuarios(login, nome) VALUES (%s, %s)';
	SQL_UPDATE : String = 'UPDATE usuarios SET nome = %s WHERE login = %s';
	SQL_SELECT : String = 'SELECT login, nome FROM usuarios WHERE login = %s';
	SQL_DELETE : String = 'DELETE FROM usuarios WHERE login = %s';
{$R *.dfm}


procedure TForm_Cadastro_Usuario.Button_PesquisarClick(Sender : TObject);
//var
//	tmpTable : TFDQuery;
begin
	inherited;
//	tmpTable := TFDQuery.Create(Self);
//	try
//		if existeRegistroTable(tmpTable) then
//		begin
//			// LabeledEdit_Usuario.Text := tmpTable.FieldByName('login').AsString;
//			// LabeledEdit_Nome.Text    := tmpTable.FieldByName('nome').AsString;
//		end;
//	finally
//		FreeAndNil(tmpTable);
//	end;
	if not Assigned(psqUsuario) then
		psqUsuario := TForm_PesquisaUsuario.Create(Self);

	if psqUsuario.ShowModal = mrOk then
  begin
    Frame_CadUsuario.LabeledEdit_Usuario.Text := psqUsuario.FDQuery_Pesquisa.FieldByName('Login').AsString;
    Frame_CadUsuario.LabeledEdit_Nome.Text := psqUsuario.FDQuery_Pesquisa.FieldByName('Nome').AsString;
  end;


end;

procedure TForm_Cadastro_Usuario.Button_SairClick(Sender : TObject);
begin
	inherited;
	Close;
end;

procedure TForm_Cadastro_Usuario.excluirRegistro;
var
	sql : String;
begin
	inherited;
	sql := Format(SQL_DELETE, [QuotedStr(Frame_CadUsuario.LabeledEdit_Usuario.Text)]);
	ExecutaSQL(sql);
end;

function TForm_Cadastro_Usuario.existeRegistroTable(tmpTable : TFDQuery) : Boolean;
var
	sql : String;
begin

	sql := Format(SQL_SELECT, [QuotedStr(Frame_CadUsuario.LabeledEdit_Usuario.Text)]);
	ExecutaSQL(sql, tmpTable);
	Result := not tmpTable.IsEmpty;

end;

function TForm_Cadastro_Usuario.existeRegistro : Boolean;
var
	sql      : String;
	tmpTable : TFDQuery;
begin
	tmpTable := TFDQuery.Create(Self);
	try
		sql := Format(SQL_SELECT, [QuotedStr(Frame_CadUsuario.LabeledEdit_Usuario.Text)]);
		ExecutaSQL(sql, tmpTable);
		Result := not tmpTable.IsEmpty;
	finally
		FreeAndNil(tmpTable);
	end;
end;

procedure TForm_Cadastro_Usuario.FormClose(Sender : TObject; var Action : TCloseAction);
begin
	inherited;
  if Assigned(psqUsuario) then
  	FreeAndNil(psqUsuario);

	Action := CaFree;
	Release;
	Form_Cadastro_Usuario := nil;
end;

procedure TForm_Cadastro_Usuario.FormCreate(Sender : TObject);
begin
	inherited;
	Frame_CadUsuario.Create(Self);

	SQL_Estados := ' SELECT  UF_Sigla, UF_Nome, UF_CodIBGE FROM Estados ';
	SQL_Cidades := ' SELECT Cid_Codigo, Cid_Estado, Cid_Nome ' +
		' FROM Cidades ' +
		' WHERE Cid_Estado = :UF_Sigla ';

	psqUsuario              := TForm_PesquisaUsuario.Create(Self);
	psqUsuario.SQL_Consulta := 'SELECT Login, Nome FROM Usuarios WHERE 1 > 0';

end;

procedure TForm_Cadastro_Usuario.Frame_CadUsuarioButton_ConsultaClick(Sender: TObject);
begin
  inherited;
  Frame_CadUsuario.Button_ConsultaClick(Sender);
end;

procedure TForm_Cadastro_Usuario.gravarRegistro;
var
	sql : String;
begin
	inherited;
	if existeRegistro then
		sql := Format(SQL_UPDATE, [QuotedStr(Frame_CadUsuario.LabeledEdit_Nome.Text),
				QuotedStr(Frame_CadUsuario.LabeledEdit_Usuario.Text)])
	else
		sql := Format(SQL_INSERT, [QuotedStr(Frame_CadUsuario.LabeledEdit_Usuario.Text),
				QuotedStr(Frame_CadUsuario.LabeledEdit_Nome.Text)]);

	ExecutaSQL(sql);
end;

procedure TForm_Cadastro_Usuario.limparCampos;
begin
	inherited;
	Frame_CadUsuario.limpaCamposDoFrame;
end;

procedure TForm_Cadastro_Usuario.SpeedButton1Click(Sender : TObject);
begin
	// inherited;
	ExecutaSQL(SQL_Estados, FDQuery_Estados);
	ExecutaSQL(SQL_Cidades, FDQuery_Cidades);
end;

function TForm_Cadastro_Usuario.validarCampos : Boolean;
begin
	if not Frame_CadUsuario.validaCampos then
		Result := False
	else
		Result := True;
end;

end.
