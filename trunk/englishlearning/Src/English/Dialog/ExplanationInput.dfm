object ExplanationInputForm: TExplanationInputForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #35299#37322#24405#20837
  ClientHeight = 206
  ClientWidth = 603
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl2: TLabel
    Left = 291
    Top = 19
    Width = 36
    Height = 13
    Caption = #35299#37322#65306
  end
  object lblWord: TLabel
    Left = 24
    Top = 19
    Width = 36
    Height = 13
    Caption = #35789#24615#65306
  end
  object lblImportance: TLabel
    Left = 24
    Top = 48
    Width = 48
    Height = 13
    Caption = #37325#35201#24230#65306
  end
  object lblDifficulty: TLabel
    Left = 24
    Top = 80
    Width = 48
    Height = 13
    Caption = #38590#26131#24230#65306
  end
  object dblkcbbWordType: TDBLookupComboBox
    Left = 104
    Top = 16
    Width = 145
    Height = 21
    KeyField = 'ID'
    ListField = 'Disp'
    ListSource = dsWordType
    TabOrder = 0
  end
  object dblkcbbImportance: TDBLookupComboBox
    Left = 105
    Top = 48
    Width = 145
    Height = 21
    KeyField = 'ID'
    ListField = 'Disp'
    ListSource = dsImportance
    TabOrder = 1
  end
  object dblkcbbDifficulty: TDBLookupComboBox
    Left = 104
    Top = 75
    Width = 145
    Height = 21
    KeyField = 'ID'
    ListField = 'Disp'
    ListSource = dsDifficulty
    TabOrder = 2
  end
  object edt1: TEdit
    Left = 360
    Top = 16
    Width = 217
    Height = 21
    TabOrder = 3
  end
  object btnOK: TBitBtn
    Left = 216
    Top = 152
    Width = 75
    Height = 25
    DoubleBuffered = True
    Kind = bkOK
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 4
  end
  object btnCancel: TBitBtn
    Left = 328
    Top = 152
    Width = 75
    Height = 25
    DoubleBuffered = True
    Kind = bkCancel
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 5
  end
  object tblDifficulty: TADOTable
    Active = True
    Connection = dmManager.conEnglish
    CursorType = ctStatic
    TableName = 'Difficulty'
    Left = 352
    Top = 154
  end
  object dsDifficulty: TDataSource
    DataSet = tblDifficulty
    Left = 424
    Top = 154
  end
  object dsImportance: TDataSource
    DataSet = tblImportance
    Left = 424
    Top = 106
  end
  object tblImportance: TADOTable
    Active = True
    Connection = dmManager.conEnglish
    CursorType = ctStatic
    TableName = 'Importance'
    Left = 352
    Top = 106
  end
  object dsWordType: TDataSource
    DataSet = tblWordType
    Left = 424
    Top = 48
  end
  object tblWordType: TADOTable
    Active = True
    Connection = dmManager.conEnglish
    CursorType = ctStatic
    TableName = 'WordType'
    Left = 352
    Top = 48
  end
end
