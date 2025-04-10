unit frmConfiguracaoBanco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.Themes, zArquivoConfig,
  IArquivoConfig;

type
  TFrm_Config = class(TForm)
    pnlTop: TPanel;
    pnlBottom: TPanel;
    pnlMain: TPanel;
    lblTituloDB: TLabel;
    edtHost: TEdit;
    edtDatabase: TEdit;
    edtUser: TEdit;
    lblHost: TLabel;
    lblDatabase: TLabel;
    edtPort: TEdit;
    lblUser: TLabel;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
  public
  end;

var
  Frm_Config: TFrm_Config;

implementation

{$R *.dfm}

uses
  System.StrUtils;

procedure TFrm_Config.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrm_Config.btnSalvarClick(Sender: TObject);
var
  IArquivo: IArquivoJson;
begin
  IArquivo := TArquivoJson.Create;

  if (Trim(edtHost.Text) = '') or (Trim(edtDatabase.Text) = '') or (Trim(edtPort.Text) = '') or (Trim(edtUser.Text) = '') then
  begin
    Application.MessageBox('Todos os campos devem ser preenchidos.', 'ZOvni', MB_OK or MB_ICONINFORMATION);
    Exit;
  end;

  TArquivoJson(IArquivo).Host := edtHost.Text;
  TArquivoJson(IArquivo).Database := edtDatabase.Text;
  TArquivoJson(IArquivo).Porta := edtPort.Text;
  TArquivoJson(IArquivo).User := edtUser.Text;

  IArquivo.EscreverArquivoConfig;

  Application.MessageBox('Arquivo de configuração salvo com sucesso!', 'ZOvni', MB_OK or MB_ICONQUESTION);

  pnlMain.Enabled := False;
  btnSalvar.Visible := False;
end;

end.

