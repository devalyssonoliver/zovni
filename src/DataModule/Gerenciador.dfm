object DM_Gerenciador: TDM_Gerenciador
  OnCreate = DataModuleCreate
  Height = 480
  Width = 640
  object fdConnection: TFDConnection
    Params.Strings = (
      'Database=base_zovni'
      'User_Name=postgres'
      'Password=postzeus2011'
      'DriverID=PG')
    TxOptions.AutoStop = False
    Connected = True
    Left = 408
    Top = 232
  end
  object pgDriver: TFDPhysPgDriverLink
    Left = 304
    Top = 224
  end
end
