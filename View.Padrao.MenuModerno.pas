unit View.Padrao.MenuModerno;

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
	Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons;

type
	TForm_Padrao_MenuModerno = class(TForm)
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    Image1: TImage;
		private
    protected
			procedure CloseApplication;
		public
			{ Public declarations }
	end;

var
	Form_Padrao_MenuModerno : TForm_Padrao_MenuModerno;

implementation

{$R *.dfm}

{ TForm_Padrao_MenuModerno }

procedure TForm_Padrao_MenuModerno.CloseApplication;
begin
	Application.Terminate;
end;

end.
