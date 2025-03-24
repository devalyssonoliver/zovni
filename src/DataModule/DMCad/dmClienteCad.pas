unit dmClienteCad;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, Gerenciador,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TDM_ClientesCad = class(TDataModule)
    fdqryClientesCad: TFDQuery;
    fldClientesLocid: TIntegerField;
    wdstrngfldClientesLocnome: TWideStringField;
    wdstrngfldClientesLoctelefone: TWideStringField;
    wdstrngfldClientesLoccpf: TWideStringField;
    wdstrngfldClientesLoccnpj: TWideStringField;
    wdstrngfldClientesLoclogradouro: TWideStringField;
    wdstrngfldClientesLocnumero_endereco: TWideStringField;
    wdstrngfldClientesLocbairro: TWideStringField;
    wdstrngfldClientesLoccidade: TWideStringField;
    wdstrngfldClientesLoccep: TWideStringField;
    wdstrngfld_tipopessoa: TWideStringField;
    blnfldClientesLocativo: TBooleanField;
    fdqryEstado: TFDQuery;
    fdqryCidade: TFDQuery;
    wdstrngfldClientesLocestado: TWideStringField;
    bcdfldClientesCadsaldo_loja: TBCDField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Salvar;
    procedure Inserir;
    procedure Editar;
    procedure Cancelar;
    procedure Excluir;
    procedure ExibirCliente(_Codigo: Integer);
    procedure CarregarEstados;
    procedure CarregarCidades(_EstadoUF: String);
  end;

var
  DM_ClientesCad: TDM_ClientesCad;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDM_ClientesCad }

procedure TDM_ClientesCad.Cancelar;
begin
  fdqryClientesCad.Cancel;
end;

procedure TDM_ClientesCad.DataModuleCreate(Sender: TObject);
begin
  fdqryClientesCad.Open();
  fdqryClientesCad.Active := True;
  CarregarEstados;
end;

procedure TDM_ClientesCad.DataModuleDestroy(Sender: TObject);
begin
  fdqryClientesCad.Close;
  fdqryEstado.Close;
  fdqryCidade.Close;
end;

procedure TDM_ClientesCad.Editar;
begin
  fdqryClientesCad.Edit;
end;

procedure TDM_ClientesCad.Excluir;
begin
  if not fdqryClientesCad.IsEmpty then
    fdqryClientesCad.Delete;
end;

procedure TDM_ClientesCad.ExibirCliente(_Codigo: Integer);
begin
  with fdqryClientesCad do
  begin
    Close;
    SQL.Text := 'SELECT * FROM clientes WHERE id = :id';
    ParamByName('id').AsInteger := _Codigo;
    Open;
  end;
end;

procedure TDM_ClientesCad.Inserir;
begin
  if not (fdqryClientesCad.State in [dsInsert, dsEdit]) then
    fdqryClientesCad.Insert;
end;

procedure TDM_ClientesCad.Salvar;
begin
  if (fdqryClientesCad.State in [dsInsert, dsEdit]) then
    fdqryClientesCad.Post;
end;

procedure TDM_ClientesCad.CarregarEstados;
begin
  with fdqryEstado do
  begin
    Close;
    SQL.Text := 'SELECT uf, nome FROM estado ORDER BY nome';
    Open;
  end;
end;

procedure TDM_ClientesCad.CarregarCidades(_EstadoUF: String);
begin
  with fdqryCidade do
  begin
    Close;
    SQL.Text := 'SELECT uf, nome FROM municipio WHERE uf = :uf ORDER BY nome';
    ParamByName('UF').AsString := _EstadoUF;
    Open;
  end;
end;

end.

