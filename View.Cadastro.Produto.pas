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
	FireDAC.Comp.Client,
	View.Padrao.Pesquisa,
	Entity.Cadastro.Produto,
	Vcl.Menus;

type
	TForm_Cadastro_Produto = class(TForm_PadraoCadastro)
		Edit_Codigo : TLabeledEdit;
		Edit_Descricao : TLabeledEdit;
		Shape1 : TShape;
		Image_Produto : TImage;
		Label1 : TLabel;
		FileOpenDialog1 : TFileOpenDialog;
		FileSaveDialog1 : TFileSaveDialog;
		PopupMenu1 : TPopupMenu;
		Salvarimagem1 : TMenuItem;
    Removerimagem1: TMenuItem;
		procedure FormClose(Sender : TObject; var Action : TCloseAction);
		procedure Button_SairClick(Sender : TObject);
		procedure Image_ProdutoClick(Sender : TObject);
		procedure FormCreate(Sender : TObject);
		procedure Button_PesquisarClick(Sender : TObject);
		procedure FormShow(Sender : TObject);
		procedure Edit_CodigoExit(Sender : TObject);
		procedure Edit_CodigoEnter(Sender : TObject);
		procedure Salvarimagem1Click(Sender : TObject);
    procedure Removerimagem1Click(Sender: TObject);
		private
			psqProduto  : TForm_Padrao_Pesquisa;
			memTableCad : TFDMemTable;
			objProduto  : TProduto;
			function addItem(codigo, descricao : String; imagem : TField; extensao : String) : Boolean;
			function removeItem() : Boolean;
			procedure popularTelaPelaPesquisa;
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
	Utils,
	View.Pesquisa.Produto;

const
	SQL_CONSULTA_TODOS : String = 'SELECT * FROM Produtos WHERE 1 > 0 ';

{$R *.dfm}

	{ TForm_Cadastro_Produto }

function TForm_Cadastro_Produto.addItem(codigo, descricao : String; imagem : TField; extensao : String) : Boolean;
begin
	// if memTableCad.IsEmpty then
	// memTableCad.Append
	// else
	// memTableCad.Edit;
	// if codigo <> EmptyStr then
	// memTableCad.FieldByName('ID').AsString := codigo;
	// if descricao <> EmptyStr then
	// memTableCad.FieldByName('Descricao').AsString := descricao;
	// if imagem <> nil then
	// memTableCad.FieldByName('Imagem').Assign(imagem);
	// memTableCad.Post;
	if codigo <> EmptyStr then
		objProduto.id := codigo.ToInteger;

	if descricao <> EmptyStr then
		objProduto.descricao := descricao;

	if imagem <> nil then
	begin
		objProduto.imagem.FieldByName('Imagem').Assign(imagem);
		objProduto.imagem.FieldByName('Imagem2').Assign(imagem);
	end;

	if not (extensao.IsEmpty) then
		objProduto.extensao := extensao;
end;

procedure TForm_Cadastro_Produto.Button_PesquisarClick(Sender : TObject);

begin
	inherited;
	if not Assigned(psqProduto) then
		psqProduto := TForm_PesquisaProduto.Create(Self);

	if psqProduto.ShowModal = mrOk then
	begin
		popularTelaPelaPesquisa;
	end;
end;

procedure TForm_Cadastro_Produto.Button_SairClick(Sender : TObject);
begin
	inherited;
	Close;
end;

procedure TForm_Cadastro_Produto.Edit_CodigoEnter(Sender : TObject);
begin
	inherited;
	Edit_Codigo.Tag := StrToInt(Edit_Codigo.Text);
end;

