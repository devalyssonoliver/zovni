object DM_Usuarios: TDM_Usuarios
  Height = 274
  Width = 393
  object fdqryUsuarios: TFDQuery
    Connection = DM_Gerenciador.fdConnection
    SQL.Strings = (
      'SELECT * FROM usuarios')
    Left = 240
    Top = 120
  end
end
