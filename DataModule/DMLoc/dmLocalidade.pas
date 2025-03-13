unit dmLocalidade;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Comp.Client, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TDM_Localidade = class(TDataModule)
    fdqryEstados: TFDQuery;
    fdqryCidades: TFDQuery;
    intgrfldCidadesid: TIntegerField;
    wdstrngfldCidadesnome: TWideStringField;
  public
    procedure CarregarEstados;
    procedure CarregarCidades(EstadoID: Integer);
  end;

var
  DM_Localidade: TDM_Localidade;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDM_Localidade.CarregarEstados;
begin
  fdqryEstados.Close;
  fdqryEstados.SQL.Text := 'SELECT id, nome FROM estado ORDER BY nome';
  fdqryEstados.Open;
end;

procedure TDM_Localidade.CarregarCidades(EstadoID: Integer);
begin
  fdqryCidades.Close;
  fdqryCidades.SQL.Text := 'SELECT id, nome FROM municipio WHERE iduf = :iduf ORDER BY nome';
  fdqryCidades.ParamByName('iduf').AsInteger := EstadoID;
  fdqryCidades.Open;
  fdqryCidades.Insert;
end;

end.

