unit PictureLibrary;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ADODB, AdvOfficeStatusBar, AdvOfficeStatusBarStylers, AdvMenus,
  AdvMenuStylers, AdvStickyPopupMenu, AdvToolBar, AdvToolBarStylers, ExtDlgs,
  DB, Menus, ActnList, AdvSmoothImageListBox,
  AdvShapeButton, AdvGlowButton, AdvOfficeImage, PictureLibraryController,
  PictureLibraryView, ViewData;

type
  TFileType = (ftPicType, ftRtfType);

type
  TPictureLibraryForm = class(TAdvToolBarForm, IPictureLibraryView)
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
    actKingExplanation: TAction;
    actWordSelection: TAction;
    pmnPictureMenu: TAdvPopupMenu;
    mnuAddExplanation: TMenuItem;
    mnuDelete: TMenuItem;
    mnuExportToCsv: TMenuItem;
    mnuAddDisp: TMenuItem;
    dlgOpenPic1: TOpenPictureDialog;
    TAdvToolBarOfficeStyler1: TAdvToolBarOfficeStyler;
    mnuExplanation: TAdvStickyPopupMenu;
    TAdvMenuOfficeStyler1: TAdvMenuOfficeStyler;
    AdvOfficeStatusBarOfficeStyler2: TAdvOfficeStatusBarOfficeStyler;
    mnuWordExplanation: TAdvStickyPopupMenu;
    lbxPicture: TAdvSmoothImageListBox;
    imgScreen: TAdvOfficeImage;
    btnRemovePicture: TAdvGlowButton;
    btnReplacePicture: TAdvGlowButton;
    btnRefreshPicture: TAdvGlowButton;
    btnBatAddPicture: TAdvGlowButton;
    actBatAddPicture: TAction;
    dlgOpen1: TOpenDialog;
    procedure actWordSelectionExecute(Sender: TObject);
    procedure lbxPictureItemSelect(Sender: TObject; itemindex: Integer);
    procedure FormCreate(Sender: TObject);
    procedure actAddPictureExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actRefreshPictureExecute(Sender: TObject);
    procedure actRemovePictureExecute(Sender: TObject);
    procedure actReplacePictureExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actAddDispExecute(Sender: TObject);
    procedure actGooglePictureExecute(Sender: TObject);
    procedure actKingExplanationExecute(Sender: TObject);
    procedure actBatAddPictureExecute(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure lbxPictureItemZoomIn(Sender: TObject; itemindex: Integer;
      var allow: Boolean);
    procedure lbxPictureItemZoomedOut(Sender: TObject; itemindex: Integer);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FPictureLibraryController:TPictureLibraryController;
    FQryWord:TADOQuery;
    FCurWord:TWord;
    FIsChanged:Boolean;
    FXmlPath:string;

    procedure SetWord(const value:string);
    function  GetWord:string;

    function  GetFilePath(const Word, PicPath: string;
        const FileType:TFileType=ftPicType):string;
  public
    { Public declarations }
    procedure ShowPicture(value:TCustomADODataSet); overload;
    procedure ShowPicture(value:string); overload;

    property  Word:string read GetWord write SetWord;
    property  IsChanged:Boolean read FIsChanged write FIsChanged;
    property  XmlPath:string read FXmlPath write FXmlPath;
  end;

var
  PictureLibraryForm: TPictureLibraryForm;

implementation

uses WordSearch, CommonInfo, UserStrUtils, PictureDispDialog, ShellAPI, StrUtils;

{$R *.dfm}

procedure TPictureLibraryForm.actAddDispExecute(Sender: TObject);
var
  pic:TPicture;
  ItemIndex:integer;
  strPicName:string;
begin
  if (lbxPicture.Items.Count = 0) or (lbxPicture.SelectedItemIndex < 0) then
  begin
    MessageDlg('没有选择图片对象，请选择对象后再进行该处理！', mtError, [mbOK], 0);
    exit;
  end;

  strPicName := lbxPicture.Items[lbxPicture.SelectedItemIndex].FileName;
  pic := TPicture.Create;
  try
    PictureDispDialogForm := TPictureDispDialogForm.Create(nil);
    PictureDispDialogForm.PictureDisp :=
        FQryWord.FieldByName('PictureDisp').AsString;
    PictureDispDialogForm.RtfPath := ConfigInfo.LibInfo.RtfPath +
        GetFilePath(FCurWord.Word, strPicName, ftRtfType);

    if PictureDispDialogForm.ShowModal <> mrOk then
      Exit;

    if not DirectoryExists(ExtractFileDir(PictureDispDialogForm.RtfPath)) then
      ForceDirectories(PWideChar(ExtractFileDir(PictureDispDialogForm.RtfPath)));

    PictureDispDialogForm.redtPictureDisp.Lines.SaveToFile(PictureDispDialogForm.RtfPath);
    FIsChanged := True;

    pic.Word := FCurWord.Word;
    pic.PictureID := GetMd5(ExtractFileName(
        lbxPicture.Items[lbxPicture.SelectedItemIndex].FileName));
    pic.PictureDisp := PictureDispDialogForm.PictureDisp;

    FPictureLibraryController.UpdatePictureDisp(pic);

    ItemIndex := lbxPicture.SelectedItemIndex;

    actRefreshPictureExecute(Sender);

    lbxPicture.SelectedItemIndex := ItemIndex;
  finally
    PictureDispDialogForm.Free;
  end;
end;

procedure TPictureLibraryForm.actAddPictureExecute(Sender: TObject);
var
  i:integer;
  strPicName:string;
  pic:TPicture;
begin
  if FCurWord.Word = '' then
  begin
    MessageDlg('没有选择单词对象，请选择对象后再进行该处理！', mtError, [mbOK], 0);
    Exit;
  end;

  dlgOpenPic1.Options := dlgOpenPic1.Options + [ofAllowMultiSelect];

  if not dlgOpenPic1.Execute then
    exit;

  for i := 0 to dlgOpenPic1.Files.Count - 1 do
  begin
    strPicName := GetFilePath(FCurWord.Word, dlgOpenPic1.Files[i]);

    if FileExists(ConfigInfo.LibInfo.PicPath + strPicName) then
    begin
      strPicName := rename(ExtractFileName(dlgOpenPic1.Files[i]));
      strPicName := GetFilePath(FCurWord.Word, strPicName);
    end;

    pic := TPicture.Create;
    Pic.Word := FCurWord.Word;
    pic.PictureID := GetMd5(ExtractFileName(strPicName));
    pic.PictureName := strPicName;
    pic.PictureDisp := '';
    FPictureLibraryController.InsertPicture(pic);

    strPicName := ConfigInfo.LibInfo.PicPath + strPicName;

    FIsChanged := True;

//    strTmpName := ConfigInfo.LibInfo.TmpPath + ExtractFileName(strPicName);
//    if FileExists(strPicName) then
//      MoveFileEx(PWideChar(strPicName), PWideChar(strTmpName), MOVEFILE_REPLACE_EXISTING);

    if not DirectoryExists(ExtractFileDir(strPicName)) then
      ForceDirectories( PWideChar(ExtractFileDir(strPicName)));

    CopyFile(PWideChar(dlgOpenPic1.Files[i]), PWideChar(strPicName), False);
  end;

  actRefreshPictureExecute(Sender);
end;

procedure TPictureLibraryForm.actBatAddPictureExecute(Sender: TObject);
var
  i:integer;
  strPicName:string;
  pic:TPicture;
  piclibForm:TPictureLibraryForm;
begin
  dlgOpen1.Options := dlgOpen1.Options - [ofAllowMultiSelect];
  dlgOpen1.InitialDir := ConfigInfo.ImgPath;

  if not dlgOpen1.Execute then
    exit;

  try
    piclibForm := TPictureLibraryForm.Create(nil);
    piclibForm.XmlPath := dlgOpen1.FileName;
    piclibForm.ShowModal;

    actRefreshPictureExecute(Sender);
  finally
    piclibForm.Free;
  end;

end;

procedure TPictureLibraryForm.actGooglePictureExecute(Sender: TObject);
var
  URL:string;
begin
  if FCurWord.Word = '' then
  begin
    MessageDlg('没有选择单词对象，请选择对象后再进行该处理！', mtError, [mbOK], 0);
    exit;
  end;

  URL := 'http://www.google.com/images?q=' + FCurWord.Word;
  ShellExecute(handle, 'open', PWideChar(configInfo.Browser), PWideChar(URL), nil, SW_SHOWNORMAL);
end;

procedure TPictureLibraryForm.actKingExplanationExecute(Sender: TObject);
var
  URL:string;
begin
  if FCurWord.Word = '' then
  begin
    MessageDlg('没有选择单词对象，请选择对象后再进行该处理！', mtError, [mbOK], 0);
    exit;
  end;

  URL := 'http://www.iciba.com/' + FCurWord.Word;
  ShellExecute(handle, 'open', PWideChar(configInfo.Browser), PWideChar(URL), nil, SW_SHOWNORMAL);
end;

procedure TPictureLibraryForm.actRefreshPictureExecute(Sender: TObject);
begin
  if FCurWord.Word = '' then
    exit;

  FPictureLibraryController.ShowPicture(FCurWord);
end;

procedure TPictureLibraryForm.actRemovePictureExecute(Sender: TObject);
var
  pic:TPicture;
  strPicName, strTmpName, strRtfName:string;
  ItemIndex:integer;
begin
  if (lbxPicture.Items.Count = 0) or (lbxPicture.SelectedItemIndex < 0) then
  begin
    MessageDlg('没有选择图片对象，请选择对象后再进行该处理！', mtError, [mbOK], 0);
    exit;
  end;

  if MessageDlg('您确认要删除吗？', mtconfirmation, [mbYes, mbNo], 0) <> mrYes then
  begin
    Exit;
  end;

  pic := TPicture.Create;
  try
    pic.Word := FCurWord.Word;
    pic.PictureID := GetMd5(ExtractFileName(
        lbxPicture.Items[lbxPicture.SelectedItemIndex].FileName));

    FPictureLibraryController.DeletePicture(pic);

    FIsChanged := True;

    strPicName := lbxPicture.Items[lbxPicture.SelectedItemIndex].FileName;
    strTmpName := ConfigInfo.LibInfo.TmpPath + ExtractFileName(strPicName);
    strRtfName := ConfigInfo.LibInfo.RtfPath + GetFilePath(FCurWord.Word, strPicName, ftRtfType);
    if FileExists(strPicName) then
      MoveFileEx(PWideChar(strPicName), PWideChar(strTmpName), MOVEFILE_REPLACE_EXISTING);

    if FileExists(strRtfName) then
      DeleteFile(strRtfName);

    ItemIndex := lbxPicture.SelectedItemIndex;

    actRefreshPictureExecute(Sender);

    if ItemIndex > 0 then
      lbxPicture.SelectedItemIndex := ItemIndex - 1;
  finally
    pic.Free;
  end;
end;

procedure TPictureLibraryForm.actReplacePictureExecute(Sender: TObject);
var
  pic:TPicture;
  strPicName, strTmpName:string;
  ItemIndex:integer;
begin
  if (lbxPicture.Items.Count = 0) or (lbxPicture.SelectedItemIndex < 0) then
  begin
    MessageDlg('没有选择图片对象，请选择对象后再进行该处理！', mtError, [mbOK], 0);
    exit;
  end;

  dlgOpenPic1.Options := dlgOpenPic1.Options - [ofAllowMultiSelect];
  if not dlgOpenPic1.Execute then
  begin
    Exit;
  end;

  pic := TPicture.Create;
  try
    pic.Word := FCurWord.Word;
    pic.PictureID := GetMd5(ExtractFileName(
        lbxPicture.Items[lbxPicture.SelectedItemIndex].FileName));

    FPictureLibraryController.ReplacePicture(pic);

    strPicName := lbxPicture.Items[lbxPicture.SelectedItemIndex].FileName;
    strTmpName := ConfigInfo.LibInfo.TmpPath + ExtractFileName(strPicName);
    if FileExists(strPicName) then
      MoveFileEx(PWideChar(strPicName), PWideChar(strTmpName), MOVEFILE_REPLACE_EXISTING);

    if not DirectoryExists(ExtractFileDir(strPicName)) then
      ForceDirectories(PWideChar(ExtractFileDir(strPicName)));

    CopyFile(PWideChar(dlgOpenPic1.FileName), PWideChar(strPicName), False);

    FIsChanged := True;

    ItemIndex := lbxPicture.SelectedItemIndex;

    actRefreshPictureExecute(Sender);

    lbxPicture.SelectedItemIndex := ItemIndex;
  finally
    pic.Free;
  end;
end;

procedure TPictureLibraryForm.actWordSelectionExecute(Sender: TObject);
begin
  try
    WordSearchForm := TWordSearchForm.Create(nil);
    WordSearchForm.Word := FCurWord.Word;

    if WordSearchForm.ShowModal <> mrOk then
    begin
      exit;
    end;

    FCurWord.Word := WordSearchForm.Word;

    FPictureLibraryController.ShowPicture(FCurWord);
  finally
    WordSearchForm.Free;
  end;
end;

procedure TPictureLibraryForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  FPictureLibraryController.Free;
//  FCurWord.Free;
end;

procedure TPictureLibraryForm.FormCreate(Sender: TObject);
begin
  FPictureLibraryController := TPictureLibraryController.Create(Self);
  FCurWord := TWord.Create;
  FIsChanged := False;

  lbxPicture.Header.Caption := '';
  lbxPicture.Footer.Caption := '';
end;

procedure TPictureLibraryForm.FormDestroy(Sender: TObject);
begin
  FPictureLibraryController.Free;
  FCurWord.Free;
end;

procedure TPictureLibraryForm.FormResize(Sender: TObject);
begin
  if WindowState = wsMaximized then
    lbxPicture.Columns := 9
  else if WindowState = wsNormal then
  begin
    lbxPicture.Columns := 7;
  end;
end;

procedure TPictureLibraryForm.FormShow(Sender: TObject);
var
  I, J:integer;
begin
  advtlbrpgr1.ActivePageIndex := 0;

  if FCurWord.Word <> '' then
  begin
    FPictureLibraryController.ShowPicture(FCurWord);
  end
  else if FXmlPath <> '' then
  begin
    for I := 0 to advtlbrpgr1.AdvPageCount - 1 do
    begin
      advtlbrpgr1.AdvPages[i].TabVisible := False;

      for J := 0 to advtlbrpgr1.AdvPages[i].AdvToolBarCount - 1 do
        advtlbrpgr1.AdvPages[i].AdvToolBars[j].Visible := False;
    end;

    advtlbrpgr1.Height := advtlbrpgr1.Caption.Height;

    lbxPicture.Items.BeginUpdate;
    lbxPicture.Items.Clear;

    ShowPicture(ExtractFilePath(FXmlPath));

    lbxPictureItemSelect(lbxPicture, 0);

    lbxPicture.Items.EndUpdate;
  end;
end;

procedure TPictureLibraryForm.lbxPictureItemSelect(Sender: TObject;
  itemindex: Integer);
begin
//  if not Assigned(FQryWord) or (not FQryWord.Active) then
//    exit;
  if FXmlPath <> '' then
  begin
    lbxPicture.Header.Caption := GetParentDirName(lbxPicture.Items[itemindex].FileName);

    lbxPicture.Footer.Caption := lbxPicture.Items[itemindex].FileName;
  end
  else
  begin
    FQryWord.First;

    if FQryWord.RecordCount = 0 then
      exit;

    FQryWord.RecNo := itemindex + 1;

    lbxPicture.Header.Caption := FQryWord.FieldByName('Word').AsString;

    lbxPicture.Footer.Caption := lbxPicture.Items[itemindex].FileName;
  end;
end;

procedure TPictureLibraryForm.lbxPictureItemZoomedOut(Sender: TObject;
  itemindex: Integer);
begin
  lbxPicture.Items.BeginUpdate;
  lbxPicture.Items[itemindex].Location := '';
  lbxPicture.Items[itemindex].Image.LoadFromFile(lbxPicture.Items[itemindex].FileName);
  lbxPicture.Items.EndUpdate;
end;

procedure TPictureLibraryForm.lbxPictureItemZoomIn(Sender: TObject;
  itemindex: Integer; var allow: Boolean);
begin
  lbxPicture.Items.BeginUpdate;
  lbxPicture.Items[itemindex].Image.Assign(nil);
  lbxPicture.Items[itemindex].Location := lbxPicture.Items[itemindex].FileName;
  lbxPicture.Items.EndUpdate;
end;

procedure TPictureLibraryForm.ShowPicture(value:TCustomADODataSet);
var
  index:integer;
var
  item: TAdvSmoothImageListBoxItem;
  strPicName: string;
begin
  FQryWord := TADOQuery(value);

//  if value.RecordCount = 0 then
//    exit;
  lbxPicture.Header.Caption := FCurWord.Word;
  lbxPicture.Footer.Caption := '';

  lbxPicture.Items.BeginUpdate;
  lbxPicture.Items.Clear;

  value.First;
  while not value.Eof do
  begin
    strPicName := ConfigInfo.LibInfo.PicPath + value.FieldByName('PictureName').AsString;

    item := lbxPicture.Items.Add;

    if FileExists(strPicName) then
      item.Image.LoadFromFile(strPicName);

    item.FileName := strPicName;
    item.Caption.Text := value.FieldByName('Word').AsString;
    item.Caption.Location := TAdvSmoothImageListBoxLocation(cpCenterCenter);
    item.Hint := value.FieldByName('PictureDisp').AsString;

    value.Next;
  end;

  lbxPictureItemSelect(lbxPicture, 0);

  lbxPicture.Items.EndUpdate;

  //advtlbr1.Enabled := lbxPicture.Items.Count > 0;
end;

function TPictureLibraryForm.GetFilePath(const Word, PicPath: string;
    const FileType:TFileType=ftPicType):string;
begin
  if FileType = ftPicType then
  begin
    Result := Format('%s\%s\%s', [UpperCase(Word[1]), Word, ExtractFileName(PicPath)]);
  end
  else if FileType = ftRtfType then
  begin
    Result := Format('%s\%s\%s', [UpperCase(Word[1]), Word, ExtractFileName(PicPath)]);
    Result := ChangeFileExt(Result, '.rtf');
  end;
end;

procedure TPictureLibraryForm.SetWord(const value:string);
begin
  FCurWord.Word := value;
end;

function  TPictureLibraryForm.GetWord:string;
begin
  Result := FCurWord.Word;
end;

procedure  TPictureLibraryForm.ShowPicture(value:string);
var
  sch: TSearchrec;
  strPicName:string;
  pic:TPicture;
  item: TAdvSmoothImageListBoxItem;
begin
    if rightStr(trim(value), 1) <> '\' then
      value := trim(value) + '\'
    else
      value := trim(value);

    if not DirectoryExists(value) then
    begin
      exit;
    end;

  if FindFirst(value + '*', faAnyfile, sch) = 0 then
  begin
    repeat
      if ((sch.Name = '.') or (sch.Name = '..')) then
        Continue;

      if DirectoryExists(value + sch.Name) then
      begin
        ShowPicture(value + sch.Name);
      end
      else
      begin
        try
          try
            if value = ExtractFilePath(FXmlPath) then
              Continue;

            if LowerCase(ExtractFileDir(value + sch.Name)) =
               LowerCase(ExtractFilePath(FXmlPath) + 'Temp') then
            begin
              strPicName := sch.Name;
              if FileExists(ConfigInfo.LibInfo.TmpPath + strPicName) then
              begin
                strPicName := rename(ExtractFileName(value + sch.Name));
                strPicName := ConfigInfo.LibInfo.TmpPath + strPicName;
              end;

              strPicName := ConfigInfo.LibInfo.TmpPath + strPicName;

              if not DirectoryExists(ExtractFileDir(strPicName)) then
                  ForceDirectories( PWideChar(ExtractFileDir(strPicName)));

              CopyFile(PWideChar(value + sch.Name), PWideChar(strPicName), False);

              logger.Warn(Format('%s -> %s : %s(%s)',[value + sch.Name, strPicName, 'Success', 'Only File']));

              Continue;
            end;

            FCurWord.Word := GetParentDirName(value + sch.Name);

            strPicName := GetFilePath(FCurWord.Word, value + sch.Name);

            if FileExists(ConfigInfo.LibInfo.PicPath + strPicName) then
            begin
              strPicName := rename(ExtractFileName(value + sch.Name));
              strPicName := GetFilePath(FCurWord.Word, strPicName);
            end;

            pic := TPicture.Create;
            Pic.Word := FCurWord.Word;
            pic.PictureID := GetMd5(ExtractFileName(strPicName));
            pic.PictureName := strPicName;
            pic.PictureDisp := '';
            FPictureLibraryController.InsertPicture(pic);

            strPicName := ConfigInfo.LibInfo.PicPath + strPicName;

            FIsChanged := True;

        //    strTmpName := ConfigInfo.LibInfo.TmpPath + ExtractFileName(strPicName);
        //    if FileExists(strPicName) then
        //      MoveFileEx(PWideChar(strPicName), PWideChar(strTmpName), MOVEFILE_REPLACE_EXISTING);

            if not DirectoryExists(ExtractFileDir(strPicName)) then
              ForceDirectories( PWideChar(ExtractFileDir(strPicName)));

            CopyFile(PWideChar(value + sch.Name), PWideChar(strPicName), False);

            //add item
            //strPicName := ConfigInfo.LibInfo.PicPath + value.FieldByName('PictureName').AsString;

            item := lbxPicture.Items.Add;

            if FileExists(strPicName) then
              item.Image.LoadFromFile(strPicName);

            item.FileName := strPicName;
            item.Caption.Text := LowerCase(GetParentDirName(strPicName));
            item.Caption.Location := TAdvSmoothImageListBoxLocation(cpCenterCenter);
            item.Hint := '';

            logger.Info(Format('%s -> %s : %s',[value + sch.Name, strPicName, 'Success']));
          except on err:Exception do
            begin
              logger.Error(Format('%s -> %s : %s(%s)',[value + sch.Name, strPicName, 'Fail', err.Message]));

              strPicName := GetFilePath(FCurWord.Word, value + sch.Name);
              strPicName := ConfigInfo.LibInfo.TmpPath + strPicName;

              if not DirectoryExists(ExtractFileDir(strPicName)) then
                ForceDirectories( PWideChar(ExtractFileDir(strPicName)));

              CopyFile(PWideChar(value + sch.Name), PWideChar(strPicName), False);

              logger.Warn(Format('%s -> %s : %s(%s)',[value + sch.Name, strPicName, 'Success', 'Only File']));

              Continue;
            end;
          end;

        finally
          pic.Free;
        end;
      end;
    until FindNext(sch) <> 0;
    SysUtils.FindClose(sch);
  end;

//  actRefreshPictureExecute(Sender);
end;


initialization
  RegisterClass(TPictureLibraryForm);

end.
