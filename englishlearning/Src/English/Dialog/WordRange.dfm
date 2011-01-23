inherited WordRangeForm: TWordRangeForm
  Caption = #21333#35789#33539#22260
  ClientHeight = 197
  ClientWidth = 294
  ExplicitWidth = 300
  ExplicitHeight = 225
  PixelsPerInch = 96
  TextHeight = 13
  object lblWord: TLabel
    Left = 16
    Top = 27
    Width = 60
    Height = 13
    Caption = #36215#22987#21333#35789#65306
  end
  object lblWordEnd: TLabel
    Left = 16
    Top = 83
    Width = 60
    Height = 13
    Caption = #32456#27490#21333#35789#65306
  end
  object edtWord: TEdit
    Left = 96
    Top = 24
    Width = 145
    Height = 21
    TabOrder = 0
    OnExit = edtWordExit
  end
  object btnWordSearch: TButton
    Left = 247
    Top = 22
    Width = 26
    Height = 25
    Caption = '...'
    TabOrder = 1
    OnClick = btnWordSearchClick
  end
  object edtWordEnd: TEdit
    Left = 96
    Top = 80
    Width = 145
    Height = 21
    TabOrder = 2
    OnExit = edtWordEndExit
  end
  object btnWordEndSearch: TButton
    Left = 247
    Top = 78
    Width = 26
    Height = 25
    Caption = '...'
    TabOrder = 3
    OnClick = btnWordEndSearchClick
  end
  object btnOK: TBitBtn
    Left = 112
    Top = 156
    Width = 75
    Height = 25
    DoubleBuffered = True
    Enabled = False
    Kind = bkOK
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 4
  end
  object btnCancel: TBitBtn
    Left = 206
    Top = 156
    Width = 75
    Height = 25
    DoubleBuffered = True
    Kind = bkCancel
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 5
  end
end
