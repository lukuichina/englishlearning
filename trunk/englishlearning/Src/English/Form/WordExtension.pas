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
    grdTypeWordExtention: TDBAdvGrid;
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
    grdSynonymWordExtention: TDBAdvGrid;
    dsSynonymWordExtention: TDataSource;
    advpmn2: TAdvPopupMenu;
    mnuAddSynonymExtention: TMenuItem;
    mnuUpdateSynonymExtention: TMenuItem;
    mnuDeleteSynonymExtention: TMenuItem;
    MenuItem4: TMenuItem;
    mnuSynonymViewPicture: TMenuItem;
    mnuSynonymViewExplanation: TMenuItem;
    actAddSynonymExtention: TAction;
    actUpdateSynonymExtention: TAction;
    actDeleteSynonymExtention: TAction;
    actSynonymViewPicture: TAction;
    actSynonymViewExplanation: TAction;
    dsAntonymWordExtention: TDataSource;
    advpmn3: TAdvPopupMenu;
    mnuAddAntonymExtention: TMenuItem;
    mnuUpdateAntonymExtention: TMenuItem;
    mnuDeleteAntonymExtention: TMenuItem;
    MenuItem5: TMenuItem;
    mnuAntonymViewPicture: TMenuItem;
    mnuAntonymViewExplanation: TMenuItem;
    actAddAntonymExtention: TAction;
    actUpdateAntonymExtention: TAction;
    actDeleteAntonymExtention: TAction;
    actAntonymViewPicture: TAction;
    actAntonymViewExplanation: TAction;
    btnAddPicture: TAdvGlowButton;
    btnRemovePicture: TAdvGlowButton;
    btnReplacePicture: TAdvGlowButton;
    grdAntonymWordExtention: TDBAdvGrid;
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
    procedure actAddSynonymExtentionExecute(Sender: TObject);
    procedure actUpdateSynonymExtentionExecute(Sender: TObject);
    procedure actDeleteSynonymExtentionExecute(Sender: TObject);
    procedure advpmn2Popup(Sender: TObject);
    procedure actSynonymViewPictureExecute(Sender: TObject);
    procedure actSynonymViewExplanationExecute(Sender: TObject);
    procedure aopWordExtensionChange(Sender: TObject);
    procedure advpmn3Popup(Sender: TObject);
    procedure actAddAntonymExtentionExecute(Sender: TObject);
    procedure actUpdateAntonymExtentionExecute(Sender: TObject);
    procedure actDeleteAntonymExtentionExecute(Sender: TObject);
    procedure actAntonymViewPictureExecute(Sender: TObject);
    procedure actAntonymViewExplanationExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FWordExtensionController:TWordExtensionController;
    FFormInit:Boolean;
    FIsChanged:Boolean;
    FWord:string;

    procedure ShowWordRecordCount;
    procedure SetEditMenuStatus;
  public
    { Public declarations }
    property Word:string read FWord write FWord;
    property IsChanged:Boolean read FIsChanged;

    procedure ShowWord(value:TCustomADODataSet);
    procedure ShowTypeWordExtention(value:TCustomADODataSet);
    procedure ShowSynonymExtention(value:TCustomADODataSet);
    procedure ShowAntonymExtention(value:TCustomADODataSet);
  end;

var
  WordExtensionForm: TWordExtensionForm;

implementation

uses TypeWordExtentionDialog, WordPicture, WordExplain,
  SynonymWordExtentionDialog;

{$R *.dfm}


procedure TWordExtensionForm.actAddSynonymExtentionExecute(Sender: TObject);
var
  synonymWordExtendInfo:TSynonymExtention;
  Allow:Boolean;
