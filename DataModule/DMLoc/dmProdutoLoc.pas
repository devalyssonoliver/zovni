unit dmProdutoLoc;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Gerenciador;

type
  TModoBusca = (mdCodigo, mdNome);
  TDM_ProdutoLoc = class(TDataModule)
    fdqryProdutoLoc: TFDQuery;
    fldProdutoLocid: TIntegerField;
    wdstrngfldProdutoLocnome: TWideStringField;
    wdstrngfldProdutoLocmarca: TWideStringField;
    wdstrngfldProdutoLocgenero: TWideStringField;
    bcdfldProdutoLocpreco: TBCDField;
    fldProdutoLocestoque: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  procedure Buscar(Campo : Variant;Modo: TModoBusca);
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
  fdqryProdutoLoc.SQL.Text := 'SELECT * FROM produtos WHERE ';

  case Modo of
    mdCodigo:
      begin
        fdqryProdutoLoc.SQL.Text := fdqryProdutoLoc.SQL.Text + 'id = :id';
        fdqryProdutoLoc.Params.ParamByName('id').Value := Campo;
      end;
    mdNome:
      begin
        fdqryProdutoLoc.SQL.Text := fdqryProdutoLoc.SQL.Text + 'nome ILIKE :nome';
        fdqryProdutoLoc.Params.ParamByName('nome').Value := '%' + Campo + '%';
      end;
  end;

  fdqryProdutoLoc.Open;
end;

procedure TDM_ProdutoLoc.Excluir;
begin
  if not fdqryProdutoLoc.IsEmpty then
  begin
    fdqryProdutoLoc.Delete;
  end;
end;

end.
