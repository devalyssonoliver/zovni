unit dmFornecedorCad;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Gerenciador, FireDAC.Stan.ExprFuncs ;

type
  TDM_FornecedorCad = class(TDataModule)
    fdqryFornecedorCad: TFDQuery;
    fdqryEstado: TFDQuery;
    fdqryCidade: TFDQuery;
    fldFornecedorCadid: TIntegerField;
    wdstrngfldFornecedorCadnome: TWideStringField;
    wdstrngfldFornecedorCadtelefone: TWideStringField;
    wdstrngfldFornecedorCadtipo_pessoa: TWideStringField;
    wdstrngfldFornecedorCadcpf: TWideStringField;
    wdstrngfldFornecedorCadcnpj: TWideStringField;
    wdstrngfldFornecedorCadlogradouro: TWideStringField;
    wdstrngfldFornecedorCadnumero_endereco: TWideStringField;
    wdstrngfldFornecedorCadbairro: TWideStringField;
    wdstrngfldFornecedorCadcidade: TWideStringField;
    wdstrngfldFornecedorCadcep: TWideStringField;
    blnfldFornecedorCadativo: TBooleanField;
    wdstrngfldFornecedorCadestado: TWideStringField;
    wdmfldFornecedorCadendereco: TWideMemoField;
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
    procedure ExibirFornecedor(_Codigo: Integer);
    procedure CarregarEstados;
    procedure CarregarCidades(_EstadoUF: String);
  end;

var
  DM_FornecedorCad: TDM_FornecedorCad;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDM_FornecedorCad.Cancelar;
begin
  fdqryFornecedorCad.Cancel;
end;

procedure TDM_FornecedorCad.CarregarCidades(_EstadoUF: String);
begin
  with fdqryCidade do
  begin
    Close;
    SQL.Text := 'SELECT uf, nome FROM municipio WHERE uf = :uf ORDER BY nome';
    ParamByName('UF').AsString := _EstadoUF;
    Open;
  end;
end;

procedure TDM_FornecedorCad.CarregarEstados;
begin
  with fdqryEstado do
  begin
    Close;
    SQL.Text := 'SELECT uf, nome FROM estado ORDER BY nome';
    Open;
  end;
end;

procedure TDM_FornecedorCad.DataModuleCreate(Sender: TObject);
begin
  fdqryFornecedorCad.Open;
  fdqryFornecedorCad.Active;
  CarregarEstados;
end;

procedure TDM_FornecedorCad.DataModuleDestroy(Sender: TObject);
begin
  fdqryFornecedorCad.Close;
  fdqryEstado.Close;
  fdqryCidade.Close;
end;

procedure TDM_FornecedorCad.Editar;
begin
  fdqryFornecedorCad.Edit;
end;

procedure TDM_FornecedorCad.Excluir;
begin
  if not fdqryFornecedorCad.IsEmpty then
    fdqryFornecedorCad.Delete;
end;

procedure TDM_FornecedorCad.ExibirFornecedor(_Codigo: Integer);
begin
  with fdqryFornecedorCad do
  begin
    Close;
    SQL.Text := 'SELECT * FROM fornecedores WHERE id = :id';
    ParamByName('id').AsInteger := _Codigo;
    Open;
  end;
end;

procedure TDM_FornecedorCad.Inserir;
begin
    if not (fdqryFornecedorCad.State in [dsInsert, dsEdit]) then
    fdqryFornecedorCad.Insert;
end;

procedure TDM_FornecedorCad.Salvar;
begin
  if (fdqryFornecedorCad.State in [dsInsert, dsEdit]) then
  fdqryFornecedorCad.Post;
end;

end.
