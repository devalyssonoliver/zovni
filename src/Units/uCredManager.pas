unit uCredManager;

interface

uses
  Windows, SysUtils;

const
  CRED_TYPE_GENERIC = 1;
  CRED_PERSIST_LOCAL_MACHINE = 2;

type
  PCREDENTIAL_ATTRIBUTE = ^CREDENTIAL_ATTRIBUTE;

  CREDENTIAL_ATTRIBUTE = record
    Keyword: LPWSTR;
    Flags: DWORD;
    ValueSize: DWORD;
    Value: PBYTE;
  end;

  PCREDENTIAL = ^CREDENTIAL;

  CREDENTIAL = record
    Flags: DWORD;
    Type_: DWORD;
    TargetName: LPWSTR;
    Comment: LPWSTR;
    LastWritten: TFILETIME;
    CredentialBlobSize: DWORD;
    CredentialBlob: LPBYTE;
    Persist: DWORD;
    AttributeCount: DWORD;
    Attributes: PCREDENTIAL_ATTRIBUTE;
    TargetAlias: LPWSTR;
    UserName: LPWSTR;
  end;

function SaveCredential(const Target, User, Password: string): Boolean;

function ReadCredential(const Target: string; out User, Password: string): Boolean;

implementation

function CredWrite(Cred: PCREDENTIAL; Flags: DWORD): BOOL; stdcall; external 'Advapi32.dll' name 'CredWriteW';

function CredRead(TargetName: LPCWSTR; Type_: DWORD; Flags: DWORD; out Credential: PCREDENTIAL): BOOL; stdcall; external 'Advapi32.dll' name 'CredReadW';

procedure CredFree(Buffer: Pointer); stdcall; external 'Advapi32.dll';

function SaveCredential(const Target, User, Password: string): Boolean;
var
  Cred: Credential;
  PwdPtr: PWideChar;
begin
  ZeroMemory(@Cred, SizeOf(Cred));
  Cred.Type_ := CRED_TYPE_GENERIC;
  Cred.TargetName := PChar(Target);
  Cred.UserName := PChar(User);
  Cred.Persist := CRED_PERSIST_LOCAL_MACHINE;
  PwdPtr := PWideChar(Password);
  Cred.CredentialBlobSize := Length(Password) * SizeOf(Char);
  Cred.CredentialBlob := PBYTE(PwdPtr);
  Cred.AttributeCount := 0;
  Result := CredWrite(@Cred, 0);
end;

function ReadCredential(const Target: string; out User, Password: string): Boolean;
var
  pCred: PCREDENTIAL;
begin
  Result := CredRead(PChar(Target), CRED_TYPE_GENERIC, 0, pCred);
  if Result then
  begin
    User := pCred.UserName;
    SetString(Password, PChar(pCred.CredentialBlob), pCred.CredentialBlobSize div SizeOf(Char));
    CredFree(pCred);
  end;
end;

end.