begin
  try
    SynonymWordExtentionDialogForm := TSynonymWordExtentionDialogForm.Create(nil);
    SynonymWordExtentionDialogForm.Word := dsWord.DataSet.FieldByName('Word').AsString;
    SynonymWordExtentionDialogForm.WordType := 0;
    SynonymWordExtentionDialogForm.SynonymWord := dsWord.DataSet.FieldByName('Word').AsString;
    SynonymWordExtentionDialogForm.SynonymWordType := 0;

    if SynonymWordExtentionDialogForm.ShowModal  <> mrOk then
      Exit;

    synonymWordExtendInfo := TSynonymExtention.Create;
    synonymWordExtendInfo.Word := SynonymWordExtentionDialogForm.Word;
    synonymWordExtendInfo.WordType := SynonymWordExtentionDialogForm.WordType;
    synonymWordExtendInfo.ExplanationID := SynonymWordExtentionDialogForm.ExplanationID;

    synonymWordExtendInfo.SynonymWord := SynonymWordExtentionDialogForm.SynonymWord;
    synonymWordExtendInfo.SynonymWordType := SynonymWordExtentionDialogForm.SynonymWordType;
    synonymWordExtendInfo.SynonymExplanationID := SynonymWordExtentionDialogForm.SynonymExplanationID;

    grdSynonymWordExtention.BeginUpdate;

    FWordExtensionController.InsertSynonymExtention(synonymWordExtendInfo);

    grdWordRowChanging(Sender, grdWord.SelectedRow[0], grdWord.SelectedRow[0], Allow);
    dsSynonymWordExtention.DataSet.Locate('Word', synonymWordExtendInfo.SynonymWord, []);

    grdSynonymWordExtention.EndUpdate;
  finally
    SynonymWordExtentionDialogForm.Free;
    synonymWordExtendInfo.Free;
  end;
end;

procedure TWordExtensionForm.actAddTypeWordExtentionExecute(Sender: TObject);
var
  typeWordExtendInfo:TTypeWordExtention;
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

    typeWordExtendInfo := TTypeWordExtention.Create;
    typeWordExtendInfo.BaseWord := TypeWordExtentionDialogForm.BaseWord;
    typeWordExtendInfo.BaseType := TypeWordExtentionDialogForm.BaseType;
    typeWordExtendInfo.ExtendWord := TypeWordExtentionDialogForm.ExtendWord;
    typeWordExtendInfo.ExtendType := TypeWordExtentionDialogForm.ExtendType;

    grdTypeWordExtention.BeginUpdate;

    FWordExtensionController.InsertTypeWordExtention(typeWordExtendInfo);

    grdWordRowChanging(Sender, grdWord.SelectedRow[0], grdWord.SelectedRow[0], Allow);
    dsTypeWordExtention.DataSet.Locate('Word', typeWordExtendInfo.ExtendWord, []);

    grdTypeWordExtention.EndUpdate;
  finally
    TypeWordExtentionDialogForm.Free;
    typeWordExtendInfo.Free;
  end;
end;

procedure TWordExtensionForm.actAntonymViewExplanationExecute(Sender: TObject);
begin
  try
    WordExplainForm := TWordExplainForm.Create(nil);
    WordExplainForm.Word := dsAntonymWordExtention.DataSet.FieldByName('Word').AsString;
    WordExplainForm.ShowModal;

    if WordExplainForm.IsChanged then
    begin
      grdAntonymWordExtention.BeginUpdate;

//      ShowWords('%');
//
//      qryWord.Locate('Word', edtWordEdit.Text, []);

      grdAntonymWordExtention.EndUpdate;
    end;
  finally
    WordExplainForm.Free;
  end;
end;

procedure TWordExtensionForm.actAntonymViewPictureExecute(Sender: TObject);
var
  ExplanationID:Integer;
begin
  try
    WordPictureForm := TWordPictureForm.Create(nil);
    WordPictureForm.Word := dsAntonymWordExtention.DataSet.FieldByName('Word').AsString;
    WordPictureForm.WordType := dsAntonymWordExtention.DataSet.FieldByName('WordTypeID').AsInteger;
//    WordPictureForm.ExplanationID := qryWordExplanation.FieldByName('ExplanationID').AsInteger;
    WordPictureForm.ShowModal;

    if WordPictureForm.IsChanged then
    begin
//      FIsChanged := True;

//      ExplanationID := qryWordExplanation.FieldByName('ExplanationID').AsInteger;

      grdAntonymWordExtention.BeginUpdate;
//      ShowWordExplanation;
//      qryWordExplanation.Locate('ExplanationID', ExplanationID, []);
      grdAntonymWordExtention.EndUpdate;
    end;
  finally
    WordPictureForm.Free;
  end;
end;

procedure TWordExtensionForm.actDeleteAntonymExtentionExecute(Sender: TObject);
var
  AntonymWordExtendInfo:TAntonymExtention;
  Allow:Boolean;
