unit Backup;

interface

uses
  System.SysUtils;

type
  IBackup = interface
    ['{A816164D-7AA3-4AFD-8BB3-D7A0DDB0C857}']
    procedure GerarBackup(const ADestino: string);
    procedure AgendarBackup;
  end;

function CriarBackup: IBackup;

implementation

uses
  zBackup;

function CriarBackup: IBackup;
begin
  Result := TBackup.Create;
end;

end.

