unit frmClienteCad;

interface

uses
  Winapi.Windows, System.Classes, Vcl.Controls, Vcl.Forms, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, Vcl.ComCtrls, Data.DB, Vcl.Buttons,
  dmClienteCad, UFuncoesAuxiliares, Vcl.Imaging.pngimage, System.SysUtils,
  System.ImageList, Vcl.ImgList;

type
  TModoOperacao = (tpNovo, tpEditar, tpExibir);

  TFrm_ClientesCad = class(TForm)
    pnlTopo: TPanel;
    pnlBaixo: TPanel;
    pnlMeio: TPanel;
    dsClienteCad: TDataSource;
    pgCad: TPageControl;
    tsCadastro: TTabSheet;
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
    btnSalvar: TBitBtn;
    btnNovo: TBitBtn;
    btnEditar: TBitBtn;
    btnFechar: TBitBtn;
    lblTITULO: TLabel;
    imgicon: TImage;
    grpLocalizacaoInfo: TGroupBox;
    lblEndereco: TLabel;
    lblCEP: TLabel;
    lblCidade: TLabel;
    lblNumero: TLabel;
    dbedtEndereco: TDBEdit;
    dbedtCEP: TDBEdit;
    dbedtNumero: TDBEdit;
    dbedtBairro: TDBEdit;
    lblBairro: TLabel;
    dbedtSaldo: TDBEdit;
    lblSaldo: TLabel;
    dbchkAtivo: TDBCheckBox;
    btnCancelar: TBitBtn;
    il: TImageList;
    lblEstado: TLabel;
    dsCidade: TDataSource;
    dbcbbEstado: TDBComboBox;
    dsEstado: TDataSource;
    dbcbbCidade: TDBComboBox;

    procedure dbcbbTipoClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dbcbbEstadoChange(Sender: TObject);

  private
    { Private declarations }
    FClienteCad: TDM_ClientesCad;
  public
    { Public declarations }
    procedure AlterarModoOperacao(Modo: TModoOperacao);
    procedure Exibir(_Codigo: Integer);
  end;

var
  Frm_ClientesCad: TFrm_ClientesCad;

implementation

{$R *.dfm}


// Refatorar, código repetido.
procedure TFrm_ClientesCad.AlterarModoOperacao(Modo: TModoOperacao);
begin
  case Modo of
    tpNovo, tpEditar:
      begin
        if Modo = tpNovo then
          FClienteCad.Inserir
        else
          FClienteCad.Editar;

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

procedure TFrm_ClientesCad.btnCancelarClick(Sender: TObject);
begin
  AlterarModoOperacao(tpExibir);
  FClienteCad.Cancelar;
end;

procedure TFrm_ClientesCad.btnEditarClick(Sender: TObject);
begin
  AlterarModoOperacao(tpEditar);
end;

procedure TFrm_ClientesCad.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrm_ClientesCad.btnNovoClick(Sender: TObject);
begin
  AlterarModoOperacao(tpNovo);
end;

procedure TFrm_ClientesCad.btnSalvarClick(Sender: TObject);
begin
  if VerificarPreenchimentoObrigatorio([dbedtNome, dbedtTelefone, dbedtEndereco]) then
    Exit;
  FClienteCad.Salvar;
  AlterarModoOperacao(tpExibir);
end;

procedure TFrm_ClientesCad.Exibir(_Codigo: Integer);
begin
  FClienteCad.ExibirCliente(_Codigo);
end;

procedure TFrm_ClientesCad.dbcbbEstadoChange(Sender: TObject);
begin
  if FClienteCad.fdqryEstado.Locate('nome', dbcbbEstado.Text, []) then
  begin
    FClienteCad.CarregarCidades(FClienteCad.fdqryEstado.FieldByName('uf').AsString);

    // Atualiza a lista de cidades no ComboBox
    dbcbbCidade.Items.Clear;
    FClienteCad.fdqryCidade.First;
    while not FClienteCad.fdqryCidade.Eof do
    begin
      dbcbbCidade.Items.Add(FClienteCad.fdqryCidade.FieldByName('nome').AsString);
      FClienteCad.fdqryCidade.Next;
    end;
  end;
end;

procedure TFrm_ClientesCad.dbcbbTipoClick(Sender: TObject);
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

procedure TFrm_ClientesCad.FormCreate(Sender: TObject);
begin
  FClienteCad := TDM_ClientesCad.Create(nil);
  dsClienteCad.DataSet := FClienteCad.fdqryClientesCad;

  // Carregando os estados
  FClienteCad.CarregarEstados;

  // Atualizando o ComboBox de estados
  dbcbbEstado.Items.Clear;
  FClienteCad.fdqryEstado.First;
  while not FClienteCad.fdqryEstado.Eof do
  begin
    dbcbbEstado.Items.Add(FClienteCad.fdqryEstado.FieldByName('nome').AsString);
    FClienteCad.fdqryEstado.Next;
  end;
end;

procedure TFrm_ClientesCad.FormDestroy(Sender: TObject);
begin
  dsClienteCad.DataSet := nil;
  FreeAndNil(FClienteCad);
end;

end.

