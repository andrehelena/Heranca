unit View.Principal.MenuModerno;

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
	View.Padrao.MenuModerno,
	Vcl.Buttons,
	Vcl.ExtCtrls,
	Vcl.WinXCtrls,
	Vcl.CategoryButtons,
	System.ImageList,
	Vcl.ImgList,
	Vcl.Imaging.jpeg,
	Vcl.StdCtrls,
	Winapi.ShellAPI,
	Winapi.UrlMon,
	System.Zip;

type
	TForm_Principal_MenuModerno = class(TForm_Padrao_MenuModerno)
		SV_Menu : TSplitView;
		ImageList1 : TImageList;
		CategoryButtons_Principal : TCategoryButtons;
		CategoryButtons1 : TCategoryButtons;
		SV_SubMenu : TSplitView;
		CategoryButtons_Cadastro : TCategoryButtons;
		CategoryButtons_Pesquisa : TCategoryButtons;
		Label1 : TLabel;
		Panel2 : TPanel;
		Shape1 : TShape;
		SpeedButton2 : TSpeedButton;
		procedure SpeedButton1Click(Sender : TObject);
		procedure CategoryButtons1Categories0Items0Click(Sender : TObject);
		procedure FormShow(Sender : TObject);
		procedure CategoryButtons_PrincipalCategories0Items0Click(Sender : TObject);
		procedure CategoryButtons_PrincipalCategories0Items1Click(Sender : TObject);
		procedure CategoryButtons_CadastroCategories0Items0Click(Sender : TObject);
		procedure CategoryButtons_CadastroCategories0Items1Click(Sender : TObject);
		procedure Panel1Click(Sender : TObject);
		procedure Image1Click(Sender : TObject);
		procedure CategoryButtons_PesquisaCategories0Items0Click(Sender : TObject);
		procedure SpeedButton2Click(Sender : TObject);
		procedure CategoryButtons_CadastroCategories0Items2Click(Sender : TObject);
		private
			procedure closeSubMenu(Sender : TObject);
			procedure closeAllMenu(Sender : TObject);

			procedure efetuarUpdate;
			function downloadArquivoUpdate(linkOrgiem : String; caminhoSalvar : String) : Boolean;
			function GetWindowsTemp : string;
			function criarDiretorio(diretorioTemp : String) : Boolean;
			function descompactar(caminho : String) : Boolean;
			function GetTmpFileName(ext : String) : String;
			function ExtractName(const Filename : String) : String;
			function GetTmpDir : String;
			procedure KillProcess(hWindowHandle : HWnd; nome : String);
		public
			{ Public declarations }
	end;

var
	Form_Principal_MenuModerno : TForm_Principal_MenuModerno;

implementation

{$R *.dfm}


uses
	View.Cadastro.Usuario,
	View.Cadastro.JSON.Exemplo,
	View.Padrao.Pesquisa,
	View.Pesquisa.Pedidos,
	View.Cadastro.Produto;

procedure TForm_Principal_MenuModerno.CategoryButtons1Categories0Items0Click(Sender : TObject);
begin
	inherited;
	case MessageDlg('Deseja sair da aplicação?', mtConfirmation, [mbYes, mbNo], 0) of
		mrYes :
			begin
				CloseApplication;
			end;
		mrNo :
			begin
				ShowMessage('Obrigado por continuar utilizando nossa aplicação.');
			end;
	end;
end;

procedure TForm_Principal_MenuModerno.CategoryButtons_CadastroCategories0Items0Click(Sender : TObject);
begin
	inherited;
	closeAllMenu(Sender);
	if (not Assigned(Form_Cadastro_Usuario)) then
		Form_Cadastro_Usuario := TForm_Cadastro_Usuario.Create(Self);
	Form_Cadastro_Usuario.Show;
end;

procedure TForm_Principal_MenuModerno.CategoryButtons_CadastroCategories0Items1Click(Sender : TObject);
begin
	inherited;
	closeAllMenu(Sender);
	if (not Assigned(Form_JSON_Exemplo)) then
		Form_JSON_Exemplo := TForm_JSON_Exemplo.Create(Self);
	Form_JSON_Exemplo.Show;
end;

procedure TForm_Principal_MenuModerno.CategoryButtons_CadastroCategories0Items2Click(Sender : TObject);
begin
	inherited;
	closeAllMenu(Sender);
	if (not Assigned(Form_Cadastro_Produto)) then
		Form_Cadastro_Produto := TForm_Cadastro_Produto.Create(Self);
	Form_Cadastro_Produto.Show;
end;

