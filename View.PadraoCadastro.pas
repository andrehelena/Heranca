unit View.PadraoCadastro;

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
	Vcl.StdCtrls,
	Vcl.Buttons;

type
	TForm_PadraoCadastro = class(TForm)
		Panel_Inferior : TPanel;
		Panel_Fundo : TPanel;
		Button_Confirma__ : TButton;
		Button_Cancelar_ : TButton;
		Button_Pesquisar_ : TButton;
		Button_Sair_ : TButton;
		Button_Excluir__ : TButton;
		Panel_Sair : TPanel;
		Shape_Sair : TShape;
		Button_Sair : TSpeedButton;
		Panel_Cancelar : TPanel;
		Shape_Cancelar : TShape;
		Button_Cancelar : TSpeedButton;
		Panel_Pesquisar : TPanel;
		Shape_Pesquisar : TShape;
		Button_Pesquisar : TSpeedButton;
		Panel_Excluir : TPanel;
		Shape_Excluir : TShape;
		Button_Excluir : TSpeedButton;
		Panel_Confirma : TPanel;
		Shape_Confirma : TShape;
		Button_Confirma : TSpeedButton;
    Panel_FundoTotal: TPanel;
    Shape_FundoTotal: TShape;
		procedure Button_Confirma__Click(Sender : TObject);
		procedure Button_Excluir__Click(Sender : TObject);
		procedure Button_Cancelar_Click(Sender : TObject);
		procedure Button_ExcluirClick(Sender : TObject);
		procedure Button_CancelarClick(Sender : TObject);
		procedure Button_ConfirmaClick(Sender : TObject);

		private
			procedure cancelarLancamento(Sender : TObject);
			procedure excluirLancamento(Sender : TObject);
			procedure confirmarLancamento(Sender : TObject);
      procedure CreateParams(var Params: TCreateParams); override;
		protected
			function validarCampos() : Boolean; virtual; abstract;
			procedure gravarRegistro(); virtual; abstract;
			procedure excluirRegistro(); virtual; abstract;
			procedure limparCampos; virtual; abstract;
			function existeRegistro : Boolean; virtual; abstract;
		public
			{ Public declarations }
	end;

var
	Form_PadraoCadastro : TForm_PadraoCadastro;

implementation

{$R *.dfm}


procedure TForm_PadraoCadastro.Button_CancelarClick(Sender : TObject);
begin
	cancelarLancamento(Sender);;
end;

procedure TForm_PadraoCadastro.Button_Cancelar_Click(Sender : TObject);
begin
	if (MessageDlg('Deseja cancelar a operação?',
			mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
	begin
		limparCampos;
	end;
end;

procedure TForm_PadraoCadastro.Button_ConfirmaClick(Sender : TObject);
begin
	confirmarLancamento(Sender);
end;

procedure TForm_PadraoCadastro.Button_Confirma__Click(Sender : TObject);
begin
	if validarCampos then
	begin
		gravarRegistro;
		limparCampos;
	end;
end;

procedure TForm_PadraoCadastro.Button_ExcluirClick(Sender : TObject);
begin
	excluirLancamento(Sender);
end;

procedure TForm_PadraoCadastro.Button_Excluir__Click(Sender : TObject);
begin
	if (MessageDlg('Deseja excluir o registro?',
			mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
	begin
		excluirRegistro;
		limparCampos;
	end;
end;

procedure TForm_PadraoCadastro.cancelarLancamento(Sender : TObject);
begin
	if (MessageDlg('Deseja cancelar a operação?',
			mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
	begin
		limparCampos;
	end;
end;

procedure TForm_PadraoCadastro.confirmarLancamento(Sender : TObject);
begin
	if validarCampos then
	begin
		gravarRegistro;
		limparCampos;
	end;
end;

procedure TForm_PadraoCadastro.CreateParams(var Params: TCreateParams);
begin
  inherited;
	Params.Style := WS_CHILDWINDOW;
end;

procedure TForm_PadraoCadastro.excluirLancamento(Sender : TObject);
begin
	if (MessageDlg('Deseja excluir o registro?',
			mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
	begin
		excluirRegistro;
		limparCampos;
	end;
end;

end.
