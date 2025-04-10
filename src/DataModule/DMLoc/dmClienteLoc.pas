unit dmClienteLoc;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Gerenciador;

type
  TModoBusca = (mdCodigo, mdNome);

  TDM_ClienteLoc = class(TDataModule)
    fdqryClientesLoc: TFDQuery;
    fldClientesLocid: TIntegerField;
    wdstrngfldClientesLocnome: TWideStringField;
    wdstrngfldClientesLoctelefone: TWideStringField;
    wdstrngfldClientesLocbairro: TWideStringField;
    wdstrngfldClientesLoccidade: TWideStringField;
    blnfldClientesLocativo: TBooleanField;
    fdqryClientesLoctipo_pessoa: TWideStringField;
    wdstrngfldClientesLoccpf: TWideStringField;
    wdstrngfldClientesLoccnpj: TWideStringField;
    wdstrngfldClientesLoclogradouro: TWideStringField;
    wdstrngfldClientesLocnumero_endereco: TWideStringField;
    wdstrngfldClientesLoccep: TWideStringField;
    bcdfldClientesLocsaldo_loja: TBCDField;
    wdstrngfldClientesLocestado: TWideStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Buscar(Campo: Variant; Modo: TModoBusca);
    procedure Excluir;
  end;

var
  DM_ClienteLoc: TDM_ClienteLoc;

implementation



{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDM_ClienteLoc }

procedure TDM_ClienteLoc.Buscar(Campo: Variant; Modo: TModoBusca);
begin
  fdqryClientesLoc.Close;
  fdqryClientesLoc.SQL.Text := 'SELECT * FROM clientes WHERE ';

  case Modo of
    mdCodigo:
      begin
        fdqryClientesLoc.SQL.Add('id = :id');
        fdqryClientesLoc.Params.ParamByName('id').Value := Campo;
      end;
    mdNome:
      begin
        fdqryClientesLoc.SQL.Add('nome ILIKE :nome');
        fdqryClientesLoc.Params.ParamByName('nome').Value := '%' + Campo + '%';
      end;
  end;

  fdqryClientesLoc.Open;
end;

procedure TDM_ClienteLoc.Excluir;
begin
  if not fdqryClientesLoc.IsEmpty then
  begin
    fdqryClientesLoc.Delete;
  end;
end;

end.

