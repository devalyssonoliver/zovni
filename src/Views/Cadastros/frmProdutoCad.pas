unit frmProdutoCad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.DBCtrls, Data.DB, Vcl.Mask, Vcl.Grids, Vcl.DBGrids, dmProdutoCad,
  UFuncoesAuxiliares, System.ImageList, Vcl.ImgList;

type
  TModoOperacao = (tpNovo, tpEditar, tpExibir);

  TFrm_ProdutoCad = class(TForm)
    pnlTopo: TPanel;
    lblTITULO: TLabel;
    imgicon: TImage;
    pnlBaixo: TPanel;
    btnSalvar: TBitBtn;
    btnNovo: TBitBtn;
    btnEditar: TBitBtn;
    btnFechar: TBitBtn;
    pnlMeio: TPanel;
    pgcModulos: TPageControl;
    tsCadastroProd: TTabSheet;
    grpInforBasic: TGroupBox;
    dbedtId: TDBEdit;
    dsProdutoCad: TDataSource;
    lblNome: TLabel;
    lblMarca: TLabel;
    dbedtMarca: TDBEdit;
    lblGenero: TLabel;
    lblPreco: TLabel;
    dbedtPreco: TDBEdit;
    dbchkAtivo: TDBCheckBox;
    lblDataCadastro: TLabel;
    dbedtDataCadastro: TDBEdit;
    dbedtNome: TDBEdit;
    dsEstoque: TDataSource;
    lblInforAdic: TLabel;
    dbmmoinformadic: TDBMemo;
    lblEstoqueENumeracao: TLabel;
    dbcbbgenero: TDBComboBox;
    dbgrdNumeracao: TDBGrid;
    il: TImageList;
    btnCancelar: TBitBtn;
    dbedtEstoqueTotal: TDBEdit;
    dbedtCusto: TDBEdit;
    lblCusto: TLabel;
    lblEstoque: TLabel;
    lblIdFornecedor: TLabel;
    dbedtid_fornecedor: TDBEdit;
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FProdutoCad: TDM_ProdutoCad;
  public
    { Public declarations }
    procedure AlterarModoOperacao(Modo: TModoOperacao);
    procedure CarregarCliente(_Codigo: Integer);
  end;

var
  Frm_ProdutoCad: TFrm_ProdutoCad;

implementation

{$R *.dfm}



{ TFrm_ProdutoCad }

procedure TFrm_ProdutoCad.AlterarModoOperacao(Modo: TModoOperacao);
begin
  case Modo of
    tpNovo, tpEditar:
      begin
        if Modo = tpNovo then
        begin
          FProdutoCad.Inserir;
        end
        else
        begin
          FProdutoCad.Editar;
        end;
        grpInforBasic.Enabled := True;

        DefinirEstadoBotoes([btnNovo, btnEditar], False);
        DefinirEstadoBotoes([btnSalvar, btnCancelar, btnFechar], True);
      end;

    tpExibir:
      begin
        grpInforBasic.Enabled := False;
        DefinirEstadoBotoes([btnNovo, btnEditar, btnFechar], True);
        DefinirEstadoBotoes([btnSalvar, btnCancelar], False);
      end;
  end;
end;

procedure TFrm_ProdutoCad.btnCancelarClick(Sender: TObject);
begin
  FProdutoCad.Cancelar;
  AlterarModoOperacao(tpExibir);
end;

procedure TFrm_ProdutoCad.btnEditarClick(Sender: TObject);
begin
  AlterarModoOperacao(tpEditar);
end;

procedure TFrm_ProdutoCad.btnNovoClick(Sender: TObject);
begin
  AlterarModoOperacao(tpNovo);
end;

procedure TFrm_ProdutoCad.btnSalvarClick(Sender: TObject);
begin
  if VerificarPreenchimentoObrigatorio([dbedtNome, dbedtMarca, dbedtPreco, dbedtid_fornecedor, dbedtCusto]) then
    Exit;
  if dbedtCusto.Text > dbedtPreco.Text then
  begin
    if Application.MessageBox('O preço é menor que o custo, deseja continuar?', 'ZOvni', MB_ICONQUESTION) = mrYes then
      Exit;
  end;

  FProdutoCad.Salvar;
  AlterarModoOperacao(tpExibir);
end;

procedure TFrm_ProdutoCad.CarregarCliente(_Codigo: Integer);
begin
  FProdutoCad.ExibirProduto(_Codigo);
end;

procedure TFrm_ProdutoCad.FormCreate(Sender: TObject);
begin
  FProdutoCad := TDM_ProdutoCad.Create(nil);
end;

procedure TFrm_ProdutoCad.FormDestroy(Sender: TObject);
begin
  FreEAndNil(FProdutoCad);

end;

end.

