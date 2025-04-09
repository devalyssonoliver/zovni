unit Backup;

interface
type
   IBackup = interface
   ['{A816164D-7AA3-4AFD-8BB3-D7A0DDB0C857}']
     procedure GerarBackup(const ADestino : String);
     procedure AgendarBackup;
   end;

implementation

end.

