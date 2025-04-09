unit frmConfiguracaoBanco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  zArquivoConfig, IArquivoConfig;

type
  TFrm_Config = class(TForm)
    pnlTop: TPanel;
    pnlBottom: TPanel;
    pnlCenter: TPanel;
    lblTituloDB: TLabel;
    pnlConfig: TPanel;
    edtHost: TEdit;
    edtDatabase: TEdit;
    edtUser: TEdit;
    edtPassword: TEdit;
    lblHost: TLabel;
    lblDatabase: TLabel;
    lblPorta: TLabel;
    edtPort: TEdit;
    lblUser: TLabel;
    lblPass: TLabel;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    btnEditar: TBitBtn;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Config: TFrm_Config;

implementation

{$R *.dfm}

procedure TFrm_Config.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrm_Config.btnEditarClick(Sender: TObject);
begin
  pnlConfig.Enabled := True;
  btnEditar.Visible := False;
  btnSalvar.Visible := True;


end;

procedure TFrm_Config.btnSalvarClick(Sender: TObject);
var
 IArquivo : IArquivoJson;
begin
  IArquivo := TArquivoJson.Create;

  if (Trim(edtHost.text) = '' )or
     (Trim(edtDatabase.Text) = '') or
     (Trim(edtPort.Text) = '' ) or
     (Trim(edtUser.Text) = '') or
     (Trim(edtPassword.text) = '')
  then
  begin
    Application.MessageBox('Todos os campos devem ser preenchidos.', 'ZOvni',
    MB_OK or MB_ICONINFORMATION);
    Exit;
  end;

  TArquivoJson(IArquivo).Host     := edtHost.Text;
  TArquivoJson(IArquivo).Database := edtDatabase.Text;
  TArquivoJson(IArquivo).Porta    := edtPort.Text;
  TArquivoJson(IArquivo).User     := edtUser.Text;
  TArquivoJson(IArquivo).Pass     := edtPassword.Text;

  IArquivo.EscreverArquivoConfig;

  Application.MessageBox('Arquivo de configuração salvo com sucesso!', 'ZOvni',
   MB_OK or MB_ICONQUESTION);
  pnlConfig.Enabled := False;
  btnSalvar.Visible := False;
  btnEditar.Visible := True;

end;


end.
