unit dmProdutoCad;

interface

uses
  System.SysUtils, System.Classes, Gerenciador, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TDM_ProdutoCad = class(TDataModule)
    fdqryNumeracaoProd: TFDQuery;
    fdqryNumeracao: TFDQuery;
    fdqryProdutoCad: TFDQuery;
    fldProdutoCadid: TIntegerField;
    wdstrngfldProdutoCadnome: TWideStringField;
    wdmfldProdutoCadinformadic: TWideMemoField;
    wdstrngfldProdutoCadmarca: TWideStringField;
    wdstrngfldProdutoCadgenero: TWideStringField;
    bcdfldProdutoCadpreco: TBCDField;
    blnfldProdutoCadativo: TBooleanField;
    sqltmstmpfldProdutoCaddata_cadastro: TSQLTimeStampField;
    fldProdutoCadestoque: TIntegerField;
    bcdfldProdutoCadcusto: TBCDField;
    fldProdutoCadid_fornecedor: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
    procedure fdqryNumeracaoProdBeforePost(DataSet: TDataSet);
    procedure fdqryNumeracaoProdAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Salvar;
    procedure Inserir;
    procedure Cancelar;
    procedure Excluir;
    procedure ExibirProduto(_Codigo: Integer);
    procedure Editar;
  end;

var
  DM_ProdutoCad: TDM_ProdutoCad;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDM_ProdutoCad.Cancelar;
begin
  if (fdqryProdutoCad.State in [dsInsert, dsEdit]) then
  begin
    fdqryProdutoCad.Cancel;
  end;
end;

procedure TDM_ProdutoCad.DataModuleCreate(Sender: TObject);
begin
  fdqryProdutoCad.Open;
end;

procedure TDM_ProdutoCad.Editar;
begin
  fdqryProdutoCad.Edit;
  fdqryNumeracaoProd.Open();
  fdqryNumeracaoProd.Insert;
end;

procedure TDM_ProdutoCad.Excluir;
begin
  if not fdqryProdutoCad.IsEmpty then
  begin
    fdqryProdutoCad.Delete;
  end;
end;

procedure TDM_ProdutoCad.ExibirProduto(_Codigo: Integer);
begin
  with fdqryProdutoCad do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM produtos WHERE id = :id');
    ParamByName('id').AsInteger := _Codigo;
    Open;
  end;

  with fdqryNumeracaoProd do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM produto_numeracao WHERE id_produto = :id_produto');
    ParamByName('id_produto').AsInteger := _Codigo;
    Open;
  end;
end;

procedure TDM_ProdutoCad.fdqryNumeracaoProdAfterPost(DataSet: TDataSet);
begin
  if not fdqryProdutoCad.FieldByName('id').IsNull then
  begin
    fdqryNumeracaoProd.Close;
    fdqryNumeracaoProd.ParamByName('id_produto').AsInteger := fdqryProdutoCad.FieldByName('id').AsInteger;
    fdqryNumeracaoProd.Open;
  end;
end;

procedure TDM_ProdutoCad.fdqryNumeracaoProdBeforePost(DataSet: TDataSet);
begin
  if fdqryNumeracaoProd.FieldByName('id_produto').IsNull then
  begin
    fdqryNumeracaoProd.FieldByName('id_produto').AsInteger := fdqryProdutoCad.FieldByName('id').AsInteger;
  end;
end;

procedure TDM_ProdutoCad.Inserir;
begin
  if not (fdqryProdutoCad.State in [dsInsert, dsEdit]) then
  begin
    fdqryProdutoCad.Insert;
  end;
end;

procedure TDM_ProdutoCad.Salvar;
begin
  fdqryProdutoCad.Connection.StartTransaction;
  try
    if (fdqryProdutoCad.State in [dsInsert, dsEdit]) then
    begin
      fdqryProdutoCad.Post;
    end;
    fdqryProdutoCad.Connection.Commit;
  except
    fdqryProdutoCad.Connection.Rollback;
    raise;
  end;
end;

end.

