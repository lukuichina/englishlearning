object dmManager: TdmManager
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 359
  Width = 589
  object conEnglish: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=Password123;Persist Security Info=T' +
      'rue;User ID=sa;Initial Catalog=English;Data Source=ADMIN-PC'
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
