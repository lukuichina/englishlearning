object ExplanationInputDialogForm: TExplanationInputDialogForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #35299#37322#24405#20837
  ClientHeight = 306
  ClientWidth = 474
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
    Left = 28
    Top = 219
    Width = 36
    Height = 13
    Caption = #35299#37322#65306
  end
  object edt1: TEdit
    Left = 70
    Top = 216
    Width = 381
    Height = 25
    TabOrder = 3
  end
  object btnOK: TBitBtn
    Left = 120
    Top = 261
    Width = 75
    Height = 25
    DoubleBuffered = True
    Kind = bkOK
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 4
  end
  object btnCancel: TBitBtn
    Left = 272
    Top = 261
    Width = 75
    Height = 25
    DoubleBuffered = True
    Kind = bkCancel
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 5
  end
  object dbrgrpImportance: TDBRadioGroup
    Left = 26
    Top = 100
    Width = 425
    Height = 41
    Caption = #37325#35201#24615
    Columns = 5
    DataField = 'Disp'
    DataSource = dsImportance
    ParentBackground = True
    TabOrder = 1
    OnChange = dbrgrpImportanceChange
  end
  object dbrgrpDifficulty: TDBRadioGroup
    Left = 26
    Top = 155
    Width = 425
    Height = 41
    Caption = #38590#26131#24230
    Columns = 5
    DataField = 'Disp'
    DataSource = dsDifficulty
    ParentBackground = True
    TabOrder = 2
    OnChange = dbrgrpDifficultyChange
  end
  object dbrgrpWordType: TDBRadioGroup
    Left = 26
    Top = 8
    Width = 425
    Height = 78
    Caption = #35789#24615
    Columns = 4
    DataField = 'Disp'
    DataSource = dsWordType
    ParentBackground = True
    TabOrder = 0
  end
  object tblDifficulty: TADOTable
    Active = True
    Connection = dmManager.conEnglish
    CursorType = ctStatic
    TableName = 'Difficulty'
    Left = 344
    Top = 146
    object intfldDifficultyID: TIntegerField
      FieldName = 'ID'
    end
    object strfldDifficultyName: TStringField
      FieldName = 'Name'
    end
    object strfldDifficultyDisp: TStringField
      FieldName = 'Disp'
    end
  end
  object dsDifficulty: TDataSource
    DataSet = tblDifficulty
    Left = 416
    Top = 146
  end
  object dsImportance: TDataSource
    DataSet = tblImportance
    Left = 416
    Top = 98
  end
  object tblImportance: TADOTable
    Active = True
    Connection = dmManager.conEnglish
    CursorType = ctStatic
    TableName = 'Importance'
    Left = 344
    Top = 98
    object intfldImportanceID: TIntegerField
      FieldName = 'ID'
    end
    object strfldImportanceName: TStringField
      FieldName = 'Name'
    end
    object strfldImportanceDisp: TStringField
      FieldName = 'Disp'
    end
  end
  object dsWordType: TDataSource
    DataSet = tblWordType
    Left = 416
    Top = 40
  end
  object tblWordType: TADOTable
    Active = True
    Connection = dmManager.conEnglish
    CursorType = ctStatic
    TableName = 'WordType'
    Left = 344
    Top = 40
  end
end
