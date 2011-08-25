unit WordView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AdvSmoothExpanderGroup, AdvSmoothImageListBox, AdvSmoothMenu,
  AdvSmoothLabel, AdvOfficeTabSet, AdvOfficePager, AdvOfficePagerStylers,
  AdvOfficeButtons, AdvStickyPopupMenu, AdvToolBar, AdvSmoothTouchKeyBoard,
  AdvGlowButton, AdvGlassButton, ActnList, DB, ADODB, Menus, AdvMenus, StdCtrls,
  AdvMenuStylers, ImgList, GDIPPictureContainer,ShellAPI, AdvOfficeImage,
  ExtCtrls, AdvSplitter, WordViewView, WordViewController, Gauges, WordViewThread;

type
  TWordViewForm = class(TForm, IWordViewView)
    grp1: TAdvSmoothExpanderGroup;
    lbxPicture: TAdvSmoothImageListBox;
    AdvOfficePagerOfficeStyler1: TAdvOfficePagerOfficeStyler;
    TAdvOfficePager1: TAdvOfficePager;
    TAdvOfficePage1: TAdvOfficePage;
    TAdvOfficePage2: TAdvOfficePage;
    TAdvOfficePage3: TAdvOfficePage;
    mnuWordType: TAdvStickyPopupMenu;
    btnWordRange: TAdvGlowButton;
    actlst1: TActionList;
    actWordRange: TAction;
    actMainPic: TAction;
    btnWordType: TAdvGlowButton;
    advmnfcstylr1: TAdvMenuOfficeStyler;
    ilt1: TImageList;
    pmnWordRange: TAdvPopupMenu;
    item11: TMenuItem;
    item21: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    actNoMainPic: TAction;
    actNoExp: TAction;
    actAll: TAction;
    actManagePicture: TAction;
    btnManagePicture: TAdvGlowButton;
    actWordExplanation: TAction;
    spWord: TADOStoredProc;
    actWordType: TAction;
    tblWordType: TADOTable;
    iltWordType: TImageList;
    btnManagePicture1: TAdvGlowButton;
    btnKingExplanation: TAdvGlowButton;
    actKingExplanation: TAction;
    actGooglePicture: TAction;
    btnWordOption: TAdvGlowButton;
    actWordOption: TAction;
    btnWordExplanation: TAdvGlowButton;
    mnuWordOption: TAdvStickyPopupMenu;
    btnNormalView: TAdvGlowButton;
    btnMaxView: TAdvGlowButton;
    actNormalView: TAction;
    actClientView: TAction;
    actScreenView: TAction;
    imgScreen: TAdvOfficeImage;
    btnScreenView: TAdvGlowButton;
    AdvSplitter1: TAdvSplitter;
    btnGooglePicture2: TAdvGlowButton;
    btnScreenView1: TAdvGlowButton;
    actOnePicture: TAction;
    actMultyPicture: TAction;
    btnClientView: TAdvGlowButton;
    actMaxView: TAction;
    spWordPicture: TADOStoredProc;
    procedure actWordRangeExecute(Sender: TObject);
    procedure lbxPictureItemSelect(Sender: TObject; itemindex: Integer);
    procedure actMainPicExecute(Sender: TObject);
    procedure actNoMainPicExecute(Sender: TObject);
    procedure actNoExpExecute(Sender: TObject);
    procedure actAllExecute(Sender: TObject);
    procedure actManagePictureExecute(Sender: TObject);
    procedure actWordExplanationExecute(Sender: TObject);
    procedure mnuWordTypeItemClick(Sender: TObject; Index: Integer);
    procedure FormCreate(Sender: TObject);
    procedure btnWordTypeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnWordRangeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure actKingExplanationExecute(Sender: TObject);
    procedure actGooglePictureExecute(Sender: TObject);
    procedure btnWordOptionMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure mnuWordOptionItemClick(Sender: TObject; Index: Integer);
    procedure lbxPictureItemZoomIn(Sender: TObject; itemindex: Integer;
      var allow: Boolean);
    procedure lbxPictureItemZoomedOut(Sender: TObject; itemindex: Integer);
    procedure FormResize(Sender: TObject);
    procedure actClientViewExecute(Sender: TObject);
    procedure actMaxViewExecute(Sender: TObject);
    procedure actMultyPictureExecute(Sender: TObject);
    procedure actNormalViewExecute(Sender: TObject);
    procedure actOnePictureExecute(Sender: TObject);
    procedure actScreenViewExecute(Sender: TObject);
    procedure imgScreenClick(Sender: TObject);
    procedure lbxPictureNavigate(Sender: TObject; NavigationMode:
        TAdvSmoothImageListBoxNavigationMode; var allow: Boolean);
    procedure pmnWordRangePopup(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FBeginWord:string;
    FEndWord:string;
    FViewType:Integer;
    FWordType:Integer;
    FHavingData:Boolean;
    FIsWordRangeMenuPopuped :Boolean;
    FWordViewController:IWordViewController;
    FProgressForm: TForm;                                  {进度窗体}
    FGauge: TGauge;                                        {进度条}
    FShowProgress :Boolean;
    //var
    WordViewThread:TWordViewThread;
    FThreadFinished:Boolean;

    procedure SetImageList(const qryWordRange:TADOQuery);
    procedure SetPopUpMenuCheck(const ViewType:Integer);
    procedure OnTerminate(Sender:TObject);
    procedure CreateProcessForm(AOwner: TComponent);
    procedure UpdateProgress(const value:Integer);
    { Private declarations }
  public
    { Public declarations }
    property ShowProgress: Boolean read FShowProgress write FShowProgress;
  end;

var
  WordViewForm: TWordViewForm;

implementation

uses
  WordRange, DataModule, WordPicture, WordExplain, FullScreenDialog, AdvAPI,
  CommonInfo;

{$R *.dfm}

procedure TWordViewForm.actAllExecute(Sender: TObject);
begin
  try
    WordRangeForm := TWordRangeForm.Create(nil);

    if WordRangeForm.ShowModal <> mrOk then
      exit;

    FBeginWord := WordRangeForm.WordStart;
    FEndWord := WordRangeForm.WordEnd;
    FViewType := 0;
    //FWordType := 0;

    spWord.Close;
//    spWord.Parameters.ParamByName('@BeginWord').Value := FBeginWord;
//    spWord.Parameters.ParamByName('@EndWord').Value := FEndWord;
    spWord.Parameters.ParamByName('@SessionID').Value := SessionInfo.SessionID;
    spWord.Parameters.ParamByName('@ViewType').Value := FViewType;
    spWord.Parameters.ParamByName('@WordType').Value := 0;
    spWord.Open;

    FHavingData := True;//spWord.RecordCount > 0;
    SetPopUpMenuCheck(FViewType);

    SetImageList(nil);

  finally
    WordRangeForm.Free;
  end;
end;

procedure TWordViewForm.actClientViewExecute(Sender: TObject);
begin
  lbxPicture.Header.Visible := False;
  lbxPicture.Footer.Visible := False;
end;

procedure TWordViewForm.actGooglePictureExecute(Sender: TObject);
var
  Word:string;
  URL:string;
begin
  if (lbxPicture.Items.Count = 0) or (lbxPicture.SelectedItemIndex = -1) then
  begin
    MessageDlg('没有选择单词对象，请选择对象后再进行该处理！', mtError, [mbOK], 0);
    exit;
  end;

  Word := lbxPicture.Items[lbxPicture.SelectedItemIndex].Caption.Text;
  URL := 'http://www.google.com/images?q=' + Word;
  ShellExecute(handle, 'open', PWideChar(configInfo.Browser), PWideChar(URL), nil, SW_SHOWNORMAL);
  //ShellExecute(handle, 'open', PWideChar(URL), nil, nil, SW_SHOWNORMAL);
end;

procedure TWordViewForm.actKingExplanationExecute(Sender: TObject);
var
  Word:string;
  URL:string;
begin
  if (lbxPicture.Items.Count = 0) or (lbxPicture.SelectedItemIndex = -1) then
  begin
    MessageDlg('没有选择单词对象，请选择对象后再进行该处理！', mtError, [mbOK], 0);
    exit;
  end;

  Word := lbxPicture.Items[lbxPicture.SelectedItemIndex].Caption.Text;
  URL := 'http://www.iciba.com/' + Word;
  ShellExecute(handle, 'open', PWideChar(configInfo.Browser), PWideChar(URL), nil, SW_SHOWNORMAL);
  //ShellExecute(handle, 'open', PWideChar(URL), nil, nil, SW_SHOWNORMAL);
  end;

procedure TWordViewForm.actMainPicExecute(Sender: TObject);
begin
  try
    WordRangeForm := TWordRangeForm.Create(nil);
    WordRangeForm.WordStart := FBeginWord;
    WordRangeForm.WordEnd := FEndWord;
    WordRangeForm.ViewType := FViewType;

    if WordRangeForm.ShowModal <> mrOk then
      exit;

    FBeginWord := WordRangeForm.WordStart;
    FEndWord := WordRangeForm.WordEnd;
    FViewType := WordRangeForm.ViewType; //1;
    //FWordType := 0;

    FWordViewController.InsertWordView(FBeginWord, FEndWord);

    spWord.Close;
//    spWord.Parameters.ParamByName('@BeginWord').Value := FBeginWord;
//    spWord.Parameters.ParamByName('@EndWord').Value := FEndWord;
    spWord.Parameters.ParamByName('@SessionID').Value := SessionInfo.SessionID;
    spWord.Parameters.ParamByName('@ViewType').Value := FViewType;
    spWord.Parameters.ParamByName('@WordType').Value := 0;
    spWord.Open;

    FHavingData := True;//spWord.RecordCount > 0;
    SetPopUpMenuCheck(FViewType);

    SetImageList(nil);

  finally
    WordRangeForm.Free;
  end;
end;

procedure TWordViewForm.actManagePictureExecute(Sender: TObject);
begin
  if (lbxPicture.Items.Count = 0) or (lbxPicture.SelectedItemIndex = -1) then
  begin
    MessageDlg('没有选择单词对象，请选择对象后再进行该处理！', mtError, [mbOK], 0);
    exit;
  end;

  try
    WordPictureForm := TWordPictureForm.Create(nil);

    spWord.First;
    spWord.RecNo := lbxPicture.SelectedItemIndex + 1;
    WordPictureForm.Word := spWord.FieldByName('Word').AsString;
    WordPictureForm.WordType := spWord.FieldByName('WordTypeID').AsInteger;
    WordPictureForm.ExplanationID := spWord.FieldByName('ExplanationID').AsInteger;

    WordPictureForm.ShowModal;

    if WordPictureForm.IsChanged then
    begin
      spWord.Close;
      spWord.Open;

      SetImageList(nil);
      lbxPicture.ScrollToItem(lbxPicture.SelectedItemIndex);
    end;

  finally
    WordPictureForm.Free;
  end;
end;

procedure TWordViewForm.actMaxViewExecute(Sender: TObject);
begin
  TAdvOfficePager1.Visible  := False;
  lbxPicture.Header.Visible := False;
  lbxPicture.Footer.Visible := False;

  WindowState := wsMaximized;
end;

procedure TWordViewForm.actMultyPictureExecute(Sender: TObject);
begin
//  imgScreen.Hide;
//
//  lbxPicture.Items.BeginUpdate;
//  lbxPicture.ItemAppearance.ItemWidth := 140;
//  lbxPicture.ItemAppearance.ItemHeight := 140;
//  lbxPicture.ItemAppearance.ImageWidth := 140;
//  lbxPicture.ItemAppearance.ImageHeight := 140;
//
//  if WindowState = wsNormal then
//    lbxPicture.Columns := 7
//  else if WindowState = wsMinimized then
//    lbxPicture.Columns := 9;
//
//  lbxPicture.Items.EndUpdate;
end;

procedure TWordViewForm.SetImageList(const qryWordRange:TADOQuery);
var
  item: TAdvSmoothImageListBoxItem;
  strPicName: string;
//var
//  WordViewThread:TWordViewThread;
begin
  TAdvOfficePage1.Enabled := False;
  TAdvOfficePage2.Enabled := False;
  TAdvOfficePage3.Enabled := False;
//  btnWordOption.Enabled := False;
//  btnWordType.Enabled := False;
//  btnWordExplanation.Enabled := False;
//  btnManagePicture.Enabled := False;
//  btnKingExplanation.Enabled := False;
//  btnManagePicture1.Enabled := False;
//
//  btnNormalView.Enabled := False;
//  btnClientView.Enabled := False;
//  btnMaxView.Enabled := False;
//  btnScreenView.Enabled := False;
//  btnScreenView1.Enabled := False;
//  btnGooglePicture2.Enabled := False;
  //lbxPicture.Items.BeginUpdate;

  lbxPicture.Items.Clear;
  lbxPicture.Header.Caption := '';
  lbxPicture.Footer.Caption := '';
  lbxPicture.Enabled := False;

  //显示进度窗体
  if ShowProgress then
    CreateProcessForm(nil);

  FThreadFinished := False;
  WordViewThread := TWordViewThread.Create(True);
  WordViewThread.WordStoredProc := spWord;
  WordViewThread.PictureListBox := lbxPicture;
  WordViewThread.WordViewThreadEvent := UpdateProgress;
  //WordViewThread.ShowProgress := True;
  WordViewThread.Resume;
  WordViewThread.OnTerminate := OnTerminate;

//  spWord.First;
//  while not spWord.Eof do
//  begin
//    strPicName := ConfigInfo.PicPath + spWord.FieldByName('PictureName').AsString;
//
//    item := lbxPicture.Items.Add;
//
//    if FileExists(strPicName) then
//      item.Image.LoadFromFile(strPicName);
//
//    item.FileName := strPicName;
//    item.Caption.Text := spWord.FieldByName('Word').AsString;
//    item.Caption.Location := TAdvSmoothImageListBoxLocation(cpCenterCenter);
//
//    spWord.Next;
//  end;

//  lbxPictureItemSelect(lbxPicture, 0);
//
//  lbxPicture.Items.EndUpdate;

end;

procedure TWordViewForm.OnTerminate(Sender: TObject);
begin
  if ShowProgress then
      FreeAndNil(FProgressForm);

  MessageDlg(Format('图片加载完毕！共%d幅图片！', [lbxPicture.Items.Count]), mtInformation, [mbOK], 0);

  lbxPictureItemSelect(lbxPicture, 0);
  lbxPicture.SelectedItemIndex := 0;
  lbxPicture.ScrollToItem(0);
  lbxPicture.Enabled := True;

  //lbxPicture.Items.EndUpdate;
  TAdvOfficePage1.Enabled := True;
  TAdvOfficePage2.Enabled := True;
  TAdvOfficePage3.Enabled := True;
//  btnWordOption.Enabled := True;
//  btnWordType.Enabled := True;
//  btnWordExplanation.Enabled := True;
//  btnManagePicture.Enabled := True;
//  btnKingExplanation.Enabled := True;
//  btnManagePicture1.Enabled := True;
//
//  btnNormalView.Enabled := True;
//  btnClientView.Enabled := True;
//  btnMaxView.Enabled := True;
//  btnScreenView.Enabled := True;
//  btnScreenView1.Enabled := True;
//  btnGooglePicture2.Enabled := True;

    FThreadFinished := True;
end;

procedure TWordViewForm.actNoExpExecute(Sender: TObject);
begin
  try
    WordRangeForm := TWordRangeForm.Create(nil);

    if WordRangeForm.ShowModal <> mrOk then
      exit;

    FBeginWord := WordRangeForm.WordStart;
    FEndWord := WordRangeForm.WordEnd;
    FViewType := 3;
    //FWordType := 0;

    spWord.Close;
//    spWord.Parameters.ParamByName('@BeginWord').Value := FBeginWord;
//    spWord.Parameters.ParamByName('@EndWord').Value := FEndWord;
    spWord.Parameters.ParamByName('@SessionID').Value := SessionInfo.SessionID;
    spWord.Parameters.ParamByName('@ViewType').Value := FViewType;
    spWord.Parameters.ParamByName('@WordType').Value := 0;
    spWord.Open;

    FHavingData := True;//spWord.RecordCount > 0;
    SetPopUpMenuCheck(FViewType);

    SetImageList(nil);

  finally
    WordRangeForm.Free;
  end;
end;

procedure TWordViewForm.actNoMainPicExecute(Sender: TObject);
begin
  try
    WordRangeForm := TWordRangeForm.Create(nil);

    if WordRangeForm.ShowModal <> mrOk then
      exit;

    FBeginWord := WordRangeForm.WordStart;
    FEndWord := WordRangeForm.WordEnd;
    FViewType := 2;
    //FWordType := 0;

    spWord.Close;
//    spWord.Parameters.ParamByName('@BeginWord').Value := FBeginWord;
//    spWord.Parameters.ParamByName('@EndWord').Value := FEndWord;
    spWord.Parameters.ParamByName('@SessionID').Value := SessionInfo.SessionID;
    spWord.Parameters.ParamByName('@ViewType').Value := FViewType;
    spWord.Parameters.ParamByName('@WordType').Value := 0;
    spWord.Open;

    FHavingData := True;//spWord.RecordCount > 0;
    SetPopUpMenuCheck(FViewType);

    SetImageList(nil);

  finally
    WordRangeForm.Free;
  end;
end;

procedure TWordViewForm.actNormalViewExecute(Sender: TObject);
begin
  lbxPicture.Header.Visible := True;
  lbxPicture.Footer.Visible := True;
end;

procedure TWordViewForm.actOnePictureExecute(Sender: TObject);
var
  i:Integer;
begin
//  lbxPicture.Items.BeginUpdate;
////  lbxPicture.ItemAppearance.ItemWidth := lbxPicture.ClientWidth;
////  lbxPicture.ItemAppearance.ItemHeight := lbxPicture.ClientHeight;
////  lbxPicture.ItemAppearance.ImageWidth := lbxPicture.ClientWidth;
////  lbxPicture.ItemAppearance.ImageHeight := lbxPicture.ClientHeight;
////  lbxPicture.Columns := 1;
//  for i := 0 to lbxPicture.Items.CountSelected - 1 do
//  begin
//    lbxPicture.Items[i].Visible := false;
//  end;
//
//  imgScreen.Parent := lbxPicture;
//  imgScreen.Left := lbxPicture.Left;
//  imgScreen.Top := lbxPicture.Top + lbxPicture.Header.Height;
//  imgScreen.Width := lbxPicture.Width;
//  imgScreen.Height := lbxPicture.Height - lbxPicture.Footer.Height - lbxPicture.Footer.Height;
//  imgScreen.Picture.LoadFromFile(lbxPicture.Items[lbxPicture.SelectedItemIndex].FileName);
//  imgScreen.Show;
//
//  lbxPicture.Items.EndUpdate;
end;

procedure TWordViewForm.actScreenViewExecute(Sender: TObject);
//var
//  item:array[0..0] of integer;
begin
  if (lbxPicture.Items.Count = 0) {or (lbxPicture.SelectedItemIndex = -1)} then
  begin
    //MessageDlg('没有选择单词对象，请选择对象后再进行该处理！', mtError, [mbOK], 0);
    exit;
  end;

  try
    FullScreenDialogForm := TFullScreenDialogForm.Create(nil);

    FullScreenDialogForm.SpWord := spWord;

    if lbxPicture.SelectedItemIndex > 0 then
      FullScreenDialogForm.CurrentIndex := lbxPicture.SelectedItemIndex
    else
      FullScreenDialogForm.CurrentIndex := 0;

    FullScreenDialogForm.ShowModal;

    lbxPicture.SelectedItemIndex := FullScreenDialogForm.CurrentIndex;
    lbxPictureItemSelect(Sender, FullScreenDialogForm.CurrentIndex);
  finally
    FullScreenDialogForm.Free;
  end;
end;

procedure TWordViewForm.actWordExplanationExecute(Sender: TObject);
begin
  if (lbxPicture.Items.Count = 0) or (lbxPicture.SelectedItemIndex = -1) then
  begin
    MessageDlg('没有选择单词对象，请选择对象后再进行该处理！', mtError, [mbOK], 0);
    exit;
  end;

  try
    WordExplainForm := TWordExplainForm.Create(nil);

    spWord.First;
    spWord.RecNo := lbxPicture.SelectedItemIndex + 1;
    WordExplainForm.Word := spWord.FieldByName('Word').AsString;

    WordExplainForm.ShowModal;

    if WordExplainForm.IsChanged then
    begin
      spWord.Close;
      spWord.Open;

      SetImageList(nil);
      lbxPicture.ScrollToItem(lbxPicture.SelectedItemIndex);
    end;

  finally
    WordExplainForm.Free;
  end;
end;

procedure TWordViewForm.actWordRangeExecute(Sender: TObject);
begin
  actMainPicExecute(Sender);
end;

procedure TWordViewForm.btnWordOptionMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  p:TPoint;
begin
  if not mnuWordOption.IsVisible then
  begin
    p.X := btnWordOption.Left;
    p.Y := TAdvOfficePager1.Top + TAdvOfficePager1.Height - 5;
    p := ClientToScreen(p);
    mnuWordOption.ShowMenu(p.X, p.Y);
  end
  else
  begin
    mnuWordOption.HideMenu;
  end;
end;

procedure TWordViewForm.btnWordRangeMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
//  if not InDropDownRect(btnWordRange) then
//    exit;
//
//  if AnyPopup then
//  begin
//    btnWordRange.DropDownMenu.CloseMenu;
//  end;

end;

procedure TWordViewForm.btnWordTypeMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  p:TPoint;
begin
  if not mnuWordType.IsVisible then
  begin
    p.X := btnWordType.Left;
    p.Y := TAdvOfficePager1.Top + TAdvOfficePager1.Height - 5;
    p := ClientToScreen(p);
    mnuWordType.ShowMenu(p.X, p.Y);
  end
  else
  begin
    mnuWordType.HideMenu;
  end;
end;

procedure TWordViewForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FWordViewController.DeleteWordView;

  if not FThreadFinished then
  begin
    if not WordViewThread.Suspended then
      WordViewThread.Suspend;
  end;

  if ShowProgress then
      FreeAndNil(FProgressForm);
end;

procedure TWordViewForm.FormCreate(Sender: TObject);
var
  item:TStickyMenuItem;
begin
  FWordViewController := TWordViewController.Create(self);

  tblWordType.Close;
  tblWordType.Open;

  mnuWordType.MenuItems.Clear;
  while not tblWordType.Eof do
  begin
    item := mnuWordType.MenuItems.Add;
    item.ImageIndex := tblWordType.RecNo - 1;
    item.Caption := tblWordType.FieldByName('Name').AsString;
    item.HideOnClick := True;
    item.Style := isRadioButton;

    tblWordType.Next;
  end;

  TAdvOfficePager1.ActivePageIndex := 0;

  FViewType := 1;
  FShowProgress := True;
  FThreadFinished := True;
end;

procedure TWordViewForm.FormResize(Sender: TObject);
begin
  if WindowState = wsMaximized then
    lbxPicture.Columns := 9
  else if WindowState = wsNormal then
  begin
    if NOT TAdvOfficePager1.Visible then
    begin
      TAdvOfficePager1.Visible  := True;
      lbxPicture.Header.Visible := True;
      lbxPicture.Footer.Visible := True;
    end;

    lbxPicture.Columns := 7;
  end;
end;

procedure TWordViewForm.FormShow(Sender: TObject);
begin
  try
    if Self.Owner = nil then
      exit;

//    WordRangeForm := TWordRangeForm.Create(nil);
//
//    if WordRangeForm.ShowModal <> mrOk then
//      exit;
//
//    FBeginWord := WordRangeForm.WordStart;
//    FEndWord := WordRangeForm.WordEnd;
//    FViewType := 1;
    FViewType := 1;
    //FWordType := 0;

    spWord.Close;
//    spWord.Parameters.ParamByName('@BeginWord').Value := FBeginWord;
//    spWord.Parameters.ParamByName('@EndWord').Value := FEndWord;
    spWord.Parameters.ParamByName('@SessionID').Value := SessionInfo.SessionID;
    spWord.Parameters.ParamByName('@ViewType').Value := FViewType;
    spWord.Parameters.ParamByName('@WordType').Value := 0;
    spWord.Open;

    FHavingData := True;//spWord.RecordCount > 0;
    SetPopUpMenuCheck(FViewType);

    SetImageList(nil);

    btnWordRange.Enabled := False;
  finally
//    WordRangeForm.Free;
  end;
end;

procedure TWordViewForm.imgScreenClick(Sender: TObject);
begin
  //imgScreen.Hide;
end;

procedure TWordViewForm.lbxPictureItemSelect(Sender: TObject;
  itemindex: Integer);
begin
  spWord.First;

  if spWord.RecordCount = 0 then
    exit;

  spWord.RecNo := itemindex + 1;

  lbxPicture.Header.Caption := //spWord.FieldByName('Word').AsString + '        ' +
                               spWord.FieldByName('WordType').AsString + '  ' +
                               spWord.FieldByName('Explanation').AsString;

  lbxPicture.Footer.Caption := lbxPicture.Items[itemindex].FileName;
end;

procedure TWordViewForm.lbxPictureItemZoomedOut(Sender: TObject;
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

procedure TWordViewForm.lbxPictureItemZoomIn(Sender: TObject;
  itemindex: Integer; var allow: Boolean);
var
  list:TAdvSmoothImageListBox;
begin
  list := TAdvSmoothImageListBox(Sender);
  list.Items.BeginUpdate;
  list.Items[itemindex].Image.Assign(nil);
  list.Items[itemindex].Location := list.Items[itemindex].FileName;
  list.Items.EndUpdate;
end;

procedure TWordViewForm.lbxPictureNavigate(Sender: TObject; NavigationMode:
    TAdvSmoothImageListBoxNavigationMode; var allow: Boolean);
begin
  if not imgScreen.Visible then
    exit;

  imgScreen.Picture.LoadFromFile(lbxPicture.Items[lbxPicture.SelectedItemIndex].FileName);
end;

procedure TWordViewForm.mnuWordOptionItemClick(Sender: TObject; Index: Integer);
var
  intWordType:Integer;
begin
  mnuWordOption.HideMenu;

  if not FHavingData then
  begin
    MessageDlg('没有选择单词范围，请选择单词范围后再进行该处理！', mtError, [mbOK], 0);
    mnuWordOption.MenuItems[index].Checked := False;
    exit;
  end;

  FViewType := Index;
  intWordType := 0;

  spWord.Close;
//  spWord.Parameters.ParamByName('@BeginWord').Value := FBeginWord;
//  spWord.Parameters.ParamByName('@EndWord').Value := FEndWord;
  spWord.Parameters.ParamByName('@SessionID').Value := SessionInfo.SessionID;
  spWord.Parameters.ParamByName('@ViewType').Value := FViewType;
  spWord.Parameters.ParamByName('@WordType').Value := intWordType;
  spWord.Open;

  SetPopUpMenuCheck(FViewType);

  SetImageList(nil);
end;

procedure TWordViewForm.mnuWordTypeItemClick(Sender: TObject; Index: Integer);
var
  intWordType:Integer;
begin
  mnuWordType.HideMenu;

  if not FHavingData then
  begin
    MessageDlg('没有选择单词范围，请选择单词范围后再进行该处理！', mtError, [mbOK], 0);
    mnuWordType.MenuItems[index].Checked := False;
    exit;
  end;

  tblWordType.First;
  tblWordType.RecNo := Index + 1;
  intWordType := tblWordType.FieldByName('ID').AsInteger;

  spWord.Close;
//  spWord.Parameters.ParamByName('@BeginWord').Value := FBeginWord;
//  spWord.Parameters.ParamByName('@EndWord').Value := FEndWord;
  spWord.Parameters.ParamByName('@SessionID').Value := SessionInfo.SessionID;
  spWord.Parameters.ParamByName('@ViewType').Value := FViewType;
  spWord.Parameters.ParamByName('@WordType').Value := intWordType;
  spWord.Open;

  SetImageList(nil);
end;

procedure TWordViewForm.pmnWordRangePopup(Sender: TObject);
begin
  if FIsWordRangeMenuPopuped then
  begin
    FIsWordRangeMenuPopuped := False;
    exit;
  end;
end;

procedure  TWordViewForm.SetPopUpMenuCheck(const ViewType:Integer);
var
  i:Integer;
begin
  for i := 0 to mnuWordOption.MenuItems.Count - 1 do
  begin
    mnuWordOption.MenuItems[i].Checked := False;
  end;

  for i := 0 to mnuWordType.MenuItems.Count - 1 do
  begin
    mnuWordType.MenuItems[i].Checked := False;
  end;

  if FHavingData then
    mnuWordOption.MenuItems[ViewType].Checked := True;
end;

procedure TWordViewForm.CreateProcessForm(AOwner: TComponent);
var
  Panel: TPanel;
  Prompt: TLabel;                                           {提示的标签}
  bsNone:TBorderStyle;
  //bcNone:TBevelCut;
begin
  if Assigned(FProgressForm) then
    exit;

  FProgressForm := TForm.Create(AOwner);
  with FProgressForm do
  begin
    try
      Font.Name := '宋体';                                  {设置字体}
      Font.Size := 9;
      BorderStyle := bsNone;
      Width := 300;
      Height := 100;
      BorderWidth := 1;
      Color := clBlack;
      Position := poOwnerFormCenter;
      //Position := poScreenCenter;

      Panel := TPanel.Create(FProgressForm);
      with Panel do
      begin
        Parent := FProgressForm;
        Align := alClient;
        BevelInner := bvNone;
        BevelOuter := bvRaised;
        Caption := '';
      end;

      Prompt := TLabel.Create(Panel);
      with Prompt do
      begin
        Parent := Panel;
        AutoSize := True;
        Left := 25;
        Top := 25;
        Caption := '正在导出数据，请稍候......';
        Font.Style := [fsBold];
      end;

      FGauge := TGauge.Create(Panel);
      with FGauge do
      begin
        Parent := Panel;
        ForeColor := clBlue;
        Left := 20;
        Top := 50;
        Height := 13;
        Width := 260;
        MinValue := 0;
        MaxValue := spWord.RecordCount;
      end;
    except

    end;
  end;

  FProgressForm.Show;
  FProgressForm.Update;

  SetWindowPos(FProgressForm.Handle, HWND_TOPMOST, 0, 0, 0, 0,
      SWP_NOMOVE OR SWP_NOSIZE OR SWP_SHOWWINDOW);
end;

procedure TWordViewForm.UpdateProgress(const value:Integer);
begin
  FGauge.Progress := value;
end;

initialization
  RegisterClass(TWordViewForm);

end.