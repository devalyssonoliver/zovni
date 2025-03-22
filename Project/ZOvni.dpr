program ZOvni;

uses
  System.UITypes,
  Vcl.Forms,
  frmConfigBanco in '..\Views\frmConfigBanco.pas' {Frm_Config},
  Vcl.Themes,
  Vcl.Styles,
  ArquivoConfig in '..\Classes\ArquivoConfig.pas',
  IArquivoConfig in '..\Interfaces\IArquivoConfig.pas',
  Vcl.Dialogs,
  System.SysUtils,
  Gerenciador in '..\DataModule\Gerenciador.pas' {DM_Gerenciador: TDataModule},
  frmPrincipal in '..\Views\frmPrincipal.pas' {Frm_Principal},
  dmClienteCad in '..\DataModule\DMCad\dmClienteCad.pas' {DM_ClientesCad: TDataModule},
  frmClienteCad in '..\Views\Views.Cadastros\frmClienteCad.pas' {Frm_ClientesCad},
  UFuncoesAuxiliares in '..\Units\UFuncoesAuxiliares.pas',
  frmClienteLoc in '..\Views\Views.Localizacao\frmClienteLoc.pas' {Frm_ClienteLoc},
  dmClienteLoc in '..\DataModule\DMLoc\dmClienteLoc.pas' {DM_ClienteLoc: TDataModule},
  dmProdutoLoc in '..\DataModule\DMLoc\dmProdutoLoc.pas' {DM_ProdutoLoc: TDataModule},
  frmProdutoLoc in '..\Views\Views.Localizacao\frmProdutoLoc.pas' {Frm_ProdutoLoc},
  frmProdutoCad in '..\Views\Views.Cadastros\frmProdutoCad.pas' {Frm_ProdutoCad},
  dmProdutoCad in '..\DataModule\DMCad\dmProdutoCad.pas' {DM_ProdutoCad: TDataModule},
  dmFornecedorLoc in '..\DataModule\DMLoc\dmFornecedorLoc.pas' {DM_FornecedorLoc: TDataModule},
  frmFornecedorLoc in '..\Views\Views.Localizacao\frmFornecedorLoc.pas' {Frm_FornecedorLoc},
  dmUsuario in '..\DataModule\DMCad\dmUsuario.pas' {DM_Usuarios: TDataModule},
  frmLogin in '..\Views\frmLogin.pas' {Frm_Loginn},
  frmInicializar in '..\Views\frmInicializar.pas' {Form1},
  Winapi.Windows {Form1},
  frmFornecedorCad in '..\Views\Views.Cadastros\frmFornecedorCad.pas' {Form_FornecedorCad},
  dmFornecedorCad in '..\DataModule\DMCad\dmFornecedorCad.pas' {DM_FornecedorCad: TDataModule},
  frmCompraCad in '..\Views\Views.Cadastros\frmCompraCad.pas' {Frm_CompraCad};

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
      Application.MessageBox('Não foi possível conectar!' + sLineBreak +
                             'Configure as informações de acesso.',
                             'ZOvni - Gestão', MB_ICONERROR);
      Application.CreateForm(TFrm_Config, Frm_Config);
      Frm_Config.ShowModal;
    end;
  end;


end.

