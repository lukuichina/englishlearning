inherited SynonymWordExtentionDialogForm: TSynonymWordExtentionDialogForm
  Caption = #21516#20041#25193#23637
  ClientHeight = 356
  ClientWidth = 506
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 512
  ExplicitHeight = 384
  PixelsPerInch = 96
  TextHeight = 13
  object lblExtendWord: TLabel
    Left = 24
    Top = 144
    Width = 60
    Height = 13
    Caption = #25193#23637#21333#35789#65306
  end
  object lblBaseExplanation: TLabel
    Left = 24
    Top = 104
    Width = 48
    Height = 13
    Caption = #22522#26412#35299#37322
  end
  object Label1: TLabel
    Left = 24
    Top = 264
    Width = 48
    Height = 13
    Caption = #25193#23637#35299#37322
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
    OnClick = dbrgrpBaseTypeClick
  end
  object dbrgrpExtendType: TDBRadioGroup
    Left = 24
    Top = 170
    Width = 425
    Height = 78
    Caption = #25193#23637#35789#24615
    Columns = 4
    DataField = 'Disp'
    DataSource = dsExtendType
    ParentBackground = True
    TabOrder = 4
    OnClick = dbrgrpExtendTypeClick
  end
  object btnCancel: TBitBtn
    Left = 288
    Top = 308
    Width = 75
    Height = 25
    DoubleBuffered = True
    Kind = bkCancel
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 8
  end
  object btnOK: TBitBtn
    Left = 136
    Top = 308
    Width = 75
    Height = 25
    DoubleBuffered = True
    Kind = bkOK
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 7
  end
  object btnExtendWordSearch: TButton
    Left = 255
    Top = 139
    Width = 26
    Height = 25
    Caption = '...'
    TabOrder = 3
    OnClick = btnExtendWordSearchClick
  end
  object edtExtendWord: TEdit
    Left = 104
    Top = 143
    Width = 145
    Height = 21
    TabOrder = 2
    OnExit = dbrgrpExtendTypeClick
  end
  object dblkcbblBaseExplanation: TDBLookupComboBox
    Left = 104
    Top = 104
    Width = 225
    Height = 21
    KeyField = 'ExplanationID'
    ListField = 'Explanation'
    ListSource = dsBaseExplanation
    TabOrder = 1
  end
  object dblkcbblExtendExplanation: TDBLookupComboBox
    Left = 104
    Top = 264
    Width = 225
    Height = 21
    KeyField = 'ExplanationID'
    ListField = 'Explanation'
    ListSource = dsExtendExplanation
    TabOrder = 5
  end
  object btnReset: TButton
    Left = 376
    Top = 264
    Width = 75
    Height = 25
    Caption = #37325#32622
    TabOrder = 6
    OnClick = btnResetClick
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
    Top = 168
  end
  object tblExtendType: TADOTable
    Active = True
    Connection = dmManager.conEnglish
    CursorType = ctStatic
    TableName = 'WordType'
    Left = 336
    Top = 168
  end
  object dsBaseExplanation: TDataSource
    Left = 416
    Top = 88
  end
  object dsExtendExplanation: TDataSource
    Left = 416
    Top = 256
  end
end