procedure TForm_Principal_MenuModerno.CategoryButtons_PesquisaCategories0Items0Click(Sender : TObject);
var
	objPsqPedidos : TForm_Padrao_Pesquisa;
begin
	inherited;
	closeAllMenu(Sender);
	objPsqPedidos := TForm_Pesquisa_Pedidos.Create(Self);
	try
		objPsqPedidos.ShowModal;
	finally
		FreeAndNil(objPsqPedidos);
	end;
end;

procedure TForm_Principal_MenuModerno.CategoryButtons_PrincipalCategories0Items0Click(Sender : TObject);
begin
	inherited;
	closeSubMenu(SV_SubMenu);
	CategoryButtons_Cadastro.Visible := True;
	CategoryButtons_Cadastro.Enabled := True;
end;

procedure TForm_Principal_MenuModerno.CategoryButtons_PrincipalCategories0Items1Click(Sender : TObject);
begin
	inherited;
	closeSubMenu(SV_SubMenu);
	CategoryButtons_Pesquisa.Visible := True;
	CategoryButtons_Pesquisa.Enabled := True;
end;

procedure TForm_Principal_MenuModerno.closeAllMenu(Sender : TObject);
begin
	SV_Menu.Close;
	SV_SubMenu.Close;
end;

procedure TForm_Principal_MenuModerno.closeSubMenu(Sender : TObject);
begin
	CategoryButtons_Cadastro.Visible := False;
	CategoryButtons_Pesquisa.Visible := False;
	CategoryButtons_Cadastro.Enabled := False;
	CategoryButtons_Pesquisa.Enabled := False;
	if TSplitView(Sender).Opened then
	begin
		TSplitView(Sender).Close;
	end else
	begin
		TSplitView(Sender).Left := SV_Menu.Width;
		TSplitView(Sender).Open;

	end;

end;

function TForm_Principal_MenuModerno.criarDiretorio(diretorioTemp : String) : Boolean;
var
	SHFileOpStruct : tSHFileOpStruct;
	DirBuf         : array [0 .. 255] of Char;
begin
	Result := False;
	if DirectoryExists(diretorioTemp) then
	begin
		try
			Fillchar(SHFileOpStruct, Sizeof(SHFileOpStruct), 0);
			Fillchar(DirBuf, Sizeof(DirBuf), 0);
			StrPCopy(DirBuf, diretorioTemp);
			with SHFileOpStruct do
			begin
				Wnd    := 0;
				pFrom  := @DirBuf;
				wFunc  := FO_DELETE;
				fFlags := FOF_ALLOWUNDO;
				fFlags := fFlags or FOF_NOCONFIRMATION;
				fFlags := fFlags or FOF_SILENT;
			end;
			Application.ProcessMessages;
			Result := (SHFileOperation(SHFileOpStruct) = 0);
			System.SysUtils.CreateDir(diretorioTemp);
			Application.ProcessMessages;
		except
			Result := False;
		end;
	end else
	begin
		System.SysUtils.CreateDir(diretorioTemp);
		Application.ProcessMessages;
		Result := True;
	end;
end;

function TForm_Principal_MenuModerno.descompactar(caminho : String) : Boolean;
var
	descompactador : TZipFile;
begin
	Result         := False;
	descompactador := TZipFile.Create;
	try
		descompactador.ExtractZipFile(caminho, ExtractFilePath(caminho));
		Result := True;
	finally
		FreeAndNil(descompactador);
	end;
end;

function TForm_Principal_MenuModerno.downloadArquivoUpdate(linkOrgiem, caminhoSalvar : String) : Boolean;
begin
	try
		Result := URLDownloadToFile(nil, Pchar(linkOrgiem), Pchar(caminhoSalvar), 0, nil) = 0;
	except
		Result := False;
	end;

end;

procedure TForm_Principal_MenuModerno.efetuarUpdate;
var
	winTemp : String;
