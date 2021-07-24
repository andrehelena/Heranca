unit View.Padrao;

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
	Vcl.ExtCtrls,
	Vcl.Imaging.pngimage,
	Vcl.Menus, Vcl.Buttons;

type
	TForm_Padrao = class(TForm)
		Panel1 : TPanel;
		Image1 : TImage;
		MainMenu1 : TMainMenu;
		Cadastro1 : TMenuItem;
		Pesquisa1 : TMenuItem;
		Sair1 : TMenuItem;
    SpeedButton1: TSpeedButton;
		procedure Sair1Click(Sender : TObject);
    procedure SpeedButton1Click(Sender: TObject);
		private
			procedure CloseApplication;
		public
			{ Public declarations }
	end;

var
	Form_Padrao : TForm_Padrao;

implementation

{$R *.dfm}


procedure TForm_Padrao.CloseApplication;
begin
	Application.Terminate;
end;

procedure TForm_Padrao.Sair1Click(Sender : TObject);
begin
	CloseApplication;
end;

procedure TForm_Padrao.SpeedButton1Click(Sender: TObject);
begin
	CloseApplication;
end;

end.
