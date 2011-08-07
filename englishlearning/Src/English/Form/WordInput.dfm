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
    object mnuWordExplanation: TMenuItem
      Action = actViewExplanation
      ImageIndex = 0
    end
    object mnuViewPicture: TMenuItem
      Action = actViewPicture
      ImageIndex = 1
    end
    object mnuViewExtention: TMenuItem
      Action = actViewExtention
    end
    object mnuExportToCsv: TMenuItem
      Action = actImportToExcel
      ImageIndex = 2
    end
    object mnuDelete: TMenuItem
      Action = actDeleteWord
      ImageIndex = 3
    end
  end
  object actlst1: TActionList
    Images = ilGridPopMenu
    Left = 536
    Top = 216
    object actViewExplanation: TAction
      Caption = #26597#30475#35299#37322
      OnExecute = actViewExplanationExecute
    end
    object actViewPicture: TAction
      Caption = #26597#30475#22270#29255
      OnExecute = actViewPictureExecute
    end
    object actImportToExcel: TAction
      Caption = #23548#20986#21040'Excel'
      OnExecute = actImportToExcelExecute
    end
    object actDeleteWord: TAction
      Caption = #21024#38500
      OnExecute = actDeleteWordExecute
    end
    object actViewExtention: TAction
      Caption = #26597#30475#25193#23637
      ImageIndex = 0
      OnExecute = actViewExtentionExecute
    end
  end
  object ilGridPopMenu: TImageList
    Left = 584
    Top = 216
    Bitmap = {
      494C010104000800B40010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000017171749ADABAAFF5C5A59DF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000170000002500000025000000250000002500000025000000250000
      0026000000030000000000000000000000000000000000000000000000000000
      00000000000000000000565453FF7A7978FFA5A2A1FF908F8EFF767473FF0000
      000000000000000000000000000000000000FDFDFD02D7D7D728717171985C5C
      5CC25B5B5BC35B5B5BC35B5B5BC35B5B5BC35B5B5BC35B5B5BC35B5B5BC35E5E
      5EBE9A9A9A65F2F2F20D00000000000000000000000000000001A5A5A5D4A5A5
      A5D4A5A5A5D4A5A5A5D4A5A5A5D4A5A5A5D4A5A5A5D4A5A5A5D4A5A5A5D4A5A5
      A5D4A5A5A5D4A5A5A5D4A5A5A5D4A7A7A7D50000000000000000000000000000
      0000101073FC07077EFF070787FF07078CFF07078EFF07078BFF070784FF0707
      7AFF06062F7B0000000000000000000000000000000000000000000000000000
      000000000000666462FF6A6867FF6F6D6CFF9C9A99FF868483FF868483FF8584
      83FF10101028000000000000000000000000000000007C7A77B1F1D37CFFD4C4
      7AFFD8D488FFDADE8EFFD9E58EFFD8E78EFFD8E78EFFD9E28EFFDADA8CFFDAD1
      86FFF4EA90FEE8E8E81800000000000000000000000000000000F8F8F8FFF5F5
      F5FFF2F2F2FFEFEFEFFFEDECECFFEAE9E9FFE7E6E6FFE4E3E3FFE2E2E1FFE2E2
      E1FFF4F3F3FFFFFFFFFF8B8B8BFFDFDFDFFF0000000000000000000000000404
      275A00007DFF00008EFF00009AFF0000A0FF0000A2FF00009FFF000096FF0000
      89FF05057AFF000000000000000000000000000000000000000000000000504E
      4DFF565352FF5B5958FF5F5C5BFF636261FF949290FF7C7A79FF7B7A79FF7B7A
      79FF7A7878FF686665FF000000000000000000000000C58C50FEBE8E4DFFC6A5
      61FFCDB871FFD1C67CFFD3CF82FFD4D384FFD4D283FFD3CC80FFD0C178FFCBB0
      6BFFC39B59FF7C7C7CA600000000000000000000000000000000FBFBFBFFEBE3
      DFFFE8E0DCFFF2F2F2FFEFEFEFFFEDECECFFECEBEBFFE7E6E6FFDBD9D9FFE2E2
      E1FFE1E1E0FFF4F3F3FFFFFFFFFFA9A9A9FF0000000000000000000000000808
      84FF000095FF0000A6FF0000B3FF0000B9FF0000BAFF0000B7FF0000AEFF0000
      A0FF00008DFF0D0D5BBE00000000000000000000000000000000666464FF514F
      4EFF514F4EFF514F4EFF535150FF585655FF8C8988FF72706FFF716F6EFF706F
      6EFF706E6DFF6E6C6BFF6D6B6AFF00000000FEFEFE01B4753CFFB57839FFBD8C
      4AFFC49D5AFFC9AB66FFCCB46EFFCDB871FFCDB770FFCBB16BFFC7A562FFC196
      54FFBA8343FF797979AE00000000000000000000000000000000FEFEFEFFEDE5
      E1FFEBE3DFFFF5F5F5FFF2F2F2FFEFEFEFFFEEEEEEFFEAE9E9FFDEDCDCFFE4E3
      E3FFE2E2E1FFE1E1E0FFF4F3F3FFB7B7B7FF000000000000000009094A9E0000
      91FF0000A9FF0000B9FF0000C5FF0000CBFF0000CDFF0000CAFF0000C1FF0000
      B4FF00009FFF010189FF00000814000000000000000000000000676564FF504E
      4DFF504E4DFF504E4DFF514F4EFF535150FF868382FF6A6867FF686665FF6866
      65FF686665FF686665FF6A6867FF00000000FEFEFE01A57C5BFFB1845DFFB891
      69FFBF9D75FFC3A67DFFC6AC83FFC7AE85FFC6AC83FFC2A77DFFBC9D74FFB490
      68FFAA8159FF7C7C7CAE00000000000000000000000000000000FFFFFFFFF0E8
      E4FFEDE5E1FFF8F8F8FFF5F5F5FFF2F2F2FFF1F1F1FFEDECECFFE1DFDFFFE7E6
      E6FFC6C3C2FFE2E2E1FFDAD8D8FFF8F8F8FF000000000000040A020286FF0000
      9DFF0000B5FF0000C6FF0000D4FF0000DBFF0000DDFF0000D9FF0000CFFF0000
      C0FF0000ACFF000096FF0D0D78F0000000000000000000000000686766FF504E
      4DFF504E4DFF504E4DFF504E4DFF52504FFF959290FF686665FF686665FF6866
      65FF686665FF686665FF6A6867FF00000000FEFEFE01A4A4A4FFC3C3C3FFCCCC
      CCFFD2D2D2FFD6D6D6FFD7D7D7FFD5D5D5FFCFD0CEFFC5C9C5FFAFCCABFFA7AF
      A4FFA1A1A1FF7F7F7FAE00000000000000000000000000000000FFFFFFFFF2EB
      E7FFF1EAE6FFFEFEFEFFFCFCFCFFF9F9F9FFF8F8F8FFF5F4F3FFE9E7E5FFEDED
      EDFFCBC9C8FFE7E7E7FFD8D7D6FFE4E4E3FF0000000012126BDD0B0B92FFA7A7
      CEFFCFCFDAFFCFCFD9FFCFCFD9FFCFCFD9FFCFCFDAFFCFCFD9FFCFCFD9FFCFCF
      D9FFD3D3DAFF1D1DA7FF0B0B88FF03031F4A00000000000000006A6867FF504E
      4DFF504E4DFF504E4DFFA5A4A3FF94918FFF92908DFF8C8988FFADACABFF6866
      65FF686665FF686665FF6A6867FF00000000FEFEFE01A9A9A9FFD2D2D2FFDFDF
      DFFFE6E6E6FFE9E9E9FF465833FFDEDED9FFDCE8D9FFDAE7D9FFDEEFD9FFD6E8
      C4FFD0D99FFF828282AE00000000000000000000000000000000FFFFFFFFF1E9
      E5FFF1E9E5FFFEFEFEFFFBFBFBFFF8F8F8FFF8F8F7FFC9CFDCFFBDC3D3FFEDEC
      ECFFCBC9C8FFE7E6E6FFDBD9D9FFE2E2E1FF0404275A222286FF20209FFFBBBB
      D9FFE3E3E4FFE4E4E4FFE4E4E4FFE4E4E4FFE4E4E4FFE4E4E4FFE4E4E4FFE4E4
      E4FFE7E7E5FF3232B1FF212195FF262680FF00000000000000006C6A69FF504E
      4DFF504E4DFFC9C7C7FF8A8785FF8D8A89FF8C8988FF888584FF82807FFFCFCE
      CEFF686665FF686665FF6A6867FF00000000FEFEFE01BABABAFFE6E6E6FFEDED
      EDFFF1F1F1FFF2F2F2FFEBECEBFF9AB194FF377E36FFE1ECDBFFDCDBCCFFECF0
      DCFFDCDAD5FF848484AE00000000000000000000000000000000FFFFFFFFDCD8
      D8FFDCD8D8FFDDDADAFFDCD9D9FFD9D6D6FFD9D6D5FFCBCEDBFFC2C4D2FFD0CE
      CDFFB8B4B3FFCBC9C8FFE0DFDEFFE5E4E4FF00000000414197FF3939A8FFD4D4
      E9FFFDFDF5FFFDFDF5FFFDFDF4FFFDFDF4FFFDFDF4FFFDFDF4FFFDFDF4FFFDFD
      F5FFFFFFF7FF4B4BBBFF3939A0FF1A1A55AB00000000000000006D6B6AFF7F7D
      7DFF7A7877FF7F7C7CFFFFFFFFFF868381FF858281FF82807FFF7C7A79FF7674
      73FF777575FF696666FF6A6867FF00000000FEFEFE01C5C5C5FFF1F1F1FFF6F6
      F6FFF8F8F8FFF8F8F8FFF6F6F6FF57A04BFF60AE59FF9DC597FFAECAA0FFBBC3
      9EFFF5EDDBFF878787AE00000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFDFDFDFFF8F8F8FFEBEAEAFFF2F2
      F2FFD0CDCDFFEDECECFFE1DFDFFFE7E6E6FF00000000050520485959B3FF4D4D
      BEFF4B4BCCFF4B4BD8FF4B4BE1FF4B4BE6FF4B4BE7FF4B4BE4FF4B4BDEFF4B4B
      D4FF4B4BC7FF5555BBFF5F5FAEFF000000000000000000000000949394FF6F6D
      6DFF757272FF858282FF9C9B9AFFFFFFFFFFA8A7A6FFFFFFFFFFFFFFFFFF7E7C
      7CFF7F7C7DFF797777FF797778FF00000000FEFEFE01CECECEFFF8F8F8FFFCFC
      FCFFFDFDFDFFFCFCFCFFF9F9F9FFAECBACFF77AD5EFF8AC575FFA0CC7BFFC0D1
      7DFFF5EDE0FF8A8A8AAE00000000000000000000000000000000E9E9E9FFE9E9
      E9FFE9E9E9FFE9E9E9FFE9E9E9FFEAEAEAFFE9E9E9FFE6E6E6FFE4E4E4FFE1E1
      E1FFDEDEDEFFDBDBDBFFD8D8D8FFD6D5D5FF00000000000000006060A4F27575
      C7FF7575D4FF7575DDFF7575E3FF7575E6FF7575E8FF7575E6FF7575E1FF7575
      D9FF7575CFFF7676C2FF0B0B2F65000000000000000000000000000000006C6A
      6BFF858483FF888787FF8B8989FF929191FF8C8A8AFF8A8988FFFFFFFFFFFFFF
      FFFF807F7FFF7C7B7BFF080708150000000000000000D5D5D5FFFDFDFDFFFFFF
      FFFFFFFFFFFFFDFDFDFFFBFBFBFF93C18DFF8DCC7BFF9FC474FFA3A75DFFD3CB
      AAFFB38A34FF8D857EAE00000000000000000000000001010104C0BEBBFFC0BE
      BBFFC0BEBBFFC0BEBCFFC0BEBCFFC0BEBCFFC0BEBCFFBFBDBBFFBDBBB9FFBBB8
      B7FFB9B6B4FFB7B4B2FFB5B2B0FFB2AEADFF0000000000000000000008159E9E
      D3FF9393D6FF9393DEFF9393E2FF9393E5FF9393E5FF9393E4FF9393E0FF9393
      DBFF9393D2FF8585BCF900000000000000000000000000000000000000000000
      0000676566FF898888FF8B8989FF8C8A8AFF8E8C8DFFFFFFFFFFFFFFFFFF8684
      84FF615F5FFF00000000000000000000000000000000BFBFBFFDFDFDFDFFFFFF
      FFFFFFFFFFFFFDFDFDFFFCFCFCFFE4EDE1FFA7D584FFADC06FFFC4B963FFA467
      27FFD89941FFD18430FF000000000000000000000000241F1949A68459FFA683
      59FFA68159FFA67F59FFA67D59FFA67C59FFA67A59FFA67859FFA67659FFA675
      59FFA67359FFA67159FFA67059FFA66E59FF0000000000000000000000004949
      7ABEB1B1DAFFB2B2E0FFB2B2E3FFB2B2E5FFB2B2E6FFB2B2E5FFB2B2E2FFB2B2
      DEFFBBBBDEFF01010F2500000000000000000000000000000000000000000000
      00000000000000000000767474FF8D8B8BFF8D8B8BFF8C8A8BFF8A8989FF0A0A
      0A1A0000000000000000000000000000000000000000E7E7E71ACBCBCBFDEDED
      EDFFEEEEEEFFEEEEEEFFEEEEEEFFEEEEEEFFD9DECEFFC9C07EFFD8B159FFD293
      3BFFC57428FFC37329FF995024E3000000000000000024201949A68559FFA683
      59FFA68259FFA68059FFA67E59FFA67C59FFA67B59FFA67959FFA67759FFA676
      59FFA67459FFA67259FFA67159FFA66F59FF0000000000000000000000000000
      0001DDDDEDFFD5D5EAFFD5D5ECFFD5D5EEFFD5D5EEFFD5D5EDFFD5D5ECFFD5D5
      E9FF74749CD70000000000000000000000000000000000000000000000000000
      0000000000000000000000000000605E5FFF8E8D8DFF5D5B5CFF000000000000
      000000000000000000000000000000000000000000000000000000000000FDFD
      FD02FDFDFD02FDFDFD02FDFDFD02FDFDFD02FDFDFD02FDFDFD02ECE0D03AE599
      46FECE7C31FEB76522FF964714FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000C0C336D28285CA828285CA828285CA828285CA828285CA828285CA82A2A
      5FAC000003070000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F7F1EF13AC613BF3A45933FFDFD5D4320000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF000000000000000300000000
      0000800300000000000080030000000000000003000000000000000300000000
      0000000300000000000000030000000000000003000000000000000300000000
      0000000300000000000080030000000000008003000000000000800100000000
      0000E001000000000000FFF00000000000000000000000000000000000000000
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
