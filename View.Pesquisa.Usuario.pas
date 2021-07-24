unit View.Pesquisa.Usuario;

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
	View.Padrao.Pesquisa,
	Data.DB,
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
	Vcl.StdCtrls,
	Vcl.Grids,
	Vcl.DBGrids,
	Vcl.ExtCtrls, Vcl.Buttons;

type
	TForm_PesquisaUsuario = class(TForm_Padrao_Pesquisa)
		private
			{ Private declarations }
		public
			{ Public declarations }
	end;

var
	Form_PesquisaUsuario : TForm_PesquisaUsuario;

implementation

{$R *.dfm}

end.
