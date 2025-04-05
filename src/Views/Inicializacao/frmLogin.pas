unit frmLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, dmUsuario;

type
  TFrm_Loginn = class(TForm)
    pnlFundo: TPanel;
    edtLogin: TEdit;
    edtSenha: TEdit;
    btnLogin: TBitBtn;
    lblLogin: TLabel;
    lblSenha: TLabel;
    lbBemVindo: TLabel;
    btnCancelar: TBitBtn;
    procedure btnLoginClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);

  private
    { Private declarations }
    DMLogin: TDM_Usuarios;
  public
    { Public declarations }
  end;

var
  Frm_Loginn: TFrm_Loginn;

implementation

{$R *.dfm}

procedure TFrm_Loginn.btnCancelarClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrm_Loginn.btnLoginClick(Sender: TObject);
begin
  if DMLogin.VerificarLogin(edtLogin.Text, edtSenha.Text) then
  begin
    Application.MessageBox(PChar('Bem-vindo ' + edtLogin.Text), 'ZOnvio', MB_OK);
    Close;
    ModalResult := mrOk;
  end
  else
  begin
    Application.MessageBox('Login inválido', 'ZOvni', MB_ICONWARNING);
    ModalResult := mrNone;
  end;

end;

procedure TFrm_Loginn.FormCreate(Sender: TObject);
begin
  DMLogin := TDM_Usuarios.Create(self);
end;

end.

