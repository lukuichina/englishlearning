inherited WordSearchDialogForm: TWordSearchDialogForm
  ClientHeight = 730
  ClientWidth = 1008
  WindowState = wsMaximized
  ExplicitWidth = 1024
  ExplicitHeight = 768
  PixelsPerInch = 96
  TextHeight = 13
  inherited grp1: TGroupBox
    Width = 1008
    ExplicitWidth = 1008
  end
  inherited grpWord: TGroupBox
    Width = 1008
    Height = 614
    ExplicitWidth = 1008
    ExplicitHeight = 614
    inherited dbdvgrd1: TDBAdvGrid
      Width = 792
      Height = 597
      ExplicitWidth = 792
      ExplicitHeight = 597
    end
    object grpSelectWords: TGroupBox
      Left = 794
      Top = 15
      Width = 212
      Height = 597
      Align = alRight
      TabOrder = 1
      object btnAdd: TButton
        Left = 6
        Top = 120
        Width = 27
        Height = 25
        Caption = '+'
        TabOrder = 0
        OnClick = btnAddClick
      end
      object btnDel: TButton
        Left = 6
        Top = 184
        Width = 27
        Height = 25
        Caption = '-'
        TabOrder = 1
        OnClick = btnDelClick
      end
      object lstSelectWords: TListBox
        Left = 39
        Top = 15
        Width = 171
        Height = 580
        Align = alRight
        ItemHeight = 13
        TabOrder = 2
      end
      object btnClear: TButton
        Left = 6
        Top = 248
        Width = 27
        Height = 25
        Caption = 'x'
        TabOrder = 3
        OnClick = btnClearClick
      end
    end
  end
  inherited stat1: TStatusBar
    Top = 711
    Width = 1008
    ExplicitTop = 711
    ExplicitWidth = 1008
  end
end
