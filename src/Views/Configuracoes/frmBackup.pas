unit frmBackup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask,
  Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TFrm_Backup = class(TForm)
    pnlTopo: TPanel;
    lblTITULO: TLabel;
    imgicon: TImage;
    pnl_Central: TPanel;
    pg_Configs: TPageControl;
    tsNow: TTabSheet;
    tsAgendar: TTabSheet;
    dlgOpen: TOpenDialog;
    lbledt_DiretorioBackup: TLabeledEdit;
    btn_LocalizarCaminho: TBitBtn;
    btn_ExecutarBackup: TBitBtn;
    LOG: TMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Backup: TFrm_Backup;

implementation

{$R *.dfm}

end.
