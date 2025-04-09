unit zArquivoConfig;

interface

uses
  IArquivoConfig, System.SysUtils, System.Classes, System.JSON, System.IOUtils;

type
  TArquivoJson = class(TInterfacedObject, IArquivoJson)
  private
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

{ TArquivoJson }

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
    JsonObject.AddPair('Pass', Pass);

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
begin
  FilePath := TPath.Combine(ExtractFilePath(ParamStr(0)), 'ZOvni.json');
  if TFile.Exists(FilePath) then
  begin
    JsonString := TFile.ReadAllText(FilePath);
    JsonObject := TJsonObject.ParseJSONValue(JsonString) as TJSONObject;
    try
      Host := JsonObject.GetValue<string>('Host');
      Database := JsonObject.GetValue<string>('Database');
      Porta := JsonObject.GetValue<string>('Porta');
      User := JsonObject.GetValue<string>('User');
      Pass := JsonObject.GetValue<string>('Pass');
    finally
      JsonObject.Free;
    end;
  end;

end;

end.

