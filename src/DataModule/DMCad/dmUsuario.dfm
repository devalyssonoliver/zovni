object DM_Usuarios: TDM_Usuarios
  OnCreate = DataModuleCreate
  Height = 274
  Width = 393
  object fdqryUsuarios: TFDQuery
    Connection = DM_Gerenciador.fdConnection
    SQL.Strings = (
      'SELECT * FROM usuarios')
    Left = 240
    Top = 120
    object intgrfldUsuariosid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object wdstrngfldUsuariosnome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 100
    end
    object wdstrngfldUsuarioslogin: TWideStringField
      FieldName = 'login'
      Origin = '"login"'
      Size = 100
    end
    object wdmfldUsuariossenha: TWideMemoField
      FieldName = 'senha'
      Origin = 'senha'
      BlobType = ftWideMemo
    end
    object blnfldUsuariosativo: TBooleanField
      FieldName = 'ativo'
      Origin = 'ativo'
    end
    object dtfldUsuariosdata_cadastro: TDateField
      FieldName = 'data_cadastro'
      Origin = 'data_cadastro'
    end
  end
end
