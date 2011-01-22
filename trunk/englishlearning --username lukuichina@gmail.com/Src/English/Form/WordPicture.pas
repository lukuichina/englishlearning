unit WordPicture;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ADODB, Menus, AdvMenus, ActnList, ImgList, DB,
  StdCtrls, AdvSmoothTabPager, AdvSmoothImageListBox,Typinfo, ExtCtrls,
  AdvSmoothExpanderGroup, DBAdvSmoothImageListBox, AdvSmoothToggleButton,
  ExtDlgs, AdvSmoothListBox, DBAdvSmoothListBox, AdvGlowButton, AdvToolBar,
  ToolWin, ComCtrls, AdvToolBarStylers, AdvShapeButton, AdvStickyPopupMenu,
  AdvMenuStylers, AdvAppStyler, ShellAPI, AdvOfficeStatusBar,
  AdvOfficeStatusBarStylers;

type
  TAdvSmoothImageListBoxItemEx = class(TAdvSmoothImageListBoxItem)
    FFields:TFields;

  public
    destructor Destroy; override;
    property Fields:TFields read FFields write FFields;

  end;

type
  TClickButton = (AddMainPicButton, RemoveMainPicButton, AddPicButton,
                  RemovePicButton, ReplacePicButton, RefreshPicButton);

type
  TFileType = (ftPicType, ftRtfType);

type
  TWordPictureForm = class(TAdvToolBarForm)
    actlst1: TActionList;
    pmnPictureMenu: TAdvPopupMenu;
    mnuAddExplanation: TMenuItem;
    mnuDelete: TMenuItem;
    mnuExportToCsv: TMenuItem;
    cmdAdd: TADOCommand;
    cmdUpdate: TADOCommand;
    cmdDelete: TADOCommand;
    tgr1: TAdvSmoothTabPager;
    tbg0: TAdvSmoothTabPage;
    img0: TAdvSmoothImageListBox;
    qryWordType: TADOQuery;
    tbg1: TAdvSmoothTabPage;
    img1: TAdvSmoothImageListBox;
    tbg2: TAdvSmoothTabPage;
    tbg3: TAdvSmoothTabPage;
    tbg4: TAdvSmoothTabPage;
    tbg5: TAdvSmoothTabPage;
    tbg6: TAdvSmoothTabPage;
    tbg7: TAdvSmoothTabPage;
    tbg8: TAdvSmoothTabPage;
    img2: TAdvSmoothImageListBox;
    img3: TAdvSmoothImageListBox;
    img4: TAdvSmoothImageListBox;
    img5: TAdvSmoothImageListBox;
    img6: TAdvSmoothImageListBox;
    img7: TAdvSmoothImageListBox;
    img8: TAdvSmoothImageListBox;
    dblbx0: TDBAdvSmoothImageListBox;
    dblbx1: TDBAdvSmoothImageListBox;
    dblbx2: TDBAdvSmoothImageListBox;
    dblbx3: TDBAdvSmoothImageListBox;
    dblbx4: TDBAdvSmoothImageListBox;
    dblbx5: TDBAdvSmoothImageListBox;
    dblbx6: TDBAdvSmoothImageListBox;
    dblbx7: TDBAdvSmoothImageListBox;
    dblbx8: TDBAdvSmoothImageListBox;
    tbg9: TAdvSmoothTabPage;
    tbg10: TAdvSmoothTabPage;
    dblbx9: TDBAdvSmoothImageListBox;
    img9: TAdvSmoothImageListBox;
    dblbx10: TDBAdvSmoothImageListBox;
    img10: TAdvSmoothImageListBox;
    actAddMainPicture: TAction;
    actRemoveMainPicture: TAction;
    actAddPicture: TAction;
    actRemovePicture: TAction;
    dlgOpenPic1: TOpenPictureDialog;
    qryExplanation: TADOQuery;
    qryPictureMaxID: TADOQuery;
    actRefreshPicture: TAction;
    mnuAddDisp: TMenuItem;
    actAddDisp: TAction;
    advtlbrpgr1: TAdvToolBarPager;
    advpgAdvToolBarPager11: TAdvPage;
    advpgAdvToolBarPager12: TAdvPage;
    advpgAdvToolBarPager13: TAdvPage;
    TAdvToolBarOfficeStyler1: TAdvToolBarOfficeStyler;
    AdvQuickAccessToolBar1: TAdvQuickAccessToolBar;
    sbnMain: TAdvShapeButton;
    advtlbr1: TAdvToolBar;
    btnRemoveMainPicture: TAdvGlowButton;
    btnAddMainPicture: TAdvGlowButton;
    btnAddPicture: TAdvGlowButton;
    btnRemovePicture: TAdvGlowButton;
    btnReplacePicture: TAdvGlowButton;
    mnuExplanation: TAdvStickyPopupMenu;
    TAdvMenuOfficeStyler1: TAdvMenuOfficeStyler;
    actGooglePicture: TAction;
    advtlbr3: TAdvToolBar;
    AdvOfficeStatusBar2: TAdvOfficeStatusBar;
    AdvOfficeStatusBarOfficeStyler2: TAdvOfficeStatusBarOfficeStyler;
    btnRefreshPicture: TAdvGlowButton;
    actReplacePicture: TAction;
    advtlbr4: TAdvToolBar;
    actWordExplanation: TAction;
    advtlbr2: TAdvToolBar;
    btnPictureDisp: TAdvGlowButton;
    btnGooglePicture: TAdvGlowButton;
    btnWordExplanation: TAdvGlowButton;
    spPicture: TADOStoredProc;
    mnuWordExplanation: TAdvStickyPopupMenu;
    cmdPictureDisp: TADOCommand;
    tblWordType: TADOTable;
    cmdReplacePicture: TADOCommand;

    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure imgItemSelect(Sender: TObject; itemindex: Integer);
    procedure dblbxItemSelect(Sender: TObject; itemindex: Integer);
    procedure actRemovePictureExecute(Sender: TObject);
    procedure actRemoveMainPictureExecute(Sender: TObject);
    procedure actAddMainPictureExecute(Sender: TObject);
    procedure actAddPictureExecute(Sender: TObject);
    procedure actRefreshPictureExecute(Sender: TObject);
    procedure imgItemZoomIn(Sender: TObject; itemindex: Integer;
      var allow: Boolean);
    procedure imgItemZoomedOut(Sender: TObject; itemindex: Integer);
    procedure imgMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnAddPictureMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure mnuExplanationItemClick(Sender: TObject; Index: Integer);
    procedure tgr1Change(Sender: TObject);
    procedure actGooglePictureExecute(Sender: TObject);
    procedure actAddDispExecute(Sender: TObject);
    procedure actReplacePictureExecute(Sender: TObject);
    procedure btnWordExplanationMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure actWordExplanationExecute(Sender: TObject);
    procedure mnuWordExplanationItemClick(Sender: TObject; Index: Integer);
  private
    { Private declarations }
    FWord:string;
    FWordType:Integer;
    FExplanationID:Integer;
    FIsChanged:Boolean;
    selectedExplanationID:array[0..10] of Integer;
    spMainPictureList,spPictureList:array[0..10] of TADOStoredProc;

    procedure ShowPicture;
    procedure ShowChangedPicture(button:TClickButton = RefreshPicButton);
    procedure SetImageItemInfo(ImageItem: TAdvSmoothImageListBoxItem; spPicInfo:TADOStoredProc;
      ImageList:TAdvSmoothImageListBox);
    procedure SetHeaderFooterInfo(ImageList: TAdvSmoothImageListBox;
      spPicInfo:TADOStoredProc; const itemIndex:Integer = 0);
    procedure LoadIcon;
    procedure ShowWordPicture(button:TClickButton = RefreshPicButton);
    procedure ShowWordTypePicture(index: Integer; button:TClickButton = RefreshPicButton);
    procedure InitExplanationMenu(menu:TAdvStickyPopupMenu;
      style:TStickyMenuItemStyle = isMenuItem; IsFirstSpecial:Boolean = False);

    procedure SetExplanationID(const value:Integer);
    procedure RefreshWordTypeExplanation;
    function  GetWordType(const value:Integer):string;
    function  GetFilePath(const Word,WordType:string; const ExplanationID,PictureID:Integer;
      const PicPath: string = ''; const FileType: TFileType = ftRtfType):string;
  public
    { Public declarations }
    property Word:string  read FWord write FWord;
    property WordType:Integer write FWordType;// read FWordType;
    property ExplanationID:Integer write SetExplanationID;
    property IsChanged:Boolean read FIsChanged;
  end;

