unit frmProdutoLoc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, dmProdutoLoc,
  System.ImageList, Vcl.ImgList, frmProdutoCad;

type
  TFrm_ProdutoLoc = class(TForm)
    dsProdutoLoc: TDataSource;
    ilAtivo: TImageList;
    pnlBaixo: TPanel;
    btnNovo: TBitBtn;
    btnExcluir: TBitBtn;
    btnFechar: TBitBtn;
    btnExibir: TBitBtn;
    pnlMeio: TPanel;
    pnlFuncoesBusca: TPanel;
    cbbModoDeBusca: TComboBox;
    edtCodigo: TEdit;
    edtNome: TEdit;
    btnBuscar: TBitBtn;
    pnlGrid: TPanel;
    dbgrd: TDBGrid;
    pnlTopo: TPanel;
    imgicon: TImage;
    lblTITULO: TLabel;
    procedure ConfigurarModoBusca;
    procedure ModoBusca(Modo: TModoBusca);
    procedure cbbModoDeBuscaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnExibirClick(Sender: TObject);
    procedure dbgrdDblClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);

  private
    { Private declarations }
    FProdutoDM : TDM_ProdutoLoc;
    FCodigo : Integer;
    procedure ExibirProdutoCad;
  public
    { Public declarations }
  end;

var
  Frm_ProdutoLoc: TFrm_ProdutoLoc;

implementation

{$R *.dfm}

{ TFrm_ProdutoLoc }

procedure TFrm_ProdutoLoc.ExibirProdutoCad;
begin
  if dbgrd.DataSource.DataSet.IsEmpty then
    Exit;

  FCodigo := dbgrd.DataSource.DataSet.FieldByName('id').AsInteger;
  if FCodigo = 0 then
    Exit;

  Application.CreateForm(TFrm_ProdutoCad, Frm_ProdutoCad);
  try
    Frm_ProdutoCad.CarregarCliente(FCodigo);
    Frm_ProdutoCad.AlterarModoOperacao(tpExibir);
    Frm_ProdutoCad.ShowModal;
  finally
    FreeAndNil(Frm_ProdutoCad);
    dbgrd.DataSource.DataSet.Refresh;
  end;
end;

procedure TFrm_ProdutoLoc.btnBuscarClick(Sender: TObject);
begin
  case cbbModoDeBusca.ItemIndex of
    0:
      ModoBusca(mdCodigo);
    1:
      ModoBusca(mdNome);
  end;
  dbgrd.DataSource := dsProdutoLoc;

end;

procedure TFrm_ProdutoLoc.btnExcluirClick(Sender: TObject);
begin
  if Application.MessageBox(PChar('Deseja excluir o produto Id:  ' + dbgrd.DataSource.DataSet.FieldByName('id').AsString + '?'), 'Zovni', MB_YESNO + MB_ICONQUESTION) = IDYES then
   begin

   end;
end;

procedure TFrm_ProdutoLoc.btnExibirClick(Sender: TObject);
begin
  ExibirProdutoCad;
end;

procedure TFrm_ProdutoLoc.btnNovoClick(Sender: TObject);
begin
  Application.CreateForm(TFrm_ProdutoCad, Frm_ProdutoCad);
  try
  Frm_ProdutoCad.AlterarModoOperacao(tpNovo);
  Frm_ProdutoCad.ShowModal;
  finally
   FreeAndNil(Frm_ProdutoCad);
  end;
end;

procedure TFrm_ProdutoLoc.cbbModoDeBuscaClick(Sender: TObject);
begin
  ConfigurarModoBusca;
end;

procedure TFrm_ProdutoLoc.ConfigurarModoBusca;
begin
  begin
    edtCodigo.Visible := False;
    edtNome.Visible := False;

    case cbbModoDeBusca.ItemIndex of
      0:
        edtCodigo.Visible := True;
      1:
        edtNome.Visible := True;
    end;

  end;
end;

procedure TFrm_ProdutoLoc.dbgrdDblClick(Sender: TObject);
begin
  ExibirProdutoCad;
end;

procedure TFrm_ProdutoLoc.FormCreate(Sender: TObject);
begin
  FProdutoDM := TDM_ProdutoLoc.Create(nil);
  dbgrd.DataSource := dsProdutoLoc;
  dbgrd.DataSource.DataSet.Active := True;
end;

procedure TFrm_ProdutoLoc.ModoBusca(Modo: TModoBusca);
begin
    case Modo of
    mdCodigo:
      FProdutoDM.Buscar(StrToIntDef(edtCodigo.Text, 0), mdCodigo);
    mdNome:
      FProdutoDM.Buscar(edtNome.Text, mdNome);
  end;
end;


end.
