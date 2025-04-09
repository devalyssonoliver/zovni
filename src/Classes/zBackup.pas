unit zBackup;

interface

uses
  Backup, Winapi.Windows, System.SysUtils, ShellAPI, zArquivoConfig;

type
  TBackup = class(TInterfacedObject, IBackup)
  public
    procedure GerarBackup(const ADestino: string);
    procedure AgendarBackup;
  end;

implementation

{ TBackup }

procedure TBackup.AgendarBackup;
begin

end;

procedure TBackup.GerarBackup(const ADestino: string);
var
  Comando, FileName: string;
  Params: string;
begin
  FileName := IncludeTrailingPathDelimiter(ADestino) + 'backup.sql';
end;

end.