var
  WordPictureForm: TWordPictureForm;

implementation

uses
  DataModule,IdHashMessageDigest,IdGlobal, IdHash, PictureDispDialog, AdvAPI;

{$R *.dfm}

destructor TAdvSmoothImageListBoxItemEx.Destroy;
begin
  FFields.Free;;
  inherited;
end;

procedure TWordPictureForm.actAddDispExecute(Sender: TObject);
var
  index,MainItemIndex,itemindex:integer;
  list,mainlist: TAdvSmoothImageListBox;
begin
  index := tgr1.ActivePageIndex;
  mainlist := TAdvSmoothImageListBox(tgr1.AdvSmoothTabPages[index].FindChildControl('dblbx' + IntToStr(index)));
  list := TAdvSmoothImageListBox(tgr1.AdvSmoothTabPages[index].FindChildControl('img' + IntToStr(index)));

  if (list.Items.Count = 0) or (list.SelectedItemIndex = -1) then
  begin
    MessageDlg('没有选择图片对象，请选择对象后再进行该处理！', mtError, [mbOK], 0);
    exit;
  end;

  spPictureList[index].First;
  spPictureList[index].RecNo := list.SelectedItemIndex + 1;

  try
    PictureDispDialogForm := TPictureDispDialogForm.Create(nil);
    PictureDispDialogForm.PictureDisp :=
        spPictureList[index].FieldByName('PictureDisp').AsString;
    PictureDispDialogForm.RtfPath := ConfigInfo.RtfPath +
        GetFilePath(FWord, spPictureList[index].FieldByName('WordType').AsString,
                    spPictureList[index].FieldByName('ExplanationID').AsInteger,
                    spPictureList[index].FieldByName('PictureID').AsInteger);

    if PictureDispDialogForm.ShowModal <> mrOk then
      Exit;

    if not DirectoryExists(ExtractFileDir(PictureDispDialogForm.RtfPath)) then
      CreateDirectory(PWideChar(ExtractFileDir(PictureDispDialogForm.RtfPath)),nil);

    PictureDispDialogForm.redtPictureDisp.Lines.SaveToFile(PictureDispDialogForm.RtfPath);
    FIsChanged := True;

    cmdPictureDisp.Parameters.ParamByName('Word').Value := FWord;
    cmdPictureDisp.Parameters.ParamByName('WordType').Value :=
        spPictureList[index].FieldByName('WordTypeID').AsInteger;
    cmdPictureDisp.Parameters.ParamByName('ExplanationID').Value :=
        spPictureList[index].FieldByName('ExplanationID').AsInteger;
    cmdPictureDisp.Parameters.ParamByName('PictureID').Value :=
        spPictureList[index].FieldByName('PictureID').AsInteger;
    cmdPictureDisp.Parameters.ParamByName('PictureDisp').Value :=
        PictureDispDialogForm.PictureDisp;

    cmdPictureDisp.Execute;

    MainItemIndex := mainlist.SelectedItemIndex;
    itemindex := list.SelectedItemIndex;

    ShowChangedPicture(RefreshPicButton);

    mainlist.SelectedItemIndex := MainItemIndex;
    list.SelectedItemIndex := itemindex;

  finally
    PictureDispDialogForm.Free;
  end;
