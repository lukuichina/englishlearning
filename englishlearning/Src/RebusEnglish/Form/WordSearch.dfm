object WordSearchForm: TWordSearchForm
  Left = 0
  Top = 0
  Caption = #21333#35789#26816#32034
  ClientHeight = 730
  ClientWidth = 1008
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object grp1: TGroupBox
    Left = 0
    Top = 0
    Width = 1008
    Height = 97
    Align = alTop
    Color = 16773863
    ParentBackground = False
    ParentColor = False
    TabOrder = 0
    object lblWord: TLabel
      Left = 16
      Top = 20
      Width = 36
      Height = 13
      Caption = #21333#35789#65306
    end
    object lblImportance: TLabel
      Left = 272
      Top = 20
      Width = 48
      Height = 13
      Caption = #37325#35201#24230#65306
    end
    object lblDifficulty: TLabel
      Left = 528
      Top = 20
      Width = 48
      Height = 13
      Caption = #38590#26131#24230#65306
    end
    object btnSearch: TButton
      Left = 794
      Top = 15
      Width = 75
      Height = 25
      Caption = #26816#32034
      TabOrder = 6
      OnClick = btnSearchClick
    end
    object edtWord: TEdit
      Left = 96
      Top = 17
      Width = 145
      Height = 21
      TabOrder = 0
      OnExit = edtWordExit
      OnKeyDown = edtWordKeyDown
    end
    object dblkcbbImportance: TDBLookupComboBox
      Left = 352
      Top = 17
      Width = 145
      Height = 21
      KeyField = 'ID'
      ListField = 'Disp'
      ListSource = dsImportance
      TabOrder = 1
    end
    object dblkcbbDifficulty: TDBLookupComboBox
      Left = 608
      Top = 17
      Width = 145
      Height = 21
      KeyField = 'ID'
      ListField = 'Disp'
      ListSource = dsDifficulty
      TabOrder = 2
    end
    object btnOK: TBitBtn
      Left = 898
      Top = 15
      Width = 75
      Height = 25
      Caption = 'OK'
      DoubleBuffered = True
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      ModalResult = 1
      NumGlyphs = 2
      ParentDoubleBuffered = False
      TabOrder = 7
    end
    object rgCatalogOption: TRadioGroup
      Left = 8
      Top = 44
      Width = 233
      Height = 38
      Caption = #20998#31867
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        #24573#30053
        #20998#31867#26377
        #20998#31867#26080)
      TabOrder = 3
    end
    object rgExplanationOption: TRadioGroup
      Left = 264
      Top = 44
      Width = 233
      Height = 38
      Caption = #35299#37322
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        #24573#30053
        #35299#37322#26377
        #35299#37322#26080)
      TabOrder = 4
    end
    object rgPictureOption: TRadioGroup
      Left = 520
      Top = 44
      Width = 232
      Height = 38
      Caption = #22270#29255
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        #24573#30053
        #22270#29255#26377
        #22270#29255#26080)
      TabOrder = 5
    end
    object rgLibraryOption: TRadioGroup
      Left = 770
      Top = 44
      Width = 232
      Height = 38
      Caption = #32032#26448
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        #24573#30053
        #32032#26448#26377
        #32032#26448#26080)
      TabOrder = 8
    end
  end
  object grpWord: TGroupBox
    Left = 0
    Top = 97
    Width = 1008
    Height = 614
    Align = alClient
    Caption = #26816#32034#32467#26524
    Color = 16773863
    ParentBackground = False
    ParentColor = False
    TabOrder = 1
    object dbdvgrd1: TDBAdvGrid
      Left = 2
      Top = 15
      Width = 1004
      Height = 597
      Cursor = crDefault
      Align = alClient
      ColCount = 14
      Ctl3D = True
      DrawingStyle = gdsClassic
      RowCount = 101
      FixedRows = 1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
      ParentCtl3D = False
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 0
      OnDblClick = dbdvgrd1DblClick
      OnScrollCell = dbdvgrd1ScrollCell
      ActiveCellFont.Charset = DEFAULT_CHARSET
      ActiveCellFont.Color = clWindowText
      ActiveCellFont.Height = -11
      ActiveCellFont.Name = 'Tahoma'
      ActiveCellFont.Style = [fsBold]
      ControlLook.FixedGradientHoverFrom = clGray
      ControlLook.FixedGradientHoverTo = clWhite
      ControlLook.FixedGradientDownFrom = clGray
      ControlLook.FixedGradientDownTo = clSilver
      ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
      ControlLook.DropDownHeader.Font.Color = clWindowText
      ControlLook.DropDownHeader.Font.Height = -11
      ControlLook.DropDownHeader.Font.Name = 'Tahoma'
      ControlLook.DropDownHeader.Font.Style = []
      ControlLook.DropDownHeader.Visible = True
      ControlLook.DropDownHeader.Buttons = <>
      ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
      ControlLook.DropDownFooter.Font.Color = clWindowText
      ControlLook.DropDownFooter.Font.Height = -11
      ControlLook.DropDownFooter.Font.Name = 'Tahoma'
      ControlLook.DropDownFooter.Font.Style = []
      ControlLook.DropDownFooter.Visible = True
      ControlLook.DropDownFooter.Buttons = <>
      Filter = <>
      FilterDropDown.Font.Charset = DEFAULT_CHARSET
      FilterDropDown.Font.Color = clWindowText
      FilterDropDown.Font.Height = -11
      FilterDropDown.Font.Name = 'Tahoma'
      FilterDropDown.Font.Style = []
      FilterDropDownClear = '(All)'
      FixedColWidth = 20
      FixedRowHeight = 22
      FixedFont.Charset = DEFAULT_CHARSET
      FixedFont.Color = clWindowText
      FixedFont.Height = -11
      FixedFont.Name = 'Tahoma'
      FixedFont.Style = [fsBold]
      FloatFormat = '%.2f'
      PrintSettings.DateFormat = 'dd/mm/yyyy'
      PrintSettings.Font.Charset = DEFAULT_CHARSET
      PrintSettings.Font.Color = clWindowText
      PrintSettings.Font.Height = -11
      PrintSettings.Font.Name = 'Tahoma'
      PrintSettings.Font.Style = []
      PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
      PrintSettings.FixedFont.Color = clWindowText
      PrintSettings.FixedFont.Height = -11
      PrintSettings.FixedFont.Name = 'Tahoma'
      PrintSettings.FixedFont.Style = []
      PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
      PrintSettings.HeaderFont.Color = clWindowText
      PrintSettings.HeaderFont.Height = -11
      PrintSettings.HeaderFont.Name = 'Tahoma'
      PrintSettings.HeaderFont.Style = []
      PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
      PrintSettings.FooterFont.Color = clWindowText
      PrintSettings.FooterFont.Height = -11
      PrintSettings.FooterFont.Name = 'Tahoma'
      PrintSettings.FooterFont.Style = []
      PrintSettings.PageNumSep = '/'
      SearchFooter.FindNextCaption = 'Find &next'
      SearchFooter.FindPrevCaption = 'Find &previous'
      SearchFooter.Font.Charset = DEFAULT_CHARSET
      SearchFooter.Font.Color = clWindowText
      SearchFooter.Font.Height = -11
      SearchFooter.Font.Name = 'Tahoma'
      SearchFooter.Font.Style = []
      SearchFooter.HighLightCaption = 'Highlight'
      SearchFooter.HintClose = 'Close'
      SearchFooter.HintFindNext = 'Find next occurence'
      SearchFooter.HintFindPrev = 'Find previous occurence'
      SearchFooter.HintHighlight = 'Highlight occurences'
      SearchFooter.MatchCaseCaption = 'Match case'
      Version = '2.3.0.7'
      AutoCreateColumns = True
      AutoRemoveColumns = False
      Columns = <
        item
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -11
          HeaderFont.Name = 'Tahoma'
          HeaderFont.Style = []
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -11
          PrintFont.Name = 'Tahoma'
          PrintFont.Style = []
          Width = 20
        end
        item
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'RowId'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Header = #34892#25968
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -11
          HeaderFont.Name = 'Tahoma'
          HeaderFont.Style = []
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -11
          PrintFont.Name = 'Tahoma'
          PrintFont.Style = []
          Width = 64
        end
        item
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          EditLength = 20
          FieldName = 'Word'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Header = #21333#35789
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -11
          HeaderFont.Name = 'Tahoma'
          HeaderFont.Style = []
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -11
          PrintFont.Name = 'Tahoma'
          PrintFont.Style = []
          Width = 200
        end
        item
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'ImportanceLevel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Header = #37325#35201#24230
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -11
          HeaderFont.Name = 'Tahoma'
          HeaderFont.Style = []
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -11
          PrintFont.Name = 'Tahoma'
          PrintFont.Style = []
          Width = 64
        end
        item
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'DifficultyLevel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Header = #38590#26131#24230
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -11
          HeaderFont.Name = 'Tahoma'
          HeaderFont.Style = []
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -11
          PrintFont.Name = 'Tahoma'
          PrintFont.Style = []
          Width = 64
        end
        item
          Alignment = taCenter
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'IsCataloged'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Header = #20998#31867
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -11
          HeaderFont.Name = 'Tahoma'
          HeaderFont.Style = []
          HeaderAlignment = taCenter
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -11
          PrintFont.Name = 'Tahoma'
          PrintFont.Style = []
          Width = 48
        end
        item
          Alignment = taCenter
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'IsExplained'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Header = #35299#37322
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -11
          HeaderFont.Name = 'Tahoma'
          HeaderFont.Style = []
          HeaderAlignment = taCenter
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -11
          PrintFont.Name = 'Tahoma'
          PrintFont.Style = []
          Width = 48
        end
        item
          Alignment = taCenter
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'IsPictured'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Header = #22270#29255
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -11
          HeaderFont.Name = 'Tahoma'
          HeaderFont.Style = []
          HeaderAlignment = taCenter
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -11
          PrintFont.Name = 'Tahoma'
          PrintFont.Style = []
          Width = 48
        end
        item
          Alignment = taCenter
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'IsPictureLibraryed'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Header = #32032#26448
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -11
          HeaderFont.Name = 'Tahoma'
          HeaderFont.Style = []
          HeaderAlignment = taCenter
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -11
          PrintFont.Name = 'Tahoma'
          PrintFont.Style = []
          Width = 48
        end
        item
          Alignment = taRightJustify
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'WordTypeCount'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Header = #35789#24615#25968
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -11
          HeaderFont.Name = 'Tahoma'
          HeaderFont.Style = []
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -11
          PrintFont.Name = 'Tahoma'
          PrintFont.Style = []
          Width = 48
        end
        item
          Alignment = taRightJustify
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'ExplanationCount'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Header = #35299#37322#25968
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -11
          HeaderFont.Name = 'Tahoma'
          HeaderFont.Style = []
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -11
          PrintFont.Name = 'Tahoma'
          PrintFont.Style = []
          Width = 48
        end
        item
          Alignment = taRightJustify
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'PictureCount'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Header = #22270#29255#25968
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -11
          HeaderFont.Name = 'Tahoma'
          HeaderFont.Style = []
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -11
          PrintFont.Name = 'Tahoma'
          PrintFont.Style = []
          Width = 48
        end
        item
          Alignment = taRightJustify
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'MainPictureCount'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Header = #20027#22270#29255#25968
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -11
          HeaderFont.Name = 'Tahoma'
          HeaderFont.Style = []
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -11
          PrintFont.Name = 'Tahoma'
          PrintFont.Style = []
          Width = 64
        end
        item
          Alignment = taRightJustify
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'PictureLibraryCount'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Header = #32032#26448#25968
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -11
          HeaderFont.Name = 'Tahoma'
          HeaderFont.Style = []
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -11
          PrintFont.Name = 'Tahoma'
          PrintFont.Style = []
          Width = 48
        end>
      DataSource = dsWord
      InvalidPicture.Data = {
        055449636F6E0000010001002020200000000000A81000001600000028000000
        2000000040000000010020000000000000100000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000006A6A6B256A6A6B606A6A6B946A6A6BC06A6A6BE1
        6A6A6BF86A6A6BF86A6A6BE16A6A6BC06A6A6B946A6A6B606A6A6B2500000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000006A6A6B407575769E787879F19F9F9FF6C0C0C0FDDADADAFFEDEDEEFF
        FBFBFBFFFBFBFBFFEDEDEEFFDADADAFFC0C0C0FD9F9F9FF6787879F17575769E
        6A6A6B4000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000000000006A6A6B22
        7C7C7C98888889F0BDBDBDFCE9E9EBFED9D9E9FEB5B5DDFE8B8BCDFE595AB7FF
        3739A8FF2B2CA4FF4A49B1FF7171C1FFA1A2D7FFD3D3E8FFEAEAEBFEBEBEBFFC
        888889F07C7C7C986A6A6B220000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000006A6A6B43838383D8
        B7B7B8FAECECEFFEC0C0DFFF7977C4FF2221A0FF12129BFF1010A4FF0C0CA8FF
        0A0AACFF0A0AB4FF0A0AB9FF0D0DBEFF0F0FB1FF1111A6FF5656B8FFAEADDCFF
        ECECEFFEB7B7B8FA838383D86A6A6B4300000000000000000000000000000000
        00000000000000000000000000000000000000006A6A6B4E878788EAD3D3D3FE
        CACAE8FF4443B0FF171799FF11119CFF0C0C98FF0B0B9BFF0B0BA0FF0A0AA6FF
        0909ACFF0909B2FF0808BAFF0707BFFF0B09C8FF0D0DCEFF1111CCFF1010AFFF
        4A49B2FFCFCFEBFFD3D3D3FE878788EA6A6A6B4E000000000000000000000000
        000000000000000000000000000000006A6A6B43878788EAE1E1E1FFA8A8DAFF
        2323A0FF15159CFF0D0D92FF0C0C95FF0C0C99FF0B0B9EFF0B0BA0FF0A0AA6FF
        0909ACFF0909B2FF0808B8FF0808BCFF0808C3FF0C0CC9FF0C0CD0FF0D0DD6FF
        1313CFFF2222A9FFAFAFDEFFE1E1E1FF878788EA6A6A6B430000000000000000
        0000000000000000000000006A6A6B22838383D8D3D3D3FEA8A8D9FF2020A4FF
        13139BFF0C0C92FF0C0C95FF0C0C97FF0C0C99FF0B0B9EFF0B0BA0FF0A0AA4FF
        0A0AA9FF0909B0FF0808B4FF0808BBFF0707C0FF0A0AC6FF0909CCFF0C0CD3FF
        0D0DD8FF1313D3FF1A1AA8FFAEADDEFFD4D4D4FE838383D86A6A6B2200000000
        0000000000000000000000007C7C7C98B7B7B8FACACAE8FF2524A3FF13139FFF
        0C0C97FF0C0C95FF0C0C95FF0C0C91FF0C0C95FF0B0B9EFF0B0BA0FF0A0AA4FF
        0A0AA8FF0909ADFF0909B2FF0808B8FF0808BCFF0707C0FF0808BCFF0707C5FF
        0C0CD3FF0D0DD7FF1212D1FF2020A7FFCDCDEBFFB8B8B9FA7C7C7C9800000000
        00000000000000006A6A6B40888889F0ECECEFFE4545B1FF1616A4FF0B0B9BFF
        0C0C99FF0C0C96FF3333A2FFB9B9D0FF393A9BFF0C0C95FF0B0BA1FF0A0AA4FF
        0A0AA7FF0A0AABFF0909B0FF0808B4FF0808B7FF2F2FC2FFAEAEE2FF4B4BBFFF
        0707BEFF0B0BD1FF0C0CD3FF1413CCFF4848B1FFECECEFFE888889F06A6A6B40
        00000000000000007575769EBFBFBFFD9B9BD5FF1C1CA6FF0C0CA1FF0B0B9FFF
        0B0B9AFF3535A7FFB5B5BEFFE6E6DFFFEDEDEFFF3C3C9CFF0C0C97FF0A0AA4FF
        0A0AA6FF0A0AA9FF0909ADFF0909B0FF2626B5FFCECEDEFFFFFFFBFFEEEEF1FF
        4848BAFF0808BCFF0A0ACDFF0B0BCEFF1111ABFFBEC0E0FFBFC0BFFD7575769E
        000000006A6A6B25787879F1E3E3E5FE4646B2FF1414A8FF0A0AA4FF0B0BA0FF
        2121A9FFBDBDCAFFD0D0C8FFC5C5C5FFE3E3E1FFEDEDEFFF3E3E9EFF0C0C98FF
        0A0AA6FF0A0AA8FF0A0AA9FF2B2BB0FFC0C0CDFFEAEAE2FFEBEBEBFFFEFEF8FF
        EDEDEEFF2828BDFF0707C4FF0809C7FF0F0FC4FF8788CBFFEBEBECFE79797AF1
        6A6A6B256A6A6B609D9E9DF6D6D7E4FF3A3AB3FF1212ADFF0A0AA8FF0A0AA4FF
        1313AAFFABABCFFFD6D6CBFFCACACAFFC6C6C6FFE4E4E0FFEEEEEFFF3F3FA0FF
        0C0C99FF0A0AA6FF2828ABFFB2B2BFFFD8D8CEFFD6D6D8FFE0E0E0FFF6F5EDFF
        D1D1EDFF1E1CC0FF0707BEFF0707BFFF0707C0FF2120AAFFD3D5E9FE9FA0A0F6
        6A6A6B606A6A6B94BDBDBDFBBABBDCFF3A39B7FF2F2FB8FF0909ADFF0A0AA9FF
        0A0AA6FF1515ACFFADADCFFFD6D6CBFFCBCBCAFFC6C6C6FFE4E4E1FFEEEEEFFF
        3838A1FF2222A2FFACABB8FFC8C8C0FFC7C7C8FFCDCDCDFFE1E1D9FFC8CAE1FF
        2424BCFF0808B4FF0808B9FF0808BAFF0808BBFF0F0EABFFA1A2D5FEC0C0C0FC
        6A6A6B946A6A6BC0D9D8D7FE9999D1FF3838BBFF3636BCFF2C2CB7FF0909ADFF
        0A0AA9FF0A0AA4FF1C1CAFFFB1B1CFFFD6D6CBFFCCCCCBFFC7C7C7FFE4E4E1FF
        ECECEEFFACACB7FFC2C2BCFFBEBEBFFFC0C0C0FFCFCFC6FFC1C1D5FF2727B8FF
        0909ACFF0909B2FF0909B2FF0909B4FF0808B4FF0E0EB5FF6E6EBFFFD9D9D9FE
        6A6A6BC06A6A6BE1EBEAEBFF7D7CC7FF3838BFFF3434BEFF3536BEFF2A2AB8FF
        0909B0FF0909ACFF0A0AA8FF1C1CB1FFB2B2D0FFD7D7CCFFCBCBCBFFC7C7C8FF
        C8C8C3FFC6C6C3FFBFBFC1FFBDBDBDFFC5C5BCFFB8B8CEFF2929B5FF0A0AA8FF
        0909ACFF0909ADFF0909AFFF0909AFFF0909AFFF0C0CB0FF4747AFFFECECEDFF
        6A6A6BE16A6A6BF8F9F9F9FF6666C1FF3838C4FF3535C2FF3434C0FF3535BEFF
        3030BCFF1313B4FF0909ADFF0A0AA8FF1E1EB3FFAAAAD0FFD3D3CDFFCCCCCCFF
        C8C8C8FFC3C3C3FFC2C2C1FFC4C4BFFFB2B2CBFF2B2BB4FF0A0AA4FF0A0AA8FF
        0A0AA8FF0A0AA9FF0A0AA9FF0A0AA9FF0A0AA9FF0B0BA9FF3131A6FFFAFAFAFF
        6A6A6BF86A6A6BF8FBFBFBFF5959BEFF3B3BCAFF3A3AC8FF3737C4FF3535C2FF
        3636C0FF3636BEFF2323B8FF0909B1FF0A0AA7FF4949BEFFD6D6D4FFD3D3D1FF
        CDCDCDFFC8C8C8FFC4C4C3FFEDEDEDFF5F5FB3FF0C0C98FF0A0AA7FF0A0AA6FF
        0A0AA6FF0A0AA6FF0A0AA4FF0A0AA6FF0A0AA4FF0B0BA4FF2D2DA6FFFBFBFBFF
        6A6A6BF86A6A6BE1EDEDEEFF7F80CBFF4041CCFF3C3CCAFF3A3AC8FF383AC8FF
        3838C4FF3636C2FF3939C0FF2123B7FF4A4AC2FFCBCBDEFFE0E0DCFFD6D6D6FF
        D2D2D3FFCDCDCEFFC9C9C9FFE2E2E1FFF1F1F2FF4242A3FF0C0C99FF0A0AA4FF
        0A0AA4FF0A0AA4FF0B0BA3FF0B0BA3FF0B0BA1FF0E0EA1FF4443B0FFEDEDEEFF
        6A6A6BE16A6A6BC0DADADAFF9C9BD5FE4949CDFF3E3DD0FF3C3DCEFF3C3CCAFF
        3A3AC8FF3B39C7FF2828BDFF5C5CCCFFE5E5EDFFF4F4EDFFE5E5E6FFDEDEDEFF
        DCDCD9FFD9D9D3FFCDCDCDFFC8C8C8FFE5E5E1FFF1F1F3FF3F3FA0FF0C0C99FF
        0A0AA4FF0B0BA1FF0B0BA0FF0B0BA0FF0B0B9FFF1313A2FF6B6BC0FFDADADAFF
        6A6A6BC06A6A6B94C0C0C0FDBDBAE1FE5655CFFF4141D4FF3F3FD2FF3F3FCEFF
        3D3DCCFF2C2AC3FF5E5ED3FFEBEBF6FFFFFFFAFFF1F1F1FFEDEDEEFFF0F0E9FF
        D2D2E6FFBDBDD6FFDADAD3FFCFCFCFFFC9C9CAFFE5E5E2FFF1F1F3FF3A3AA0FF
        0C0C98FF0B0BA3FF0B0B9FFF0B0B9EFF0B0B9EFF1C1CA4FF9C9CD3FFC1C1C1FD
        6A6A6B946A6A6B609F9F9FF6DAD9EAFF6B6BCFFF4444D7FF4143D6FF4242D3FF
        3434CDFF6464DBFFEFEFFFFFFFFFFFFFFCFCFCFFF6F6F6FFFCFCF4FFE2E1F0FF
        5050CCFF4040C1FFC3C3DBFFE1E1D8FFD4D4D5FFCFCFCFFFE8E8E5FFF2F2F4FF
        4040A2FF0C0C99FF0F0FA2FF0F0FA0FF0F0F9DFF302FA9FFD1D1E8FEA0A0A0F6
        6A6A6B606A6A6B25787879F1E9E9EBFEA7A7DAFF6060DBFF4547DBFF3C3CD6FF
        5857DEFFF2F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8E8F8FF5B5BD4FF
        2828BDFF2A2BBDFF4949C5FFC3C3DBFFE4E4DAFFD5D5D5FFCECED0FFE8E8E5FF
        F4F4F4FF4949AFFF2121A6FF2A2AA6FF2C2BA9FF5557B8FFEAEAECFE787879F1
        6A6A6B25000000007575769EBEBEBEFDC9CAE6FF7A79DBFF4C4CDFFF4141DBFF
        5757E0FFEAEAFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8E7FFFF5B5BD7FF2E2EC6FF
        3E3EC9FF3A3AC5FF2C2EC1FF4A49C8FFC2C2DDFFE3E3DAFFD5D5D4FFDADAD3FF
        CACBD9FF4747BBFF2525ADFF2C2BACFF3332AEFFA5A4D8FFBFBFBFFD7575769E
        00000000000000006A6A6B40888889F0ECECEFFE9696D6FF7B7BE3FF4D4BE0FF
        4141DBFF5F5FE6FFE7E7FFFFFFFFFFFFE9E9FFFF5A5ADCFF3333CAFF4242CFFF
        4040CBFF3D3DC9FF3D3EC8FF3030C2FF4848C9FFC0C0DDFFECEEDEFFD0D0E0FF
        5554C7FF2828B3FF3232B4FF3434B1FF5453B7FFECECEFFE888889F06A6A6B40
        0000000000000000000000007C7C7C98B7B7B8FAD0D0ECFF8F8FDBFF6868E3FF
        4E4EE2FF3E40DBFF6565E9FFB2B2F7FF6565E4FF393BD2FF4646D7FF4343D4FF
        4343D1FF4242CFFF4040CBFF3F3FCAFF3333C4FF4E4ECBFF9E9EE2FF5C5BCFFF
        292ABAFF3636BCFF3938B8FF3F3EB1FFCBCBE9FFB7B7B8FA7C7C7C9800000000
        0000000000000000000000006A6A6B22838383D8D3D3D3FEB5B5E2FF9E9EE4FF
        6766E2FF4E50E6FF4646E0FF3D3DDAFF4444DCFF4B4BDCFF4848DBFF4847D9FF
        4646D5FF4443D3FF4343D1FF4242CFFF4143CDFF3A3AC8FF312FC5FF3535C3FF
        3C3CC3FF3D3DBEFF403FB5FFACACDCFFD3D3D3FE838383D86A6A6B2200000000
        000000000000000000000000000000006A6A6B43878788EAE1E1E1FFB5B5E2FF
        A7A6E4FF7877E5FF5151E5FF4F4FE4FF4E4EE2FF4D4DE0FF4C4CDEFF4B4BDCFF
        4949DBFF4848D7FF4747D5FF4545D3FF4545D1FF4343CFFF4242CCFF3F3FCBFF
        4343C2FF4645B6FFADADDCFFE1E1E1FF878788EA6A6A6B430000000000000000
        00000000000000000000000000000000000000006A6A6B4E878788EAD3D3D3FE
        D0D0ECFFAAA9DFFFA2A2ECFF6565E3FF5151E6FF4F4FE4FF4F4DE4FF4D4DE0FF
        4D4DDFFF4D4DDCFF4C49DBFF4A4AD8FF4749D6FF4747D4FF4949CBFF4B4BC3FF
        8E8ED0FFCDCCE8FFD3D3D3FE878788EA6A6A6B4E000000000000000000000000
        0000000000000000000000000000000000000000000000006A6A6B43838383D8
        B7B7B8FAECECEFFEC3C2E5FFADAEE1FF9E9DE8FF6F6FE0FF5C5CE1FF5452E2FF
        5051E1FF4F4FDFFF4F4FDBFF5150D6FF5151CFFF5F5FC8FFA1A1D3FEC7C8E0FE
        E4E4E7FEB7B7B8FA838383D86A6A6B4300000000000000000000000000000000
        000000000000000000000000000000000000000000000000000000006A6A6B22
        7C7C7C98888889F0BFBFBFFDEBEBECFED8D9EBFEBDBDE4FEA8A7DCFF9695D7FF
        8886D4FF7F7DCEFF8C8BD2FFA1A2D9FFC0BEE1FED9D9EAFEEAEAECFEBFBFBFFD
        888889F07C7C7C986A6A6B220000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000006A6A6B407575769E787879F19F9F9FF6C0C0C0FDDADADAFFEDEDEEFF
        FBFBFBFFFBFBFBFFEDEDEEFFDADADAFFC0C0C0FD9F9F9FF6787879F17575769E
        6A6A6B4000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000006A6A6B256A6A6B606A6A6B946A6A6BC06A6A6BE1
        6A6A6BF86A6A6BF86A6A6BE16A6A6BC06A6A6B946A6A6B606A6A6B2500000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000FFC003FFFF0000FFFC00003FF800001FF000000FE0000007C0000003
        C000000380000001800000010000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000080000001
        80000001C0000003C0000003E0000007F000000FF800001FFC00003FFF0000FF
        FFC003FF}
      ShowUnicode = False
      ColWidths = (
        20
        64
        200
        64
        64
        48
        48
        48
        48
        48
        48
        48
        64
        48)
    end
  end
  object stat1: TStatusBar
    Left = 0
    Top = 711
    Width = 1008
    Height = 19
    Panels = <
      item
        Width = 150
      end
      item
        Width = 50
      end>
  end
  object dsWord: TDataSource
    DataSet = qryWord
    Left = 104
    Top = 272
  end
  object qryWord: TADOQuery
    Active = True
    Connection = dmManager.conEnglish
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Word'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = '%'
      end
      item
        Name = 'CatalogOption1'
        DataType = ftWideString
        Size = 1
        Value = #9675
      end
      item
        Name = 'CatalogOption2'
        DataType = ftWideString
        Size = 1
        Value = #215
      end
      item
        Name = 'ExplanationOption1'
        DataType = ftWideString
        Size = 1
        Value = #9675
      end
      item
        Name = 'ExplanationOption2'
        DataType = ftWideString
        Size = 1
        Value = #215
      end
      item
        Name = 'PictureOption1'
        DataType = ftWideString
        Size = 1
        Value = #9675
      end
      item
        Name = 'PictureOption2'
        DataType = ftWideString
        Size = 1
        Value = #215
      end
      item
        Name = 'LibraryOption1'
        DataType = ftWideString
        Size = 1
        Value = #9675
      end
      item
        Name = 'LibraryOption2'
        DataType = ftWideString
        Size = 1
        Value = #215
      end>
    SQL.Strings = (
      'SELECT'
      '    ROW_NUMBER() OVER(ORDER BY Word.Word ASC) AS RowId,'
      '    Word.Word,'
      '    Importance.ID as  ImportanceID,'
      '    Importance.Disp as ImportanceLevel,'
      '    Difficulty.ID as DifficultyID,'
      '    Difficulty.Disp as DifficultyLevel,'
      
        '    CASE WHEN (SELECT COUNT(*) FROM WordExplanation WHERE WordEx' +
        'planation.Word = Word.Word) > 0 THEN '#39#9675#39' ELSE '#39#215#39' END AS IsExpla' +
        'ined,'
      
        '    CASE WHEN (SELECT COUNT(*) FROM Picture WHERE Picture.Word =' +
        ' Word.Word) > 0 THEN '#39#9675#39' ELSE '#39#215#39' END AS IsPictured,'
      
        '    CASE WHEN (SELECT COUNT(*) FROM WordCatalogRelation WHERE Wo' +
        'rdCatalogRelation.Word = Word.Word AND WordCatalogRelation.Catal' +
        'ogID BETWEEN '#39'WC00001'#39' AND '#39'WC00010'#39') > 0 THEN '#39#9675#39' ELSE '#39#215#39' END ' +
        'AS IsCataloged,'
      
        '    CASE WHEN (SELECT COUNT(*) FROM PictureLibrary WHERE Picture' +
        'Library.Word = Word.Word) > 0 THEN '#39#9675#39' ELSE '#39#215#39' END AS IsPicture' +
        'Libraryed,'
      
        '    (SELECT COUNT(*) FROM (SELECT Distinct WordType FROM WordExp' +
        'lanation WHERE WordExplanation.Word = Word.Word) wt) AS WordType' +
        'Count,'
      
        '    (SELECT COUNT(*) FROM WordExplanation WHERE WordExplanation.' +
        'Word = Word.Word) AS ExplanationCount,'
      
        '    (SELECT COUNT(*) FROM Picture WHERE Picture.Word = Word.Word' +
        ') AS PictureCount,'
      
        '    (SELECT COUNT(*) FROM Picture WHERE Picture.Word = Word.Word' +
        ' AND Picture.MainPicture = 1) AS MainPictureCount,'
      
        '    (SELECT COUNT(*) FROM PictureLibrary WHERE PictureLibrary.Wo' +
        'rd = Word.Word) AS PictureLibraryCount'
      'FROM'
      '    Word'
      'INNER JOIN '
      '    Importance on Importance.ID = Word.ImportanceLevel'
      'INNER JOIN'
      '    Difficulty on Difficulty.ID = Word.DifficultyLevel'
      'WHERE'
      '    Word.Word LIKE :Word'
      
        '    AND CASE WHEN (SELECT COUNT(*) FROM WordCatalogRelation WHER' +
        'E WordCatalogRelation.Word = Word.Word AND WordCatalogRelation.C' +
        'atalogID BETWEEN '#39'WC00001'#39' AND '#39'WC00010'#39') > 0 THEN '#39#9675#39' ELSE '#39#215#39' ' +
        'END IN (:CatalogOption1,:CatalogOption2)'
      
        '    AND CASE WHEN (SELECT COUNT(*) FROM WordExplanation WHERE Wo' +
        'rdExplanation.Word = Word.Word) > 0 THEN '#39#9675#39' ELSE '#39#215#39' END IN (:E' +
        'xplanationOption1,:ExplanationOption2)'
      
        '    AND CASE WHEN (SELECT COUNT(*) FROM Picture WHERE Picture.Wo' +
        'rd = Word.Word) > 0 THEN '#39#9675#39' ELSE '#39#215#39' END IN (:PictureOption1,:P' +
        'ictureOption2)'
      
        '    AND CASE WHEN (SELECT COUNT(*) FROM PictureLibrary WHERE Pic' +
        'tureLibrary.Word = Word.Word) > 0 THEN '#39#9675#39' ELSE '#39#215#39' END IN (:Lib' +
        'raryOption1,:LibraryOption2)'
      'ORDER BY'
      '    Word.Word ASC')
    Left = 32
    Top = 272
  end
  object tblImportance: TADOTable
    Active = True
    Connection = dmManager.conEnglish
    CursorType = ctStatic
    TableName = 'Importance'
    Left = 32
    Top = 330
  end
  object dsImportance: TDataSource
    DataSet = tblImportance
    Left = 104
    Top = 330
  end
  object dsDifficulty: TDataSource
    DataSet = tblDifficulty
    Left = 104
    Top = 378
  end
  object tblDifficulty: TADOTable
    Active = True
    Connection = dmManager.conEnglish
    CursorType = ctStatic
    TableName = 'Difficulty'
    Left = 32
    Top = 378
  end
end
