unit Gerenciador;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Phys.PGDef, FireDAC.Phys.PG, Data.DB, FireDAC.Comp.Client, IArquivoConfig, zArquivoConfig,
  Vcl.Forms;

type
  TDM_Gerenciador = class(TDataModule)
    fdConnection: TFDConnection;
    pgDriver: TFDPhysPgDriverLink;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    IArquivoConfig: IArquivoJson;
  public
    { Public declarations }
  end;

var
  DM_Gerenciador: TDM_Gerenciador;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDM_Gerenciador.DataModuleCreate(Sender: TObject);
var
  Config: TArquivoJson;
begin

  Config := TArquivoJson.Create;
  try
    Config.LerArquivoConfig;

    fdConnection.Params.Clear;
    fdConnection.Params.Add('DriverID=PG');
    fdConnection.Params.Add('Server=' + Config.Host);
    fdConnection.Params.Add('Database=' + Config.Database);
    fdConnection.Params.Add('Port=' + Config.Porta);
    fdConnection.Params.Add('LoginTimeout=2');
    fdConnection.Params.UserName := Config.User;
    fdConnection.Params.Password := Config.Pass;
    pgDriver.VendorLib := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName)) + 'libpq.dll';
    fdConnection.Connected := True;
  except
  Exit;
  end;
  Config.Free;
end;

end.