end;

procedure TWordPictureForm.actAddMainPictureExecute(Sender: TObject);
var
  mainlist,list:TAdvSmoothImageListBox;
  index:integer;
  ItemIndex,MainItemIndex:Integer;
begin
  index := tgr1.ActivePageIndex;
  mainlist := TAdvSmoothImageListBox(tgr1.AdvSmoothTabPages[index].FindChildControl('dblbx'+IntToStr(index)));
  list := TAdvSmoothImageListBox(tgr1.AdvSmoothTabPages[index].FindChildControl('img'+IntToStr(index)));

  if (list.Items.Count = 0) or (list.SelectedItemIndex < 0) then
    Exit;

  spPictureList[index].RecNo := list.SelectedItemIndex + 1;

  cmdUpdate.Parameters.ParamByName('Word').Value := FWord;
  cmdUpdate.Parameters.ParamByName('WordType').Value := tgr1.ActivePageIndex;
  cmdUpdate.Parameters.ParamByName('ExplanationID').Value :=
      spPictureList[index].FieldByName('ExplanationID').AsInteger;
  cmdUpdate.Parameters.ParamByName('PictureID').Value :=
      spPictureList[index].FieldByName('PictureID').AsInteger;
  cmdUpdate.Parameters.ParamByName('MainPicture').Value := 1;

  cmdUpdate.Execute;

  FIsChanged := True;

  MainItemIndex := mainlist.SelectedItemIndex;
  ItemIndex := list.SelectedItemIndex;

  ShowChangedPicture(AddMainPicButton);

  mainlist.SelectedItemIndex := MainItemIndex;
  list.SelectedItemIndex := ItemIndex;
end;

procedure TWordPictureForm.actAddPictureExecute(Sender: TObject);
begin
  if selectedExplanationID[tgr1.ActivePageIndex] > 0 then
  begin
    mnuExplanationItemClick(mnuExplanation, selectedExplanationID[tgr1.ActivePageIndex] - 1);
  end;
end;

procedure TWordPictureForm.actGooglePictureExecute(Sender: TObject);
var
  URL:string;
begin;
  URL := 'http://www.google.com/images?q=' + FWord;
  ShellExecute(handle, 'open', PWideChar(URL), nil, nil, SW_SHOWNORMAL);
end;

procedure TWordPictureForm.actRefreshPictureExecute(Sender: TObject);
begin
  ShowChangedPicture(RefreshPicButton);
end;

procedure TWordPictureForm.actRemoveMainPictureExecute(Sender: TObject);
var
  list:TAdvSmoothImageListBox;
  index:integer;
begin
  index := tgr1.ActivePageIndex;
  list := TAdvSmoothImageListBox(tgr1.AdvSmoothTabPages[index].FindChildControl('dblbx'+IntToStr(index)));

  if (list.Items.Count = 0) or (list.SelectedItemIndex < 0) then
    Exit;

  spMainPictureList[index].RecNo := list.SelectedItemIndex + 1;

  cmdUpdate.Parameters.ParamByName('Word').Value := FWord;
  cmdUpdate.Parameters.ParamByName('WordType').Value := tgr1.ActivePageIndex;
  cmdUpdate.Parameters.ParamByName('ExplanationID').Value :=
      spMainPictureList[index].FieldByName('ExplanationID').AsInteger;
  cmdUpdate.Parameters.ParamByName('PictureID').Value :=
      spMainPictureList[index].FieldByName('PictureID').AsInteger;
  cmdUpdate.Parameters.ParamByName('MainPicture').Value := 0;

  cmdUpdate.Execute;

  FIsChanged := True;

  ShowChangedPicture(RemoveMainPicButton);
end;

procedure TWordPictureForm.actRemovePictureExecute(Sender: TObject);
var
  mainlist,list:TAdvSmoothImageListBox;
  index:integer;
  strPicName,strTmpName:string;
  MainItemIndex,ItemIndex:Integer;
begin
  index := tgr1.ActivePageIndex;
  mainlist := TAdvSmoothImageListBox(tgr1.AdvSmoothTabPages[index].FindChildControl('dblbx'+IntToStr(index)));
  list := TAdvSmoothImageListBox(tgr1.AdvSmoothTabPages[index].FindChildControl('img'+IntToStr(index)));

  if (list.Items.Count = 0) or (list.SelectedItemIndex < 0) then
    Exit;

  spPictureList[index].RecNo := list.SelectedItemIndex + 1;
  strPicName := ConfigInfo.PicPath + spPictureList[index].FieldByName('PictureName').AsString;

  cmdDelete.Parameters.ParamByName('Word').Value := FWord;
  cmdDelete.Parameters.ParamByName('WordType').Value := tgr1.ActivePageIndex;
  cmdDelete.Parameters.ParamByName('ExplanationID').Value :=
      spPictureList[index].FieldByName('ExplanationID').AsInteger;
  cmdDelete.Parameters.ParamByName('PictureID').Value :=
      spPictureList[index].FieldByName('PictureID').AsInteger;

  cmdDelete.Execute;

  FIsChanged := True;

  strTmpName := configInfo.TmpPath + ExtractFileName(strPicName);
  if FileExists(strPicName) then
    MoveFileEx(PWideChar(strPicName), PWideChar(strTmpName), MOVEFILE_REPLACE_EXISTING);

  MainItemIndex := mainlist.SelectedItemIndex;
  ItemIndex := list.SelectedItemIndex;

  ShowChangedPicture(RemovePicButton);

  //mainlist.SelectedItemIndex := MainItemIndex;
  //list.SelectedItemIndex := ItemIndex;
end;

procedure TWordPictureForm.actReplacePictureExecute(Sender: TObject);
 var
  mainlist,list:TAdvSmoothImageListBox;
  index:integer;
  strPicName,strTmpName:string;
  MainItemIndex,ItemIndex:Integer;
