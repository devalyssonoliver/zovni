unit frmFornecedorLoc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, dmFornecedorLoc,
  System.ImageList, Vcl.ImgList, frmFornecedorCad;

type
  TFrm_FornecedorLoc = class(TForm)
    dsFornecedorLoc: TDataSource;
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
    procedure btnBuscarClick(Sender: TObject);
    procedure ModoBusca(Modo: TModoBusca);
    procedure cbbModoDeBuscaChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNovoClick(Sender: TObject);
    procedure btnExibirClick(Sender: TObject);
    procedure dbgrdDblClick(Sender: TObject);

  private
    FDMFornecedor : TDM_FornecedorLoc;
    procedure ConfigurarModoBusca;
    procedure ExibirCadFornecedor;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_FornecedorLoc: TFrm_FornecedorLoc;
   FCodigo : Integer;

implementation

{$R *.dfm}
procedure TFrm_FornecedorLoc.btnBuscarClick(Sender: TObject);
begin
   case cbbModoDeBusca.ItemIndex of
    0:
      ModoBusca(mdCodigo);
    1:
      ModoBusca(mdNome);
  end;
  dbgrd.DataSource := dsFornecedorLoc;
end;

procedure TFrm_FornecedorLoc.btnExcluirClick(Sender: TObject);
begin
   if Application.MessageBox(PChar('Deseja excluir o cliente Id:  ' + dbgrd.DataSource.DataSet.FieldByName('id').AsString + '?'), 'Zovni', MB_YESNO + MB_ICONQUESTION) = IDYES then
   begin
     FDMFornecedor.Excluir;
   end;
end;

procedure TFrm_FornecedorLoc.btnExibirClick(Sender: TObject);
begin
 ExibirCadFornecedor;
end;

procedure TFrm_FornecedorLoc.btnFecharClick(Sender: TObject);
begin
  FreeAndNil(FDMFornecedor);
  Close;
end;

procedure TFrm_FornecedorLoc.btnNovoClick(Sender: TObject);
begin
   Form_FornecedorCad := TForm_FornecedorCad.Create(nil);
   try
   Form_FornecedorCad.AlterarModoOperacao(tpNovo);
   Form_FornecedorCad.ShowModal;
   finally
   FreeAndNil(Form_FornecedorCad);
   dbgrd.DataSource.DataSet.Refresh;
   end;
end;

procedure TFrm_FornecedorLoc.cbbModoDeBuscaChange(Sender: TObject);
begin
  ConfigurarModoBusca;
end;

procedure TFrm_FornecedorLoc.ConfigurarModoBusca;
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
procedure TFrm_FornecedorLoc.dbgrdDblClick(Sender: TObject);
begin
 ExibirCadFornecedor;
end;

procedure TFrm_FornecedorLoc.ExibirCadFornecedor;
begin
  if dbgrd.DataSource.DataSet.IsEmpty then
    Exit;

  FCodigo := dbgrd.DataSource.DataSet.FieldByName('id').AsInteger;
  if FCodigo = 0 then
    Exit;

  Form_FornecedorCad := TForm_FornecedorCad.Create(nil);
  try
    Form_FornecedorCad.Exibir(FCodigo);
    Form_FornecedorCad.AlterarModoOperacao(tpExibir);
    Form_FornecedorCad.ShowModal;
  finally
    FreeAndNil(Form_FornecedorCad);
    dbgrd.DataSource.DataSet.Refresh;
  end;
end;

procedure TFrm_FornecedorLoc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(FDMFornecedor);
end;

procedure TFrm_FornecedorLoc.FormCreate(Sender: TObject);
begin
  FDMFornecedor := TDM_FornecedorLoc.Create(Nil);
  dsFornecedorLoc := FDMFornecedor.fdqryFornecedores.DataSource;
end;

procedure TFrm_FornecedorLoc.ModoBusca(Modo: TModoBusca);
begin
  case Modo of
    mdCodigo:
      FDMFornecedor.Buscar(StrToIntDef(edtCodigo.Text, 0), mdCodigo);
    mdNome:
      FDMFornecedor.Buscar(edtNome.Text, mdNome);
  end;
end;
end.
