object DM_ProdutoLoc: TDM_ProdutoLoc
  OnDestroy = DataModuleDestroy
  Height = 480
  Width = 640
  object fdqryProdutoLoc: TFDQuery
    Connection = DM_Gerenciador.fdConnection
    SQL.Strings = (
      
        'SELECT id, nome, informadic, marca, genero, preco, ativo, data_c' +
        'adastro, '
      '       estoque, custo, id_fornecedor'
      '  FROM public.produtos;'
      '')
    Left = 376
    Top = 352
    object fldProdutoLocid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object wdstrngfldProdutoLocnome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 100
    end
    object wdstrngfldProdutoLocmarca: TWideStringField
      FieldName = 'marca'
      Origin = 'marca'
      Size = 50
    end
    object wdstrngfldProdutoLocgenero: TWideStringField
      FieldName = 'genero'
      Origin = 'genero'
      Size = 10
    end
    object bcdfldProdutoLocpreco: TBCDField
      FieldName = 'preco'
      Origin = 'preco'
      Precision = 10
      Size = 2
    end
    object fldProdutoLocestoque: TIntegerField
      FieldName = 'estoque'
      Origin = 'estoque'
    end
  end
end
