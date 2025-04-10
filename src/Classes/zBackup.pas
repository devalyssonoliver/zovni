unit zBackup;

interface

uses
  Backup, System.SysUtils, Vcl.Dialogs, Winapi.Windows, Winapi.ShellAPI;

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
  // Em breve: agendamento com Task Scheduler ou lógica interna.
end;

procedure TBackup.GerarBackup(const ADestino: string);
var
  DirApp, PgDumpPath, CaminhoBackup, Comando: string;
begin
  SetEnvironmentVariable('PGPASSWORD', 'postzeus2011');
  DirApp := ExtractFilePath(ParamStr(0));
  PgDumpPath := IncludeTrailingPathDelimiter(DirApp) + 'pg_dump.exe';

  if not FileExists(PgDumpPath) then
  begin
    ShowMessage('pg_dump.exe não encontrado!');
    Exit;
  end;

  CaminhoBackup := IncludeTrailingPathDelimiter(ADestino) + 'backup_' + FormatDateTime('yyyymmdd_hhnnss', Now) + '.tar';

  ShellExecute(0, 'open', PChar(PgDumpPath), PChar(Format('-U postgres -h localhost -p 5432 -F c -b -v -f "%s" base_zovni', [CaminhoBackup])), nil, SW_HIDE);
  Sleep(3000);
end;

end.

