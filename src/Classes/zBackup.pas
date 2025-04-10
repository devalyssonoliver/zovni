unit zBackup;

interface

uses
  Backup, System.SysUtils, Vcl.Dialogs, Winapi.Windows, Winapi.ShellAPI,
  System.JSON, zArquivoConfig, System.IOUtils;

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
  CaminhoLog, DirApp, PgDumpPath, CaminhoBackup, Comando: string;
  Config: TArquivoJson;
begin
  Config := TArquivoJson.Create;
  try
    Config.LerArquivoConfig;
    SetEnvironmentVariable('PGPASSWORD', 'postzeus2011');

    DirApp := ExtractFilePath(ParamStr(0));
    PgDumpPath := IncludeTrailingPathDelimiter(DirApp) + 'pg_dump.exe';

    CaminhoLog := ChangeFileExt(CaminhoBackup, '.log');
    CaminhoBackup := IncludeTrailingPathDelimiter(ADestino) + 'backup_' + FormatDateTime('yyyymmdd_hhnnss', Now) + '.tar';

    Comando := Format('-U %s -h %s -p %s -F c -b -v -f "%s" %s', [Config.User, Config.Host, Config.Porta, CaminhoBackup, Config.Database]);

    ShellExecute(0, 'open', PChar(PgDumpPath), PChar(Comando), nil, SW_HIDE);
    Sleep(3000);
  finally
    Config.Free;
  end;
end;

end.

