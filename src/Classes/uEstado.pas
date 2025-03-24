unit uEstado;

interface

uses
  System.Classes, System.Generics.Collections;

type
  TEstado = class
  private
    FNome: string;
    FSigla: string;
    FCidades: TStringList;
  public
    constructor Create(const ANome, ASigla: string);
    destructor Destroy; override;
    procedure AdicionarCidade(const ACidade: string);
    function ObterCidades: TStringList;
    property Nome: string read FNome;
    property Sigla: string read FSigla;
  end;

  TGerenciadorEstados = class
  private
    FListaEstados: TObjectList<TEstado>;
  public
    constructor Create;
    destructor Destroy; override;
    procedure CarregarEstados;
    function ObterEstados: TObjectList<TEstado>;
  end;

implementation

{ TEstado }

constructor TEstado.Create(const ANome, ASigla: string);
begin
  FNome := ANome;
  FSigla := ASigla;
  FCidades := TStringList.Create;
end;

destructor TEstado.Destroy;
begin
  FCidades.Free;
  inherited;
end;

procedure TEstado.AdicionarCidade(const ACidade: string);
begin
  FCidades.Add(ACidade);
end;

function TEstado.ObterCidades: TStringList;
begin
  Result := FCidades;
end;

{ TGerenciadorEstados }

constructor TGerenciadorEstados.Create;
begin
  FListaEstados := TObjectList<TEstado>.Create;
end;

destructor TGerenciadorEstados.Destroy;
begin
  FListaEstados.Free;
  inherited;
end;

procedure TGerenciadorEstados.CarregarEstados;
var
  Estado: TEstado;
begin
  // Acre
  Estado := TEstado.Create('Acre', 'AC');
  Estado.AdicionarCidade('Rio Branco');
  Estado.AdicionarCidade('Cruzeiro do Sul');
  FListaEstados.Add(Estado);

  // Alagoas
  Estado := TEstado.Create('Alagoas', 'AL');
  Estado.AdicionarCidade('Maceió');
  Estado.AdicionarCidade('Arapiraca');
  FListaEstados.Add(Estado);

  // São Paulo
  Estado := TEstado.Create('São Paulo', 'SP');
  Estado.AdicionarCidade('São Paulo');
  Estado.AdicionarCidade('Campinas');
  Estado.AdicionarCidade('Santos');
  FListaEstados.Add(Estado);
end;

function TGerenciadorEstados.ObterEstados: TObjectList<TEstado>;
begin
  Result := FListaEstados;
end;

end.

