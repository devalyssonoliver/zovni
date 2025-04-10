unit frmUsuarioCad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.Imaging.pngimage,
  Data.DB, Vcl.Mask, dmUsuario;

type
  TModoOperacao = (mdNovo, mdEditar, mdExibir);

  TFrm_Usuario = class(TForm)
    dbnvr_Controller: TDBNavigator;
    pnlCentral: TPanel;
    pnlDetails: TPanel;
    imgicon: TImage;
    lblTITULO: TLabel;
    dbedt_Nome: TDBEdit;
    dbedt_Login: TDBEdit;
    dbchk_Ativo: TDBCheckBox;
    lbl_Nome: TLabel;
    lbl_Login: TLabel;
    lbl_Senha: TLabel;
    lbl_DataCadastro: TLabel;
    ds_UsuarioscCad: TDataSource;
    dbedt_Codigo: TDBEdit;
    pnlBaixo: TPanel;
    btnSalvar: TBitBtn;
    btnNovo: TBitBtn;
    btnEditar: TBitBtn;
    btnFechar: TBitBtn;
    btnCancelar: TBitBtn;
    dbedt_DataCadastro: TDBEdit;
    dbedt_Senha: TDBEdit;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    FUsuarioDM: TDM_Usuarios;
  public
    { Public declarations }
    procedure AlterarModoOperacao(Modo: TModoOperacao);
  end;

var
  Frm_Usuario: TFrm_Usuario;

implementation

{$R *.dfm}

uses
  UFuncoesAuxiliares;

procedure TFrm_Usuario.AlterarModoOperacao(Modo: TModoOperacao);
begin
  case Modo of
    mdNovo, mdEditar:
      begin
        if Modo = mdNovo then
          FUsuarioDM.Inserir
        else
          FUsuarioDM.Editar;

        pnlCentral.Enabled := True;
        DefinirEstadoBotoes([btnNovo, btnEditar], False);
        DefinirEstadoBotoes([btnSalvar, btnCancelar, btnFechar], True);
      end;

    mdExibir:
      begin
        pnlCentral.Enabled := False;
        DefinirEstadoBotoes([btnNovo, btnEditar, btnFechar], True);
        DefinirEstadoBotoes([btnSalvar, btnCancelar], False);
      end;
  end;
end;

procedure TFrm_Usuario.btnCancelarClick(Sender: TObject);
begin
  AlterarModoOperacao(mdExibir);
  FUsuarioDM.Cancelar;

end;

procedure TFrm_Usuario.btnEditarClick(Sender: TObject);
begin
  AlterarModoOperacao(mdEditar);
end;

procedure TFrm_Usuario.btnNovoClick(Sender: TObject);
begin
  AlterarModoOperacao(mdNovo);
end;

procedure TFrm_Usuario.btnSalvarClick(Sender: TObject);
begin
  AlterarModoOperacao(mdExibir);
  FUsuarioDM.Salvar;
end;

procedure TFrm_Usuario.FormCreate(Sender: TObject);
begin
  FUsuarioDM := TDM_Usuarios.Create(nil);
end;

end.

