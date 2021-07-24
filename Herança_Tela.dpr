program Herança_Tela;

uses
  Vcl.Forms,
  View.Padrao in 'View.Padrao.pas' {Form_Padrao},
  View.Principal in 'View.Principal.pas' {Form_Principal},
  View.PadraoCadastro in 'View.PadraoCadastro.pas' {Form_PadraoCadastro},
  View.Cadastro.Usuario in 'View.Cadastro.Usuario.pas' {Form_Cadastro_Usuario},
  Data.Module.Conexao in 'Data.Module.Conexao.pas' {DataModuleConexao: TDataModule},
  View.Cadastro.JSON.Exemplo in 'View.Cadastro.JSON.Exemplo.pas' {Form_JSON_Exemplo},
  View.Frame.Usuario in 'View.Frame.Usuario.pas' {Frame_Usuario: TFrame},
  View.Padrao.Pesquisa in 'View.Padrao.Pesquisa.pas' {Form_Padrao_Pesquisa},
  View.Pesquisa.Usuario in 'View.Pesquisa.Usuario.pas' {Form_PesquisaUsuario},
  View.Pesquisa.Pedidos in 'View.Pesquisa.Pedidos.pas' {Form_Pesquisa_Pedidos},
  DataSet.Serialize.Config in '..\..\andre\Componentes\D10.3\viniciussanchez_dataset-serialize\dataset-serialize-master\src\DataSet.Serialize.Config.pas',
  DataSet.Serialize.Consts in '..\..\andre\Componentes\D10.3\viniciussanchez_dataset-serialize\dataset-serialize-master\src\DataSet.Serialize.Consts.pas',
  DataSet.Serialize.Export in '..\..\andre\Componentes\D10.3\viniciussanchez_dataset-serialize\dataset-serialize-master\src\DataSet.Serialize.Export.pas',
  DataSet.Serialize.Import in '..\..\andre\Componentes\D10.3\viniciussanchez_dataset-serialize\dataset-serialize-master\src\DataSet.Serialize.Import.pas',
  DataSet.Serialize.Language in '..\..\andre\Componentes\D10.3\viniciussanchez_dataset-serialize\dataset-serialize-master\src\DataSet.Serialize.Language.pas',
  DataSet.Serialize in '..\..\andre\Componentes\D10.3\viniciussanchez_dataset-serialize\dataset-serialize-master\src\DataSet.Serialize.pas',
  DataSet.Serialize.UpdatedStatus in '..\..\andre\Componentes\D10.3\viniciussanchez_dataset-serialize\dataset-serialize-master\src\DataSet.Serialize.UpdatedStatus.pas',
  DataSet.Serialize.Utils in '..\..\andre\Componentes\D10.3\viniciussanchez_dataset-serialize\dataset-serialize-master\src\DataSet.Serialize.Utils.pas',
  View.Padrao.MenuModerno in 'View.Padrao.MenuModerno.pas' {Form_Padrao_MenuModerno},
  View.Principal.MenuModerno in 'View.Principal.MenuModerno.pas' {Form_Principal_MenuModerno},
  Vcl.Themes,
  Vcl.Styles,
  View.Cadastro.Produto in 'View.Cadastro.Produto.pas' {Form_Cadastro_Produto},
  View.Padrao.Form in 'View.Padrao.Form.pas' {Form_Padrao_Form},
  Utils in 'Utils.pas',
  View.Pesquisa.Produto in 'View.Pesquisa.Produto.pas' {Form_PesquisaProduto},
  Entity.Cadastro.Produto in 'Entity.Cadastro.Produto.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm_Principal_MenuModerno, Form_Principal_MenuModerno);
  Application.CreateForm(TDataModuleConexao, DataModuleConexao);
  Application.Run;
end.
