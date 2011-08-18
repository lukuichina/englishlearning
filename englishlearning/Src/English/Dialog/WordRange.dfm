inherited WordRangeForm: TWordRangeForm
  Caption = #21333#35789#33539#22260
  ClientHeight = 245
  ClientWidth = 361
  OnShow = FormShow
  ExplicitWidth = 367
  ExplicitHeight = 273
  PixelsPerInch = 96
  TextHeight = 13
  object lblWord: TLabel
    Left = 32
    Top = 27
    Width = 60
    Height = 13
    Caption = #36215#22987#21333#35789#65306
  end
  object lblWordEnd: TLabel
    Left = 32
    Top = 75
    Width = 60
    Height = 13
    Caption = #32456#27490#21333#35789#65306
  end
  object edtWord: TEdit
    Left = 112
    Top = 24
    Width = 169
    Height = 21
    TabOrder = 0
    OnExit = edtWordExit
  end
  object btnWordSearch: TButton
    Left = 287
    Top = 22
    Width = 26
    Height = 25
    Caption = '...'
    TabOrder = 1
    OnClick = btnWordSearchClick
  end
  object edtWordEnd: TEdit
    Left = 112
    Top = 72
    Width = 169
    Height = 21
    TabOrder = 2
    OnExit = edtWordEndExit
  end
  object btnWordEndSearch: TButton
    Left = 287
    Top = 70
    Width = 26
    Height = 25
    Caption = '...'
    TabOrder = 3
    OnClick = btnWordEndSearchClick
  end
  object btnOK: TBitBtn
    Left = 152
    Top = 204
    Width = 75
    Height = 25
    DoubleBuffered = True
    Enabled = False
    Kind = bkOK
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 6
  end
  object btnCancel: TBitBtn
    Left = 246
    Top = 204
    Width = 75
    Height = 25
    DoubleBuffered = True
    Kind = bkCancel
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 7
  end
  object rgWordOption: TRadioGroup
    Left = 32
    Top = 112
    Width = 249
    Height = 73
    Caption = #21333#35789#36873#39033
    Columns = 2
    ItemIndex = 1
    Items.Strings = (
      #25152#26377
      #26377#35299#37322#26377#22270#29255
      #26377#35299#37322#26080#22270#29255
      #26080#35299#37322)
    TabOrder = 4
  end
  object btnReset: TBitBtn
    Left = 32
    Top = 204
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Reset'
    DoubleBuffered = True
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333FFFFF333333000033333388888833333333333F888888FFF333
      000033338811111188333333338833FFF388FF33000033381119999111833333
      38F338888F338FF30000339119933331111833338F388333383338F300003391
      13333381111833338F8F3333833F38F3000039118333381119118338F38F3338
      33F8F38F000039183333811193918338F8F333833F838F8F0000391833381119
      33918338F8F33833F8338F8F000039183381119333918338F8F3833F83338F8F
      000039183811193333918338F8F833F83333838F000039118111933339118338
      F3833F83333833830000339111193333391833338F33F8333FF838F300003391
      11833338111833338F338FFFF883F83300003339111888811183333338FF3888
      83FF83330000333399111111993333333388FFFFFF8833330000333333999999
      3333333333338888883333330000333333333333333333333333333333333333
      0000}
    ModalResult = 7
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 5
    OnClick = btnResetClick
  end
end
