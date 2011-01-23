inherited FullScreenDialogForm: TFullScreenDialogForm
  BorderStyle = bsNone
  Caption = 'FullScreenDialogForm'
  ClientHeight = 281
  ClientWidth = 488
  Color = clBackground
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 488
  ExplicitHeight = 281
  PixelsPerInch = 96
  TextHeight = 13
  object imgPicture: TAdvOfficeImage
    Left = 0
    Top = 0
    Width = 488
    Height = 281
    Align = alClient
    PopupMenu = pmn1
    Version = '1.0.3.0'
    OnClick = imgPictureClick
    ExplicitLeft = 112
    ExplicitTop = 56
    ExplicitWidth = 273
    ExplicitHeight = 169
  end
  object RzPanel1: TRzPanel
    Left = 112
    Top = 230
    Width = 281
    Height = 35
    Anchors = [akBottom]
    BorderOuter = fsNone
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 1
    Transparent = True
    DesignSize = (
      281
      35)
    object btnLast: TAdvGlassButton
      Left = 214
      Top = 5
      Width = 50
      Height = 32
      Action = actLast
      Anchors = [akBottom]
      BackColor = clBlack
      BackGroundSymbol = bsFastForward
      ButtonShape = btsCurvedRectangle
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ForeColor = clNone
      ForceTransparent = True
      GlowColor = 16760205
      InnerBorderColor = clBlack
      OuterBorderColor = clBlack
      ParentFont = False
      ShineColor = clWhite
      TabOrder = 0
      Version = '1.2.3.0'
    end
    object btnNext: TAdvGlassButton
      Left = 165
      Top = 5
      Width = 50
      Height = 32
      Action = actNext
      Anchors = [akBottom]
      BackColor = clBlack
      BackGroundSymbol = bsForward
      ButtonShape = btsCurvedRectangle
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ForeColor = clNone
      ForceTransparent = True
      GlowColor = 16760205
      InnerBorderColor = clBlack
      OuterBorderColor = clBlack
      ParentFont = False
      ShineColor = clWhite
      TabOrder = 1
      Version = '1.2.3.0'
    end
    object btnExit: TAdvGlassButton
      Left = 127
      Top = 5
      Width = 32
      Height = 32
      Action = actExit
      Anchors = [akBottom]
      BackColor = clBlack
      BackGroundSymbol = bsStop
      CornerRadius = 16
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ForeColor = clNone
      ForceTransparent = True
      GlowColor = 16760205
      InnerBorderColor = clBlack
      OuterBorderColor = clBlack
      ParentFont = False
      ShineColor = clWhite
      TabOrder = 2
      Version = '1.2.3.0'
    end
    object btnPrevious: TAdvGlassButton
      Left = 73
      Top = 5
      Width = 50
      Height = 32
      Action = actPrevious
      Anchors = [akBottom]
      BackColor = clBlack
      BackGroundSymbol = bsBackward
      ButtonDirection = bdLeft
      ButtonShape = btsCurvedRectangle
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ForeColor = clNone
      ForceTransparent = True
      GlowColor = 16760205
      InnerBorderColor = clBlack
      OuterBorderColor = clBlack
      ParentFont = False
      ShineColor = clWhite
      TabOrder = 3
      Version = '1.2.3.0'
    end
    object btnFirst: TAdvGlassButton
      Left = 22
      Top = 5
      Width = 50
      Height = 32
      Action = actFirst
      Anchors = [akBottom]
      BackColor = clBlack
      BackGroundSymbol = bsFastBackward
      ButtonDirection = bdLeft
      ButtonShape = btsCurvedRectangle
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ForeColor = clNone
      ForceTransparent = True
      GlowColor = 16760205
      InnerBorderColor = clBlack
      OuterBorderColor = clBlack
      ParentFont = False
      ShineColor = clWhite
      TabOrder = 4
      Version = '1.2.3.0'
    end
  end
  object FullScreen1: TFullScreen
    Left = 40
    Top = 16
  end
  object pmn1: TAdvPopupMenu
    OnPopup = pmn1Popup
    MenuStyler = AdvMenuOfficeStyler2
    Version = '2.5.3.3'
    Left = 416
    Top = 208
    object mnuNext: TMenuItem
      Action = actNext
    end
    object mnuPrevious: TMenuItem
      Action = actPrevious
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object mnuExit: TMenuItem
      Action = actExit
    end
  end
  object AdvMenuOfficeStyler2: TAdvMenuOfficeStyler
    AntiAlias = aaNone
    AutoThemeAdapt = False
    Style = osOffice2010Blue
    Background.Position = bpCenter
    Background.Color = clWhite
    Background.ColorTo = clWhite
    ButtonAppearance.DownColor = 7131391
    ButtonAppearance.DownColorTo = 8122111
    ButtonAppearance.HoverColor = 9102333
    ButtonAppearance.HoverColorTo = 14285309
    ButtonAppearance.DownBorderColor = 3181250
    ButtonAppearance.HoverBorderColor = 5819121
    ButtonAppearance.CaptionFont.Charset = DEFAULT_CHARSET
    ButtonAppearance.CaptionFont.Color = clWindowText
    ButtonAppearance.CaptionFont.Height = -11
    ButtonAppearance.CaptionFont.Name = 'Segoe UI'
    ButtonAppearance.CaptionFont.Style = []
    IconBar.Color = clWhite
    IconBar.ColorTo = clWhite
    IconBar.CheckColor = 12775932
    IconBar.CheckBorder = 3577330
    IconBar.RadioColor = 12775932
    IconBar.RadioBorder = 3577330
    IconBar.SeparatorColor = 15197410
    SelectedItem.Color = 14285309
    SelectedItem.ColorTo = 9102333
    SelectedItem.ColorMirror = 9102333
    SelectedItem.ColorMirrorTo = 14285309
    SelectedItem.BorderColor = 5819121
    SelectedItem.Font.Charset = DEFAULT_CHARSET
    SelectedItem.Font.Color = clWindowText
    SelectedItem.Font.Height = -12
    SelectedItem.Font.Name = #24494#36719#38597#40657
    SelectedItem.Font.Style = []
    SelectedItem.NotesFont.Charset = DEFAULT_CHARSET
    SelectedItem.NotesFont.Color = clWindowText
    SelectedItem.NotesFont.Height = -9
    SelectedItem.NotesFont.Name = #24494#36719#38597#40657
    SelectedItem.NotesFont.Style = []
    SelectedItem.CheckColor = 12775932
    SelectedItem.CheckBorder = 3577330
    SelectedItem.RadioColor = 12775932
    SelectedItem.RadioBorder = 3577330
    RootItem.Color = 16643823
    RootItem.ColorTo = 15784647
    RootItem.GradientDirection = gdVertical
    RootItem.Font.Charset = DEFAULT_CHARSET
    RootItem.Font.Color = clMenuText
    RootItem.Font.Height = -12
    RootItem.Font.Name = #24494#36719#38597#40657
    RootItem.Font.Style = []
    RootItem.SelectedColor = 8122111
    RootItem.SelectedColorTo = 7131391
    RootItem.SelectedColorMirror = 7131391
    RootItem.SelectedColorMirrorTo = 8122111
    RootItem.SelectedBorderColor = 3181250
    RootItem.HoverColor = 14285309
    RootItem.HoverColorTo = 9102333
    RootItem.HoverColorMirror = 9102333
    RootItem.HoverColorMirrorTo = 14285309
    RootItem.HoverBorderColor = 5819121
    RootItem.HoverTextColor = clBlack
    Glyphs.SubMenu.Data = {
      5A000000424D5A000000000000003E0000002800000004000000070000000100
      0100000000001C0000000000000000000000020000000200000000000000FFFF
      FF0070000000300000001000000000000000100000003000000070000000}
    Glyphs.Check.Data = {
      7E000000424D7E000000000000003E0000002800000010000000100000000100
      010000000000400000000000000000000000020000000200000000000000FFFF
      FF00FFFF0000FFFF0000FFFF0000FFFF0000FDFF0000F8FF0000F07F0000F23F
      0000F71F0000FF8F0000FFCF0000FFEF0000FFFF0000FFFF0000FFFF0000FFFF
      0000}
    Glyphs.Radio.Data = {
      7E000000424D7E000000000000003E0000002800000010000000100000000100
      010000000000400000000000000000000000020000000200000000000000FFFF
      FF00FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FC3F0000F81F0000F81F
      0000F81F0000F81F0000FC3F0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000}
    SideBar.Font.Charset = DEFAULT_CHARSET
    SideBar.Font.Color = clWhite
    SideBar.Font.Height = -19
    SideBar.Font.Name = 'Tahoma'
    SideBar.Font.Style = [fsBold, fsItalic]
    SideBar.Image.Position = bpCenter
    SideBar.Background.Position = bpCenter
    SideBar.SplitterColorTo = clBlack
    Separator.Color = 13224135
    Separator.ColorTo = 13224135
    Separator.GradientType = gtBoth
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMenuText
    Font.Height = -12
    Font.Name = #24494#36719#38597#40657
    Font.Style = []
    NotesFont.Charset = DEFAULT_CHARSET
    NotesFont.Color = clGray
    NotesFont.Height = -9
    NotesFont.Name = #24494#36719#38597#40657
    NotesFont.Style = []
    MenuBorderColor = 11578279
    Left = 448
    Top = 208
  end
  object actlst1: TActionList
    Left = 384
    Top = 208
    object actFirst: TAction
      Caption = 'actFirst'
      OnExecute = actFirstExecute
    end
    object actPrevious: TAction
      Caption = #19978#19968#24133
      ShortCut = 16464
      OnExecute = actPreviousExecute
    end
    object actExit: TAction
      Caption = #36864#20986
      ShortCut = 27
      OnExecute = actExitExecute
    end
    object actNext: TAction
      Caption = #19979#19968#24133
      ShortCut = 16462
      OnExecute = actNextExecute
    end
    object actLast: TAction
      Caption = 'actLast'
      OnExecute = actLastExecute
    end
  end
end
