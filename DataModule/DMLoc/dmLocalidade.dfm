object DM_Localidade: TDM_Localidade
  Height = 480
  Width = 640
  object fdqryEstados: TFDQuery
    Connection = DM_Gerenciador.fdConnection
    SQL.Strings = (
      'SELECT id, nome FROM estado ORDER BY nome;'
      '')
    Left = 216
    Top = 112
    object intgrfldEstadosid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object wdstrngfldEstadosnome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
  end
  object fdqryCidades: TFDQuery
    Connection = DM_Gerenciador.fdConnection
    SQL.Strings = (
      'SELECT * FROM municipio order by id')
    Left = 408
    Top = 112
    object intgrfldCidadesid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object wdstrngfldCidadesnome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 255
    end
  end
end