begin
  index := tgr1.ActivePageIndex;
  mainlist := TAdvSmoothImageListBox(tgr1.AdvSmoothTabPages[index].FindChildControl('dblbx'+IntToStr(index)));
  list := TAdvSmoothImageListBox(tgr1.AdvSmoothTabPages[index].FindChildControl('img'+IntToStr(index)));

  if (list.Items.Count = 0) or (list.SelectedItemIndex < 0) then
    Exit;

  dlgOpenPic1.Options := dlgOpenPic1.Options - [ofAllowMultiSelect];
  if not dlgOpenPic1.Execute then
    exit;

  spPictureList[index].RecNo := list.SelectedItemIndex + 1;

  cmdReplacePicture.Parameters.ParamByName('Word').Value := FWord;
  cmdReplacePicture.Parameters.ParamByName('WordType').Value := tgr1.ActivePageIndex;
  cmdReplacePicture.Parameters.ParamByName('ExplanationID').Value :=
      spPictureList[index].FieldByName('ExplanationID').AsInteger;
  cmdReplacePicture.Parameters.ParamByName('PictureID').Value :=
      spPictureList[index].FieldByName('PictureID').AsInteger;
//  cmdReplacePicture.Parameters.ParamByName('PictureName').Value := //dlgOpenPic1.FileName;

  cmdReplacePicture.Execute;

  FIsChanged := True;

  strPicName := ConfigInfo.PicPath + spPictureList[index].FieldByName('PictureName').AsString;
  strTmpName := configInfo.TmpPath + ExtractFileName(strPicName);
  if FileExists(strPicName) then
    MoveFileEx(PWideChar(strPicName), PWideChar(strTmpName), MOVEFILE_REPLACE_EXISTING);

  if not DirectoryExists(ExtractFileDir(strPicName)) then
    CreateDirectory(PWideChar(ExtractFileDir(strPicName)),nil);

  CopyFile(PWideChar(dlgOpenPic1.FileName), PWideChar(strPicName), False);

  FIsChanged := True;

  MainItemIndex := mainlist.SelectedItemIndex;
  ItemIndex := list.SelectedItemIndex;

  ShowChangedPicture(ReplacePicButton);

  mainlist.SelectedItemIndex := MainItemIndex;
  list.SelectedItemIndex := ItemIndex;
end;

procedure TWordPictureForm.actWordExplanationExecute(Sender: TObject);
//var
//  tabindex:integer;
begin
//  if InDropDownRect(btnAddDisp) then
//    exit;
//
//  qryWordType.Close;
//  qryWordType.Parameters.ParamByName('Word').Value := FWord;
//  qryWordType.Open;
//
//  if qryWordType.RecordCount = 0 then
//    exit;
//
////  ShowWordPicture;
//
//  qryWordType.First;
//  qryWordType.RecNo := tgr1.ActivePageIndex + 1;
////  repeat
//    tabindex := qryWordType.FieldByName('WordTypeID').AsInteger;
//    selectedExplanationID[tabindex] := 0;
//
//    ShowWordTypePicture(tabindex);
//
////    qryWordType.Next;
////  until qryWordType.Eof;
end;

procedure TWordPictureForm.btnWordExplanationMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  p:TPoint;
begin
  if not mnuWordExplanation.IsVisible then
  begin
//    if not InDropDownRect(btnAddDisp, X,Y) then
//      exit;

    InitExplanationMenu(mnuWordExplanation, isRadioButton, True);
    SetPopUpMenuCheck(mnuWordExplanation, selectedExplanationID[tgr1.ActivePageIndex]);

    p.X := btnWordExplanation.Left + btnWordExplanation.Margins.Left;
    p.Y := btnWordExplanation.Top + advtlbrpgr1.Height - btnWordExplanation.Margins.Top - advtlbr3.CaptionHeight;
    p := ClientToScreen(p);

    mnuWordExplanation.ShowMenu(p.X, p.Y);
  end
  else
  begin
    mnuWordExplanation.HideMenu;
  end;
end;

procedure TWordPictureForm.btnAddPictureMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  p:TPoint;
begin
  if not mnuExplanation.IsVisible then
  begin
    if selectedExplanationID[tgr1.ActivePageIndex] > 0 then
      exit;

    InitExplanationMenu(mnuExplanation, isRadioButton);
    SetPopUpMenuCheck(mnuExplanation, selectedExplanationID[tgr1.ActivePageIndex] - 1);

    p.X := btnAddPicture.Left + btnAddPicture.Margins.Left;
    p.Y := btnAddPicture.Top + advtlbrpgr1.Height - btnAddPicture.Margins.Top - advtlbr1.CaptionHeight;
    p := ClientToScreen(p);
    mnuExplanation.ShowMenu(p.X, p.Y);
  end
  else
  begin
    mnuExplanation.HideMenu;
  end;
end;

procedure TWordPictureForm.dblbxItemSelect(Sender: TObject;
  itemindex: Integer);
var
  list:TAdvSmoothImageListBox;
  index:integer;
begin
  index := tgr1.ActivePageIndex;
  list := TDBAdvSmoothImageListBox(tgr1.AdvSmoothTabPages[index].FindChildControl('dblbx'+IntToStr(index)));

  if tgr1.ActivePageIndex = 0 then
  begin
    spMainPictureList[0].RecNo := itemindex + 1;
    list.Header.Caption := spMainPictureList[0].FieldByName('WordType').AsString + '  ' +
                           spMainPictureList[0].FieldByName('Explanation').AsString;
//    list.Footer.Caption := qryMainPicture0.FieldByName('PictureDisp').AsString + #13#10#13#10 +
//                           list.Items[itemindex].FileName;
  end
  else
  begin
    spMainPictureList[index].RecNo := itemindex + 1;
    list.Header.Caption := spMainPictureList[index].FieldByName('WordType').AsString + '  ' +
                           spMainPictureList[index].FieldByName('Explanation').AsString;
