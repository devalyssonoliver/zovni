unit frmMenuPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Ribbon,
  Vcl.ActnCtrls, Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnMenus, Vcl.RibbonActnMenus,
  System.Actions, Vcl.ActnList, Vcl.RibbonSilverStyleActnCtrls,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.RibbonLunaStyleActnCtrls,
  Vcl.RibbonObsidianStyleActnCtrls, Vcl.Buttons, Vcl.ComCtrls, Vcl.Menus,
  Vcl.ExtCtrls, frmClienteLoc, frmProdutoLoc, frmLogin, frmCompraProdutosCad,
  Vcl.Imaging.pngimage, Vcl.Imaging.jpeg, ShellApi, System.ImageList,
  Vcl.ImgList, Vcl.StdCtrls;

type
  TFrm_Principal = class(TForm)
    actmgr2: TActionManager;
    rbnMenu: TRibbon;
    accessbar: TRibbonQuickAccessToolbar;
    Cadastros: TRibbonPage;
    appMenu: TRibbonApplicationMenuBar;
    rbgroupinfobasic: TRibbonGroup;
    actClientes: TAction;
    btnClientes: TSpeedButton;
    btnProdutos: TSpeedButton;
    btnFornecedor: TSpeedButton;
    CadastrosMoviment: TRibbonPage;
    movimentacoes: TRibbonGroup;
    btnCompras: TSpeedButton;
    stat: TStatusBar;
    spl: TSplitter;
    btnUsuarios: TSpeedButton;
    imgWalpaper: TImage;
    img_LogoBackground: TImage;
    img_QRCODE: TImage;
    rbnpgConfiguracoes: TRibbonPage;
    rbngrpmGrupoConfig: TRibbonGroup;
    btn_FormBackup: TSpeedButton;
    lbl_QrCode: TLabel;
    procedure btnClientesClick(Sender: TObject);
    procedure btnProdutosClick(Sender: TObject);
    procedure btnFornecedorClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnComprasClick(Sender: TObject);
    procedure btnUsuariosClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure img_QRCODEClick(Sender: TObject);
    procedure btn_FormBackupClick(Sender: TObject);
  private
    { Private declarations }
    FormLogin: TFrm_Loginn;
  public
    { Public declarations }
  end;

var
  Frm_Principal: TFrm_Principal;

implementation

uses
  frmClienteCad, frmFornecedorLoc, frmSplashScreen, frmUsuarioCad, Vcl.GraphUtil,
  frmBackup;

{$R *.dfm}

procedure TFrm_Principal.btnClientesClick(Sender: TObject);
begin
  Application.CreateForm(TFrm_ClienteLoc, Frm_ClienteLoc);
  Frm_ClienteLoc.Show;
end;

procedure TFrm_Principal.btnComprasClick(Sender: TObject);
begin
  Application.CreateForm(TFrm_CompraCad, Frm_CompraCad);
  Frm_CompraCad.ShowModal;
end;

procedure TFrm_Principal.btnFornecedorClick(Sender: TObject);
begin
  Application.CreateForm(TFrm_FornecedorLoc, Frm_FornecedorLoc);
  Frm_FornecedorLoc.Show;

end;

procedure TFrm_Principal.btnProdutosClick(Sender: TObject);
begin
  Application.CreateForm(TFrm_ProdutoLoc, Frm_ProdutoLoc);
  Frm_ProdutoLoc.Show;
end;

procedure TFrm_Principal.btnUsuariosClick(Sender: TObject);
begin
  Frm_Usuario := TFrm_Usuario.Create(nil);
  try
    Frm_Usuario.AlterarModoOperacao(mdExibir);
    Frm_Usuario.ShowModal;
  finally
    FreeAndNil(Frm_Usuario);
  end;
end;

procedure TFrm_Principal.btn_FormBackupClick(Sender: TObject);
begin
  Frm_backup := TFrm_Backup.Create(nil);
  try
    Frm_Backup.ShowModal;
  finally
    FreeAndNil(Frm_Backup);
  end;
end;

procedure TFrm_Principal.FormCreate(Sender: TObject);
begin

  Application.CreateForm(TForm1, Form1);
  try
    Form1.ShowModal;
  finally
    FreeAndNil(Form1);
  end;
end;

procedure TFrm_Principal.FormPaint(Sender: TObject);
begin
  GradientFillCanvas(Canvas, RGB(250, 250, 250),  // Cor inicial (branco gelo)
    RGB(210, 230, 255),  // Cor final (azul bebê)
    ClientRect,          // Área
    gdVertical);
end;

procedure TFrm_Principal.img_QRCODEClick(Sender: TObject);
begin
  ShellExecute(0, 'open', 'https://github.com/devalyssonoliver/zovni', nil, nil, SHOW_OPENWINDOW);
end;

end.

