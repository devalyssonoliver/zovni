program ZOvni;

uses
  System.UITypes,
  Vcl.Forms,
  frmConfiguracaoBanco in '..\Views\Configuracoes\frmConfiguracaoBanco.pas' {Frm_Config},
  Vcl.Themes,
  Vcl.Styles,
  zArquivoConfig in '..\Classes\zArquivoConfig.pas',
  IArquivoConfig in '..\Interfaces\IArquivoConfig.pas',
  Vcl.Dialogs,
  System.SysUtils,
  Gerenciador in '..\DataModule\Gerenciador.pas' {DM_Gerenciador: TDataModule},
  frmMenuPrincipal in '..\Views\Principal\frmMenuPrincipal.pas' {Frm_Principal},
  dmClienteCad in '..\DataModule\DMCad\dmClienteCad.pas' {DM_ClientesCad: TDataModule},
  UFuncoesAuxiliares in '..\Units\UFuncoesAuxiliares.pas',
  dmClienteLoc in '..\DataModule\DMLoc\dmClienteLoc.pas' {DM_ClienteLoc: TDataModule},
  dmProdutoLoc in '..\DataModule\DMLoc\dmProdutoLoc.pas' {DM_ProdutoLoc: TDataModule},
  dmProdutoCad in '..\DataModule\DMCad\dmProdutoCad.pas' {DM_ProdutoCad: TDataModule},
  dmFornecedorLoc in '..\DataModule\DMLoc\dmFornecedorLoc.pas' {DM_FornecedorLoc: TDataModule},
  dmUsuario in '..\DataModule\DMCad\dmUsuario.pas' {DM_Usuarios: TDataModule},
  frmLogin in '..\Views\Inicializacao\frmLogin.pas' {Frm_Loginn},
  frmSplashScreen in '..\Views\Inicializacao\frmSplashScreen.pas' {Form1},
  Winapi.Windows {Form1},
  dmFornecedorCad in '..\DataModule\DMCad\dmFornecedorCad.pas' {DM_FornecedorCad: TDataModule},
  frmClienteLoc in '..\Views\Localizacoes\frmClienteLoc.pas' {Frm_ClienteLoc},
  frmFornecedorLoc in '..\Views\Localizacoes\frmFornecedorLoc.pas' {Frm_FornecedorLoc},
  frmProdutoLoc in '..\Views\Localizacoes\frmProdutoLoc.pas' {Frm_ProdutoLoc},
  frmClienteCad in '..\Views\Cadastros\frmClienteCad.pas' {Frm_ClientesCad},
  frmFornecedorCad in '..\Views\Cadastros\frmFornecedorCad.pas' {Form_FornecedorCad},
  frmProdutoCad in '..\Views\Cadastros\frmProdutoCad.pas' {Frm_ProdutoCad},
  frmCompraProdutosCad in '..\Views\Cadastros\frmCompraProdutosCad.pas' {Frm_CompraCad},
  frmCompraCad in '..\Views\Cadastros\frmCompraCad.pas' {Frm_Compra},
  frmUsuarioCad in '..\Views\Cadastros\frmUsuarioCad.pas' {Frm_Usuario},
  dmCompraCad in '..\DataModule\DMCad\dmCompraCad.pas' {DataModule1: TDataModule},
  frmBackup in '..\Views\Configuracoes\frmBackup.pas' {Frm_Backup},
  zBackup in '..\Classes\zBackup.pas',
  Backup in '..\Interfaces\Backup.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows11 White Smoke');
  Application.CreateForm(TDM_Gerenciador, DM_Gerenciador);
  try
    DM_Gerenciador.fdConnection.Connected := True;
    Application.CreateForm(TFrm_Loginn, Frm_Loginn);
    if Frm_Loginn.ShowModal = mrOk then
    begin
      FreeAndNil(Frm_Loginn);
      Application.CreateForm(TFrm_Principal, Frm_Principal);
      Application.Run;
    end
    else
      Application.Terminate;
  except
    on E: Exception do
    begin
      Application.MessageBox('Não foi possível conectar!' + sLineBreak + 'Configure as informações de acesso.', 'ZOvni - Gestão', MB_ICONERROR);
      Application.CreateForm(TFrm_Config, Frm_Config);
      Frm_Config.ShowModal;
    end;
  end;

end.

