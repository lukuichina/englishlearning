unit PictureLibrary;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ADODB, AdvOfficeStatusBar, AdvOfficeStatusBarStylers, AdvMenus,
  AdvMenuStylers, AdvStickyPopupMenu, AdvToolBar, AdvToolBarStylers, ExtDlgs,
  DB, Menus, ActnList, AdvSmoothImageListBox,
  AdvShapeButton, AdvGlowButton, AdvOfficeImage;

type
  TPictureLibraryForm = class(TAdvToolBarForm)
    AdvOfficeStatusBar2: TAdvOfficeStatusBar;
    advtlbrpgr1: TAdvToolBarPager;
    advpgAdvToolBarPager11: TAdvPage;
    advtlbr1: TAdvToolBar;
    btnRemoveMainPicture: TAdvGlowButton;
    btnAddMainPicture: TAdvGlowButton;
    btnAddPicture: TAdvGlowButton;
    advtlbr2: TAdvToolBar;
    btnPictureDisp: TAdvGlowButton;
    advtlbrWord: TAdvToolBar;
    btnWord: TAdvGlowButton;
    advpgAdvToolBarPager12: TAdvPage;
    advtlbr3: TAdvToolBar;
    btnWordExplanation: TAdvGlowButton;
    advtlbr4: TAdvToolBar;
    btnGooglePicture: TAdvGlowButton;
    advpgAdvToolBarPager13: TAdvPage;
    AdvQuickAccessToolBar1: TAdvQuickAccessToolBar;
    sbnMain: TAdvShapeButton;
    actlst1: TActionList;
    actAddMainPicture: TAction;
    actRemoveMainPicture: TAction;
    actAddPicture: TAction;
    actRemovePicture: TAction;
    actRefreshPicture: TAction;
    actAddDisp: TAction;
    actGooglePicture: TAction;
    actReplacePicture: TAction;
    actWordExplanation: TAction;
    actWordSelection: TAction;
    pmnPictureMenu: TAdvPopupMenu;
    mnuAddExplanation: TMenuItem;
    mnuDelete: TMenuItem;
    mnuExportToCsv: TMenuItem;
    mnuAddDisp: TMenuItem;
    cmdAdd: TADOCommand;
    cmdUpdate: TADOCommand;
    cmdDelete: TADOCommand;
    qryWordType: TADOQuery;
    dlgOpenPic1: TOpenPictureDialog;
    qryExplanation: TADOQuery;
    qryPictureMaxID: TADOQuery;
    TAdvToolBarOfficeStyler1: TAdvToolBarOfficeStyler;
    mnuExplanation: TAdvStickyPopupMenu;
    TAdvMenuOfficeStyler1: TAdvMenuOfficeStyler;
    AdvOfficeStatusBarOfficeStyler2: TAdvOfficeStatusBarOfficeStyler;
    spPicture: TADOStoredProc;
    mnuWordExplanation: TAdvStickyPopupMenu;
    cmdPictureDisp: TADOCommand;
    tblWordType: TADOTable;
    cmdReplacePicture: TADOCommand;
    lbxPicture: TAdvSmoothImageListBox;
    imgScreen: TAdvOfficeImage;
    btnRemovePicture: TAdvGlowButton;
    btnRefreshPicture: TAdvGlowButton;
    btnReplacePicture: TAdvGlowButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PictureLibraryForm: TPictureLibraryForm;

implementation

{$R *.dfm}

initialization
  RegisterClass(TPictureLibraryForm);

end.
