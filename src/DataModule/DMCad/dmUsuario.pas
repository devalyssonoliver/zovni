unit dmUsuario;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Gerenciador;

type
  TDM_Usuarios = class(TDataModule)
    fdqryUsuarios: TFDQuery;
    wdstrngfldUsuariosnome: TWideStringField;
    wdstrngfldUsuarioslogin: TWideStringField;
    wdmfldUsuariossenha: TWideMemoField;
    blnfldUsuariosativo: TBooleanField;
    dtfldUsuariosdata_cadastro: TDateField;
    intgrfldUsuariosid: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Salvar;
    procedure Editar;
    function VerificarLogin(Login, Senha : string): Boolean;
    procedure Cancelar;
    procedure Inserir;
  end;

var
  DM_Usuarios: TDM_Usuarios;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataModule1 }

procedure TDM_Usuarios.Cancelar;
begin
  if (fdqryUsuarios.State in [dsInsert, dsEdit]) then
  begin
    fdqryUsuarios.Cancel;
  end;

end;

procedure TDM_Usuarios.DataModuleCreate(Sender: TObject);
begin
 fdqryUsuarios.Open();
end;

procedure TDM_Usuarios.Editar;
begin
   fdqryUsuarios.Edit;
end;

procedure TDM_Usuarios.Inserir;
begin
  if not (fdqryUsuarios.State in [dsInsert, dsEdit]) then
  begin
    fdqryUsuarios.Insert;
  end;

end;

procedure TDM_Usuarios.Salvar;
begin
   if (fdqryUsuarios.state in [dsInsert, dsEdit]) then
   begin
     fdqryUsuarios.Post;
   end;

end;

function TDM_Usuarios.VerificarLogin(Login, Senha : string): Boolean;
begin
  Result := False;
  fdqryUsuarios.Close;
  fdqryUsuarios.SQL.Text :=
    'SELECT * FROM usuarios WHERE login = :login AND senha = MD5(:senha) AND ativo IS TRUE;';
  fdqryUsuarios.Params.ParamByName('login').AsString := Login;
  fdqryUsuarios.Params.ParamByName('senha').AsString := Senha;
  fdqryUsuarios.Open;

  Result := not fdqryUsuarios.IsEmpty;
end;

end.
