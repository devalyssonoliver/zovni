object DM_FornecedorLoc: TDM_FornecedorLoc
  OnCreate = DataModuleCreate
  Height = 381
  Width = 396
  object fdqryFornecedores: TFDQuery
    Connection = DM_Gerenciador.fdConnection
    SQL.Strings = (
      'SELECT '
      '    id AS "ID",'
      '    nome AS "Nome",'
      '    cnpj AS "CNPJ",'
      '    telefone AS "Telefone"'
      'FROM '
      '    public.fornecedores;')
    Left = 88
    Top = 200
    object fldFornecedoresID: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object wdstrngfldFornecedoresNome: TWideStringField
      DisplayWidth = 97
      FieldName = 'nome'
      Origin = 'nome'
      ProviderFlags = []
      Size = 100
    end
    object wdstrngfldFornecedoresCNPJ: TWideStringField
      DisplayWidth = 23
      FieldName = 'cnpj'
      Origin = 'cnpj'
      Size = 14
    end
    object wdstrngfldFornecedoresTelefone: TWideStringField
      DisplayWidth = 15
      FieldName = 'telefone'
      Origin = 'telefone'
      Size = 15
    end
  end
end
