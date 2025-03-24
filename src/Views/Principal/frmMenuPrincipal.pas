unit frmMenuPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Ribbon,
  Vcl.ActnCtrls, Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnMenus, Vcl.RibbonActnMenus,
  System.Actions, Vcl.ActnList, Vcl.RibbonSilverStyleActnCtrls,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.RibbonLunaStyleActnCtrls,
  Vcl.RibbonObsidianStyleActnCtrls, Vcl.Buttons, Vcl.ComCtrls, Vcl.Menus,
  Vcl.ExtCtrls, frmClienteLoc, frmProdutoLoc, frmLogin, frmCompraProdutosCad;

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
    pnlInfors: TPanel;
    btnProdutos: TSpeedButton;
    btnFornecedor: TSpeedButton;
    CadastrosMoviment: TRibbonPage;
    movimentacoes: TRibbonGroup;
    btnCompras: TSpeedButton;
    procedure btnClientesClick(Sender: TObject);
    procedure MostrarHint(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnProdutosClick(Sender: TObject);
    procedure btnFornecedorClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnComprasClick(Sender: TObject);
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
  frmClienteCad, frmFornecedorLoc, frmSplashScreen;

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

procedure TFrm_Principal.FormCreate(Sender: TObject);
begin

  Application.CreateForm(TForm1, Form1);
  try
    Form1.ShowModal;
  finally
    FreeAndNil(Form1);
  end;
end;

procedure TFrm_Principal.FormShow(Sender: TObject);
begin
  Application.ShowHint := True;
  Application.OnHint := MostrarHint;
end;

procedure TFrm_Principal.MostrarHint(Sender: TObject);
begin
  if Application.Hint <> '' then
    pnlInfors.Caption := 'Formulário em Exibição: ' + Application.Hint
  else
    pnlInfors.Caption := '';
end;

end.

