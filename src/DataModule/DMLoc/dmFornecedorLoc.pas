unit dmFornecedorLoc;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Gerenciador;

type
  TModoBusca = (mdCodigo, mdNome);

  TDM_FornecedorLoc = class(TDataModule)
    fdqryFornecedores: TFDQuery;
    wdstrngfldFornecedoresNome: TWideStringField;
    wdstrngfldFornecedoresCNPJ: TWideStringField;
    wdstrngfldFornecedoresTelefone: TWideStringField;
    fldFornecedoresID: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Buscar(Campo: Variant; Modo: TModoBusca);
    procedure Excluir;
  end;

var
  DM_FornecedorLoc: TDM_FornecedorLoc;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDM_FornecedorLoc.Buscar(Campo: Variant; Modo: TModoBusca);
begin
  fdqryFornecedores.Close;
  fdqryFornecedores.SQL.Clear;
  fdqryFornecedores.SQL.Add('SELECT * FROM fornecedores WHERE');

  case Modo of
    mdCodigo:
      begin
        fdqryFornecedores.SQL.Add('id = :id');
        fdqryFornecedores.Params.ParamByName('id').AsInteger := Campo;
      end;
    mdNome:
      begin
        fdqryFornecedores.SQL.Add('nome ILIKE :nome');
        fdqryFornecedores.Params.ParamByName('nome').AsString := '%' + Campo + '%';
      end;
  end;

  fdqryFornecedores.Open;
end;

procedure TDM_FornecedorLoc.DataModuleCreate(Sender: TObject);
begin
  fdqryFornecedores.Open;
end;

procedure TDM_FornecedorLoc.Excluir;
begin
  if not fdqryFornecedores.IsEmpty then
  begin
    fdqryFornecedores.Delete;
  end;
end;

end.

