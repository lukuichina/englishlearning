unit WordExtension;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AdvAppStyler, AdvToolBar, AdvToolBarStylers, AdvShapeButton,
  StdCtrls, Grids, AdvObj, BaseGrid, AdvGrid, DBAdvGrid, AdvOfficePager,
  WordExtensionView, WordExtensionController, ADODB, DB, ViewData, Menus,
  AdvMenus, ActnList, ImgList, AdvGlowButton, AsgFindDialog;

type
  TWordExtensionForm = class(TAdvToolBarForm, IWordExtensionView)
    advtlbrpgr1: TAdvToolBarPager;
    advtlbrpgrAdvToolBarPager11: TAdvPage;
    advtlbrpgrAdvToolBarPager12: TAdvPage;
    advtlbrpgrAdvToolBarPager13: TAdvPage;
    AdvToolBarOfficeStyler2: TAdvToolBarOfficeStyler;
    AdvFormStyler2: TAdvFormStyler;
    AdvQuickAccessToolBar1: TAdvQuickAccessToolBar;
    sbnMain: TAdvShapeButton;
    aopWordExtension: TAdvOfficePager;
    advfcpg1: TAdvOfficePage;
    dbdvgrd1: TDBAdvGrid;
    advfcpg2: TAdvOfficePage;
    grpWord: TGroupBox;
    grdWord: TDBAdvGrid;
    dsWord: TDataSource;
    advfcpg3: TAdvOfficePage;
    advfcpg4: TAdvOfficePage;
    advfcpg5: TAdvOfficePage;
    dsTypeWordExtention: TDataSource;
    ilGridPopMenu: TImageList;
    actTypeWordExtention: TActionList;
    actAddTypeWordExtention: TAction;
    actUpdateTypeWordExtention: TAction;
    actDeleteTypeWordExtention: TAction;
    actImportToExcel: TAction;
    actViewPicture: TAction;
    advpmn1: TAdvPopupMenu;
    mnuAddExplanation: TMenuItem;
    mnuUpdateExplanation: TMenuItem;
    mnuDelete: TMenuItem;
    mnuExportToCsv: TMenuItem;
    mnuViewPicture: TMenuItem;
    actViewExplanation: TAction;
    mnuViewExplanation: TMenuItem;
    advtlbr2: TAdvToolBar;
    advtlbr1: TAdvToolBar;
    btnRemoveMainPicture: TAdvGlowButton;
    btnAddMainPicture: TAdvGlowButton;
    btnRefreshPicture: TAdvGlowButton;
    actMainMenu: TActionList;
    actPreviousPage: TAction;
    actNextPage: TAction;
    actAddExtention: TAction;
    actRemoveExtention: TAction;
    actUpdateExtention: TAction;
    actAddDisp: TAction;
    actGooglePicture: TAction;
    actGoTo: TAction;
    actWordExplanation: TAction;
    actFind: TAction;
    dlgFind: TFindDialog;
    dlgFindDialog: TAdvGridFindDialog;
    advtlbr3: TAdvToolBar;
    btnPictureDisp: TAdvGlowButton;
    btnReplacePicture: TAdvGlowButton;
    btnRemovePicture: TAdvGlowButton;
    btnAddPicture: TAdvGlowButton;
    procedure FormCreate(Sender: TObject);
    procedure grdWordRowChanging(Sender: TObject; OldRow, NewRow: Integer;
      var Allow: Boolean);
    procedure advpmn1Popup(Sender: TObject);
    procedure actAddTypeWordExtentionExecute(Sender: TObject);
    procedure actUpdateTypeWordExtentionExecute(Sender: TObject);
    procedure actDeleteTypeWordExtentionExecute(Sender: TObject);
    procedure actViewPictureExecute(Sender: TObject);
    procedure actViewExplanationExecute(Sender: TObject);
    procedure actFindExecute(Sender: TObject);
    procedure dlgFindFind(Sender: TObject);
    procedure actNextPageExecute(Sender: TObject);
    procedure actPreviousPageExecute(Sender: TObject);
    procedure actGoToExecute(Sender: TObject);
    procedure actAddExtentionExecute(Sender: TObject);
    procedure actRemoveExtentionExecute(Sender: TObject);
    procedure actUpdateExtentionExecute(Sender: TObject);
  private
    { Private declarations }
    FWordExtensionController:TWordExtensionController;
    FFormInit:Boolean;

    procedure ShowWordRecordCount;
  public
    { Public declarations }
    procedure ShowWord(value:TCustomADODataSet);
    procedure ShowTypeWordExtention(value:TCustomADODataSet);
  end;

