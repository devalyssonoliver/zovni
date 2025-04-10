object Frm_Config: TFrm_Config
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 292
  ClientWidth = 446
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  StyleName = 'Windows11 White Smoke'
  TextHeight = 15
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 446
    Height = 60
    Align = alTop
    BevelOuter = bvNone
    Color = clSkyBlue
    ParentBackground = False
    TabOrder = 0
    object lblTituloDB: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 440
      Height = 54
      Align = alClient
      Alignment = taCenter
      AutoSize = False
      Caption = 'Configura'#231#227'o do Banco de Dados'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -24
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 10
      ExplicitTop = 10
      ExplicitWidth = 430
      ExplicitHeight = 40
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 235
    Width = 446
    Height = 57
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 2
    ExplicitTop = 372
    object btnSalvar: TBitBtn
      Left = 244
      Top = 16
      Width = 90
      Height = 25
      Caption = '&Salvar'
      Kind = bkOK
      NumGlyphs = 2
      TabOrder = 0
      OnClick = btnSalvarClick
    end
    object btnCancelar: TBitBtn
      Left = 340
      Top = 16
      Width = 90
      Height = 25
      Caption = '&Cancelar'
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 1
      OnClick = btnCancelarClick
    end
  end
  object pnlMain: TPanel
    Left = 0
    Top = 60
    Width = 446
    Height = 175
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    ExplicitHeight = 312
    object lblHost: TLabel
      Left = 16
      Top = 20
      Width = 28
      Height = 15
      Caption = 'Host:'
    end
    object lblPort: TLabel
      Left = 16
      Top = 65
      Width = 31
      Height = 15
      Caption = 'Porta:'
    end
    object lblDatabase: TLabel
      Left = 16
      Top = 110
      Width = 51
      Height = 15
      Caption = 'Database:'
    end
    object lblUser: TLabel
      Left = 16
      Top = 155
      Width = 40
      Height = 15
      Caption = 'Usu'#225'rio'
    end
    object edtHost: TEdit
      Left = 100
      Top = 16
      Width = 320
      Height = 23
      TabOrder = 0
    end
    object edtPort: TEdit
      Left = 100
      Top = 61
      Width = 320
      Height = 23
      TabOrder = 1
    end
    object edtDatabase: TEdit
      Left = 100
      Top = 106
      Width = 320
      Height = 23
      TabOrder = 2
    end
    object edtUser: TEdit
      Left = 100
      Top = 151
      Width = 320
      Height = 23
      TabOrder = 3
    end
  end
end
