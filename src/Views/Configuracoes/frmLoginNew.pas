unit frmLoginNew;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls;

type
  TFrm_LoginNew = class(TForm)
    pnlLeft: TPanel;
    pnlRight: TPanel;
    img_Background: TImage;
    edt_Login: TEdit;
    edt_Senha: TEdit;
    pnlDetail_Login: TPanel;
    pnlDetail_Senha: TPanel;
    btn_VerSenha: TSpeedButton;
    chk_LembrarLogin: TCheckBox;
    btn_Logar: TSpeedButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_LoginNew: TFrm_LoginNew;

implementation

{$R *.dfm}

end.
