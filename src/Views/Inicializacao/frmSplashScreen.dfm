object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Form1'
  ClientHeight = 110
  ClientWidth = 356
  Color = clMenuHighlight
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  StyleName = 'Windows11 White Smoke'
  OnCreate = FormCreate
  TextHeight = 15
  object pnlCentro: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 350
    Height = 104
    Align = alClient
    BevelOuter = bvNone
    Color = clMenuHighlight
    ParentBackground = False
    TabOrder = 0
    StyleName = 'Windows'
    object lblProgress: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 30
      Width = 344
      Height = 17
      Margins.Top = 30
      Align = alTop
      Alignment = taCenter
      Caption = 'lblProgress'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitWidth = 66
    end
    object pbInicial: TProgressBar
      Left = 0
      Top = 87
      Width = 350
      Height = 17
      Align = alBottom
      TabOrder = 0
      StyleName = 'Windows11 White Smoke'
    end
  end
end
