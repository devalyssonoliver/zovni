unit frmCompraCad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons, System.ImageList, Vcl.ImgList, Vcl.DBCtrls,
  Vcl.Mask;

type
  TFrm_Compra = class(TForm)
    pnlTopo: TPanel;
    lblTITULO: TLabel;
    imgicon: TImage;
    pnlCentral: TPanel;
    pnlBaixo: TPanel;
    btnSalvar: TBitBtn;
    btnFechar: TBitBtn;
    btnCancelar: TBitBtn;
    ilImages: TImageList;
    dbedt_Cod_Fornecedor: TDBEdit;
    dbedt_Custo_Total: TDBEdit;
    lblFornecedor: TLabel;
    edt_Nome_Fornecedor: TEdit;
    dbcbb_FormasPagtos: TDBComboBox;
    lblFormaPagto: TLabel;
    lblCusto: TLabel;
    dbedt_Valor_Total: TDBEdit;
    lblValorTotal: TLabel;
    dbedt_Desconto: TDBEdit;
    lblDesconto: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Compra: TFrm_Compra;

implementation

{$R *.dfm}

end.
