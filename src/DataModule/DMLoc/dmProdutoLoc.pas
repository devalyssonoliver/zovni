unit dmProdutoLoc;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Gerenciador;

type
  TModoBusca = (mdId, mdNome);

  TDM_ProdutoLoc = class(TDataModule)
    fdqryProdutoLoc: TFDQuery;
    fldProdutoLocid: TIntegerField;
    wdstrngfldProdutoLocnome: TWideStringField;
    wdstrngfldProdutoLocmarca: TWideStringField;
    wdstrngfldProdutoLocgenero: TWideStringField;
    bcdfldProdutoLocpreco: TBCDField;
    fldProdutoLocestoque: TIntegerField;
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Buscar(Campo: Variant; Modo: TModoBusca);
    procedure Excluir;
  end;

var
  DM_ProdutoLoc: TDM_ProdutoLoc;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataModule1 }

procedure TDM_ProdutoLoc.Buscar(Campo: Variant; Modo: TModoBusca);
begin
  fdqryProdutoLoc.Close;
  fdqryProdutoLoc.SQL.Clear;
  fdqryProdutoLoc.SQL.Text := 'SELECT * FROM produtos WHERE ';

  case Modo of
    mdId:
      begin
        fdqryProdutoLoc.SQL.Add('id = :id');
        fdqryProdutoLoc.Params.ParamByName('id').AsInteger := Campo;
      end;
    mdNome:
      begin
        fdqryProdutoLoc.SQL.Add('nome ILIKE :nome');
        fdqryProdutoLoc.Params.ParamByName('nome').AsString := Campo;
      end;
  end;

  fdqryProdutoLoc.Open;
end;

procedure TDM_ProdutoLoc.DataModuleDestroy(Sender: TObject);
begin
  fdqryProdutoLoc.Close;
end;

procedure TDM_ProdutoLoc.Excluir;
begin
  if not fdqryProdutoLoc.IsEmpty then
  begin
    fdqryProdutoLoc.Delete;
  end;
end;

end.