begin
  try
    AntonymWordExtendInfo := TAntonymExtention.Create;

    if MessageDlg('您确认要删除吗？', mtconfirmation, [mbYes, mbNo], 0) <> mrYes then
    begin
      exit;
    end;

    AntonymWordExtendInfo.Word := dsWord.DataSet.FieldByName('Word').AsString;
    //synonymWordExtendInfo.WordType := dsSynonymWordExtention.DataSet.FieldByName('WordTypeID').AsInteger;
    //synonymWordExtendInfo.WordType := dsSynonymWordExtention.DataSet.FieldByName('WordTypeID').AsInteger;
    AntonymWordExtendInfo.AntonymWord := dsAntonymWordExtention.DataSet.FieldByName('Word').AsString;
    //synonymWordExtendInfo.SynonymWordType := dsSynonymWordExtention.DataSet.FieldByName('WordTypeID').AsInteger;
    //synonymWordExtendInfo.WordType := dsSynonymWordExtention.DataSet.FieldByName('WordTypeID').AsInteger;

    grdAntonymWordExtention.BeginUpdate;

    FWordExtensionController.DeleteAntonymExtention(AntonymWordExtendInfo);

    grdWordRowChanging(Sender, grdWord.SelectedRow[0], grdWord.SelectedRow[0], Allow);
    //dsAntonymWordExtention.DataSet.Locate('Word', typeWordExtendInfo.Word, []);

    grdAntonymWordExtention.EndUpdate;
  finally
    //if Assigned(AntonymWordExtendInfo) then
    AntonymWordExtendInfo.Free;
  end;
end;

procedure TWordExtensionForm.actDeleteSynonymExtentionExecute(Sender: TObject);
var
  synonymWordExtendInfo:TSynonymExtention;
  Allow:Boolean;
begin
  try
    synonymWordExtendInfo := TSynonymExtention.Create;

    if MessageDlg('您确认要删除吗？', mtconfirmation, [mbYes, mbNo], 0) <> mrYes then
    begin
      exit;
    end;

    synonymWordExtendInfo.Word := dsWord.DataSet.FieldByName('Word').AsString;
    //synonymWordExtendInfo.WordType := dsSynonymWordExtention.DataSet.FieldByName('WordTypeID').AsInteger;
    //synonymWordExtendInfo.WordType := dsSynonymWordExtention.DataSet.FieldByName('WordTypeID').AsInteger;
    synonymWordExtendInfo.SynonymWord := dsSynonymWordExtention.DataSet.FieldByName('Word').AsString;
    //synonymWordExtendInfo.SynonymWordType := dsSynonymWordExtention.DataSet.FieldByName('WordTypeID').AsInteger;
    //synonymWordExtendInfo.WordType := dsSynonymWordExtention.DataSet.FieldByName('WordTypeID').AsInteger;

    grdSynonymWordExtention.BeginUpdate;

    FWordExtensionController.DeleteSynonymExtention(synonymWordExtendInfo);

    grdWordRowChanging(Sender, grdWord.SelectedRow[0], grdWord.SelectedRow[0], Allow);
    //dsTypeWordExtention.DataSet.Locate('Word', typeWordExtendInfo.Word, []);

    grdSynonymWordExtention.EndUpdate;
  finally
    //if Assigned(synonymWordExtendInfo) then
    synonymWordExtendInfo.Free;
  end;
end;

procedure TWordExtensionForm.actDeleteTypeWordExtentionExecute(Sender: TObject);
var
  typeWordExtendInfo:TTypeWordExtention;
  Allow:Boolean;
begin
  try
    typeWordExtendInfo := TTypeWordExtention.Create;

    if MessageDlg('您确认要删除吗？', mtconfirmation, [mbYes, mbNo], 0) <> mrYes then
    begin
      exit;
    end;

    typeWordExtendInfo.BaseWord := dsWord.DataSet.FieldByName('Word').AsString;
    typeWordExtendInfo.BaseType := dsTypeWordExtention.DataSet.FieldByName('BaseWordTypeID').AsInteger;
    typeWordExtendInfo.ExtendWord := dsTypeWordExtention.DataSet.FieldByName('Word').AsString;
    typeWordExtendInfo.ExtendType := dsTypeWordExtention.DataSet.FieldByName('WordTypeID').AsInteger;

    grdTypeWordExtention.BeginUpdate;

    FWordExtensionController.DeleteTypeWordExtention(typeWordExtendInfo);

    grdWordRowChanging(Sender, grdWord.SelectedRow[0], grdWord.SelectedRow[0], Allow);
    //dsTypeWordExtention.DataSet.Locate('Word', typeWordExtendInfo.Word, []);

    grdTypeWordExtention.EndUpdate;
  finally
    //if Assigned(typeWordExtendInfo) then
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