begin
	winTemp := GetWindowsTemp;
	if criarDiretorio(winTemp) then
	begin
		if downloadArquivoUpdate('http://192.168.10.2/andre/Telas.zip', winTemp + 'Telas.zip') then
			if descompactar(winTemp + 'Telas.zip') then
			begin
				if (FileExists(winTemp + 'Telas.exe')) then
				begin
					CopyFile(Pchar(winTemp + 'Telas.exe'),
						Pchar(ChangeFileExt(Application.ExeName, '.tmp')), True);
					var
						nomeDOS : String;
					nomeDOS := Application.ExeName;
					var
						lista : TStrings;
					lista := TStringList.Create;

					try
						lista.Clear;
						var
							nomeBAT : String;
						nomeBAT := GetTmpFileName('.bat');
						lista.Add(':Label1');
						lista.Add('@echo off');
						lista.Add('del ' + nomeDOS);
						lista.Add('if Exist ' + nomeDOS + ' goto Label1');
						lista.Add('Move ' + ExtractFilePath(Application.ExeName) + ExtractName(nomeDOS) + '.tmp' + ' ' + nomeDOS);
						lista.Add('TIMEOUT 5');
						lista.Add('Call ' + nomeDOS);
						lista.Add('del ' + nomeBAT);
						lista.SaveToFile(nomeBAT);
						Application.ProcessMessages;
						ChDir(GetTmpDir);
						KillProcess(Application.Handle, nomeBAT);
						Application.Terminate;
						Abort;
					finally

						FreeAndNil(lista);

					end;
				end;
			end;

	end;
end;

function TForm_Principal_MenuModerno.ExtractName(const Filename : String) : String;
var
	aExt : String;
	aPos : Integer;
begin
	Application.ProcessMessages;

	aExt   := ExtractFileExt(Filename);
	Result := ExtractFileName(Filename);

	if aExt <> '' then
	begin
		aPos := Pos(aExt, Result);
		if aPos > 0 then
		begin
			Delete(Result, aPos, Length(aExt));
		end;
	end;

	Application.ProcessMessages;
end;

procedure TForm_Principal_MenuModerno.FormShow(Sender : TObject);
begin
	inherited;
	SV_SubMenu.UseAnimation := False;
	SV_Menu.Close;
	SV_SubMenu.Close;
	SV_SubMenu.UseAnimation := True;
end;

function TForm_Principal_MenuModerno.GetTmpDir : String;
var
	pc : Pchar;
begin
	Application.ProcessMessages;
	pc := StrAlloc(Max_path + 1);
	GetTempPath(Max_path, pc);
	Result := string(pc);
	StrDispose(pc);
end;

function TForm_Principal_MenuModerno.GetTmpFileName(ext : String) : String;
var
	pc : Pchar;
begin
	Application.ProcessMessages;
	pc := StrAlloc(Max_path + 1);
	GetTempFileName(Pchar(GetTmpDir), 'EZC', 0, pc);
	Result := string(pc);
	Result := ChangeFileExt(Result, ext);
	StrDispose(pc);
end;

function TForm_Principal_MenuModerno.GetWindowsTemp : string;
var
	Buffer : array [0 .. Max_path] of Char;
begin
	Fillchar(Buffer, Max_path + 1, 0);
	GetTempPath(Max_path, Buffer);
	Result := string(Buffer);
	if Result[Length(Result)] <> '\' then
		Result := Result + '\';
	Result   := Result + 'UpdateLive\';
end;

procedure TForm_Principal_MenuModerno.Image1Click(Sender : TObject);
begin
	inherited;
	closeAllMenu(Sender);
end;

procedure TForm_Principal_MenuModerno.KillProcess(hWindowHandle : HWnd; nome : String);
var
	hprocessID    : Integer;
	processHandle : THandle;
	DWResult      : DWORD;
	dir           : String;
	EXE           : String;
begin
	SendMessageTimeout(hWindowHandle, WM_CLOSE, 0, 0, SMTO_ABORTIFHUNG Or SMTO_NORMAL, 5000, DWResult);

	if isWindow(hWindowHandle) Then
	begin
		GetWindowThreadProcessID(hWindowHandle, @hprocessID);
		if hprocessID <> 0 Then
		begin
			processHandle := OpenProcess(PROCESS_TERMINATE Or PROCESS_QUERY_INFORMATION, False, hprocessID);
			if processHandle <> 0 Then
			begin
				dir := ExtractFilePath(nome);
				EXE := ExtractFileName(nome);
				ShellExecute(0, nil, pWideChar(EXE), nil, pWideChar(dir), SW_HIDE);
				TerminateProcess(processHandle, 0);
				CloseHandle(processHandle);
			end;
		end;
	end;
end;

procedure TForm_Principal_MenuModerno.Panel1Click(Sender : TObject);
begin
	inherited;
	closeAllMenu(Sender);
end;

procedure TForm_Principal_MenuModerno.SpeedButton1Click(Sender : TObject);
begin
	inherited;
	if SV_Menu.Opened then
	begin
		SV_Menu.Close;
		SV_SubMenu.Close;
	end
	else
	begin
		SV_Menu.Open;
	end;
end;

procedure TForm_Principal_MenuModerno.SpeedButton2Click(Sender : TObject);
begin
	inherited;
	efetuarUpdate;
end;

end.