procedure TForm_Cadastro_Produto.Edit_CodigoExit(Sender : TObject);
begin
	inherited;
	if (Edit_Codigo.Tag = StrToInt(Edit_Codigo.Text)) then
		Exit;
	if (Edit_Codigo.Text = EmptyStr) or (StrToInt(Edit_Codigo.Text) = 0) then
		Exit;
	try
		psqProduto.SQL_Consulta := SQL_CONSULTA_TODOS + 'AND ID = ' + Edit_Codigo.Text;
		try
			psqProduto.Button_AtualizarClick(Sender);
			if not psqProduto.FDQuery_Pesquisa.IsEmpty then
			begin
				popularTelaPelaPesquisa;
			end;
		finally
			psqProduto.SQL_Consulta := SQL_CONSULTA_TODOS;
		end;
	except
		on E : Exception do
		begin
			mensagemAviso('Erro na consulta do produto!' + #13#10 + E.Message);
			Raise;
		end;
	end;
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
		ExecutaSQL('DELETE FROM Produtos WHERE ID = ' + Edit_Codigo.Text);
	end;
end;

function TForm_Cadastro_Produto.existeRegistro : Boolean;
var
	tmp : TFDQuery;
	sql : String;
begin
	tmp := TFDQuery.Create(Self);
	try
		sql := Format('SELECT ID FROM Produtos WHERE ID = %s', [Edit_Codigo.Text]);
		ExecutaSQL(sql, tmp);
		Result := not tmp.IsEmpty;
	finally
		FreeAndNil(tmp);
	end;

end;

procedure TForm_Cadastro_Produto.popularTelaPelaPesquisa;
begin
	Edit_Codigo.Text    := psqProduto.FDQuery_Pesquisa.FieldByName('ID').AsString;
	Edit_Descricao.Text := psqProduto.FDQuery_Pesquisa.FieldByName('Descricao').AsString;
	Image_Produto.Picture.Assign(psqProduto.FDQuery_Pesquisa.FieldByName('Imagem'));
	addItem(psqProduto.FDQuery_Pesquisa.FieldByName('ID').AsString,
		psqProduto.FDQuery_Pesquisa.FieldByName('Descricao').AsString,
		psqProduto.FDQuery_Pesquisa.FieldByName('Imagem'),
		psqProduto.FDQuery_Pesquisa.FieldByName('Extensao').AsString);
end;

procedure TForm_Cadastro_Produto.FormClose(Sender : TObject; var Action : TCloseAction);
begin
	inherited;
	FreeAndNil(psqProduto);
	Action := CaFree;
	Release;
	Form_Cadastro_Produto := nil;
end;

procedure TForm_Cadastro_Produto.FormCreate(Sender : TObject);
begin
	inherited;
	psqProduto              := TForm_PesquisaProduto.Create(Self);
	psqProduto.SQL_Consulta := SQL_CONSULTA_TODOS;

	// memTableCad := TFDMemTable.Create(Self);
	// memTableCad.FieldDefs.Add('ID', ftInteger);
	// memTableCad.FieldDefs.Add('Descricao', ftString, 50);
	// memTableCad.FieldDefs.Add('Imagem', ftBlob);
	// memTableCad.CreateDataSet;

	objProduto := TProduto.Create;
	limparCampos;
end;

procedure TForm_Cadastro_Produto.FormShow(Sender : TObject);
begin
	inherited;
	Edit_Descricao.SetFocus;
end;

procedure TForm_Cadastro_Produto.gravarRegistro;
var
	arqBinario  : TMemoryStream;
	DataSet     : TFDMemTable;
	arqFieldBin : TArrayField;
begin
	inherited;
	addItem(Edit_Codigo.Text, Edit_Descricao.Text, nil, EmptyStr);
	arqFieldBin := TArrayField.Create(nil);
	arqFieldBin.Fields.Add(objProduto.imagem.FieldByName('Imagem'));
	arqFieldBin.Fields.Add(objProduto.imagem.FieldByName('Imagem2'));
	if existeRegistro then
	begin
		ExecutaSQL('UPDATE produtos SET ' +
				' Descricao = ' + StrToSQL(objProduto.descricao) + ',' +
				' Imagem = :Imagem, ' +
				' Extensao = ' + StrToSQL(objProduto.extensao) +
				' WHERE ID = ' + objProduto.id.ToString, nil, objProduto.imagem.FieldByName('Imagem'));
	end else
	begin
		// arqBinario := TMemoryStream.Create;
		// DataSet    := TFDMemTable.Create(Self);
		// try
		// arqBinario.LoadFromFile(FileOpenDialog1.FileName);
		// DataSet.FieldDefs.Add('Imagem', ftBlob);
		// DataSet.CreateDataSet;
		// DataSet.Edit;
		// TBlobField(DataSet.FieldByName('Imagem')).LoadFromStream(arqBinario);
		ExecutaSQLArray('INSERT INTO produtos (Descricao, Imagem, Extensao, Imagem2, Extensao2) VALUES( ' +
				StrToSQL(objProduto.descricao) +
				', :Imagem,' +
				StrToSQL(objProduto.extensao) +
				', :Imagem2,' +
				StrToSQL(objProduto.extensao) +
				')', nil,
			VarArrayOf(['Imagem', 'Imagem2']),
			arqFieldBin);
		// finally
		// FreeAndNil(arqBinario);
		// FreeAndNil(DataSet);
		// end;
	end;

end;

procedure TForm_Cadastro_Produto.Image_ProdutoClick(Sender : TObject);
var
	arqBinario : TMemoryStream;
	DataSet    : TFDMemTable;
begin
	inherited;
	if FileOpenDialog1.Execute then
	begin
		Image_Produto.Picture.LoadFromFile(FileOpenDialog1.FileName);
		try
			arqBinario := TMemoryStream.Create;
			arqBinario.LoadFromFile(FileOpenDialog1.FileName);
			DataSet := TFDMemTable.Create(Self);
			DataSet.FieldDefs.Add('Imagem', ftBlob);
			DataSet.CreateDataSet;
			DataSet.Edit;
			TBlobField(DataSet.FieldByName('Imagem')).LoadFromStream(arqBinario);
			addItem(Edit_Codigo.Text, Edit_Descricao.Text, DataSet.FieldByName('Imagem'),
				ExtractFileExt(FileOpenDialog1.FileName));
		finally
			FreeAndNil(DataSet);
			FreeAndNil(arqBinario);

		end;
	end;
end;

procedure TForm_Cadastro_Produto.limparCampos;
begin
	inherited;
	Edit_Codigo.Clear;
	Edit_Descricao.Clear;
	Image_Produto.Picture := nil;
	removeItem;
	Edit_Codigo.Text := ultimoCodigo('Produtos', 'ID').ToString;
	objProduto.id    := StrToInt(Edit_Codigo.Text);
end;

function TForm_Cadastro_Produto.removeItem : Boolean;
begin
	try
		// memTableCad.EmptyDataSet;
		objProduto.id        := zerovalue;
		objProduto.descricao := EmptyStr;
		objProduto.imagem.FieldByName('Imagem').Clear;
		Result := True;
	except
		Result := False;
	end;
end;

procedure TForm_Cadastro_Produto.Removerimagem1Click(Sender: TObject);
begin
  inherited;
	objProduto.imagem.FieldByName('Imagem').Clear;
	objProduto.imagem.FieldByName('Imagem2').Clear;
  Image_Produto.Picture := nil;
end;

procedure TForm_Cadastro_Produto.Salvarimagem1Click(Sender : TObject);
begin
	inherited;
	if (FileSaveDialog1.Execute) then
		TBlobField(objProduto.imagem.FieldByName('Imagem')).SaveToFile(FileSaveDialog1.FileName);
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
