object DM_ProdutoCad: TDM_ProdutoCad
  OnCreate = DataModuleCreate
  Height = 480
  Width = 640
  object fdqryProdutoCad: TFDQuery
    Connection = DM_Gerenciador.fdConnection
    SQL.Strings = (
      
        'SELECT id, nome, informadic, marca, genero, preco, ativo, data_c' +
        'adastro, '
      '       estoque, custo, id_fornecedor'
      '  FROM public.produtos;'
      '')
    Left = 112
    Top = 120
    object fldProdutoCadid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object wdstrngfldProdutoCadnome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 100
    end
    object wdmfldProdutoCadinformadic: TWideMemoField
      FieldName = 'informadic'
      Origin = 'informadic'
      BlobType = ftWideMemo
    end
    object wdstrngfldProdutoCadmarca: TWideStringField
      FieldName = 'marca'
      Origin = 'marca'
      Size = 50
    end
    object wdstrngfldProdutoCadgenero: TWideStringField
      FieldName = 'genero'
      Origin = 'genero'
      Size = 10
    end
    object bcdfldProdutoCadpreco: TBCDField
      FieldName = 'preco'
      Origin = 'preco'
      Precision = 10
      Size = 2
    end
    object blnfldProdutoCadativo: TBooleanField
      FieldName = 'ativo'
      Origin = 'ativo'
    end
    object sqltmstmpfldProdutoCaddata_cadastro: TSQLTimeStampField
      FieldName = 'data_cadastro'
      Origin = 'data_cadastro'
      ProviderFlags = [pfInUpdate]
    end
    object fldProdutoCadestoque: TIntegerField
      FieldName = 'estoque'
      Origin = 'estoque'
    end
    object fldProdutoCadid_fornecedor: TIntegerField
      FieldName = 'id_fornecedor'
      Origin = 'id_fornecedor'
    end
    object bcdfldProdutoCadcusto: TBCDField
      FieldName = 'custo'
      Origin = 'custo'
      Precision = 10
      Size = 2
    end
  end
  object fdqryNumeracaoProd: TFDQuery
    Active = True
    BeforePost = fdqryNumeracaoProdBeforePost
    AfterPost = fdqryNumeracaoProdAfterPost
    Connection = DM_Gerenciador.fdConnection
    SQL.Strings = (
      'select * from produto_numeracao')
    Left = 432
    Top = 216
    object fldNumeracaoProdid_produto: TIntegerField
      FieldName = 'id_produto'
      Origin = 'id_produto'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object fldNumeracaoProdid_numeracao: TIntegerField
      FieldName = 'id_numeracao'
      Origin = 'id_numeracao'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object bcdfldNumeracaoProdnumeracao: TBCDField
      DisplayLabel = 'Numera'#231#227'o'
      FieldKind = fkLookup
      FieldName = 'numeracao'
      LookupDataSet = fdqryNumeracao
      LookupKeyFields = 'id_numeracao'
      LookupResultField = 'numeracao'
      KeyFields = 'id_numeracao'
      Size = 2
      Lookup = True
    end
    object fldNumeracaoProdestoque: TIntegerField
      DisplayLabel = 'Estoque'
      FieldName = 'estoque'
      Origin = 'estoque'
    end
  end
  object fdqryNumeracao: TFDQuery
    Active = True
    AutoCalcFields = False
    Connection = DM_Gerenciador.fdConnection
    SQL.Strings = (
      'select * from numeracoes')
    Left = 440
    Top = 304
    object fldNumeracaoid_numeracao: TIntegerField
      FieldName = 'id_numeracao'
    end
    object bcdfldNumeracaonumeracao: TBCDField
      FieldName = 'numeracao'
      Origin = 'numeracao'
      Precision = 4
      Size = 1
    end
  end
end
