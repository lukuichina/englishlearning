object dmManager: TdmManager
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 359
  Width = 589
  object conEnglish: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 248
    Top = 80
  end
  object TAdvAppStyler1: TAdvAppStyler
    Style = tsOffice2010Blue
    Left = 240
    Top = 184
  end
end
