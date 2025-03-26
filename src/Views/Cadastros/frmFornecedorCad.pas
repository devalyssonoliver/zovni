unit frmFornecedorCad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  Vcl.DBCtrls, Vcl.Mask, Vcl.ComCtrls, dmFornecedorCad, System.ImageList,
  Vcl.ImgList;

type
  TModoOperacao = (tpNovo, tpEditar, tpExibir);

  TForm_FornecedorCad = class(TForm)
    pnlTopo: TPanel;
    lblTITULO: TLabel;
    imgicon: TImage;
    pnlBaixo: TPanel;
    btnSalvar: TBitBtn;
    btnNovo: TBitBtn;
    btnEditar: TBitBtn;
    btnCancelar: TBitBtn;
    dsFornecedorCad: TDataSource;
    dsEstado: TDataSource;
    dsCidade: TDataSource;
    btnFechar: TBitBtn;
    pgcCadastro: TPageControl;
    tsCad: TTabSheet;
    grpInfo: TGroupBox;
    lblNome: TLabel;
    lblCNPJ: TLabel;
    lblCPF: TLabel;
    lblTipo: TLabel;
    lblTelefone: TLabel;
    dbedtCPF: TDBEdit;
    dbedtCNPJ: TDBEdit;
    dbcbbTipo: TDBComboBox;
    dbedtTelefone: TDBEdit;
    dbedtNome: TDBEdit;
    dbedtId: TDBEdit;
    grpLocalizacaoInfo: TGroupBox;
    lblEndereco: TLabel;
    lblCEP: TLabel;
    lblCidade: TLabel;
    lblNumero: TLabel;
    lblBairro: TLabel;
    lblEstado: TLabel;
    dbedtEndereco: TDBEdit;
    dbedtCEP: TDBEdit;
    dbedtNumero: TDBEdit;
    dbedtBairro: TDBEdit;
    dbcbbEstado: TDBComboBox;
    dbcbbCidade: TDBComboBox;
    dbchkAtivo: TDBCheckBox;
    ilList: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure dbcbbTipoChange(Sender: TObject);
    procedure dbcbbEstadoChange(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
  private
    { Private declarations }
    FDMColaborador: TDM_FornecedorCad;

  public
    { Public declarations }
    procedure AlterarModoOperacao(Modo: TModoOperacao);
    procedure Exibir(_Codigo: Integer);
  end;

var
  Form_FornecedorCad: TForm_FornecedorCad;

implementation

uses
  UFuncoesAuxiliares;

{$R *.dfm}

procedure TForm_FornecedorCad.AlterarModoOperacao(Modo: TModoOperacao);
begin
  begin
    case Modo of
      tpNovo, tpEditar:
        begin
          if Modo = tpNovo then
            FDMColaborador.Inserir
          else
            FDMColaborador.Editar;

          grpInfo.Enabled := True;
          grpLocalizacaoInfo.Enabled := True;
          DefinirEstadoBotoes([btnNovo, btnEditar], False);
          DefinirEstadoBotoes([btnSalvar, btnCancelar, btnFechar], True);
        end;

      tpExibir:
        begin
          grpInfo.Enabled := False;
          grpLocalizacaoInfo.Enabled := False;
          DefinirEstadoBotoes([btnNovo, btnEditar, btnFechar], True);
          DefinirEstadoBotoes([btnSalvar, btnCancelar], False);
        end;
    end;
  end;
end;

procedure TForm_FornecedorCad.btnCancelarClick(Sender: TObject);
begin
  FDMColaborador.Cancelar;
  AlterarModoOperacao(tpExibir);
end;

procedure TForm_FornecedorCad.btnEditarClick(Sender: TObject);
begin
  AlterarModoOperacao(tpEditar);
end;

procedure TForm_FornecedorCad.btnFecharClick(Sender: TObject);
begin
  dsFornecedorCad.DataSet := nil;
  FDMColaborador.Destroy;
  Close;
end;

procedure TForm_FornecedorCad.btnNovoClick(Sender: TObject);
begin
  AlterarModoOperacao(tpNovo);
end;

procedure TForm_FornecedorCad.btnSalvarClick(Sender: TObject);
begin
  if VerificarPreenchimentoObrigatorio([dbedtNome, dbedtTelefone, dbedtEndereco]) then
    Exit;
  FDMColaborador.Salvar;
  AlterarModoOperacao(tpExibir);

end;

procedure TForm_FornecedorCad.dbcbbEstadoChange(Sender: TObject);
begin
  if FDMColaborador.fdqryEstado.Locate('nome', dbcbbEstado.Text, []) then
  begin
    FDMColaborador.CarregarCidades(FDMColaborador.fdqryEstado.FieldByName('uf').AsString);
    dbcbbCidade.Items.Clear;
    FDMColaborador.fdqryCidade.First;
    while not FDMColaborador.fdqryCidade.Eof do
    begin
      dbcbbCidade.Items.Add(FDMColaborador.fdqryCidade.FieldByName('nome').AsString);
      FDMColaborador.fdqryCidade.Next;
    end;
  end;
end;

procedure TForm_FornecedorCad.dbcbbTipoChange(Sender: TObject);
begin
  dbedtCPF.Visible := False;
  dbedtCNPJ.Visible := False;
  lblCPF.Visible := False;
  lblCNPJ.Visible := False;

  case dbcbbTipo.ItemIndex of
    0:  // Pessoa Física
      begin
        dbedtCPF.Visible := True;
        lblCPF.Visible := True;
      end;

    1:  // Pessoa Jurídica
      begin
        dbedtCNPJ.Visible := True;
        lblCNPJ.Visible := True;
      end;
  end;
end;

procedure TForm_FornecedorCad.Exibir(_Codigo: Integer);
begin
  FDMColaborador.ExibirFornecedor(_Codigo);
end;

procedure TForm_FornecedorCad.FormCreate(Sender: TObject);
begin
  FDMColaborador := TDM_FornecedorCad.Create(nil);
  FDMColaborador.CarregarEstados;

  dbcbbEstado.Items.Clear;
  FDMColaborador.fdqryEstado.First;
  while not FDMColaborador.fdqryEstado.Eof do
  begin
    dbcbbEstado.Items.Add(FDMColaborador.fdqryEstado.FieldByName('nome').AsString);
    FDMColaborador.fdqryEstado.Next;
  end;
end;

end.

