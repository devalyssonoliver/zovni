unit frmCompraCad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Data.DB, Vcl.Grids, Vcl.DBGrids, System.ImageList,
  Vcl.ImgList, Vcl.Mask, Vcl.DBCtrls, dmCompraCad;

type
  TModoOperacao = (tpNovo, tpEditar, tpExibir);

  TFrm_CompraCad = class(TForm)
    pnlTopo: TPanel;
    lblTITULO: TLabel;
    imgicon: TImage;
    pnlBaixo: TPanel;
    btnSalvar: TBitBtn;
    btnNovo: TBitBtn;
    btnEditar: TBitBtn;
    btnFechar: TBitBtn;
    btnCancelar: TBitBtn;
    pnlCamposBottom: TPanel;
    dbedtvalor_total: TDBEdit;
    dsCompra: TDataSource;
    lblValorCompra: TLabel;
    lblCustoTotal: TLabel;
    dbedtcusto_total: TDBEdit;
    dbedtid_compra: TDBEdit;
    lblForncedorId: TLabel;
    dbedtid_fornecedor: TDBEdit;
    lbl: TLabel;
    edtNomeFornecedor: TEdit;
    btnFornecedor: TBitBtn;
    ilimgs: TImageList;
    dbedtdata_compra: TDBEdit;
    dbgrdCompraProd: TDBGrid;
    dsProdutosGRID: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure dbgrdCompraProdEnter(Sender: TObject);
    procedure dbgrdCompraProdColExit(Sender: TObject);
  private
    procedure AlterarModoOperacao(Modo: TModoOperacao);
  public
    procedure Exibir(_Codigo: Integer);
  end;

var
  Frm_CompraCad: TFrm_CompraCad;
  FCompra: TDMCompra_Cad;

implementation

{$R *.dfm}

procedure TFrm_CompraCad.FormCreate(Sender: TObject);
begin
  FCompra := TDMCompra_Cad.Create(nil);
  dsCompra.DataSet := FCompra.fdqryCompra;
  dsProdutosGRID.DataSet := FCompra.fdqryCompraProd;
end;

procedure TFrm_CompraCad.FormDestroy(Sender: TObject);
begin
  dsCompra.DataSet := nil;
  dsProdutosGRID.DataSet := nil;
  FreeAndNil(FCompra);
end;

procedure TFrm_CompraCad.AlterarModoOperacao(Modo: TModoOperacao);
begin
  case Modo of
    tpNovo:
      begin
        FCompra.InserirCompra;
        dbedtid_compra.SetFocus;
      end;
    tpEditar:
      begin
        FCompra.EditarCompra;
      end;
    tpExibir:
      begin
        FCompra.CancelarCompra;
      end;
  end;

  btnNovo.Enabled := Modo = tpExibir;
  btnEditar.Enabled := Modo = tpExibir;
  btnSalvar.Enabled := Modo <> tpExibir;
  btnCancelar.Enabled := Modo <> tpExibir;
end;

procedure TFrm_CompraCad.btnNovoClick(Sender: TObject);
begin
  AlterarModoOperacao(tpNovo);
end;

procedure TFrm_CompraCad.btnEditarClick(Sender: TObject);
begin
  AlterarModoOperacao(tpEditar);
end;

procedure TFrm_CompraCad.btnSalvarClick(Sender: TObject);
begin
  FCompra.SalvarCompra;
  dsProdutosGRID.AutoEdit := True;
  dsProdutosGRID.DataSet := FCompra.fdqryCompraProd;
  AlterarModoOperacao(tpExibir);
end;

procedure TFrm_CompraCad.btnCancelarClick(Sender: TObject);
begin
  AlterarModoOperacao(tpExibir);
end;

procedure TFrm_CompraCad.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrm_CompraCad.Exibir(_Codigo: Integer);
begin
  FCompra.ExibirCompra(_Codigo);
end;

procedure TFrm_CompraCad.dbgrdCompraProdEnter(Sender: TObject);
begin
  if FCompra.fdqryCompra.State in [dsInsert, dsEdit] then
    FCompra.fdqryCompra.Post;
end;

procedure TFrm_CompraCad.dbgrdCompraProdColExit(Sender: TObject);
var
  NomeProduto: string;
  PrecoUnitario, CustoUnitario: Currency;
begin
  if dsProdutosGRID.State in [dsInsert, dsEdit] then
  begin
    if dbgrdCompraProd.SelectedIndex = 0 then
    begin
      FCompra.BuscarProdutoPorID(dbgrdCompraProd.Fields[0].AsInteger, NomeProduto, PrecoUnitario, CustoUnitario);
      if NomeProduto <> '' then
      begin
        dbgrdCompraProd.Fields[1].AsString := NomeProduto;
        dbgrdCompraProd.Fields[3].AsCurrency := PrecoUnitario;
        dbgrdCompraProd.Fields[4].AsCurrency := CustoUnitario;
      end
      else
      begin
        ShowMessage('Produto n�o encontrado!');
      end;
    end;
  end;
end;

end.