procedure TWordExtensionForm.actAddAntonymExtentionExecute(Sender: TObject);
var
  antonymWordExtendInfo:TAntonymExtention;
  Allow:Boolean;
begin
  try
    SynonymWordExtentionDialogForm := TSynonymWordExtentionDialogForm.Create(nil);
    SynonymWordExtentionDialogForm.ExtentionType := 3;
    SynonymWordExtentionDialogForm.Word := dsWord.DataSet.FieldByName('Word').AsString;
    SynonymWordExtentionDialogForm.WordType := 0;
    SynonymWordExtentionDialogForm.SynonymWord := dsWord.DataSet.FieldByName('Word').AsString;
    SynonymWordExtentionDialogForm.SynonymWordType := 0;

    if SynonymWordExtentionDialogForm.ShowModal  <> mrOk then
      Exit;

    antonymWordExtendInfo := TAntonymExtention.Create;
    antonymWordExtendInfo.Word := SynonymWordExtentionDialogForm.Word;
    antonymWordExtendInfo.WordType := SynonymWordExtentionDialogForm.WordType;
    antonymWordExtendInfo.ExplanationID := SynonymWordExtentionDialogForm.ExplanationID;

    antonymWordExtendInfo.AntonymWord := SynonymWordExtentionDialogForm.SynonymWord;
    antonymWordExtendInfo.AntonymWordType := SynonymWordExtentionDialogForm.SynonymWordType;
    antonymWordExtendInfo.AntonymExplanationID := SynonymWordExtentionDialogForm.SynonymExplanationID;

    grdAntonymWordExtention.BeginUpdate;

    FWordExtensionController.InsertAntonymExtention(antonymWordExtendInfo);

    grdWordRowChanging(Sender, grdWord.SelectedRow[0], grdWord.SelectedRow[0], Allow);
    dsAntonymWordExtention.DataSet.Locate('Word', antonymWordExtendInfo.AntonymWord, []);

    grdAntonymWordExtention.EndUpdate;
  finally
    SynonymWordExtentionDialogForm.Free;
    antonymWordExtendInfo.Free;
  end;
end;

procedure TWordExtensionForm.actAddExtentionExecute(Sender: TObject);
begin
  case aopWordExtension.ActivePageIndex of
     0:
       actAddTypeWordExtentionExecute(Sender);
     2:
       actAddSynonymExtentionExecute(Sender);
     3:
       actAddAntonymExtentionExecute(Sender);
  end;
end;

procedure TWordExtensionForm.actRemoveExtentionExecute(Sender: TObject);
begin
  case aopWordExtension.ActivePageIndex of
     0:
       actDeleteTypeWordExtentionExecute(Sender);
     2:
       actDeleteSynonymExtentionExecute(Sender);
     3:
       actDeleteAntonymExtentionExecute(Sender);
  end;
end;

procedure TWordExtensionForm.actSynonymViewExplanationExecute(Sender: TObject);
begin
  try
    WordExplainForm := TWordExplainForm.Create(nil);
    WordExplainForm.Word := dsSynonymWordExtention.DataSet.FieldByName('Word').AsString;
    WordExplainForm.ShowModal;

    if WordExplainForm.IsChanged then
    begin
      grdSynonymWordExtention.BeginUpdate;

//      ShowWords('%');
//
//      qryWord.Locate('Word', edtWordEdit.Text, []);

      grdSynonymWordExtention.EndUpdate;
    end;
  finally
    WordExplainForm.Free;
  end;
end;

procedure TWordExtensionForm.actSynonymViewPictureExecute(Sender: TObject);
var
  ExplanationID:Integer;
