object DMCompra_Cad: TDMCompra_Cad
  OnCreate = DataModuleCreate
  Height = 480
  Width = 640
  object fdqryCompra: TFDQuery
    Connection = DM_Gerenciador.fdConnection
    Transaction = fdTransaction
    SQL.Strings = (
      
        'SELECT id_compra, valor_total, custo_total, data_compra, id_forn' +
        'ecedor'
      '  FROM public.compra;'
      '')
    Left = 416
    Top = 200
    object bcdfldCompravalor_total: TBCDField
      FieldName = 'valor_total'
      Origin = 'valor_total'
      Precision = 10
      Size = 2
    end
    object bcdfldCompracusto_total: TBCDField
      FieldName = 'custo_total'
      Origin = 'custo_total'
      Precision = 10
      Size = 2
    end
    object sqltmstmpfldCompradata_compra: TSQLTimeStampField
      FieldName = 'data_compra'
      Origin = 'data_compra'
      ProviderFlags = [pfInUpdate]
    end
    object fldCompraid_fornecedor: TIntegerField
      FieldName = 'id_fornecedor'
      Origin = 'id_fornecedor'
    end
    object fldCompraid_compra: TIntegerField
      FieldName = 'id_compra'
      Origin = 'id_compra'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
  end
  object fdqryCompraProd: TFDQuery
    Active = True
    BeforePost = fdqryCompraProdBeforePost
    OnNewRecord = fdqryCompraProdNewRecord
    Connection = DM_Gerenciador.fdConnection
    Transaction = fdTransaction
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select * from compra_prod'
      '')
    Left = 360
    Top = 312
    object fldCompraProdid_compra_prod: TIntegerField
      FieldName = 'id_compra_prod'
      Origin = 'id_compra_prod'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object fldCompraProdid_compra: TIntegerField
      FieldName = 'id_compra'
      Origin = 'id_compra'
    end
    object fldCompraProdid_produto: TIntegerField
      FieldName = 'id_produto'
      Origin = 'id_produto'
    end
    object fldCompraProdquantidade: TIntegerField
      FieldName = 'quantidade'
      Origin = 'quantidade'
    end
    object bcdfldCompraProdpreco_unitario: TBCDField
      FieldName = 'preco_unitario'
      Origin = 'preco_unitario'
      Precision = 10
      Size = 2
    end
    object bcdfldCompraProdcusto_unitario: TBCDField
      FieldName = 'custo_unitario'
      Origin = 'custo_unitario'
      Precision = 10
      Size = 2
    end
  end
  object fdqryProdutos: TFDQuery
    Active = True
    Connection = DM_Gerenciador.fdConnection
    SQL.Strings = (
      'SELECT id, nome, custo, preco  FROM produtos')
    Left = 288
    Top = 192
    object fldProdutosid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object wdstrngfldProdutosnome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 100
    end
    object bcdfldProdutoscusto: TBCDField
      FieldName = 'custo'
      Origin = 'custo'
      Precision = 10
      Size = 2
    end
    object bcdfldProdutospreco: TBCDField
      FieldName = 'preco'
      Origin = 'preco'
      Precision = 10
      Size = 2
    end
  end
  object fdTransaction: TFDTransaction
    Options.AutoStop = False
    Connection = DM_Gerenciador.fdConnection
    Left = 232
    Top = 304
  end
end