//    list.Footer.Caption := qryMainPictureList[index].FieldByName('PictureDisp').AsString + #13#10#13#10 +
//                           list.Items[itemindex].FileName;
  end;

  list.Footer.Caption := list.Items[itemindex].FileName;
end;

procedure TWordPictureForm.FormCreate(Sender: TObject);
var
  i:Integer;
begin
  for i := 0 to High(spPictureList) do
  begin
    selectedExplanationID[i] := 0;

    spMainPictureList[i] := TADOStoredProc.Create(self);
    spMainPictureList[i].Connection := DataModule.dmManager.conEnglish;
    spMainPictureList[i].ProcedureName := spPicture.ProcedureName;
    spMainPictureList[i].Parameters := spPicture.Parameters;

    spPictureList[i] := TADOStoredProc.Create(self);
    spPictureList[i].Connection := DataModule.dmManager.conEnglish;
    spPictureList[i].ProcedureName := spPicture.ProcedureName;
    spPictureList[i].Parameters := spPicture.Parameters;
  end;

  LoadIcon;
end;

procedure TWordPictureForm.FormShow(Sender: TObject);
var
  i:integer;
  //list:TAdvSmoothImageListBox;
begin
  for i := 1 to tgr1.AdvSmoothTabPageCount - 1 do
  begin
    tgr1.AdvSmoothTabPages[i].TabVisible := False;
    //list := TDBAdvSmoothImageListBox(tgr1.AdvSmoothTabPages[i].FindChildControl('img'+IntToStr(i)));
  end;

  ShowPicture;

  tgr1.ActivePageIndex := FWordType;
  advtlbrpgr1.ActivePageIndex := 0;
end;

procedure TWordPictureForm.imgItemZoomedOut(Sender: TObject;
  itemindex: Integer);
var
  list:TAdvSmoothImageListBox;
begin
  list := TAdvSmoothImageListBox(Sender);
  list.Items.BeginUpdate;
  list.Items[itemindex].Location := '';
  list.Items[itemindex].Image.LoadFromFile(list.Items[itemindex].FileName);
  list.Items.EndUpdate;
end;


procedure TWordPictureForm.imgItemZoomIn(Sender: TObject; itemindex: Integer;
  var allow: Boolean);
var
  list:TAdvSmoothImageListBox;
begin
  list := TAdvSmoothImageListBox(Sender);
  list.Items.BeginUpdate;
  list.Items[itemindex].Image.Assign(nil);
  list.Items[itemindex].Location := list.Items[itemindex].FileName;
  list.Items.EndUpdate;
end;

procedure TWordPictureForm.imgMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
//var
//  p:TPoint;
//  xx,yy,w,h:Integer;
begin
//  if Button <> mbRight then
//    exit;
//
//  xx:= Round(img1.Items[img1.SelectedItemIndex].GetImageRectangle.X);
//  yy:= Round(img1.Items[img1.SelectedItemIndex].GetImageRectangle.y);
//  w := Round(img1.Items[img1.SelectedItemIndex].GetImageRectangle.Width);
//  h := Round(img1.Items[img1.SelectedItemIndex].GetImageRectangle.Height);
//
//  if not ((x > xx) and (x < xx + w) and (y > yy) and (y < yy + h)) then
//    exit;
//
//  p.X := x;
//  p.Y := y;
//  p:= img1.ClientToScreen(p);
//  //GetCursorPos(p);
//  pmnPictureMenu.Popup(p.X, p.Y);
end;

procedure TWordPictureForm.imgItemSelect(Sender: TObject; itemindex: Integer);
var
  list:TAdvSmoothImageListBox;
  index:integer;
begin
  index := tgr1.ActivePageIndex;
  list := TDBAdvSmoothImageListBox(tgr1.AdvSmoothTabPages[index].FindChildControl('img'+IntToStr(index)));

  if tgr1.ActivePageIndex = 0 then
  begin
    spPictureList[0].RecNo := itemindex + 1;
    list.Header.Caption := spPictureList[0].FieldByName('WordType').AsString + '  ' +
                           spPictureList[0].FieldByName('Explanation').AsString;
//    list.Footer.Caption := qryPicture0.FieldByName('PictureDisp').AsString + #13#10#13#10 +
//                           list.Items[itemindex].FileName;
  end
  else
  begin
    spPictureList[index].RecNo := itemindex + 1;
    list.Header.Caption := spPictureList[index].FieldByName('WordType').AsString + '  ' +
                           spPictureList[index].FieldByName('Explanation').AsString;
//    list.Footer.Caption := qryPictureList[index].FieldByName('PictureDisp').AsString + #13#10#13#10 +
//                           list.Items[itemindex].FileName;
  end;

  list.Footer.Caption := list.Items[itemindex].FileName;
end;

procedure TWordPictureForm.mnuExplanationItemClick(Sender: TObject;
  Index: Integer);
var
  strPicName,strTmpName :string;
  i:Integer;
begin
  dlgOpenPic1.DefaultExt := ConfigInfo.TmpPath;
  dlgOpenPic1.Options := dlgOpenPic1.Options + [ofAllowMultiSelect];

  if not dlgOpenPic1.Execute then
    exit;

  qryExplanation.First;
  qryExplanation.RecNo := Index + 1;

  for i := 0 to dlgOpenPic1.Files.Count - 1 do
  begin
    qryPictureMaxID.Close;
    qryPictureMaxID.Parameters.ParamByName('Word').Value := FWord;
    qryPictureMaxID.Parameters.ParamByName('WordType').Value := tgr1.ActivePageIndex;
    qryPictureMaxID.Parameters.ParamByName('ExplanationID').Value :=
        qryExplanation.FieldByName('ExplanationID').AsInteger;
    qryPictureMaxID.Open;

