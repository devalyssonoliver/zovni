object Frm_EntradaSenha: TFrm_EntradaSenha
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Autentica'#231#227'o'
  ClientHeight = 120
  ClientWidth = 300
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object Label1: TLabel
    Left = 20
    Top = 20
    Width = 88
    Height = 15
    Caption = 'Informe a senha:'
  end
  object EditSenha: TEdit
    Left = 20
    Top = 45
    Width = 260
    Height = 23
    PasswordChar = '*'
    TabOrder = 0
  end
  object BtnOK: TButton
    Left = 120
    Top = 80
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    TabOrder = 1
  end
  object BtnCancelar: TButton
    Left = 205
    Top = 80
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancelar'
    TabOrder = 2
  end
end