begin
  try
    WordPictureForm := TWordPictureForm.Create(nil);
    WordPictureForm.Word := dsSynonymWordExtention.DataSet.FieldByName('Word').AsString;
    WordPictureForm.WordType := dsSynonymWordExtention.DataSet.FieldByName('WordTypeID').AsInteger;
//    WordPictureForm.ExplanationID := qryWordExplanation.FieldByName('ExplanationID').AsInteger;
    WordPictureForm.ShowModal;

    if WordPictureForm.IsChanged then
    begin
//      FIsChanged := True;

//      ExplanationID := qryWordExplanation.FieldByName('ExplanationID').AsInteger;

      grdSynonymWordExtention.BeginUpdate;
//      ShowWordExplanation;
//      qryWordExplanation.Locate('ExplanationID', ExplanationID, []);
      grdSynonymWordExtention.EndUpdate;
    end;
  finally
    WordPictureForm.Free;
  end;
end;

procedure TWordExtensionForm.actUpdateAntonymExtentionExecute(Sender: TObject);
var
  antonymWordExtendInfo, oldAntonymWordExtendInfo:TAntonymExtention;
  Allow:Boolean;
begin
  try
    SynonymWordExtentionDialogForm := TSynonymWordExtentionDialogForm.Create(nil);
    SynonymWordExtentionDialogForm.ExtentionType := 3;
    SynonymWordExtentionDialogForm.Word := dsWord.DataSet.FieldByName('Word').AsString;
    SynonymWordExtentionDialogForm.WordType := dsAntonymWordExtention.DataSet.FieldByName('BaseWordTypeID').AsInteger;
    SynonymWordExtentionDialogForm.ExplanationID := dsAntonymWordExtention.DataSet.FieldByName('BaseExplanationID').AsInteger;
    SynonymWordExtentionDialogForm.SynonymWord := dsAntonymWordExtention.DataSet.FieldByName('Word').AsString;
    SynonymWordExtentionDialogForm.SynonymWordType := dsAntonymWordExtention.DataSet.FieldByName('WordTypeID').AsInteger;
    SynonymWordExtentionDialogForm.SynonymExplanationID := dsAntonymWordExtention.DataSet.FieldByName('ExplanationID').AsInteger;

    oldAntonymWordExtendInfo := TAntonymExtention.Create;
    oldAntonymWordExtendInfo.Word := SynonymWordExtentionDialogForm.Word;
    oldAntonymWordExtendInfo.WordType := SynonymWordExtentionDialogForm.WordType;
    oldAntonymWordExtendInfo.ExplanationID := SynonymWordExtentionDialogForm.ExplanationID;
    oldAntonymWordExtendInfo.AntonymWord := SynonymWordExtentionDialogForm.SynonymWord;
    oldAntonymWordExtendInfo.AntonymWordType := SynonymWordExtentionDialogForm.SynonymWordType;
    oldAntonymWordExtendInfo.AntonymExplanationID := SynonymWordExtentionDialogForm.SynonymExplanationID;

    if SynonymWordExtentionDialogForm.ShowModal  <> mrOk then
      Exit;

    antonymWordExtendInfo := TAntonymExtention.Create;
    antonymWordExtendInfo.Word := SynonymWordExtentionDialogForm.Word;
    antonymWordExtendInfo.WordType := SynonymWordExtentionDialogForm.WordType;
    antonymWordExtendInfo.ExplanationID := SynonymWordExtentionDialogForm.ExplanationID;
    antonymWordExtendInfo.AntonymWord := SynonymWordExtentionDialogForm.SynonymWord;
    antonymWordExtendInfo.AntonymWordType := SynonymWordExtentionDialogForm.SynonymWordType;
    antonymWordExtendInfo.AntonymExplanationID := SynonymWordExtentionDialogForm.SynonymExplanationID;

    grdAntonymWordExtention.BeginUpdate;

    FWordExtensionController.UpdateAntonymExtention(antonymWordExtendInfo, oldAntonymWordExtendInfo);

    grdWordRowChanging(Sender, grdWord.SelectedRow[0], grdWord.SelectedRow[0], Allow);
    dsAntonymWordExtention.DataSet.Locate('Word', antonymWordExtendInfo.AntonymWord, []);

    grdAntonymWordExtention.EndUpdate;
  finally
    SynonymWordExtentionDialogForm.Free;
    oldAntonymWordExtendInfo.Free;
    antonymWordExtendInfo.Free;
  end;