var
  WordExtensionForm: TWordExtensionForm;

implementation

uses TypeWordExtentionDialog, WordPicture, WordExplain;

{$R *.dfm}


procedure TWordExtensionForm.actAddTypeWordExtentionExecute(Sender: TObject);
var
  typeWordExtendInfo:TTypeWordExtension;
  Allow:Boolean;
begin
  try
    TypeWordExtentionDialogForm := TTypeWordExtentionDialogForm.Create(nil);
    TypeWordExtentionDialogForm.BaseWord := dsWord.DataSet.FieldByName('Word').AsString;
    TypeWordExtentionDialogForm.BaseType := 1;
    //TypeWordExtentionDialogForm.ExtendWord := dsTypeWordExtention.DataSet.FieldByName('Word').AsString;
    TypeWordExtentionDialogForm.ExtendWord := dsWord.DataSet.FieldByName('Word').AsString;
    TypeWordExtentionDialogForm.ExtendType := 1;

    if TypeWordExtentionDialogForm.ShowModal  <> mrOk then
      Exit;

    typeWordExtendInfo := TTypeWordExtension.Create;
    typeWordExtendInfo.BaseWord := TypeWordExtentionDialogForm.BaseWord;
    typeWordExtendInfo.BaseType := TypeWordExtentionDialogForm.BaseType;
    typeWordExtendInfo.ExtendWord := TypeWordExtentionDialogForm.ExtendWord;
    typeWordExtendInfo.ExtendType := TypeWordExtentionDialogForm.ExtendType;

    dbdvgrd1.BeginUpdate;

    FWordExtensionController.InsertTypeWordExtention(typeWordExtendInfo);

    grdWordRowChanging(Sender, grdWord.SelectedRow[0], grdWord.SelectedRow[0], Allow);
    dsTypeWordExtention.DataSet.Locate('Word', typeWordExtendInfo.ExtendWord, []);

    dbdvgrd1.EndUpdate;
  finally
    TypeWordExtentionDialogForm.Free;
    typeWordExtendInfo.Free;
  end;
end;

procedure TWordExtensionForm.actDeleteTypeWordExtentionExecute(Sender: TObject);
var
  typeWordExtendInfo:TTypeWordExtension;
  Allow:Boolean;
begin
  try
    if MessageDlg('您确认要删除吗？', mtconfirmation, [mbYes, mbNo], 0) <> mrYes then
    begin
      exit;
    end;

    typeWordExtendInfo := TTypeWordExtension.Create;
    typeWordExtendInfo.BaseWord := dsWord.DataSet.FieldByName('Word').AsString;
    typeWordExtendInfo.BaseType := dsTypeWordExtention.DataSet.FieldByName('BaseWordTypeID').AsInteger;
    typeWordExtendInfo.ExtendWord := dsTypeWordExtention.DataSet.FieldByName('Word').AsString;
    typeWordExtendInfo.ExtendType := dsTypeWordExtention.DataSet.FieldByName('WordTypeID').AsInteger;

    dbdvgrd1.BeginUpdate;

    FWordExtensionController.DeleteTypeWordExtention(typeWordExtendInfo);

    grdWordRowChanging(Sender, grdWord.SelectedRow[0], grdWord.SelectedRow[0], Allow);
    //dsTypeWordExtention.DataSet.Locate('Word', typeWordExtendInfo.Word, []);

    dbdvgrd1.EndUpdate;
  finally
    typeWordExtendInfo.Free;
  end;
end;

procedure TWordExtensionForm.actFindExecute(Sender: TObject);
begin
  //dlgFindDialog.Execute;
  if not dlgFind.Execute then
    exit;

  //dsWord.DataSet.Locate('Word', dlgFind.FindText,[]);
end;

procedure TWordExtensionForm.actGoToExecute(Sender: TObject);
var
  strLineNo:string;
begin
  strLineNo:= InputBox('转到指定行',  '行号（L）：', '');
  //grdWord.ScrollBy(StrToInt(strLineNo), 0);

  grdWord.BeginUpdate;
  dsWord.DataSet.Locate('RowID', strLineNo, []);
  grdWord.EndUpdate;
end;

procedure TWordExtensionForm.actNextPageExecute(Sender: TObject);
begin
  SendMessage(grdWord.Handle, WM_KEYDOWN, VK_NEXT, 0);
end;

