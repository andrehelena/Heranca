unit Utils;

interface

uses
	Vcl.Forms,
	Winapi.Windows,
	System.SysUtils,
	FireDAC.Comp.Client;

procedure mensagemAviso(const mensagem : String);
function mensagemPergunta(const mensagem : String) : Boolean;
function StrToSQL(texto : string) : String;
function ultimoCodigo(tabela, campo : String) : Integer;

implementation

uses
	Data.Module.Conexao;

procedure mensagemAviso(const mensagem : String);
begin
	Application.MessageBox(pchar(mensagem), 'Aviso', MB_OK +
			MB_ICONWARNING + MB_TOPMOST);
end;

function mensagemPergunta(const mensagem : String) : Boolean;
begin
	case Application.MessageBox(pchar(mensagem), 'Aviso', MB_YESNO +
			MB_ICONQUESTION + MB_TOPMOST) of
		IDYES :
			begin
				Result := True;
			end;
		IDNO :
			begin
				Result := False;
			end;
	end;
end;

function StrToSQL(texto : string) : String;
begin
	Result := QuotedStr(texto);
end;

function ultimoCodigo(tabela, campo : String) : Integer;
var
	tmp : TFDQuery;
begin
	tmp := TFDQuery.Create(nil);
	try
		ExecutaSQL('SELECT MAX('+campo+')+1 AS Ultimo FROM '+tabela, tmp);
    Result := tmp.FieldByName('Ultimo').AsInteger;
	finally
		FreeAndNil(tmp)
	end;
end;

end.
