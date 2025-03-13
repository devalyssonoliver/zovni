object DM_FornecedorCad: TDM_FornecedorCad
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 348
  Width = 370
  object fdqryFornecedorCad: TFDQuery
    Connection = DM_Gerenciador.fdConnection
    SQL.Strings = (
      'select * from fornecedores')
    Left = 208
    Top = 168
    object fldFornecedorCadid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object wdstrngfldFornecedorCadnome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 100
    end
    object wdstrngfldFornecedorCadtelefone: TWideStringField
      FieldName = 'telefone'
      Origin = 'telefone'
      Size = 15
    end
    object wdstrngfldFornecedorCadtipo_pessoa: TWideStringField
      FieldName = 'tipo_pessoa'
      Origin = 'tipo_pessoa'
      FixedChar = True
      Size = 1
    end
    object wdstrngfldFornecedorCadcpf: TWideStringField
      FieldName = 'cpf'
      Origin = 'cpf'
      EditMask = '999.999.999-99;1;_'
      FixedChar = True
      Size = 14
    end
    object wdstrngfldFornecedorCadcnpj: TWideStringField
      FieldName = 'cnpj'
      Origin = 'cnpj'
      EditMask = '99.999.999/9999-99;1;_'
      FixedChar = True
      Size = 18
    end
    object wdstrngfldFornecedorCadlogradouro: TWideStringField
      FieldName = 'logradouro'
      Origin = 'logradouro'
      Size = 255
    end
    object wdstrngfldFornecedorCadnumero_endereco: TWideStringField
      FieldName = 'numero_endereco'
      Origin = 'numero_endereco'
      Size = 10
    end
    object wdstrngfldFornecedorCadbairro: TWideStringField
      FieldName = 'bairro'
      Origin = 'bairro'
      Size = 100
    end
    object wdstrngfldFornecedorCadcidade: TWideStringField
      FieldName = 'cidade'
      Origin = 'cidade'
      Size = 100
    end
    object wdstrngfldFornecedorCadcep: TWideStringField
      FieldName = 'cep'
      Origin = 'cep'
      EditMask = '99999-999 ;1;_'
      FixedChar = True
      Size = 9
    end
    object blnfldFornecedorCadativo: TBooleanField
      FieldName = 'ativo'
      Origin = 'ativo'
    end
    object wdstrngfldFornecedorCadestado: TWideStringField
      FieldName = 'estado'
      Origin = 'estado'
      Size = 200
    end
    object wdmfldFornecedorCadendereco: TWideMemoField
      FieldName = 'endereco'
      Origin = 'endereco'
      BlobType = ftWideMemo
    end
  end
  object fdqryEstado: TFDQuery
    Connection = DM_Gerenciador.fdConnection
    Left = 120
    Top = 128
  end
  object fdqryCidade: TFDQuery
    Connection = DM_Gerenciador.fdConnection
    Left = 104
    Top = 200
  end
end