end;

procedure TWordExtensionForm.actUpdateExtentionExecute(Sender: TObject);
begin
   case aopWordExtension.ActivePageIndex of
     0:
       actUpdateTypeWordExtentionExecute(Sender);
     2:
       actUpdateSynonymExtentionExecute(Sender);
     3:
       actUpdateAntonymExtentionExecute(Sender);
   end;
end;

procedure TWordExtensionForm.actUpdateSynonymExtentionExecute(Sender: TObject);
var
  synonymWordExtendInfo, oldSynonymWordExtendInfo:TSynonymExtention;
  Allow:Boolean;
begin
  try
    SynonymWordExtentionDialogForm := TSynonymWordExtentionDialogForm.Create(nil);
    SynonymWordExtentionDialogForm.Word := dsWord.DataSet.FieldByName('Word').AsString;
    SynonymWordExtentionDialogForm.WordType := dsSynonymWordExtention.DataSet.FieldByName('BaseWordTypeID').AsInteger;
    SynonymWordExtentionDialogForm.ExplanationID := dsSynonymWordExtention.DataSet.FieldByName('BaseExplanationID').AsInteger;
    SynonymWordExtentionDialogForm.SynonymWord := dsSynonymWordExtention.DataSet.FieldByName('Word').AsString;
    SynonymWordExtentionDialogForm.SynonymWordType := dsSynonymWordExtention.DataSet.FieldByName('WordTypeID').AsInteger;
    SynonymWordExtentionDialogForm.SynonymExplanationID := dsSynonymWordExtention.DataSet.FieldByName('ExplanationID').AsInteger;

    oldSynonymWordExtendInfo := TSynonymExtention.Create;
    oldSynonymWordExtendInfo.Word := SynonymWordExtentionDialogForm.Word;
    oldSynonymWordExtendInfo.WordType := SynonymWordExtentionDialogForm.WordType;
    oldSynonymWordExtendInfo.ExplanationID := SynonymWordExtentionDialogForm.ExplanationID;
    oldSynonymWordExtendInfo.SynonymWord := SynonymWordExtentionDialogForm.SynonymWord;
    oldSynonymWordExtendInfo.SynonymWordType := SynonymWordExtentionDialogForm.SynonymWordType;
    oldSynonymWordExtendInfo.SynonymExplanationID := SynonymWordExtentionDialogForm.SynonymExplanationID;

    if SynonymWordExtentionDialogForm.ShowModal  <> mrOk then
      Exit;

    synonymWordExtendInfo := TSynonymExtention.Create;
    synonymWordExtendInfo.Word := SynonymWordExtentionDialogForm.Word;
    synonymWordExtendInfo.WordType := SynonymWordExtentionDialogForm.WordType;
    synonymWordExtendInfo.ExplanationID := SynonymWordExtentionDialogForm.ExplanationID;
    synonymWordExtendInfo.SynonymWord := SynonymWordExtentionDialogForm.SynonymWord;
    synonymWordExtendInfo.SynonymWordType := SynonymWordExtentionDialogForm.SynonymWordType;
    synonymWordExtendInfo.SynonymExplanationID := SynonymWordExtentionDialogForm.SynonymExplanationID;

    grdSynonymWordExtention.BeginUpdate;

    FWordExtensionController.UpdateSynonymExtention(synonymWordExtendInfo, oldSynonymWordExtendInfo);

    grdWordRowChanging(Sender, grdWord.SelectedRow[0], grdWord.SelectedRow[0], Allow);
    dsSynonymWordExtention.DataSet.Locate('Word', synonymWordExtendInfo.SynonymWord, []);

    grdSynonymWordExtention.EndUpdate;
  finally
    SynonymWordExtentionDialogForm.Free;
    oldSynonymWordExtendInfo.Free;
    synonymWordExtendInfo.Free;
  end;
end;

procedure TWordExtensionForm.actUpdateTypeWordExtentionExecute(Sender: TObject);
var
  typeWordExtendInfo, oldTypeWordExtendInfo:TTypeWordExtention;
  Allow:Boolean;
