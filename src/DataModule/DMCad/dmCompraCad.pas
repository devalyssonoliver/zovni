unit dmCompraCad;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Gerenciador;

type
  TDMCompra_Cad = class(TDataModule)
    fdqryCompra: TFDQuery;
    fdqryCompraProd: TFDQuery;
    fdqryProdutos: TFDQuery;
    fdTransaction: TFDTransaction;
    fldCompraProdid_compra_prod: TIntegerField;
    fldCompraProdid_compra: TIntegerField;
    fldCompraProdid_produto: TIntegerField;
    fldCompraProdquantidade: TIntegerField;
    bcdfldCompraProdpreco_unitario: TBCDField;
    bcdfldCompraProdcusto_unitario: TBCDField;
    fldProdutosid: TIntegerField;
    wdstrngfldProdutosnome: TWideStringField;
    bcdfldProdutoscusto: TBCDField;
    bcdfldProdutospreco: TBCDField;
    bcdfldCompravalor_total: TBCDField;
    bcdfldCompracusto_total: TBCDField;
    sqltmstmpfldCompradata_compra: TSQLTimeStampField;
    fldCompraid_fornecedor: TIntegerField;
    fldCompraid_compra: TIntegerField;

    procedure DataModuleCreate(Sender: TObject);
    procedure fdqryCompraProdBeforeInsert(DataSet: TDataSet);
    procedure fdqryCompraProdNewRecord(DataSet: TDataSet);
    procedure fdqryCompraProdBeforePost(DataSet: TDataSet);

  private
    function GerarIDCompra: Integer;
    procedure SalvarCompraSeNecessario;

  public
    procedure BuscarProdutoPorID(_Codigo: Integer; var Nome: string; var Preco, Custo: Currency);
    procedure ExibirCompra(_Codigo: Integer);
    procedure CancelarCompra;
    procedure EditarCompra;
    procedure NovaCompra;
    procedure SalvarCompra;
    procedure InserirCompra;
    procedure ExcluirCompra;
  end;

var
  DMCompra_Cad: TDMCompra_Cad;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDMCompra_Cad.DataModuleCreate(Sender: TObject);
begin
  fdqryProdutos.Open;
  fdqryCompra.Open;
  fdqryCompraProd.Open;
end;

function TDMCompra_Cad.GerarIDCompra: Integer;
begin
  fdqryCompra.Close;
  fdqryCompra.SQL.Text := 'SELECT NEXTVAL(''compra_id_compra_seq'') AS novo_id';
  fdqryCompra.Open;
  Result := fdqryCompra.FieldByName('novo_id').AsInteger;
end;

procedure TDMCompra_Cad.SalvarCompraSeNecessario;
begin
  if fdqryCompra.State in [dsInsert, dsEdit] then
  begin
    fdqryCompra.Post;
    fdqryCompra.ApplyUpdates(0);
    fdqryCompra.Refresh;
  end;
end;

procedure TDMCompra_Cad.NovaCompra;
begin
  fdqryCompra.Append;
  fdqryCompra.FieldByName('id_compra').AsInteger := GerarIDCompra;
end;

procedure TDMCompra_Cad.SalvarCompra;
begin
  fdTransaction.StartTransaction;
  SalvarCompraSeNecessario;
  fdqryCompraProd.ApplyUpdates(0);
  fdTransaction.Commit;
end;

procedure TDMCompra_Cad.EditarCompra;
begin
  fdqryCompra.Edit;
end;

procedure TDMCompra_Cad.CancelarCompra;
begin
  if fdqryCompra.State in dsEditModes then
    fdqryCompra.Cancel;

  if fdqryCompraProd.State in dsEditModes then
    fdqryCompraProd.Cancel;
end;

procedure TDMCompra_Cad.InserirCompra;
begin
  fdqryCompra.Append;
  fdqryCompra.FieldByName('id_compra').AsInteger := GerarIDCompra;
  fdqryCompra.FieldByName('data_compra').AsDateTime := Now;
  fdqryCompra.FieldByName('valor_total').AsCurrency := 0;
  fdqryCompra.FieldByName('custo_total').AsCurrency := 0;
  fdqryCompra.Post;
end;

procedure TDMCompra_Cad.ExcluirCompra;
begin
  if not fdqryCompra.IsEmpty then
    fdqryCompra.Delete;
end;

procedure TDMCompra_Cad.ExibirCompra(_Codigo: Integer);
begin
  fdqryCompra.Close;
  fdqryCompra.SQL.Text := 'SELECT * FROM compras WHERE id_compra = :id_compra';
  fdqryCompra.ParamByName('id_compra').AsInteger := _Codigo;
  fdqryCompra.Open;

  fdqryCompraProd.Close;
  fdqryCompraProd.SQL.Text := 'SELECT * FROM compra_prod WHERE id_compra = :id_compra';
  fdqryCompraProd.ParamByName('id_compra').AsInteger := _Codigo;
  fdqryCompraProd.Open;
end;

procedure TDMCompra_Cad.BuscarProdutoPorID(_Codigo: Integer; var Nome: string; var Preco, Custo: Currency);
begin
  fdqryProdutos.Close;
  fdqryProdutos.SQL.Text := 'SELECT id, nome, preco, custo FROM produtos WHERE id = :id';
  fdqryProdutos.ParamByName('id').AsInteger := _Codigo;
  fdqryProdutos.Open;

  if not fdqryProdutos.IsEmpty then
  begin
    Nome := fdqryProdutos.FieldByName('nome').AsString;
    Preco := fdqryProdutos.FieldByName('preco').AsCurrency;
    Custo := fdqryProdutos.FieldByName('custo').AsCurrency;
  end
  else
  begin
    Nome := '';
    Preco := 0;
    Custo := 0;
  end;
end;

procedure TDMCompra_Cad.fdqryCompraProdBeforeInsert(DataSet: TDataSet);
begin
  SalvarCompraSeNecessario;
end;

procedure TDMCompra_Cad.fdqryCompraProdBeforePost(DataSet: TDataSet);
begin
  if fdqryCompra.State in dsEditModes then
    fdqryCompra.Post;

  fdqryCompraProd.FieldByName('id_compra').AsInteger := fdqryCompra.FieldByName('id_compra').AsInteger;
end;

procedure TDMCompra_Cad.fdqryCompraProdNewRecord(DataSet: TDataSet);
begin
  fdqryCompraProd.FieldByName('id_compra').AsInteger := fdqryCompra.FieldByName('id_compra').AsInteger;
end;

end.