procedure TWordExtensionForm.actPreviousPageExecute(Sender: TObject);
begin
  SendMessage(grdWord.Handle, WM_KEYDOWN, VK_PRIOR, 0);
end;

procedure TWordExtensionForm.actAddExtentionExecute(Sender: TObject);
begin
  case aopWordExtension.ActivePageIndex of
     0:
       actAddTypeWordExtentionExecute(Sender);
  end;
end;

procedure TWordExtensionForm.actRemoveExtentionExecute(Sender: TObject);
begin
  case aopWordExtension.ActivePageIndex of
     0:
       actDeleteTypeWordExtentionExecute(Sender);
  end;
end;

procedure TWordExtensionForm.actUpdateExtentionExecute(Sender: TObject);
begin
   case aopWordExtension.ActivePageIndex of
     0:
       actUpdateTypeWordExtentionExecute(Sender);
       //end;
   end;
end;

procedure TWordExtensionForm.actUpdateTypeWordExtentionExecute(Sender: TObject);
var
  typeWordExtendInfo, oldTypeWordExtendInfo:TTypeWordExtension;
  Allow:Boolean;
begin
  try
    TypeWordExtentionDialogForm := TTypeWordExtentionDialogForm.Create(nil);
    TypeWordExtentionDialogForm.BaseWord := dsWord.DataSet.FieldByName('Word').AsString;
    TypeWordExtentionDialogForm.BaseType := dsTypeWordExtention.DataSet.FieldByName('BaseWordTypeID').AsInteger;
    TypeWordExtentionDialogForm.ExtendWord := dsTypeWordExtention.DataSet.FieldByName('Word').AsString;
    TypeWordExtentionDialogForm.ExtendType := dsTypeWordExtention.DataSet.FieldByName('WordTypeID').AsInteger;

    oldTypeWordExtendInfo := TTypeWordExtension.Create;
    oldTypeWordExtendInfo.BaseWord := TypeWordExtentionDialogForm.BaseWord;
    oldTypeWordExtendInfo.BaseType := TypeWordExtentionDialogForm.BaseType;
    oldTypeWordExtendInfo.ExtendWord := TypeWordExtentionDialogForm.ExtendWord;
    oldTypeWordExtendInfo.ExtendType := TypeWordExtentionDialogForm.ExtendType;

    if TypeWordExtentionDialogForm.ShowModal  <> mrOk then
      Exit;

    typeWordExtendInfo := TTypeWordExtension.Create;
    typeWordExtendInfo := TTypeWordExtension.Create;
    typeWordExtendInfo.BaseWord := TypeWordExtentionDialogForm.BaseWord;
    typeWordExtendInfo.BaseType := TypeWordExtentionDialogForm.BaseType;
    typeWordExtendInfo.ExtendWord := TypeWordExtentionDialogForm.ExtendWord;
    typeWordExtendInfo.ExtendType := TypeWordExtentionDialogForm.ExtendType;

    dbdvgrd1.BeginUpdate;

    FWordExtensionController.UpdateTypeWordExtention(typeWordExtendInfo, oldTypeWordExtendInfo);

    grdWordRowChanging(Sender, grdWord.SelectedRow[0], grdWord.SelectedRow[0], Allow);
    dsTypeWordExtention.DataSet.Locate('Word', typeWordExtendInfo.ExtendWord, []);

    dbdvgrd1.EndUpdate;
  finally
    TypeWordExtentionDialogForm.Free;
    oldTypeWordExtendInfo.Free;
    typeWordExtendInfo.Free;
  end;
end;

procedure TWordExtensionForm.actViewExplanationExecute(Sender: TObject);
begin
  try
    WordExplainForm := TWordExplainForm.Create(nil);
    WordExplainForm.Word := dsTypeWordExtention.DataSet.FieldByName('Word').AsString;
    WordExplainForm.ShowModal;

    if WordExplainForm.IsChanged then
    begin
      grdWord.BeginUpdate;

//      ShowWords('%');
//
//      qryWord.Locate('Word', edtWordEdit.Text, []);

      grdWord.EndUpdate;
    end;
  finally
    WordExplainForm.Free;
  end;
end;
procedure TWordExtensionForm.actViewPictureExecute(Sender: TObject);
var
  ExplanationID:Integer;
begin
  try
    WordPictureForm := TWordPictureForm.Create(nil);
    WordPictureForm.Word := dsTypeWordExtention.DataSet.FieldByName('Word').AsString;
    WordPictureForm.WordType := dsTypeWordExtention.DataSet.FieldByName('WordTypeID').AsInteger;
