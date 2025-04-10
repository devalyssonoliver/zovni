unit frmBackup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls, Vcl.ComCtrls, Backup,
  zBackup, System.Threading;

type
  TFrm_Backup = class(TForm)
    pnlTopo: TPanel;
    lblTITULO: TLabel;
    imgicon: TImage;
    pnl_Central: TPanel;
    pg_Configs: TPageControl;
    tsNow: TTabSheet;
    dlgOpen: TOpenDialog;
    lbledt_DiretorioBackup: TLabeledEdit;
    btn_LocalizarCaminho: TBitBtn;
    btn_ExecutarBackup: TBitBtn;
    pb_Progresso: TProgressBar;
    procedure btn_LocalizarCaminhoClick(Sender: TObject);
    procedure ExecutarBackup;
    procedure btn_ExecutarBackupClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Backup: TFrm_Backup;

implementation

{$R *.dfm}

procedure TFrm_Backup.btn_ExecutarBackupClick(Sender: TObject);
begin
  ExecutarBackup;
end;

procedure TFrm_Backup.btn_LocalizarCaminhoClick(Sender: TObject);
var
  Dialog: TFileOpenDialog;
begin
  Dialog := TFileOpenDialog.Create(nil);
  try
    Dialog.Options := [fdoPickFolders];
    if Dialog.Execute then
      lbledt_DiretorioBackup.Text := Dialog.FileName;
  finally
    Dialog.Free;
  end;
end;

procedure TFrm_Backup.ExecutarBackup;
var
  Backup: IBackup;
  Destino: string;
begin
  Destino := lbledt_DiretorioBackup.Text;
  if (Destino = '') or (not DirectoryExists(Destino)) then
  begin
    Application.MessageBox('Selecione um diretório válido onde o backup será salvo', 'ZOvni');
    Exit;
  end;

  Self.Enabled := False;
  pb_Progresso.Visible := True;
  pb_Progresso.Style := pbstMarquee;
  pb_Progresso.Visible := True;

  TTask.Run(
    procedure
    begin
      try
        Backup := CriarBackup;
        Backup.GerarBackup(Destino);
      finally
        TThread.Synchronize(nil,
          procedure
          begin
            pb_Progresso.Visible := False;
            Self.Enabled := True;
            ShowMessage('✨ Backup finalizado com sucesso!');
          end);
      end;
    end);
end;

end.

