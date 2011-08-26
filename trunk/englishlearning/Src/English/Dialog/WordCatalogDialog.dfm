inherited WordCatalogDialogFrom: TWordCatalogDialogFrom
  Caption = #21333#35789#20998#31867#65288#32534#36753#65289
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblWord: TLabel
    Left = 80
    Top = 27
    Width = 60
    Height = 13
    Caption = #20998#31867#21517#31216#65306
  end
  object lbl2: TLabel
    Left = 80
    Top = 67
    Width = 60
    Height = 13
    Caption = #20998#31867#25551#36848#65306
  end
  object Label1: TLabel
    Left = 80
    Top = 107
    Width = 60
    Height = 13
    Caption = #21019#24314#26102#38388#65306
  end
  object Label2: TLabel
    Left = 80
    Top = 147
    Width = 60
    Height = 13
    Caption = #26356#26032#26102#38388#65306
  end
  object lblUpdateTime: TDateLabel
    Left = 160
    Top = 147
    Width = 103
    Height = 13
    Caption = '2011/08/26 21:38:21'
    DateTimeFormat = 'yyyy/MM/dd hh:mm:ss'
    Version = '1.1.0.0'
    RefreshInterval = 0
    RefreshEnabled = False
  end
  object lblCreateTime: TDateLabel
    Left = 160
    Top = 107
    Width = 103
    Height = 13
    Caption = '2011/08/26 21:38:21'
    DateTimeFormat = 'yyyy/MM/dd hh:mm:ss'
    Version = '1.1.0.0'
    RefreshInterval = 0
    RefreshEnabled = False
  end
  object btnCancel: TBitBtn
    Left = 271
    Top = 208
    Width = 75
    Height = 25
    DoubleBuffered = True
    Kind = bkCancel
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 3
  end
  object btnOK: TBitBtn
    Left = 160
    Top = 208
    Width = 75
    Height = 25
    DoubleBuffered = True
    Kind = bkOK
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 2
  end
  object edtCatalogName: TEdit
    Left = 160
    Top = 24
    Width = 186
    Height = 21
    TabOrder = 0
  end
  object edtCatalogDisp: TEdit
    Left = 160
    Top = 64
    Width = 186
    Height = 21
    TabOrder = 1
  end
end