//    strPicName := Format('%s\%s\%s_%s_%d_%d%s', [UpperCase(FWord[1]),
//        FWord,FWord,qryExplanation.FieldByName('WordType').AsString,
//        qryExplanation.FieldByName('ExplanationID').AsInteger,
//        qryPictureMaxID.FieldByName('PictureID').AsInteger,
//        ExtractFileExt(dlgOpenPic1.Files[i])]);
    strPicName := GetFilePath(FWord, qryExplanation.FieldByName('WordType').AsString,
        qryExplanation.FieldByName('ExplanationID').AsInteger,
        qryPictureMaxID.FieldByName('PictureID').AsInteger,
        dlgOpenPic1.Files[i], ftPicType);

    cmdAdd.Parameters.ParamByName('Word').Value := FWord;
    cmdAdd.Parameters.ParamByName('WordType').Value := tgr1.ActivePageIndex;

    cmdAdd.Parameters.ParamByName('Word2').Value := FWord;
    cmdAdd.Parameters.ParamByName('WordType2').Value := tgr1.ActivePageIndex;

    cmdAdd.Parameters.ParamByName('ExplanationID').Value :=
        qryExplanation.FieldByName('ExplanationID').AsInteger;
    cmdAdd.Parameters.ParamByName('ExplanationID2').Value :=
        qryExplanation.FieldByName('ExplanationID').AsInteger;

    cmdAdd.Parameters.ParamByName('MainPicture').Value := 0;
    cmdAdd.Parameters.ParamByName('PictureName').Value := strPicName;

    strPicName := ConfigInfo.PicPath + strPicName;
    cmdAdd.Execute;

    FIsChanged := True;

    strTmpName := configInfo.TmpPath + ExtractFileName(strPicName);
    if FileExists(strPicName) then
      MoveFileEx(PWideChar(strPicName), PWideChar(strTmpName), MOVEFILE_REPLACE_EXISTING);

    if not DirectoryExists(ExtractFileDir(strPicName)) then
      CreateDirectory( PWideChar(ExtractFileDir(strPicName)),nil);

    CopyFile(PWideChar(dlgOpenPic1.Files[i]), PWideChar(strPicName), False);
  end;

//  selectedExplanationID[tgr1.ActivePageIndex] := index;

  ShowChangedPicture(AddPicButton);
end;

procedure TWordPictureForm.mnuWordExplanationItemClick(Sender: TObject;
  Index: Integer);
var
  tabindex:integer;
begin
  qryWordType.Close;
  qryWordType.Parameters.ParamByName('Word').Value := FWord;
  qryWordType.Open;

  if qryWordType.RecordCount = 0 then
    exit;

//  ShowWordPicture;

//  qryWordType.First;
//  qryWordType.RecNo := tgr1.ActivePageIndex;// + 1;
//  repeat
    tabindex := qryWordType.FieldByName('WordTypeID').AsInteger;
    selectedExplanationID[tabindex] := Index;// + 1;
    btnAddPicture.DropDownButton := index = 0;//selectedExplanationID[tgr1.ActivePageIndex] = 0;

//    if Index = 0 then
//      dlgOpenPic1.Options := dlgOpenPic1.Options + [ofAllowMultiSelect]
//    else
//      dlgOpenPic1.Options := dlgOpenPic1.Options - [ofAllowMultiSelect];

    ShowWordTypePicture(tabindex);

//    qryWordType.Next;
//  until qryWordType.Eof;
end;

procedure TWordPictureForm.InitExplanationMenu(menu:TAdvStickyPopupMenu;
  style:TStickyMenuItemStyle = isMenuItem; IsFirstSpecial:Boolean = False);
var
  item:TStickyMenuItem;
begin
  menu.MenuItems.Clear;

  //qryWordType.First;
  //qryWordType.RecNo := tgr1.ActivePageIndex;// + 1;

  qryExplanation.Close;
  qryExplanation.Parameters.ParamByName('Word').Value := FWord;
  qryExplanation.Parameters.ParamByName('WordTypeID').Value := tgr1.ActivePageIndex;
      //qryWordType.FieldByName('WordTypeID').AsInteger;
  qryExplanation.Open;

  if qryExplanation.RecordCount = 0 then
    exit;

  if IsFirstSpecial then
  begin
    item := menu.MenuItems.Add;
    item.Caption := '*  所有解释';
    item.HideOnClick := True;
    item.Style := style;
  end;

  while not qryExplanation.Eof do
  begin
    item := menu.MenuItems.Add;
    item.Caption := Format('%d  %s',[qryExplanation.RecNo,
        qryExplanation.FieldByName('Explanation').AsString]);
    item.HideOnClick := True;
    item.Style := style;

    qryExplanation.Next;
  end;
end;


procedure TWordPictureForm.ShowPicture;
var
  index:integer;
begin
  qryWordType.Close;
  qryWordType.Parameters.ParamByName('Word').Value := FWord;
  qryWordType.Open;

  if qryWordType.RecordCount = 0 then
    exit;

  ShowWordPicture;

  repeat
    index := qryWordType.FieldByName('WordTypeID').AsInteger;

    ShowWordTypePicture(index);

    qryWordType.Next;
  until qryWordType.Eof;
end;

procedure TWordPictureForm.ShowChangedPicture(button:TClickButton = RefreshPicButton);
var
  index:integer;
begin
  qryWordType.Close;
  qryWordType.Parameters.ParamByName('Word').Value := FWord;
  qryWordType.Open;

  if qryWordType.RecordCount = 0 then
    exit;

  ShowWordPicture;

//  qryWordType.First;
//  qryWordType.RecNo := tgr1.ActivePageIndex;// + 1;
//  repeat
    index := tgr1.ActivePageIndex;//qryWordType.FieldByName('WordTypeID').AsInteger;

    ShowWordTypePicture(index);