begin
  try
    TypeWordExtentionDialogForm := TTypeWordExtentionDialogForm.Create(nil);
    TypeWordExtentionDialogForm.BaseWord := dsWord.DataSet.FieldByName('Word').AsString;
    TypeWordExtentionDialogForm.BaseType := dsTypeWordExtention.DataSet.FieldByName('BaseWordTypeID').AsInteger;
    TypeWordExtentionDialogForm.ExtendWord := dsTypeWordExtention.DataSet.FieldByName('Word').AsString;
    TypeWordExtentionDialogForm.ExtendType := dsTypeWordExtention.DataSet.FieldByName('WordTypeID').AsInteger;

    oldTypeWordExtendInfo := TTypeWordExtention.Create;
    oldTypeWordExtendInfo.BaseWord := TypeWordExtentionDialogForm.BaseWord;
    oldTypeWordExtendInfo.BaseType := TypeWordExtentionDialogForm.BaseType;
    oldTypeWordExtendInfo.ExtendWord := TypeWordExtentionDialogForm.ExtendWord;
    oldTypeWordExtendInfo.ExtendType := TypeWordExtentionDialogForm.ExtendType;

    if TypeWordExtentionDialogForm.ShowModal  <> mrOk then
      Exit;

    typeWordExtendInfo := TTypeWordExtention.Create;
    typeWordExtendInfo.BaseWord := TypeWordExtentionDialogForm.BaseWord;
    typeWordExtendInfo.BaseType := TypeWordExtentionDialogForm.BaseType;
    typeWordExtendInfo.ExtendWord := TypeWordExtentionDialogForm.ExtendWord;
    typeWordExtendInfo.ExtendType := TypeWordExtentionDialogForm.ExtendType;

    grdTypeWordExtention.BeginUpdate;

    FWordExtensionController.UpdateTypeWordExtention(typeWordExtendInfo, oldTypeWordExtendInfo);

    grdWordRowChanging(Sender, grdWord.SelectedRow[0], grdWord.SelectedRow[0], Allow);
    dsTypeWordExtention.DataSet.Locate('Word', typeWordExtendInfo.ExtendWord, []);

    grdTypeWordExtention.EndUpdate;
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
      grdTypeWordExtention.BeginUpdate;

//      ShowWords('%');
//
//      qryWord.Locate('Word', edtWordEdit.Text, []);

      grdTypeWordExtention.EndUpdate;
    end;
  finally
    WordExplainForm.Free;
  end;
end;

procedure TWordExtensionForm.actViewPictureExecute(Sender: TObject);
//var
//  ExplanationID:Integer;
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

      grdTypeWordExtention.BeginUpdate;
//      ShowWordExplanation;
//      qryWordExplanation.Locate('ExplanationID', ExplanationID, []);
      grdTypeWordExtention.EndUpdate;
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
   (grdTypeWordExtention.RowSelectCount > 0);
  mnuDelete.Enabled := (dsTypeWordExtention.DataSet.RecordCount > 0) and
   (grdTypeWordExtention.RowSelectCount > 0);
  mnuViewPicture.Enabled := (dsTypeWordExtention.DataSet.RecordCount > 0) and
   (grdTypeWordExtention.RowSelectCount > 0);
  mnuViewExplanation.Enabled := (dsTypeWordExtention.DataSet.RecordCount > 0) and
   (grdTypeWordExtention.RowSelectCount > 0);
end;


procedure TWordExtensionForm.advpmn2Popup(Sender: TObject);
begin
  mnuAddSynonymExtention.Enabled := (dsWord.DataSet.RecordCount > 0) and
    (grdWord.RowSelectCount > 0);
  mnuUpdateSynonymExtention.Enabled := (dsSynonymWordExtention.DataSet.RecordCount > 0) and
   (grdSynonymWordExtention.RowSelectCount > 0);
  mnuDeleteSynonymExtention.Enabled := (dsSynonymWordExtention.DataSet.RecordCount > 0) and
   (grdSynonymWordExtention.RowSelectCount > 0);
  mnuSynonymViewPicture.Enabled := (dsSynonymWordExtention.DataSet.RecordCount > 0) and
   (grdSynonymWordExtention.RowSelectCount > 0);
  mnuSynonymViewExplanation.Enabled := (dsSynonymWordExtention.DataSet.RecordCount > 0) and
   (grdSynonymWordExtention.RowSelectCount > 0);
end;

