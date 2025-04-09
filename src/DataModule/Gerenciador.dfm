object DM_Gerenciador: TDM_Gerenciador
  OnCreate = DataModuleCreate
  Height = 480
  Width = 640
  object fdConnection: TFDConnection
    Params.Strings = (
      'Database=base_zovni'
      'User_Name=postgres'
      'Password=postzeus2011'
      'Port=5433'
      'DriverID=PG')
    TxOptions.AutoStop = False
    ConnectedStoredUsage = [auDesignTime]
    Connected = True
    Left = 408
    Top = 232
  end
  object pgDriver: TFDPhysPgDriverLink
    VendorLib = 'C:\Users\ally\Downloads\libpq.dll'
    Left = 312
    Top = 224
  end
end
