unit frmClienteLoc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, dmClienteLoc, frmClienteCad, Vcl.ComCtrls,
  System.ImageList, Vcl.ImgList;

type
  TFrm_ClienteLoc = class(TForm)
    pnlTopo: TPanel;
    pnlMeio: TPanel;
    pnlBaixo: TPanel;
    imgicon: TImage;
    lblTITULO: TLabel;
    pnlFuncoesBusca: TPanel;
    cbbModoDeBusca: TComboBox;
    edtCodigo: TEdit;
    edtNome: TEdit;
    btnBuscar: TBitBtn;
    dsClienteLoc: TDataSource;
    btnNovo: TBitBtn;
    btnExcluir: TBitBtn;
    btnFechar: TBitBtn;
    btnExibir: TBitBtn;
    pnlGrid: TPanel;
    dbgrd: TDBGrid;
    ilAtivo: TImageList;
    procedure btnNovoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ConfigurarModoBusca;
    procedure ModoBusca(Modo: TModoBusca);
    procedure btnBuscarClick(Sender: TObject);
    procedure dbgrdDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure cbbModoDeBuscaClick(Sender: TObject);
    procedure btnExibirClick(Sender: TObject);
    procedure dbgrdDblClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FUsuarioLoc: TDM_ClienteLoc;
    FCodigo: Integer;
    procedure ExibirClienteCad;
  public
  end;

var
  Frm_ClienteLoc: TFrm_ClienteLoc;

implementation

{$R *.dfm}

procedure TFrm_ClienteLoc.btnBuscarClick(Sender: TObject);
begin
  case cbbModoDeBusca.ItemIndex of
    0:
      ModoBusca(mdCodigo);
    1:
      ModoBusca(mdNome);
  end;
end;

procedure TFrm_ClienteLoc.btnExcluirClick(Sender: TObject);
begin
  if Application.MessageBox(PChar('Deseja excluir o cliente Id: ' + dbgrd.DataSource.DataSet.FieldByName('id').AsString + '?'), 'ZOvni', MB_YESNO + MB_ICONQUESTION) = IDYES then
  begin
    FUsuarioLoc.Excluir;
  end;
end;

procedure TFrm_ClienteLoc.btnExibirClick(Sender: TObject);
begin
  ExibirClienteCad;
end;

procedure TFrm_ClienteLoc.btnNovoClick(Sender: TObject);
begin
  if not Assigned(Frm_ClientesCad) then
    Application.CreateForm(TFrm_ClientesCad, Frm_ClientesCad);
  try
    Frm_ClientesCad.AlterarModoOperacao(tpNovo);
    Frm_ClientesCad.ShowModal;
  finally
    FreeAndNil(Frm_ClientesCad);
    dbgrd.DataSource.DataSet.Refresh;
  end;
end;

procedure TFrm_ClienteLoc.cbbModoDeBuscaClick(Sender: TObject);
begin
  ConfigurarModoBusca;
end;

procedure TFrm_ClienteLoc.ConfigurarModoBusca;
begin
  edtCodigo.Visible := False;
  edtNome.Visible := False;

  case cbbModoDeBusca.ItemIndex of
    0:
      edtCodigo.Visible := True;
    1:
      edtNome.Visible := True;
  end;
end;

procedure TFrm_ClienteLoc.dbgrdDblClick(Sender: TObject);
begin
  ExibirClienteCad;
end;

procedure TFrm_ClienteLoc.dbgrdDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  IndiceImagem: Byte;
  CentroX, CentroY: Integer;
begin
  if not dbgrd.DataSource.DataSet.IsEmpty then
  begin
    if Column.FieldName = 'ativo' then
    begin
      dbgrd.Canvas.FillRect(Rect);
      IndiceImagem := Byte(Column.Field.AsBoolean);
      CentroX := Rect.Left + (Column.Width - ilAtivo.Width) div 2;
      CentroY := Rect.Top + (Rect.Height - ilAtivo.Height) div 2;
      ilAtivo.Draw(dbgrd.Canvas, CentroX, CentroY, IndiceImagem);
      Exit;
    end;
  end;
  dbgrd.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFrm_ClienteLoc.ExibirClienteCad;
begin
  if dbgrd.DataSource.DataSet.IsEmpty then
    Exit;

  FCodigo := dbgrd.DataSource.DataSet.FieldByName('id').AsInteger;
  if FCodigo = 0 then
    Exit;

  Application.CreateForm(TFrm_ClientesCad, Frm_ClientesCad);
  try
    Frm_ClientesCad.Exibir(FCodigo);
    Frm_ClientesCad.AlterarModoOperacao(tpExibir);
    Frm_ClientesCad.ShowModal;
  finally
    FreeAndNil(Frm_ClientesCad);
    dbgrd.DataSource.DataSet.Refresh;
  end;
end;

procedure TFrm_ClienteLoc.FormCreate(Sender: TObject);
begin
  FUsuarioLoc := TDM_ClienteLoc.Create(nil);
  dbgrd.DataSource.DataSet.Active := True;
end;

procedure TFrm_ClienteLoc.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FUsuarioLoc);
end;

procedure TFrm_ClienteLoc.ModoBusca(Modo: TModoBusca);
begin
  if (edtCodigo.Text <> '') or (edtNome.Text <> '') then
  begin
    case Modo of
      mdCodigo:
        FUsuarioLoc.Buscar(StrToIntDef(edtCodigo.Text, 0), mdCodigo);
      mdNome:
        FUsuarioLoc.Buscar(edtNome.Text, mdNome);
    end;
    dbgrd.DataSource := dsClienteLoc;
    if dsClienteLoc.DataSet.IsEmpty then
      Application.MessageBox('Sem resultados para a consulta!', 'ZOvni', MB_ICONWARNING);
  end
  else
    Application.MessageBox('O valor da consulta não pode ser nulo!', 'ZOvni', MB_ICONWARNING);
end;

end.

