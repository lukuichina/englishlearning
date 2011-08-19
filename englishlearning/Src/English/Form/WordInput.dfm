object WordInputForm: TWordInputForm
  Left = 0
  Top = 0
  Caption = #21333#35789#31649#29702
  ClientHeight = 730
  ClientWidth = 1008
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object grpWord: TGroupBox
    Left = 0
    Top = 161
    Width = 1008
    Height = 569
    Align = alClient
    Caption = #21333#35789#19968#35272
    TabOrder = 1
    object grdWord: TDBAdvGrid
      Left = 2
      Top = 15
      Width = 1004
      Height = 552
      Cursor = crDefault
      Align = alClient
      ColCount = 13
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
      PopupMenu = advpmn1
      ScrollBars = ssBoth
      TabOrder = 0
      OnCanSort = grdWordCanSort
      OnSelectionChanged = grdWordSelectionChanged
      ActiveCellFont.Charset = DEFAULT_CHARSET
      ActiveCellFont.Color = clWindowText
      ActiveCellFont.Height = -11
      ActiveCellFont.Name = 'Tahoma'
      ActiveCellFont.Style = [fsBold]
      ActiveCellColor = 9758459
      ActiveCellColorTo = 1414638
      ControlLook.FixedGradientFrom = clWhite
      ControlLook.FixedGradientTo = clWhite
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
      SearchFooter.Color = 15524577
      SearchFooter.ColorTo = 11769496
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
      SortSettings.Show = True
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
          Name = 'ID'
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
          Alignment = taCenter
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'CreateTime'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Header = #21019#24314#26102#38388
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
          Width = 128
        end
        item
          Alignment = taCenter
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'UpdateTime'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Header = #26356#26032#26102#38388
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
          Width = 128
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
        64
        128
        128)
    end
  end
  object grp1: TGroupBox
    Left = 0
    Top = 0
    Width = 1008
    Height = 161
    Align = alTop
    TabOrder = 0
    object grp3: TGroupBox
      Left = 375
      Top = 8
      Width = 354
      Height = 113
      Caption = #32534#36753
      TabOrder = 1
      object lblDifficultyEdit: TLabel
        Left = 24
        Top = 80
        Width = 48
        Height = 13
        Caption = #38590#26131#24230#65306
      end
      object lblImportanceEdit: TLabel
        Left = 24
        Top = 48
        Width = 48
        Height = 13
        Caption = #37325#35201#24230#65306
      end
      object lblWordEdit: TLabel
        Left = 24
        Top = 19
        Width = 36
        Height = 13
        Caption = #21333#35789#65306
      end
      object dblkcbbDifficultyEdit: TDBLookupComboBox
        Left = 104
        Top = 75
        Width = 145
        Height = 21
        KeyField = 'ID'
        ListField = 'Disp'
        ListSource = dsDifficultyEdit
        TabOrder = 2
      end
      object dblkcbbImportanceEdit: TDBLookupComboBox
        Left = 104
        Top = 48
        Width = 145
        Height = 21
        KeyField = 'ID'
        ListField = 'Disp'
        ListSource = dsImportanceEdit
        TabOrder = 1
      end
      object edtWordEdit: TEdit
        Left = 104
        Top = 16
        Width = 145
        Height = 21
        TabOrder = 0
      end
      object btnDelete: TBitBtn
        Left = 264
        Top = 59
        Width = 75
        Height = 25
        Caption = #21024#38500
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 4
        OnClick = btnDeleteClick
      end
      object btnUpdate: TBitBtn
        Left = 264
        Top = 17
        Width = 75
        Height = 25
        Caption = #26356#26032
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 3
        OnClick = btnUpdateClick
      end
    end
    object grp4: TGroupBox
      Left = 16
      Top = 8
      Width = 353
      Height = 113
      Caption = #28155#21152
      TabOrder = 0
      object lblDifficulty: TLabel
        Left = 24
        Top = 80
        Width = 48
        Height = 13
        Caption = #38590#26131#24230#65306
      end
      object lblImportance: TLabel
        Left = 24
        Top = 48
        Width = 48
        Height = 13
        Caption = #37325#35201#24230#65306
      end
      object lblWord: TLabel
        Left = 24
        Top = 19
        Width = 36
        Height = 13
        Caption = #21333#35789#65306
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
      object btnWord: TButton
        Left = 275
        Top = 14
        Width = 75
        Height = 25
        Caption = #24405#20837
        TabOrder = 3
        OnClick = btnWordClick
      end
      object edtWord: TEdit
        Left = 104
        Top = 16
        Width = 145
        Height = 21
        TabOrder = 0
        OnExit = edtWordExit
        OnKeyDown = edtWordKeyDown
      end
    end
    object pnl1: TPanel
      Left = 16
      Top = 127
      Width = 713
      Height = 25
      BevelOuter = bvNone
      TabOrder = 2
      object btnA: TButton
        Left = 25
        Top = 0
        Width = 25
        Height = 25
        Align = alLeft
        Caption = 'A'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = btnAClick
      end
      object btnB: TButton
        Left = 50
        Top = 0
        Width = 25
        Height = 25
        Align = alLeft
        Caption = 'B'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = btnAClick
      end
      object btnC: TButton
        Left = 75
        Top = 0
        Width = 25
        Height = 25
        Align = alLeft
        Caption = 'C'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = btnAClick
      end
      object btn3: TButton
        Left = 100
        Top = 0
        Width = 25
        Height = 25
        Align = alLeft
        Caption = 'D'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnClick = btnAClick
      end
      object btn4: TButton
        Left = 125
        Top = 0
        Width = 25
        Height = 25
        Align = alLeft
        Caption = 'E'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        OnClick = btnAClick
      end
      object btn5: TButton
        Left = 150
        Top = 0
        Width = 25
        Height = 25
        Align = alLeft
        Caption = 'F'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        OnClick = btnAClick
      end
      object btn6: TButton
        Left = 175
        Top = 0
        Width = 25
        Height = 25
        Align = alLeft
        Caption = 'G'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        OnClick = btnAClick
      end
      object btn7: TButton
        Left = 200
        Top = 0
        Width = 25
        Height = 25
        Align = alLeft
        Caption = 'H'
        TabOrder = 8
        OnClick = btnAClick
      end
      object btn8: TButton
        Left = 225
        Top = 0
        Width = 25
        Height = 25
        Align = alLeft
        Caption = 'I'
        TabOrder = 9
        OnClick = btnAClick
      end
      object btn9: TButton
        Left = 250
        Top = 0
        Width = 25
        Height = 25
        Align = alLeft
        Caption = 'J'
        TabOrder = 10
        OnClick = btnAClick
      end
      object btn10: TButton
        Left = 275
        Top = 0
        Width = 25
        Height = 25
        Align = alLeft
        Caption = 'K'
        TabOrder = 11
        OnClick = btnAClick
      end
      object btn11: TButton
        Left = 300
        Top = 0
        Width = 25
        Height = 25
        Align = alLeft
        Caption = 'L'
        TabOrder = 12
        OnClick = btnAClick
      end
      object btn12: TButton
        Left = 325
        Top = 0
        Width = 25
        Height = 25
        Align = alLeft
        Caption = 'M'
        TabOrder = 13
        OnClick = btnAClick
      end
      object btn13: TButton
        Left = 350
        Top = 0
        Width = 25
        Height = 25
        Align = alLeft
        Caption = 'N'
        TabOrder = 14
        OnClick = btnAClick
      end
      object btn14: TButton
        Left = 375
        Top = 0
        Width = 25
        Height = 25
        Align = alLeft
        Caption = 'O'
        TabOrder = 15
        OnClick = btnAClick
      end
      object btn15: TButton
        Left = 400
        Top = 0
        Width = 25
        Height = 25
        Align = alLeft
        Caption = 'P'
        TabOrder = 16
        OnClick = btnAClick
      end
      object btn16: TButton
        Left = 425
        Top = 0
        Width = 25
        Height = 25
        Align = alLeft
        Caption = 'Q'
        TabOrder = 17
        OnClick = btnAClick
      end
      object btn17: TButton
        Left = 450
        Top = 0
        Width = 25
        Height = 25
        Align = alLeft
        Caption = 'R'
        TabOrder = 18
        OnClick = btnAClick
      end
      object btn18: TButton
        Left = 475
        Top = 0
        Width = 25
        Height = 25
        Align = alLeft
        Caption = 'S'
        TabOrder = 19
        OnClick = btnAClick
      end
      object btn19: TButton
        Left = 500
        Top = 0
        Width = 25
        Height = 25
        Align = alLeft
        Caption = 'T'
        TabOrder = 20
        OnClick = btnAClick
      end
      object btn20: TButton
        Left = 525
        Top = 0
        Width = 25
        Height = 25
        Align = alLeft
        Caption = 'U'
        TabOrder = 21
        OnClick = btnAClick
      end
      object btn21: TButton
        Left = 550
        Top = 0
        Width = 25
        Height = 25
        Align = alLeft
        Caption = 'V'
        TabOrder = 22
        OnClick = btnAClick
      end
      object btn22: TButton
        Left = 575
        Top = 0
        Width = 25
        Height = 25
        Align = alLeft
        Caption = 'W'
        TabOrder = 23
        OnClick = btnAClick
      end
      object btn23: TButton
        Left = 600
        Top = 0
        Width = 25
        Height = 25
        Align = alLeft
        Caption = 'X'
        TabOrder = 24
        OnClick = btnAClick
      end
      object btn24: TButton
        Left = 625
        Top = 0
        Width = 25
        Height = 25
        Align = alLeft
        Caption = 'Y'
        TabOrder = 25
        OnClick = btnAClick
      end
      object btn1: TButton
        Left = 650
        Top = 0
        Width = 25
        Height = 25
        Align = alLeft
        Caption = 'Z'
        TabOrder = 26
        OnClick = btnAClick
      end
      object btnA2Z: TButton
        Left = 0
        Top = 0
        Width = 25
        Height = 25
        Align = alLeft
        Caption = '*'
        TabOrder = 0
        OnClick = btnA2ZClick
      end
    end
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
  object tblImportance: TADOTable
    Active = True
    Connection = dmManager.conEnglish
    CursorType = ctStatic
    TableName = 'Importance'
    Left = 32
    Top = 330
  end
  object cmdWord: TADOCommand
    CommandText = 
      'insert into Word(Word, ImportanceLevel, DifficultyLevel, CreateT' +
      'ime) '#13#10'values(:Word, :ImportanceLevel, :DifficultyLevel, (select' +
      ' GETDATE()))'
    Connection = dmManager.conEnglish
    Parameters = <
      item
        Name = 'Word'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = Null
      end
      item
        Name = 'ImportanceLevel'
        Attributes = [paSigned, paNullable]
        DataType = ftBCD
        Precision = 2
        Size = 19
        Value = Null
      end
      item
        Name = 'DifficultyLevel'
        Attributes = [paSigned, paNullable]
        DataType = ftBCD
        Precision = 2
        Size = 19
        Value = Null
      end>
    Left = 256
    Top = 274
  end
  object dsWord: TDataSource
    DataSet = qryWord
    Left = 176
    Top = 272
  end
  object tblWord: TADOTable
    Active = True
    Connection = dmManager.conEnglish
    CursorType = ctStatic
    TableName = 'Word'
    Left = 104
    Top = 272
    object strfldWordWord: TStringField
      FieldName = 'Word'
    end
    object intfldWordImportanceLevel: TIntegerField
      FieldName = 'ImportanceLevel'
    end
    object intfldWordDifficultyLevel: TIntegerField
      FieldName = 'DifficultyLevel'
    end
  end
  object qryWord: TADOQuery
    Active = True
    Connection = dmManager.conEnglish
    CursorType = ctStatic
    OnMoveComplete = qryWordMoveComplete
    Parameters = <
      item
        Name = 'Word'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = '%'
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
      
        '    (SELECT COUNT(*) FROM (SELECT Distinct WordType FROM WordExp' +
        'lanation WHERE WordExplanation.Word = Word.Word) wt) AS WordType' +
        'Count,'
      
        '    (SELECT COUNT(*) FROM WordExplanation WHERE WordExplanation.' +
        'Word = Word.Word) AS ExplanationCount,'
      
        '    (SELECT COUNT(*) FROM Picture WHERE Picture.Word = Word.Word' +
        ') AS PictureCount,'
      
        '    (SELECT COUNT(*) FROM Picture WHERE Picture.Word = Word.Word' +
        ' AND Picture.MainPicture = 1) AS MainPictureCount,'
      '    Word.CreateTime,'
      '    Word.UpdateTime'
      'FROM'
      '  Word'
      'INNER JOIN '
      '  Importance on Importance.ID = Word.ImportanceLevel'
      'INNER JOIN'
      '  Difficulty on Difficulty.ID = Word.DifficultyLevel'
      'WHERE'
      '  Word.Word like :Word'
      'ORDER BY'
      '  Word.Word ASC')
    Left = 32
    Top = 272
  end
  object dsDifficultyEdit: TDataSource
    DataSet = tblDifficultyEdit
    Left = 248
    Top = 378
  end
  object tblDifficultyEdit: TADOTable
    Active = True
    Connection = dmManager.conEnglish
    CursorType = ctStatic
    TableName = 'Difficulty'
    Left = 176
    Top = 378
  end
  object tblImportanceEdit: TADOTable
    Active = True
    Connection = dmManager.conEnglish
    CursorType = ctStatic
    TableName = 'Importance'
    Left = 176
    Top = 330
  end
  object dsImportanceEdit: TDataSource
    DataSet = tblImportanceEdit
    Left = 248
    Top = 330
  end
  object cmdWordUpdate: TADOCommand
    CommandText = 
      'UPDATE'#13#10'    Word'#13#10'SET '#13#10'    Word = :NewWord,'#13#10'    ImportanceLeve' +
      'l = :ImportanceLevel,'#13#10'    DifficultyLevel =  :DifficultyLevel,'#13 +
      #10'    UpdateTime = (select GETDATE())'#13#10'WHERE'#13#10'    Word = :Word'
    Connection = dmManager.conEnglish
    Parameters = <
      item
        Name = 'NewWord'
        Size = -1
        Value = Null
      end
      item
        Name = 'ImportanceLevel'
        Attributes = [paSigned, paNullable]
        DataType = ftBCD
        Precision = 2
        Size = 19
        Value = Null
      end
      item
        Name = 'DifficultyLevel'
        Attributes = [paSigned, paNullable]
        DataType = ftBCD
        Precision = 2
        Size = 19
        Value = Null
      end
      item
        Name = 'Word'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = Null
      end>
    Left = 336
    Top = 274
  end
  object cmdWordDelete: TADOCommand
    CommandText = 'DELETE FROM Word WHERE Word = :Word'
    Connection = dmManager.conEnglish
    Parameters = <
      item
        Name = 'Word'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = Null
      end>
    Left = 424
    Top = 274
  end
  object advpmn1: TAdvPopupMenu
    Version = '2.5.3.4'
    Left = 480
    Top = 216
    object mnuDelete: TMenuItem
      Action = actDeleteWord
    end
    object mnuExportToCsv: TMenuItem
      Action = actImportToExcel
    end
    object mnuWordExplanation: TMenuItem
      Action = actViewExplanation
    end
    object mnuViewExtention: TMenuItem
      Action = actViewExtention
    end
    object mnuViewPicture: TMenuItem
      Action = actViewPicture
    end
  end
  object actlst1: TActionList
    Images = ilGridPopMenu
    Left = 536
    Top = 216
    object actDeleteWord: TAction
      Caption = #21024#38500
      ImageIndex = 0
      OnExecute = actDeleteWordExecute
    end
    object actImportToExcel: TAction
      Caption = #23548#20986#21040'Excel'
      ImageIndex = 1
      OnExecute = actImportToExcelExecute
    end
    object actViewExplanation: TAction
      Caption = #26597#30475#35299#37322
      ImageIndex = 2
      OnExecute = actViewExplanationExecute
    end
    object actViewExtention: TAction
      Caption = #26597#30475#25193#23637
      ImageIndex = 3
      OnExecute = actViewExtentionExecute
    end
    object actViewPicture: TAction
      Caption = #26597#30475#22270#29255
      ImageIndex = 4
      OnExecute = actViewPictureExecute
    end
  end
  object ilGridPopMenu: TImageList
    Left = 584
    Top = 216
    Bitmap = {
      494C0101050008001C0110001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D6D6D6297575758A7575758AD5D5D52A000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000079797986133909FF359C14FF389E10FF399B0CFF389507FF153601FF7575
      758A000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000030A
      02FF32A420FF2FA527FF28B53FFF2FA325FF30A121FF2CAC33FF349813FF3991
      04FF040A00FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000040F04FF2FA4
      26FF27B642FF379107FF379209FF379209FF379209FF379209FF379108FF2FA4
      26FF388D02FF071100FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000575757A82DAD30FF28B5
      40FF359711FF359711FF359711FF359711FF359711FF389F12FF308E0DFF2372
      06FF319E1DFF388F03FF454545BA000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000015551BFF29B13AFF339B
      17FF339B18FF339B18FF339B18FF21650FFF000000FFFFFFF6FFFCF7E2FF2723
      23FF339B18FF35950EFF204F02FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C1C1C13E2BBB3EFF28B33DFF31A0
      1FFF31A01FFF31A01FFF000000FF8F886AFF3B382CFFFFEFA7FFFFFFFFFF0731
      01FF31A01FFF349813FF3A9908FFAAAAAA550000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080807F2ABE42FF2BAC33FF2FA4
      26FF2FA426FF021501FFFCFCFCFF7A6A28FF323232FF534613FF000600FF1548
      11FF2FA426FF339B17FF399B0CFF6F6F6F900000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007F7F7F8029C147FF2BAD34FF2DA9
      2DFF2EAE2FFFBBBBBBFFFFFFFFFFAD8C02FF0C0802FF0C380BFF082E05FF2DA9
      2DFF2DA92DFF359610FF389E10FF7070708F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BFBFBF402CAA33FF2AB13AFF2BAD
      34FF030C04FF000000FF000000FF1E7E23FF239A27FF041305FF2CB035FF2BAD
      34FF2BAD34FF37920AFF37960FFFAFAFAF500000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000192E00FF26BA47FF2CAB
      31FF249B34FF2BBA3EFF2AB63CFF0A2D0FFF2CBC3EFF29B23BFF29B23BFF29B2
      3BFF30A121FF329E1CFF1D3900FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005C5C5CA32EA327FF26BA
      49FF2CAB30FF27B642FF27B642FF27B642FF27B642FF27B642FF27B642FF2FA5
      27FF2FA426FF349714FF494949B6000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000030700FF2EAD
      2DFF26BA47FF2EA72AFF2DA82CFF26B946FF26B946FF2FA528FF349812FF2DA8
      2CFF33A11BFF060C00FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000104
      00FF3B8C00FF27BA45FF26B745FF28B540FF29B23CFF2AAF38FF2CAD33FF3B90
      00FF030800FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008E8E8E71102800FF3C9900FF41A800FF41A900FF3C9D00FF122D00FF8282
      827D000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000DFDFDF208C8C8C738B8B8B74DBDBDB24000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D9D9
      D926D9D9D926D9D9D926D9D9D926D9D9D926D9D9D926D9D9D926D9D9D926D9D9
      D926D9D9D9260000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D6D6D6297575758A7575758AD5D5D52A000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D6D6D6297575758A7575758AD5D5D52A000000000000
      0000000000000000000000000000000000000000000000000000000000004A4A
      C3FF5151C7FFF8F8FC0800000000000000000000000000000000F8F8FC085050
      C7FF4949C3FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000079797986002C5BFF007AFFFF007CFFFF007AFFFF0076FFFF002B5FFF7575
      758A000000000000000000000000000000000000000000000000000000000000
      0000797979863A3A37FF9C9A90FF99968CFF918E83FF868377FF2F2E29FF7575
      758A0000000000000000000000000000000000000000000000004A4AC3FF1919
      CEFF1D1DD0FF5555C9FFF8F8FC080000000000000000F8F8FC085555C9FF1C1C
      D0FF1717CEFF4949C3FF00000000000000000000000000000000659C6F9A4CA1
      5CFF4BAC5BFF4FA261FF48A45FFF47A361FF4AA260FF4EA562FF4DA35EFF4FA1
      62FF4CA361FF468456B900000000000000000000000000000000000000000008
      10FF007FFFFF008DFFFF00B5FFFF0095FFFF008FFFFF009CFFFF007CFFFF0073
      FFFF000814FF0000000000000000000000000000000000000000000000000B0B
      0AFFB2B1A9FFBCBBB4FFECEBE9FFB7B6AFFFB2B0A9FFD6D5D1FF99978EFF7E7B
      6EFF080808FF000000000000000000000000000000004848C2FF1D1DD0FF2323
      D2FF2A2AD5FF3030D7FF5757CAFFF8F8FC08F8F8FC085757CAFF2F2FD6FF2828
      D4FF2121D1FF1B1BCFFF4848C2FF00000000000000000000000040A960FF1D80
      3AFF1C7E37FF187E32FF1A7B2FFF137C35FF167C34FF187D32FF1A7D2FFF197D
      31FF238037FF389B4FFF00000000000000000000000000000000000C17FF007E
      FFFF00BCFFFF0070FFFF0073FFFF0073FFFF0073FFFF0073FFFF0072FFFF0083
      FFFF0070FFFF000E1FFF00000000000000000000000000000000121211FFBAB9
      B3FFF0EFEEFF7B786CFF807D72FF807D72FF807D72FF807D72FF7D7A6EFFC0BE
      B8FF787569FF0E0E0CFF0000000000000000000000003C3CBCF33232D6FF2F2F
      D7FF3838DAFF3E3EDDFF4444DFFF5B5BCBFF5A5ACBFF4343DEFF3D3DDCFF3636
      DAFF2D2DD6FF2F2FD5FF3C3CBCF300000000000000000000000023964AFF208F
      43FFA0BEA7FFB3B7B8FFC0C0C0FFCECECEFFC7C7C7FFC0C0C0FFB0B0B0FF97AB
      97FF2B904AFF1E8B41FF000000000000000000000000575757A80090FFFF00B8
      FFFF0076FFFF78A8FFFFF3F6FFFF0075FFFF0076FFFFEDF2FFFFA5C3FFFF0076
      FFFF007CFFFF0072FFFF454545BA0000000000000000575757A8CECDC8FFEAEA
      E8FF8E8B81FF8D8B80FF949287FF8D8B81FF8D8B81FF949186FF8D8B80FF8E8B
      81FFB0AEA7FF7C796DFF454545BA0000000000000000000000003D3DBCF34646
      DDFF4545E0FF4E4EE2FF5353E5FF5656E5FF5656E5FF5252E4FF4C4CE2FF4343
      DFFF4343DCFF3D3DBCF3000000000000000000000000000000001F9F4FFF299A
      54FFB3B6B7FFC4C4C4FFDDDDDDFFDFDFDFFFE4E0E4FF26873FFF228B3FFF1C88
      41FF2E9E56FF1A9747FF000000000000000000000000004C7DFF00A5FFFF0077
      FFFF0078FFFFFFFFFFFFFFFFFFFF308DFFFF0577FFFFFFFFFFFFFFFFFFFF0077
      FFFF0079FFFF0075FFFF003F8EFF00000000000000006A6A68FFE0DFDCFF9997
      8EFF9C9A91FF000000FF000000FF43423EFF514F4AFF000000FF000000FF9D9B
      91FF9B9990FF929086FF45433CFF000000000000000000000000000000003D3D
      BCF35C5CE6FF5C5CE8FF6262EAFF6666ECFF6565ECFF6161EAFF5959E7FF5959
      E5FF3D3DBCF3000000000000000000000000000000000000000015A758FF29A5
      5EFFBFC2C3FF0C883AFF198D3DFF168B45FF11883CFF209149FF159042FFB1B2
      B0FF2BAC60FF14A84DFF0000000000000000C1C1C13E00ABFFFF00B1FFFF007C
      FFFF0075FFFFFFFFFFFFF3F9FFFFE4EFFFFFA9CFFFFFFDFEFFFFFFFFFFFF067B
      FFFF007CFFFF0077FFFF007AFFFFAAAAAA55C1C1C13EEDECE9FFE7E7E4FFA9A7
      9FFFABA9A1FF000000FF71706AFF000000FF000000FF6B6A65FF000000FFACAA
      A2FFA9A79FFF9F9D94FF8A877BFFAAAAAA550000000000000000000000000000
      00003E3EBCF37171EEFF7171F0FF7474F1FF7474F1FF6F6FEFFF6E6EEDFF3E3E
      BCF300000000000000000000000000000000000000000000000018B45CFF29AE
      62FFC7C7C7FFE7E3E5FF36AB66FF49B07BFF53B378FF50BB7BFFDEDADCFFA2B7
      B3FF27AC6CFF17B45CFF00000000000000008080807F00B3FFFF009AFFFF007E
      FFFFB1D3FFFFFFFFFFFF48A3FFFFFFFFFFFFFFFFFFFF85C2FFFFFFFFFFFFCDE2
      FFFF007EFFFF0079FFFF007AFFFF6F6F6F908080807FF6F5F3FFD2D1CDFFB6B5
      AEFFB6B5AEFFBBB9B2FF6D6C68FF82807CFF84827DFF5E5D5AFFB6B4AEFFB6B4
      AEFFB6B5AEFFA4A29AFF918E83FF6F6F6F900000000000000000000000000000
      00003E3EBDF37F7FF2FF8585F5FF8787F7FF8181F6FF7B7BF4FF7878F1FF3E3E
      BDF300000000000000000000000000000000000000000000000034BD7BFF4BC8
      8DFFD1D1D1FFE6E6E6FF57AE93FF60C69AFF6ED09FFF70C7A7FFDEDEDEFFCDCD
      CDFF99C4BBFF8EC3B9FF00000000000000007F7F7F8000BBFFFF009FFFFF0089
      FFFFFFFFFFFFFFFFFFFF0082FFFFFFFFFFFFFFFFFFFF0086FFFFFFFFFFFFFFFF
      FFFF0089FFFF0077FFFF007CFFFF7070708F7F7F7F80FEFEFCFFD7D7D3FFC4C2
      BDFFC4C2BDFFC4C2BDFFB2B1ACFF020202FF000000FFABAAA6FFC4C2BDFFC4C2
      BDFFC4C2BDFF9A988EFF99968CFF7070708F0000000000000000000000003E3E
      BDF37F7FF1FF8888F5FF9696F9FFA0A0FCFFA3A3FBFFA2A2FAFF9292F5FF7B7B
      F0FF3E3EBCF3000000000000000000000000000000000000000048D393FF5ECC
      A1FFD3D3D3FF7ACBB7FF71D4ADFF84CEB7FF87C8B8FF90BCBCFFB2CDCDFFD3D3
      D3FFABCACAFFB4C7CAFF0000000000000000BFBFBF4000B6FFFF00A6FFFF0090
      FFFFFFFFFFFFF7FCFFFF0094FFFFFFFFFFFFFFFFFFFF0092FFFFD7EFFFFFFFFF
      FFFF008FFFFF0073FFFF0089FFFFAFAFAF50BFBFBF40DCDBD6FFE2E2DFFFD1D0
      CCFFD1D0CCFFD1D0CCFFAEADA9FF000000FF000000FF9D9C99FFD1D0CCFFD1D0
      CCFFD1D0CCFF8F8C81FF9B988DFFAFAFAF5000000000000000003E3EBCF37979
      EDFF8585F2FF9696F7FFA4A4FBFFAFAFFDFFB3B3FEFFB1B1FBFFAFAFF8FFADAD
      F5FFB0B0F4FF3F3FBDF3000000000000000000000000000000005CD5B6FF73C0
      B0FFA7D1D2FF87BEBEFF91C8C2FFF1EDEDFFE3E5E5FFA6CACAFFADCFCFFFD3D2
      D2FFBAD8D8FFC7C4C6FF000000000000000000000000003B79FF00B8FFFF0093
      FFFF05A4FFFF009FFFFF00A2FFFF009EFFFF00A0FFFF00A2FFFF00A0FFFF06A4
      FFFF008BFFFF007BFFFF004D8CFF000000000000000033322BFFF8F8F7FFD0CE
      CAFFDFDEDBFFDFDEDBFFDEDDDBFFA9A9A7FFA2A19FFFDEDDDBFFDFDEDBFFDFDE
      DBFFB6B4AEFFA8A69EFF46443EFF00000000000000003D3DBCF37272E9FF7E7E
      EEFF9090F3FF9F9FF7FFADADFBFF6C6CD0FF7272D2FFBCBCFBFFBCBCF9FFBCBC
      F7FFBCBCF5FFC1C1F5FF3E3EBDF30000000000000000000000007EC1BFFF84BF
      BFFFD2D2D2FFDCDCDCFFE1E1E1FFE4E4E4FFE4E4E4FFE1E1E1FFE0E0E0FFDEDE
      DEFFD4D4D4FFE0DCDEFF0000000000000000000000005C5C5CA300BEFFFF00BB
      FFFF0094FFFF00AEFFFF00AEFFFF00AEFFFF00AEFFFF00AEFFFF00AEFFFF0094
      FFFF007FFFFF0097FFFF494949B600000000000000005C5C5CA3DEDDDAFFFBFB
      FAFFCFCFCAFFECECEAFFECECEAFFECECEAFFECECEAFFECECEAFFECECEAFFC0BF
      B9FFB9B8B1FFB4B3ABFF494949B600000000000000005252C5FF7878E9FF8989
      EEFF9A9AF3FFA8A8F7FF6C6CD0FFF8F8FC08F8F8FC087575D2FFC7C7F9FFC9C9
      F8FFCBCBF7FFCECEF7FF5F5FC9FF00000000000000000000000098CFD3FF98CE
      CEFFBED2D2FFC8D9D9FFD3D8D8FFD5D5D5FFDADADAFFDDDDDDFFE2E2E2FFE3E3
      E3FFE6E6E6FFF3EFF1FF00000000000000000000000000000000000910FF00C5
      FFFF00B8FFFF0090FFFF0096FFFF00B6FFFF00B7FFFF0096FFFF0079FFFF0088
      FFFF009CFFFF000F1CFF00000000000000000000000000000000090908FFF2F2
      F1FFF8F8F8FFC7C6C1FFC9C8C3FFF4F4F2FFF4F4F2FFC2C1BBFF9E9C93FFC6C4
      BFFFCAC9C4FF10100FFF000000000000000000000000000000005959C8FF9595
      EFFFA4A4F2FF6B6BCFFFF8F8FC080000000000000000F8F8FC087979D3FFD5D5
      F9FFD9D9F9FF6666CCFF0000000000000000000000000000000026A86BFFB9DA
      DBFFC2C4C4FFC2C1C1FFD1D1D1FFD7D7D7FFDCDCDCFFE3E3E3FFEEEEEEFFF1F1
      F1FFFCFAFBFF57BD89FF00000000000000000000000000000000000000000005
      08FF00BFFFFF00BBFFFF00B0FFFF00ABFFFF00A4FFFF009AFFFF0098FFFF00C6
      FFFF000A10FF0000000000000000000000000000000000000000000000000505
      05FFC8C6C1FFFBFBFBFFF0F0EFFFEBEAE8FFE3E2E0FFDAD9D6FFD6D5D2FFD0CF
      CAFF0A0A0AFF0000000000000000000000000000000000000000000000005E5E
      C9FF6666CDFFF8F8FC0800000000000000000000000000000000F8F8FC087676
      D1FF6868CCFF000000000000000000000000000000000000000000000000A1CA
      B96C60B3849F60BB8B9F60B1869F60B5829F60AF839F60AD879F60B4819F60B6
      819F91D3AD720000000000000000000000000000000000000000000000000000
      00008E8E8E71003746FF00D9FFFF00FFFFFF00FFFFFF00E2FFFF003D4EFF8282
      827D000000000000000000000000000000000000000000000000000000000000
      00008E8E8E71393837FFDEDDDAFFFFFFFFFFFFFFFFFFE6E6E3FF40403EFF8282
      827D000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000DFDFDF208C8C8C738B8B8B74DBDBDB24000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000DFDFDF208C8C8C738B8B8B74DBDBDB24000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF00FC3F000000000000F00F000000000000
      E007000000000000C00300000000000080010000000000008001000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      80010000000000008001000000000000C003000000000000E007000000000000
      F00F000000000000FC3F000000000000E007FFFFFC3FFC3FE3C7FFFFF00FF00F
      C183C003E007E0078001C003C003C0038001C00380018001C003C00380018001
      E007C00300000000F00FC00300000000F00FC00300000000E007C00300000000
      C003C003800180018001C003800180018001C003C003C003C183C003E007E007
      E3C7E007F00FF00FFFFFFFFFFC3FFC3F00000000000000000000000000000000
      000000000000}
  end
  object qryWordNoSort: TADOQuery
    Connection = dmManager.conEnglish
    CursorType = ctStatic
    OnMoveComplete = qryWordMoveComplete
    Parameters = <
      item
        Name = 'Word'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = '%'
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
      
        '    (SELECT COUNT(*) FROM (SELECT Distinct WordType FROM WordExp' +
        'lanation WHERE WordExplanation.Word = Word.Word) wt) AS WordType' +
        'Count,'
      
        '    (SELECT COUNT(*) FROM WordExplanation WHERE WordExplanation.' +
        'Word = Word.Word) AS ExplanationCount,'
      
        '    (SELECT COUNT(*) FROM Picture WHERE Picture.Word = Word.Word' +
        ') AS PictureCount,'
      
        '    (SELECT COUNT(*) FROM Picture WHERE Picture.Word = Word.Word' +
        ' AND Picture.MainPicture = 1) AS MainPictureCount,'
      '    Word.CreateTime,'
      '    Word.UpdateTime'
      'FROM'
      '  Word'
      'INNER JOIN '
      '  Importance on Importance.ID = Word.ImportanceLevel'
      'INNER JOIN'
      '  Difficulty on Difficulty.ID = Word.DifficultyLevel'
      'WHERE'
      '  Word.Word like :Word'
      '')
    Left = 32
    Top = 224
  end
  object dlgSave1: TSaveDialog
    Filter = 'Excel Files(*.xls)|*.xls'
    Left = 648
    Top = 216
  end
end
