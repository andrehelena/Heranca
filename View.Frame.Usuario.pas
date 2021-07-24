unit View.Frame.Usuario;

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
	View.Padrao.Pesquisa;

type
	TFrame_Usuario = class(TFrame)
		LabeledEdit_Usuario : TLabeledEdit;
		Button_Consulta : TButton;
		LabeledEdit_Nome : TLabeledEdit;
		procedure Button_ConsultaClick(Sender : TObject);
		private
			psqUsuario : TForm_Padrao_Pesquisa;
		public
			procedure limpaCamposDoFrame;
			function validaCampos : Boolean;
			constructor Create(AOwner : TComponent); overload;
			destructor Destroy; override;
	end;

implementation

uses
	Data.Module.Conexao,
	View.Pesquisa.Usuario;

{$R *.dfm}


procedure TFrame_Usuario.Button_ConsultaClick(Sender : TObject);
var
	sSQL     : String;
	tableUsr : TFDQuery;
begin
	// tableUsr := TFDQuery.Create(nil);
	// try
	// sSQL := 'SELECT Login, Nome FROM Usuarios WHERE 1 > 0 ';
	// if (LabeledEdit_Usuario.Text <> EmptyStr) then
	// begin
	// sSQL := sSQL + 'AND Login = ' + QuotedStr(LabeledEdit_Usuario.Text);
	// ExecutaSQL(sSQL, tableUsr);
	// if (not tableUsr.IsEmpty) then
	// begin
	// LabeledEdit_Usuario.Text := tableUsr.FieldByName('Login').AsString;
	// LabeledEdit_Nome.Text    := tableUsr.FieldByName('Nome').AsString;
	// end;
	// end;
	// finally
	// FreeAndNil(tableUsr);
	// end;
	if psqUsuario.ShowModal = mrOk then
	begin
		LabeledEdit_Usuario.Text := psqUsuario.FDQuery_Pesquisa.FieldByName('Login').AsString;
		LabeledEdit_Nome.Text    := psqUsuario.FDQuery_Pesquisa.FieldByName('Nome').AsString;
	end;
end;

constructor TFrame_Usuario.Create(AOwner : TComponent);
begin
	psqUsuario              := TForm_PesquisaUsuario.Create(AOwner);
	psqUsuario.SQL_Consulta := 'SELECT Login, Nome FROM Usuarios WHERE 1 > 0';
end;

destructor TFrame_Usuario.Destroy;
begin
	FreeAndNil(psqUsuario);
  inherited;
end;

procedure TFrame_Usuario.limpaCamposDoFrame;
begin
	LabeledEdit_Usuario.Clear;
	LabeledEdit_Nome.Clear;
end;

function TFrame_Usuario.validaCampos : Boolean;
begin
	Result := False;
	if (Trim(LabeledEdit_Usuario.Text) = EmptyStr) then
	begin
		Application.MessageBox('Usuário é obrigatório.', 'Advertência', MB_OK + MB_ICONWARNING);
	end
	else
		if (Trim(LabeledEdit_Nome.Text) = EmptyStr) then
	begin
		Application.MessageBox('O nome é obrigatório.', 'Advertência', MB_OK + MB_ICONWARNING);
	end
	else
		Result := True;
end;

end.