//    qryWordType.Next;
//  until qryWordType.Eof;
end;

procedure TWordPictureForm.SetImageItemInfo(ImageItem: TAdvSmoothImageListBoxItem;
  spPicInfo:TADOStoredProc;ImageList:TAdvSmoothImageListBox);
var
  strPicName :string;
  rft:TStringList;
begin
  strPicName := ConfigInfo.PicPath + spPicInfo.FieldByName('PictureName').AsString;

  ImageItem.Image.LoadFromFile(strPicName);
  //ImageItem.Location := strPicName;
  ImageItem.Caption.Location := TAdvSmoothImageListBoxLocation(cpCenterCenter);
  ImageItem.Caption.Text := Format('image%3d', [spPicInfo.RecNo]);
  ImageItem.FileName := strPicName;
  ImageItem.Hint := spPicInfo.FieldByName('PictureDisp').AsString;
//  rft := TStringList.Create;
//  rft.LoadFromFile(ConfigInfo.RtfPath +
//      ChangeFileExt(spPicInfo.FieldByName('PictureName').AsString, '.rtf'));
//  ImageItem.Hint := rft.Text;
//  rft.Free;
end;

procedure TWordPictureForm.SetHeaderFooterInfo(ImageList: TAdvSmoothImageListBox;
  spPicInfo:TADOStoredProc; const itemIndex:Integer = 0);
begin
  if ImageList.Items.Count = 0 then
    exit;

  ImageList.SelectedItemIndex := itemIndex;
  spPicInfo.RecNo := ImageList.SelectedItemIndex + 1;
  ImageList.Header.Caption := spPicInfo.FieldByName('WordType').AsString + '  ' +
                              spPicInfo.FieldByName('Explanation').AsString;
  ImageList.Footer.Caption := //qryPicInfo.FieldByName('PictureDisp').AsString + #13#10#13#10 +
                              ImageList.Items[ImageList.SelectedItemIndex].FileName;
end;

procedure TWordPictureForm.LoadIcon;
const
  ICON_ADDMAINPICTURE = 'ico\up.png';
  ICON_REMOVEMAINPICTURE = 'ico\down.png';
  ICON_ADDPICTURE = 'ico\add.png';
  ICON_REMOVEPICTURE = 'ico\del.png';
  ICON_REFRESHPICTURE = 'ico\refresh.png';
begin
//    btnAddMainPic.Picture.LoadFromFile(ICON_ADDMAINPICTURE);
//    btnRemoveMainPic.Picture.LoadFromFile(ICON_REMOVEMAINPICTURE);
//    btnAddPic.Picture.LoadFromFile(ICON_ADDPICTURE);
//    btnRemovePic.Picture.LoadFromFile(ICON_REMOVEPICTURE);
//    btnRefreshPic.Picture.LoadFromFile(ICON_REFRESHPICTURE);
end;

procedure TWordPictureForm.ShowWordPicture(button:TClickButton = RefreshPicButton);
var
  list: TAdvSmoothImageListBox;
  mainitem: TAdvSmoothImageListBoxItem;
  item: TAdvSmoothImageListBoxItem;
  mainlist: TDBAdvSmoothImageListBox;
//  ExplanationID:integer;
begin
  spMainPictureList[0].Close;
  spMainPictureList[0].Parameters.ParamByName('@Word').Value := FWord;
  spMainPictureList[0].Parameters.ParamByName('@WordType').Value := 0;
  spMainPictureList[0].Parameters.ParamByName('@ExplanationID').Value :=
      selectedExplanationID[0];
  spMainPictureList[0].Parameters.ParamByName('@PictureType').Value := 1;
  spMainPictureList[0].Open;

  spPictureList[0].Close;
  spPictureList[0].Parameters.ParamByName('@Word').Value := FWord;
  spPictureList[0].Parameters.ParamByName('@WordType').Value := 0;
  spPictureList[0].Parameters.ParamByName('@ExplanationID').Value :=
      selectedExplanationID[0];
  spPictureList[0].Parameters.ParamByName('@PictureType').Value := 0;
  spPictureList[0].Open;

  mainlist := TDBAdvSmoothImageListBox(tgr1.AdvSmoothTabPages[0].FindChildControl('dblbx' + IntToStr(0)));
  list := TAdvSmoothImageListBox(tgr1.AdvSmoothTabPages[0].FindChildControl('img' + IntToStr(0)));

  if button in [AddMainPicButton,RemoveMainPicButton,RemovePicButton,RefreshPicButton] then
  begin
    mainlist.Items.BeginUpdate;
    mainlist.Items.Clear;
    while not spMainPictureList[0].Eof do
    begin
      mainitem := mainlist.Items.Add;
      SetImageItemInfo(mainitem, spMainPictureList[0], mainlist);
      spMainPictureList[0].Next;
    end;
    SetHeaderFooterInfo(mainlist, spMainPictureList[0]);
    mainlist.Items.EndUpdate;
  end;

//  ExplanationID := qryPicture0.FieldByName('ExplanationID').AsInteger;

  if button in [AddPicButton,RemovePicButton,RefreshPicButton] then
  begin
    list.Items.BeginUpdate;
    list.Items.Clear;
    while not spPictureList[0].Eof do
    begin
      item := list.Items.Add;

//    if ExplanationID = qryPicture0.FieldByName('ExplanationID').AsInteger then
//    begin
      SetImageItemInfo(item, spPictureList[0], list);

//      ExplanationID := qryPicture0.FieldByName('ExplanationID').AsInteger;
      spPictureList[0].Next;
//    end
//    else
//    begin
//      item.Splitter := True;
//      item.SplitterState := stExpanded;
//
//      ExplanationID := qryPicture0.FieldByName('ExplanationID').AsInteger;
//    end;
    end;
    SetHeaderFooterInfo(list, spPictureList[0]);
    list.Items.EndUpdate;
  end;
