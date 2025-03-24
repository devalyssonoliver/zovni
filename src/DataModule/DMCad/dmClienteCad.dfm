object DM_ClientesCad: TDM_ClientesCad
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 376
  Width = 361
  object fdqryClientesCad: TFDQuery
    Active = True
    Connection = DM_Gerenciador.fdConnection
    SQL.Strings = (
      'SELECT * FROM clientes')
    Left = 248
    Top = 184
    object fldClientesLocid: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
      KeyFields = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
    end
    object wdstrngfldClientesLocnome: TWideStringField
      FieldName = 'nome'
      Size = 130
    end
    object wdstrngfldClientesLoctelefone: TWideStringField
      FieldName = 'telefone'
      Size = 15
    end
    object wdstrngfld_tipopessoa: TWideStringField
      FieldName = 'tipo_pessoa'
      Origin = 'tipo_pessoa'
      FixedChar = True
      Size = 1
    end
    object wdstrngfldClientesLoccpf: TWideStringField
      FieldName = 'cpf'
      EditMask = '999.999.999-99;1;_'
      FixedChar = True
      Size = 14
    end
    object wdstrngfldClientesLoccnpj: TWideStringField
      FieldName = 'cnpj'
      EditMask = '99.999.999/9999-99;1;_'
      FixedChar = True
      Size = 18
    end
    object wdstrngfldClientesLoclogradouro: TWideStringField
      FieldName = 'logradouro'
      Size = 255
    end
    object wdstrngfldClientesLocnumero_endereco: TWideStringField
      FieldName = 'numero_endereco'
      Size = 10
    end
    object wdstrngfldClientesLocbairro: TWideStringField
      FieldName = 'bairro'
      Size = 100
    end
    object wdstrngfldClientesLoccidade: TWideStringField
      FieldName = 'cidade'
      Size = 100
    end
    object wdstrngfldClientesLocestado: TWideStringField
      FieldName = 'estado'
      Origin = 'estado'
      Size = 200
    end
    object wdstrngfldClientesLoccep: TWideStringField
      FieldName = 'cep'
      EditMask = '99999-999;1;_'
      FixedChar = True
      Size = 9
    end
    object blnfldClientesLocativo: TBooleanField
      FieldName = 'ativo'
      Origin = 'ativo'
    end
    object bcdfldClientesCadsaldo_loja: TBCDField
      FieldName = 'saldo_loja'
      Origin = 'saldo_loja'
      Precision = 10
      Size = 3
    end
  end
  object fdqryEstado: TFDQuery
    Connection = DM_Gerenciador.fdConnection
    Left = 152
    Top = 144
  end
  object fdqryCidade: TFDQuery
    Connection = DM_Gerenciador.fdConnection
    Left = 136
    Top = 216
  end
end
