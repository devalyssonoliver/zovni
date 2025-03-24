object DM_ClienteLoc: TDM_ClienteLoc
  Height = 332
  Width = 379
  object fdqryClientesLoc: TFDQuery
    Connection = DM_Gerenciador.fdConnection
    SQL.Strings = (
      'SELECT * FROM clientes')
    Left = 104
    Top = 136
    object fldClientesLocid: TIntegerField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 10
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object wdstrngfldClientesLocnome: TWideStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 28
      FieldName = 'nome'
      Origin = 'nome'
      Size = 130
    end
    object wdstrngfldClientesLoctelefone: TWideStringField
      DisplayLabel = 'Telefone'
      DisplayWidth = 15
      FieldName = 'telefone'
      Origin = 'telefone'
      Size = 15
    end
    object wdstrngfldClientesLoccidade: TWideStringField
      DisplayLabel = 'Cidade'
      DisplayWidth = 20
      FieldName = 'cidade'
      Origin = 'cidade'
      Size = 100
    end
    object wdstrngfldClientesLocbairro: TWideStringField
      DisplayLabel = 'Bairro'
      DisplayWidth = 28
      FieldName = 'bairro'
      Origin = 'bairro'
      Size = 100
    end
    object fdqryClientesLoctipo_pessoa: TWideStringField
      FieldName = 'tipo_pessoa'
      Origin = 'tipo_pessoa'
      FixedChar = True
      Size = 1
    end
    object blnfldClientesLocativo: TBooleanField
      DisplayLabel = 'Ativo'
      DisplayWidth = 5
      FieldName = 'ativo'
      Origin = 'ativo'
    end
    object wdstrngfldClientesLoccpf: TWideStringField
      FieldName = 'cpf'
      Origin = 'cpf'
      FixedChar = True
      Size = 14
    end
    object wdstrngfldClientesLoccnpj: TWideStringField
      FieldName = 'cnpj'
      Origin = 'cnpj'
      FixedChar = True
      Size = 18
    end
    object wdstrngfldClientesLoclogradouro: TWideStringField
      FieldName = 'logradouro'
      Origin = 'logradouro'
      Size = 255
    end
    object wdstrngfldClientesLocnumero_endereco: TWideStringField
      FieldName = 'numero_endereco'
      Origin = 'numero_endereco'
      Size = 10
    end
    object wdstrngfldClientesLoccep: TWideStringField
      FieldName = 'cep'
      Origin = 'cep'
      FixedChar = True
      Size = 9
    end
    object bcdfldClientesLocsaldo_loja: TBCDField
      FieldName = 'saldo_loja'
      Origin = 'saldo_loja'
      Precision = 10
      Size = 3
    end
    object wdstrngfldClientesLocestado: TWideStringField
      FieldName = 'estado'
      Origin = 'estado'
      Size = 200
    end
  end
end
