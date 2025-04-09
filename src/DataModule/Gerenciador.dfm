object DM_Gerenciador: TDM_Gerenciador
  OnCreate = DataModuleCreate
  Height = 480
  Width = 640
  object fdConnection: TFDConnection
    Params.Strings = (
      'DriverID=PG')
    TxOptions.AutoStop = False
    ConnectedStoredUsage = [auDesignTime]
    Left = 408
    Top = 232
  end
  object pgDriver: TFDPhysPgDriverLink
    Left = 312
    Top = 224
  end
end
