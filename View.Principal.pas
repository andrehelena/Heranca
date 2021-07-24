unit View.Principal;

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
	View.Padrao,
	Vcl.Menus,
	Vcl.ExtCtrls,
	Vcl.Imaging.pngimage,
	Vcl.Buttons;

type
	TForm_Principal = class(TForm_Padrao)
		Usuario1 : TMenuItem;
    JSONExemplo1: TMenuItem;
    Pedidos1: TMenuItem;
		procedure SpeedButton1Click(Sender : TObject);
		procedure Usuario1Click(Sender : TObject);
    procedure JSONExemplo1Click(Sender: TObject);
    procedure Pedidos1Click(Sender: TObject);
		private
			{ Private declarations }
		public
			{ Public declarations }
	end;

var
	Form_Principal : TForm_Principal;

implementation

{$R *.dfm}

uses View.Cadastro.Usuario, View.Cadastro.JSON.Exemplo, View.Padrao.Pesquisa, View.Pesquisa.Pedidos;


procedure TForm_Principal.JSONExemplo1Click(Sender: TObject);
begin
  inherited;
	if (not Assigned(Form_JSON_Exemplo)) then
		Form_JSON_Exemplo := TForm_JSON_Exemplo.Create(Self);
	Form_JSON_Exemplo.Show;
end;

procedure TForm_Principal.Pedidos1Click(Sender: TObject);
begin
  inherited;
  var objPsqPedidos: TForm_Padrao_Pesquisa;

  objPsqPedidos := TForm_Pesquisa_Pedidos.Create(Self);
  try
    objPsqPedidos.ShowModal;
  finally
		FreeAndNil(objPsqPedidos);
  end;

end;

procedure TForm_Principal.SpeedButton1Click(Sender : TObject);
begin
	case MessageDlg('Deseja sair da aplicação?', mtConfirmation, [mbYes, mbNo], 0) of
		mrYes :
			begin
				inherited;
			end;
		mrNo :
			begin
				ShowMessage('Obrigado por continuar utilizando nossa aplicação.');
			end;
	end;

end;

procedure TForm_Principal.Usuario1Click(Sender : TObject);
begin
	inherited;
	if (not Assigned(Form_Cadastro_Usuario)) then
		Form_Cadastro_Usuario := TForm_Cadastro_Usuario.Create(Self);
	Form_Cadastro_Usuario.Show;
end;

end.