//    WordPictureForm.ExplanationID := qryWordExplanation.FieldByName('ExplanationID').AsInteger;
    WordPictureForm.ShowModal;

    if WordPictureForm.IsChanged then
    begin
//      FIsChanged := True;

//      ExplanationID := qryWordExplanation.FieldByName('ExplanationID').AsInteger;

      dbdvgrd1.BeginUpdate;
//      ShowWordExplanation;
//      qryWordExplanation.Locate('ExplanationID', ExplanationID, []);
      dbdvgrd1.EndUpdate;
    end;
  finally
    WordPictureForm.Free;
  end;
end;

procedure TWordExtensionForm.advpmn1Popup(Sender: TObject);
begin
  mnuAddExplanation.Enabled := (dsWord.DataSet.RecordCount > 0) and
    (grdWord.RowSelectCount > 0);
  mnuUpdateExplanation.Enabled := (dsTypeWordExtention.DataSet.RecordCount > 0) and
   (dbdvgrd1.RowSelectCount > 0);
  mnuDelete.Enabled := (dsTypeWordExtention.DataSet.RecordCount > 0) and
   (dbdvgrd1.RowSelectCount > 0);
  mnuViewPicture.Enabled := (dsTypeWordExtention.DataSet.RecordCount > 0) and
   (dbdvgrd1.RowSelectCount > 0);
  mnuViewExplanation.Enabled := (dsTypeWordExtention.DataSet.RecordCount > 0) and
   (dbdvgrd1.RowSelectCount > 0);
end;


procedure TWordExtensionForm.dlgFindFind(Sender: TObject);
var
  option:TLocateOptions;
begin
  option := [];

//  if (frMatchCase in dlgFind.Options) then
//    option := option + [loCaseInsensitive];

  if not (frWholeWord in dlgFind.Options) then
    option := option + [loPartialKey];

  dsWord.DataSet.Locate('Word', dlgFind.FindText, option);
end;

procedure TWordExtensionForm.FormCreate(Sender: TObject);
var
  Allow:Boolean;
begin
  FFormInit := True;

//  FWordCatalog := TWordCatalog.Create;
  FWordExtensionController := TWordExtensionController.Create(self);
  FWordExtensionController.ShowWord;

  ShowWordRecordCount;

  advtlbrpgr1.ActivePageIndex := 0;
  FFormInit := False;

  grdWordRowChanging(Sender, 0, 1, Allow);
end;

procedure TWordExtensionForm.grdWordRowChanging(Sender: TObject; OldRow,
  NewRow: Integer; var Allow: Boolean);
var
  word:TWord;
  ResultVariant:Variant;
begin

  if FFormInit then
  begin
    actAddExtention.Enabled := (dsWord.DataSet.RecordCount > 0) and
      (grdWord.RowSelectCount > 0);
    actUpdateExtention.Enabled := (dsTypeWordExtention.DataSet.RecordCount > 0) and
     (dbdvgrd1.RowSelectCount > 0);
    actRemoveExtention.Enabled := (dsTypeWordExtention.DataSet.RecordCount > 0) and
     (dbdvgrd1.RowSelectCount > 0);
    exit;
  end;

  word := TWord.Create;
  ResultVariant := dsWord.DataSet.Lookup('RowID', NewRow , 'Word');
  word.Word := ResultVariant;

  FWordExtensionController.ShowTypeWordExtention(word);

  word.Free;

  actAddExtention.Enabled := (dsWord.DataSet.RecordCount > 0) and
    (grdWord.RowSelectCount > 0);
  actUpdateExtention.Enabled := (dsTypeWordExtention.DataSet.RecordCount > 0) and
   (dbdvgrd1.RowSelectCount > 0);
  actRemoveExtention.Enabled := (dsTypeWordExtention.DataSet.RecordCount > 0) and
   (dbdvgrd1.RowSelectCount > 0);
end;

procedure TWordExtensionForm.ShowWord(value:TCustomADODataSet);
begin
  //grdWord.DataSource.DataSet := value;
  dsWord.DataSet := value;
end;

procedure TWordExtensionForm.ShowTypeWordExtention(value:TCustomADODataSet);
begin
  //grdWord.DataSource.DataSet := value;
  dsTypeWordExtention.DataSet := value;
end;

procedure TWordExtensionForm.ShowWordRecordCount;
begin
  grpWord.Caption := Format('单词一览(记录数：%d)' , [dsWord.DataSet.RecordCount]);
end;

end.