end;

procedure TWordPictureForm.ShowWordTypePicture(index: Integer; button:TClickButton = RefreshPicButton);
var
  spCurrentPicture: TADOStoredProc;
  item: TAdvSmoothImageListBoxItem;
  mainitem: TAdvSmoothImageListBoxItem;
  mainlist: TDBAdvSmoothImageListBox;
  spCurrentMainPicture: TADOStoredProc;
  list: TAdvSmoothImageListBox;
//  ExplanationID:integer;
begin
  spCurrentMainPicture := spMainPictureList[index];
  spCurrentPicture := spPictureList[index];

  spCurrentMainPicture.Close;
  spCurrentMainPicture.Parameters.ParamByName('@Word').Value := FWord;
  spCurrentMainPicture.Parameters.ParamByName('@WordType').Value :=  index;
//      qryWordType.FieldByName('WordTypeID').AsInteger;
  spCurrentMainPicture.Parameters.ParamByName('@ExplanationID').Value :=
      selectedExplanationID[index];
  spCurrentMainPicture.Parameters.ParamByName('@PictureType').Value := 1;
  spCurrentMainPicture.Open;

  spCurrentPicture.Close;
  spCurrentPicture.Parameters.ParamByName('@Word').Value := FWord;
  spCurrentPicture.Parameters.ParamByName('@WordType').Value := index;
//      qryWordType.FieldByName('WordTypeID').AsInteger;
  spCurrentPicture.Parameters.ParamByName('@ExplanationID').Value :=
      selectedExplanationID[index];
  spCurrentPicture.Parameters.ParamByName('@PictureType').Value := 0;
  spCurrentPicture.Open;

  tgr1.AdvSmoothTabPages[index].TabVisible := True;
  tgr1.AdvSmoothTabPages[index].Caption := GetWordType(index);
    //qryWordType.FieldByName('WordType').AsString;

  mainlist := TDBAdvSmoothImageListBox(tgr1.AdvSmoothTabPages[index].FindChildControl('dblbx' + IntToStr(index)));
  list := TAdvSmoothImageListBox(tgr1.AdvSmoothTabPages[index].FindChildControl('img' + IntToStr(index)));

  if button in [AddMainPicButton,RemoveMainPicButton,RemovePicButton,RefreshPicButton] then
  begin
    mainlist.Items.BeginUpdate;
    mainlist.Items.Clear;
    while not spCurrentMainPicture.Eof do
    begin
      mainitem := Mainlist.Items.Add;
      SetImageItemInfo(mainitem, spCurrentMainPicture, mainlist);
      spCurrentMainPicture.Next;
    end;
    SetHeaderFooterInfo(mainlist, spCurrentMainPicture);
    mainlist.Items.EndUpdate;
  end;

//  ExplanationID := qryCurrentPicture.FieldByName('ExplanationID').AsInteger;

  if button in [AddPicButton,RemovePicButton,RefreshPicButton] then
  begin
    list.Items.BeginUpdate;
    list.Items.Clear;
    while not spCurrentPicture.Eof do
    begin
      item := list.Items.Add;

//    if ExplanationID = qryCurrentPicture.FieldByName('ExplanationID').AsInteger then
//    begin
      SetImageItemInfo(item, spCurrentPicture, list);

//      ExplanationID := qryCurrentPicture.FieldByName('ExplanationID').AsInteger;
      spCurrentPicture.Next;
//    end
//    else
//    begin
//      item.Splitter := True;
//      //item.SplitterText := qryCurrentPicture.FieldByName('WordType').AsString;
//      item.SplitterState := stExpanded;
//
//      ExplanationID := qryCurrentPicture.FieldByName('ExplanationID').AsInteger;
//    end;
  end;
    SetHeaderFooterInfo(list, spCurrentPicture);
    list.Items.EndUpdate;
  end;
end;

procedure TWordPictureForm.tgr1Change(Sender: TObject);
begin
  advtlbr1.Enabled := tgr1.ActivePageIndex <> 0;
  advtlbr2.Enabled := tgr1.ActivePageIndex <> 0;
  advtlbr3.Enabled := tgr1.ActivePageIndex <> 0;

  if tgr1.ActivePageIndex > 0 then
  begin
    RefreshWordTypeExplanation;
    btnAddPicture.DropDownButton := selectedExplanationID[tgr1.ActivePageIndex] = 0;
  end;
end;

procedure TWordPictureForm.SetExplanationID(const value:Integer);
begin
  selectedExplanationID[FWordType] := value;
end;

procedure TWordPictureForm.RefreshWordTypeExplanation;
begin
//  qryWordType.First;
//  qryWordType.RecNo := tgr1.ActivePageIndex;
  // + 1;
  qryExplanation.Close;
  qryExplanation.Parameters.ParamByName('Word').Value := FWord;
  qryExplanation.Parameters.ParamByName('WordTypeID').Value := tgr1.ActivePageIndex;
      //qryWordType.FieldByName('WordTypeID').AsInteger;
  qryExplanation.Open;
end;

function TWordPictureForm.GetWordType(const value:Integer):string;
begin
  Result := tblWordType.Lookup('ID',value,'Disp')
end;

function TWordPictureForm.GetFilePath(const Word, WordType: string;
    const ExplanationID: Integer; const PictureID: Integer;
    const PicPath: string = ''; const FileType: TFileType = ftRtfType):string;
begin
  if FileType = ftPicType then
  begin
    Result := Format('%s\%s\%s_%s_%d_%d%s', [UpperCase(Word[1]),
      Word, Word, WordType, ExplanationID, PictureID, ExtractFileExt(PicPath)]);
  end
  else if FileType = ftRtfType then
  begin
    Result := Format('%s\%s\%s_%s_%d_%d%s', [UpperCase(Word[1]),
      Word, Word, WordType, ExplanationID, PictureID, '.rtf']);
  end;
end;

end.
