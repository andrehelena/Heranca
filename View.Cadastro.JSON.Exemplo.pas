unit View.Cadastro.JSON.Exemplo;

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
	DataSet.Serialize, Datasnap.DBClient, Vcl.Buttons;

type
	TForm_JSON_Exemplo = class(TForm_PadraoCadastro)
		Memo_SQL : TMemo;
		Label1 : TLabel;
		Memo_JSON : TMemo;
		Label2 : TLabel;
    ClientDataSet1: TClientDataSet;
    FDMemTable1: TFDMemTable;
		procedure FormClose(Sender : TObject; var Action : TCloseAction);
		procedure Button_SairClick(Sender : TObject);
		private
		protected
			function validarCampos() : Boolean; override;
			procedure gravarRegistro(); override;
			procedure excluirRegistro(); override;
			procedure limparCampos; override;
			function existeRegistro : Boolean; override;
		public
			{ Public declarations }
	end;

var
	Form_JSON_Exemplo : TForm_JSON_Exemplo;

implementation


{$R *.dfm}


procedure TForm_JSON_Exemplo.Button_SairClick(Sender : TObject);
begin
	inherited;
	Close;
end;

procedure TForm_JSON_Exemplo.excluirRegistro;
begin
	inherited;

end;

function TForm_JSON_Exemplo.existeRegistro : Boolean;
begin
	Result := True;
end;

procedure TForm_JSON_Exemplo.FormClose(Sender : TObject; var Action : TCloseAction);
begin
	inherited;
	Action := CaFree;
	Release;
	Form_JSON_Exemplo := nil;
end;

procedure TForm_JSON_Exemplo.gravarRegistro;
var
	table_JSON : TFDQuery;
begin
	inherited;
	table_JSON := TFDQuery.Create(Self);
  try
		ExecutaSQL(Memo_SQL.Text, table_JSON);

    while not table_JSON.EOF do
    begin
			Memo_JSON.Lines.Add(','+table_JSON.ToJSONObject.Format);
			table_JSON.NExt;
    end;

  finally
    FreeAndNil(table_JSON);
  end;
end;

procedure TForm_JSON_Exemplo.limparCampos;
begin
	inherited;
//  Memo_SQL.Clear;
//  Memo_JSON.Clear;
end;

function TForm_JSON_Exemplo.validarCampos : Boolean;
begin
	Result := False;
  if Memo_SQL.Text = EmptyStr then
  begin
		Application.MessageBox('O SQL é obrigatório.', 'Advertência', MB_OK + MB_ICONWARNING);
    Memo_SQL.SetFocus;
  end else
  Result := True;
end;

end.
