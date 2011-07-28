inherited TypeWordExtentionDialogForm: TTypeWordExtentionDialogForm
  Caption = #35789#24615#25193#23637
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 488
  ExplicitHeight = 281
  PixelsPerInch = 96
  TextHeight = 13
  object lblExtendWord: TLabel
    Left = 24
    Top = 104
    Width = 60
    Height = 13
    Caption = #25193#23637#21333#35789#65306
  end
  object dbrgrpBaseType: TDBRadioGroup
    Left = 24
    Top = 8
    Width = 425
    Height = 78
    Caption = #22522#26412#35789#24615
    Columns = 4
    DataField = 'Disp'
    DataSource = dsBaseType
    ParentBackground = True
    TabOrder = 0
  end
  object dbrgrpExtendType: TDBRadioGroup
    Left = 24
    Top = 130
    Width = 425
    Height = 78
    Caption = #25193#23637#35789#24615
    Columns = 4
    DataField = 'Disp'
    DataSource = dsExtendType
    ParentBackground = True
    TabOrder = 3
  end
  object btnCancel: TBitBtn
    Left = 280
    Top = 220
    Width = 75
    Height = 25
    DoubleBuffered = True
    Kind = bkCancel
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 5
  end
  object btnOK: TBitBtn
    Left = 128
    Top = 220
    Width = 75
    Height = 25
    DoubleBuffered = True
    Kind = bkOK
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 4
  end
  object btnExtendWordSearch: TButton
    Left = 255
    Top = 99
    Width = 26
    Height = 25
    Caption = '...'
    TabOrder = 2
    OnClick = btnExtendWordSearchClick
  end
  object edtExtendWord: TEdit
    Left = 104
    Top = 103
    Width = 145
    Height = 21
    TabOrder = 1
  end
  object dsBaseType: TDataSource
    DataSet = tblBaseType
    Left = 416
    Top = 40
  end
  object tblBaseType: TADOTable
    Active = True
    Connection = dmManager.conEnglish
    CursorType = ctStatic
    TableName = 'WordType'
    Left = 344
    Top = 40
  end
  object dsExtendType: TDataSource
    DataSet = tblExtendType
    Left = 408
    Top = 128
  end
  object tblExtendType: TADOTable
    Active = True
    Connection = dmManager.conEnglish
    CursorType = ctStatic
    TableName = 'WordType'
    Left = 336
    Top = 128
  end
end
