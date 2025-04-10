unit zArquivoConfig;

interface

uses
  IArquivoConfig, System.SysUtils, System.Classes, System.JSON, System.IOUtils,
  Winapi.Windows, uCredManager, Vcl.Dialogs, frmEntradaSenha;

type
  TArquivoJson = class(TInterfacedObject, IArquivoJson)
  public
    Host: string;
    Database: string;
    Porta: string;
    User: string;
    Pass: string;
    procedure EscreverArquivoConfig;
    procedure LerArquivoConfig;
  end;

implementation

uses
  ShellAPI, Winapi.Messages;

function IsConsoleApp: Boolean;
var
  hStdOut: THandle;
begin
  hStdOut := GetStdHandle(STD_OUTPUT_HANDLE);
  Result := (hStdOut <> 0) and (hStdOut <> INVALID_HANDLE_VALUE);
end;

function IsRunningAsService: Boolean;
begin
  Result := GetConsoleWindow = 0;
end;

procedure TArquivoJson.EscreverArquivoConfig;
var
  JsonObject: TJSONObject;
  FilePath: string;
begin
  JsonObject := TJSONObject.Create;
  try
    JsonObject.AddPair('Host', Host);
    JsonObject.AddPair('Database', Database);
    JsonObject.AddPair('Porta', Porta);
    JsonObject.AddPair('User', User);

    FilePath := TPath.Combine(ExtractFilePath(ParamStr(0)), 'ZOvni.json');
    TFile.WriteAllText(FilePath, JsonObject.ToString);
  finally
    JsonObject.Free;
  end;
end;

procedure TArquivoJson.LerArquivoConfig;
var
  JsonObject: TJSONObject;
  JsonString: string;
  FilePath: string;
  SavedUser, TempPassword: string;
  TemInterface: Boolean;
begin
  FilePath := TPath.Combine(ExtractFilePath(ParamStr(0)), 'ZOvni.json');

  if not TFile.Exists(FilePath) then
    raise Exception.Create('Arquivo de configuração "ZOvni.json" não encontrado.');

  JsonString := TFile.ReadAllText(FilePath);
  JsonObject := TJSONObject.ParseJSONValue(JsonString) as TJSONObject;

  try
    Host := JsonObject.GetValue<string>('Host').Trim;
    Database := JsonObject.GetValue<string>('Database').Trim;
    Porta := JsonObject.GetValue<string>('Porta').Trim;
    User := JsonObject.GetValue<string>('User').Trim;

    TemInterface := not IsConsoleApp and not IsRunningAsService;

    if ReadCredential('ZOvni.Config', SavedUser, TempPassword) then
    begin
      Pass := TempPassword;
    end
    else if TemInterface then
    begin
      if TFrm_EntradaSenha.ObterSenha(User, TempPassword) then
      begin
        Pass := TempPassword;
        SaveCredential('ZOvni.Config', User, TempPassword);
      end
      else
        raise Exception.Create('Senha não fornecida.');
    end
    else
    begin
      raise Exception.Create('Senha não encontrada e sem interface disponível para entrada.');
    end;

    SetEnvironmentVariable('PGPASSWORD', PChar(Pass));
  finally
    FillChar(Pointer(TempPassword)^, Length(TempPassword) * SizeOf(Char), 0);
    JsonObject.Free;
  end;
end;

end.

