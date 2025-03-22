unit frmCompraCad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  Vcl.Grids, Vcl.DBGrids, System.ImageList, Vcl.ImgList, Vcl.Mask, Vcl.DBCtrls;

type
  TModoOperacao = (tpNovo, tpEditar, tpExibir);

  TFrm_CompraCad = class(TForm)
    pnlTopo: TPanel;
    lblTITULO: TLabel;
    imgicon: TImage;
    Panel1: TPanel;
    btnAdicionarCompra: TSpeedButton;
    imgListButtons: TImageList;
    btnEditarCompra: TSpeedButton;
    btnExcluirCompra: TSpeedButton;
    lblCodigo: TLabel;
    dbgrdProdutosCompra: TDBGrid;
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
  private
    procedure AlterarModoOperacao(Modo: TModoOperacao);
  public
    procedure Exibir(_Codigo: Integer);
  end;

var
  Frm_CompraCad: TFrm_CompraCad;

implementation

{$R *.dfm}

procedure TFrm_CompraCad.AlterarModoOperacao(Modo: TModoOperacao);
begin
  case Modo of
    tpNovo:
      begin
       // FCompra.InserirCompra;
        // dbedtid_compra.SetFocus;
      end;
    tpEditar:
      begin
       //  FCompra.EditarCompra;
      end;
    tpExibir:
      begin
        // FCompra.CancelarCompra;
      end;
  end;

{  btnNovo.Enabled := Modo = tpExibir;
  btnEditar.Enabled := Modo = tpExibir;
    btnSalvar.Enabled := Modo <> tpExibir;
      btnCancelar.Enabled := Modo <> tpExibir;}
end;

procedure TFrm_CompraCad.btnNovoClick(Sender: TObject);
begin
  AlterarModoOperacao(tpNovo);
end;

procedure TFrm_CompraCad.btnEditarClick(Sender: TObject);
begin
  AlterarModoOperacao(tpEditar);
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
 //  FCompra.ExibirCompra(_Codigo);
end;

end.

