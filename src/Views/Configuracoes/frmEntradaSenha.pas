unit frmEntradaSenha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFrm_EntradaSenha = class(TForm)
    Label1: TLabel;
    EditSenha: TEdit;
    BtnOK: TButton;
    BtnCancelar: TButton;
    procedure FormCreate(Sender: TObject);
  public
    class function ObterSenha(const Usuario: string; out Senha: string): Boolean;
  end;

implementation

{$R *.dfm}

procedure TFrm_EntradaSenha.FormCreate(Sender: TObject);
begin
  EditSenha.PasswordChar := '*';
end;

class function TFrm_EntradaSenha.ObterSenha(const Usuario: string; out Senha: string): Boolean;
var
  Frm: TFrm_EntradaSenha;
begin
  Result := False;
  Frm := TFrm_EntradaSenha.Create(nil);
  try
    Frm.Label1.Caption := Format('Informe a senha para o usuário "%s":', [Usuario]);
    if Frm.ShowModal = mrOk then
    begin
      Senha := Frm.EditSenha.Text;
      Result := Senha <> '';
    end;
  finally
    Frm.Free;
  end;
end;

end.