procedure TWordExtensionForm.advpmn3Popup(Sender: TObject);
begin
  mnuAddAntonymExtention.Enabled := (dsWord.DataSet.RecordCount > 0) and
    (grdWord.RowSelectCount > 0);
  mnuUpdateAntonymExtention.Enabled := (dsAntonymWordExtention.DataSet.RecordCount > 0) and
   (grdAntonymWordExtention.RowSelectCount > 0);
  mnuDeleteAntonymExtention.Enabled := (dsAntonymWordExtention.DataSet.RecordCount > 0) and
   (grdAntonymWordExtention.RowSelectCount > 0);
  mnuAntonymViewPicture.Enabled := (dsAntonymWordExtention.DataSet.RecordCount > 0) and
   (grdAntonymWordExtention.RowSelectCount > 0);
  mnuAntonymViewExplanation.Enabled := (dsAntonymWordExtention.DataSet.RecordCount > 0) and
   (grdAntonymWordExtention.RowSelectCount > 0);
end;

procedure TWordExtensionForm.aopWordExtensionChange(Sender: TObject);
begin
  SetEditMenuStatus;
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
  aopWordExtension.ActivePageIndex := 0;
  FFormInit := False;

  grdWordRowChanging(Sender, 0, 1, Allow);
end;

procedure TWordExtensionForm.FormShow(Sender: TObject);
begin
  if FWord <> '' then
    dsWord.DataSet.Locate('Word', FWord, []);
end;

procedure TWordExtensionForm.grdWordRowChanging(Sender: TObject; OldRow,
  NewRow: Integer; var Allow: Boolean);
var
  word:TWord;
  ResultVariant:Variant;
begin

  if FFormInit then
  begin
    SetEditMenuStatus;

    exit;
  end;

  word := TWord.Create;
  ResultVariant := dsWord.DataSet.Lookup('RowID', NewRow , 'Word');
  word.Word := ResultVariant;

  FWordExtensionController.ShowTypeWordExtention(word);
  FWordExtensionController.ShowSynonymExtention(word);
  FWordExtensionController.ShowAntonymExtention(word);

  word.Free;

  SetEditMenuStatus;
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

procedure TWordExtensionForm.ShowSynonymExtention(value:TCustomADODataSet);
begin
  dsSynonymWordExtention.DataSet := value;
end;

procedure TWordExtensionForm.ShowAntonymExtention(value:TCustomADODataSet);
begin
  dsAntonymWordExtention.DataSet := value;
end;

procedure TWordExtensionForm.SetEditMenuStatus;
begin
  if FFormInit then
    exit;

  case aopWordExtension.ActivePageIndex of
    0:
      begin
        actAddExtention.Enabled := (dsWord.DataSet.RecordCount > 0) and (grdWord.RowSelectCount > 0);
        actUpdateExtention.Enabled := (dsTypeWordExtention.DataSet.RecordCount > 0) and (grdTypeWordExtention.RowSelectCount > 0);
        actRemoveExtention.Enabled := (dsTypeWordExtention.DataSet.RecordCount > 0) and (grdTypeWordExtention.RowSelectCount > 0);
      end;
    2:
      begin
        actAddExtention.Enabled := (dsWord.DataSet.RecordCount > 0) and (grdWord.RowSelectCount > 0);
        actUpdateExtention.Enabled := (dsSynonymWordExtention.DataSet.RecordCount > 0) and (grdSynonymWordExtention.RowSelectCount > 0);
        actRemoveExtention.Enabled := (dsSynonymWordExtention.DataSet.RecordCount > 0) and (grdSynonymWordExtention.RowSelectCount > 0);
      end;
    3:
      begin
        actAddExtention.Enabled := (dsWord.DataSet.RecordCount > 0) and (grdWord.RowSelectCount > 0);
        actUpdateExtention.Enabled := (dsAntonymWordExtention.DataSet.RecordCount > 0) and (grdAntonymWordExtention.RowSelectCount > 0);
        actRemoveExtention.Enabled := (dsAntonymWordExtention.DataSet.RecordCount > 0) and (grdAntonymWordExtention.RowSelectCount > 0);
      end;
  end;
end;

procedure TWordExtensionForm.ShowWordRecordCount;
begin
  grpWord.Caption := Format('单词一览(记录数：%d)' , [dsWord.DataSet.RecordCount]);
end;

end.
