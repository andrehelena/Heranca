unit View.Cadastro.Produto;

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
	Vcl.Buttons,
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
	FireDAC.Comp.Client;

type
	TForm_Cadastro_Produto = class(TForm_PadraoCadastro)
		Edit_Codigo : TLabeledEdit;
		Edit_Descricao : TLabeledEdit;
		Shape1 : TShape;
		Image_Produto : TImage;
		Label1 : TLabel;
		FileOpenDialog1 : TFileOpenDialog;
		procedure FormClose(Sender : TObject; var Action : TCloseAction);
		procedure Button_SairClick(Sender : TObject);
		procedure Image_ProdutoClick(Sender : TObject);
		private
			{ Private declarations }
		public

		protected
			function validarCampos() : Boolean; override;
			procedure gravarRegistro(); override;
			procedure excluirRegistro(); override;
			procedure limparCampos; override;
			function existeRegistro : Boolean; override;
	end;

var
	Form_Cadastro_Produto : TForm_Cadastro_Produto;

implementation

uses
	Data.Module.Conexao,
	System.math,
	Utils;

{$R *.dfm}

{ TForm_Cadastro_Produto }

procedure TForm_Cadastro_Produto.Button_SairClick(Sender : TObject);
begin
	inherited;
	Close;
end;

procedure TForm_Cadastro_Produto.excluirRegistro;
begin
	inherited;
	if (Edit_Codigo.Text = EmptyStr) or (Edit_Codigo.Text = zerovalue.ToString) then
	begin
		mensagemAviso('Informe o produto a ser excluído.');
	end;

	if mensagemPergunta('Deseja excluír o registro?') then
	begin
		ExecutaSQL('DELETE FROM produtos WHERE ID = ' + Edit_Codigo.Text);
	end;
end;

function TForm_Cadastro_Produto.existeRegistro : Boolean;
begin
	Result := False;
end;

procedure TForm_Cadastro_Produto.FormClose(Sender : TObject; var Action : TCloseAction);
begin
	inherited;
	Action := CaFree;
	Release;
	Form_Cadastro_Produto := nil;
end;

procedure TForm_Cadastro_Produto.gravarRegistro;
var
	arqBinario : TMemoryStream;
	DataSet    : TFDMemTable;
begin
	inherited;
	arqBinario := TMemoryStream.Create;
  arqBinario.LoadFromFile(FileOpenDialog1.FileName);

  DataSet    := TFDMemTable.Create(Self);
  DataSet.FieldDefs.Add('Imagem', ftBlob);
  DataSet.CreateDataSet;
  DataSet.Edit;
	TBlobField(DataSet.FieldByName('Imagem')).LoadFromStream(arqBinario);

	if existeRegistro then
	begin
		ExecutaSQL('UPDATE produtos SET ' +
				' Descricao = ' + StrToSQL(Edit_Descricao.Text) + ',' +
				' Imagem = :Imagem' +
				'WHERE ID = ' + Edit_Codigo.Text);
	end else
	begin
		ExecutaSQL('INSERT INTO produtos (Descricao, Imagem) VALUES( ' +
				StrToSQL(Edit_Descricao.Text) + ', :Imagem)', nil, DataSet.FieldByName('Imagem'));
	end;

end;

procedure TForm_Cadastro_Produto.Image_ProdutoClick(Sender : TObject);
begin
	inherited;
	if FileOpenDialog1.Execute then
		Image_Produto.Picture.LoadFromFile(FileOpenDialog1.FileName);
end;

procedure TForm_Cadastro_Produto.limparCampos;
begin
	inherited;
	Edit_Codigo.Clear;
	Edit_Descricao.Clear;
	Image_Produto.Picture := nil;
end;

function TForm_Cadastro_Produto.validarCampos : Boolean;
begin
	Result := False;
	if Edit_Descricao.Text = EmptyStr then
	begin
		mensagemAviso('O campo descrição é obrigatório.');
		Edit_Codigo.SetFocus;
	end
	else
		Result := True;

end;

end.
