unit UFuncoesAuxiliares;

interface

uses
  Vcl.Buttons, Vcl.DBCtrls, Winapi.Windows, Vcl.Forms, Vcl.Controls;
function VerificarPreenchimentoObrigatorio(const Edits: array of TDBEdit ): Boolean;
procedure DefinirEstadoBotoes(const Botoes: array of TBitBtn; Ativo: Boolean);

implementation
function VerificarPreenchimentoObrigatorio(const Edits: array of TDBEdit ): Boolean;
var
  I : Integer;
begin
  Result := False;
  for I  := 0 to High(Edits) do
  begin
   if  Edits[I].Text = '' then
   begin
     Application.MessageBox('Por favor! Preencha os campos obrigatórios. (*)',
                            'ZOVNI - Gestão', MB_OK + MB_ICONWARNING);
   Result := True;
   end;

  end;
end;



procedure DefinirEstadoBotoes(const Botoes: array of TBitBtn; Ativo: Boolean);
var
  I: Integer;
begin
  for I := 0 to High(Botoes) do
  begin
    Botoes[I].Enabled := Ativo;
  end;
end;

end.

