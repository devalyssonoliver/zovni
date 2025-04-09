object Frm_Config: TFrm_Config
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 413
  ClientWidth = 425
  Color = clWhite
  DefaultMonitor = dmDesktop
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poDesktopCenter
  Scaled = False
  StyleName = 'Windows11 White Smoke'
  TextHeight = 15
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 425
    Height = 57
    Align = alTop
    BevelOuter = bvNone
    Color = clAppWorkSpace
    ParentBackground = False
    TabOrder = 0
    StyleName = 'Windows'
    object lblTituloDB: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 10
      Width = 376
      Height = 37
      Margins.Top = 10
      Align = alTop
      Alignment = taCenter
      Caption = 'Banco de Dados - Configura'#231#227'o'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -27
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      StyleName = 'Windows'
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 356
    Width = 425
    Height = 57
    Align = alBottom
    BevelOuter = bvNone
    Color = clAppWorkSpace
    ParentBackground = False
    TabOrder = 2
    StyleName = 'Windows'
    object btnSalvar: TBitBtn
      Left = 232
      Top = 16
      Width = 90
      Height = 25
      Caption = '&Salvar'
      Kind = bkOK
      NumGlyphs = 2
      Style = bsNew
      TabOrder = 0
      StyleName = 'Windows11 White Smoke'
      OnClick = btnSalvarClick
    end
    object btnCancelar: TBitBtn
      Left = 328
      Top = 16
      Width = 90
      Height = 25
      Caption = '&Cancelar'
      Kind = bkCancel
      NumGlyphs = 2
      Style = bsNew
      TabOrder = 2
      StyleName = 'Windows11 White Smoke'
      OnClick = btnCancelarClick
    end
    object btnEditar: TBitBtn
      Left = 232
      Top = 16
      Width = 90
      Height = 25
      Caption = '&Editar'
      DragKind = dkDock
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000191B21210000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000532DFDFF7488FEFFB2DEFCFEBCD6EAEA2726373700000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000A7B3FAFEB9E8FBFFC0EDFBFFBFDDFBFF7580FEFF282A3A3A000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000C6DDE3E5C3EFFBFFBFE2FCFF2C50FEFF3259FEFF6F8EFEFF272C3A3A0000
        0000000000000000000000000000000000000000000000000000000000000000
        00006E767B7BB3D5FEFF275FFEFF2563FEFF2466FEFF2B6FFEFF6C9DFEFE252B
        3838000000000000000000000000000000000000000000000000000000000000
        00000101010181A0DCDC3D86FFFF1F77FFFF1D7AFFFF1C7DFFFF2385FFFF65AC
        FFFF262F3A3A0000000000000000000000000000000000000000000000000000
        000000000000010101017FAADCDC3899FFFF1E8DFFFF208FFFFF2392FFFF2F99
        FEFF70BAFFFF28323A3A00000000000000000000000000000000000000000000
        000000000000000000000101010185B3DDDD49AAFEFF339FFEFF35A2FEFF39A4
        FEFF43ABFEFF7DBFFEFE25263636000000000000000000000000000000000000
        0000000000000000000000000000010101018EBADCDC5CB9FDFF48B2FDFF4BB4
        FDFF51B3FDFF4D2CF3FF7B63F6FF272539390000000000000000000000000000
        0000000000000000000000000000000000000101010194C0DCDC70C9FCFF5FBD
        FCFF7432EAFF6A27E9FF6F30EAFFA17EF0FE0201020200000000000000000000
        0000000000000000000000000000000000000000000001010101A3CADCDE9F7A
        F3FF885AEEFF8857EEFF9466EFFFAF98DEE60000000000000000000000000000
        000000000000000000000000000000000000000000000000000001010101B4AB
        D8DDAA95F5FFA992F4FFBCAEE4EA020202020000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000101
        0101B3B0D0D2B9B5D8DB02020202000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      ModalResult = 5
      Style = bsNew
      TabOrder = 1
      Visible = False
      StyleName = 'Windows11 White Smoke'
      OnClick = btnEditarClick
    end
  end
  object pnlCenter: TPanel
    Left = 0
    Top = 57
    Width = 425
    Height = 299
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    StyleName = 'Windows'
    object pnlConfig: TPanel
      Left = 0
      Top = 0
      Width = 429
      Height = 300
      Align = alClient
      BevelKind = bkTile
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitWidth = 425
      ExplicitHeight = 299
      object lblHost: TLabel
        Left = 16
        Top = 28
        Width = 29
        Height = 15
        Caption = 'Host:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblDatabase: TLabel
        Left = 16
        Top = 125
        Width = 54
        Height = 15
        Caption = 'Database:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblPorta: TLabel
        Left = 16
        Top = 73
        Width = 27
        Height = 15
        Caption = 'Port:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblUser: TLabel
        Left = 16
        Top = 177
        Width = 29
        Height = 15
        Caption = 'User:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblPass: TLabel
        Left = 16
        Top = 227
        Width = 55
        Height = 15
        Caption = 'Password:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtHost: TEdit
        Left = 16
        Top = 49
        Width = 400
        Height = 25
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        StyleName = 'Windows11 White Smoke'
      end
      object edtDatabase: TEdit
        Left = 16
        Top = 146
        Width = 400
        Height = 25
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        StyleName = 'Windows11 White Smoke'
      end
      object edtUser: TEdit
        Left = 16
        Top = 198
        Width = 400
        Height = 25
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        StyleName = 'Windows11 White Smoke'
      end
      object edtPassword: TEdit
        Left = 16
        Top = 248
        Width = 400
        Height = 25
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        PasswordChar = '*'
        TabOrder = 4
        StyleName = 'Windows11 White Smoke'
      end
      object edtPort: TEdit
        Left = 16
        Top = 94
        Width = 400
        Height = 25
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        StyleName = 'Windows11 White Smoke'
      end
    end
  end
end
