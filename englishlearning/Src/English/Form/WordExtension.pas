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
    grdDerivativeWordExtention: TDBAdvGrid;
    advfcpg2: TAdvOfficePage;
    grpWord: TGroupBox;
    grdWord: TDBAdvGrid;
    dsWord: TDataSource;
    advfcpg3: TAdvOfficePage;
    advfcpg4: TAdvOfficePage;
    advfcpg5: TAdvOfficePage;
    ilGridPopMenu: TImageList;
    actTypeWordExtention: TActionList;
    actAddDerivativeExtention: TAction;
    actUpdateDerivativeExtention: TAction;
    actDeleteDerivativeExtention: TAction;
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
    btnNextPage: TAdvGlowButton;
    btnPreviousPage: TAdvGlowButton;
    btnGoto: TAdvGlowButton;
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
    btnFind: TAdvGlowButton;
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
    dsDerivativeExtention: TDataSource;
    dsHomoionymWordExtention: TDataSource;
    advpmn4: TAdvPopupMenu;
    mnuAddHomoionymExtention: TMenuItem;
    mnuUpdateHomoionymExtention: TMenuItem;
    mnuDeleteHomoionymExtention: TMenuItem;
    MenuItem6: TMenuItem;
    mnuHomoionymViewPicture: TMenuItem;
    mnuHomoionymViewExplanation: TMenuItem;
    actAddHomoionymExtention: TAction;
    actUpdateHomoionymExtention: TAction;
    actDeleteHomoionymExtention: TAction;
    actHomoionymViewPicture: TAction;
    actHomoionymViewExplanation: TAction;
    grdHomoionymWordExtention: TDBAdvGrid;
    procedure FormCreate(Sender: TObject);
    procedure grdWordRowChanging(Sender: TObject; OldRow, NewRow: Integer;
      var Allow: Boolean);
    procedure advpmn1Popup(Sender: TObject);
    procedure actAddDerivativeExtentionExecute(Sender: TObject);
    procedure actUpdateDerivativeExtentionExecute(Sender: TObject);
    procedure actDeleteDerivativeExtentionExecute(Sender: TObject);
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
    procedure actAddHomoionymExtentionExecute(Sender: TObject);
    procedure actUpdateHomoionymExtentionExecute(Sender: TObject);
    procedure actDeleteHomoionymExtentionExecute(Sender: TObject);
    procedure actHomoionymViewPictureExecute(Sender: TObject);
    procedure actHomoionymViewExplanationExecute(Sender: TObject);
    procedure advpmn4Popup(Sender: TObject);
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
    procedure ShowDerivativeExtention(value:TCustomADODataSet);
    procedure ShowSynonymExtention(value:TCustomADODataSet);
    procedure ShowAntonymExtention(value:TCustomADODataSet);
    procedure ShowHomoionymExtention(value:TCustomADODataSet);
  end;

var
  WordExtensionForm: TWordExtensionForm;

implementation

uses {TypeWordExtentionDialog, }WordPicture, WordExplain,
  SynonymWordExtentionDialog, DerivativeWordExtentionDialog;

{$R *.dfm}


procedure TWordExtensionForm.actAddSynonymExtentionExecute(Sender: TObject);
var
  synonymWordExtendInfo:TSynonymExtention;
  Allow:Boolean;
begin
  try
    synonymWordExtendInfo := TSynonymExtention.Create;

    SynonymWordExtentionDialogForm := TSynonymWordExtentionDialogForm.Create(nil);
    SynonymWordExtentionDialogForm.Word := dsWord.DataSet.FieldByName('Word').AsString;
    SynonymWordExtentionDialogForm.WordType := 0;
    SynonymWordExtentionDialogForm.SynonymWord := dsWord.DataSet.FieldByName('Word').AsString;
    SynonymWordExtentionDialogForm.SynonymWordType := 0;

    if SynonymWordExtentionDialogForm.ShowModal  <> mrOk then
      Exit;

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

procedure TWordExtensionForm.actAddDerivativeExtentionExecute(Sender: TObject);
var
//  typeWordExtendInfo:TTypeWordExtention;
  DerivativeExtendInfo:TDerivativeExtention;
  Allow:Boolean;
begin
  try
    DerivativeExtendInfo := TDerivativeExtention.Create;

    DerivativeWordExtentionDialogForm := TDerivativeWordExtentionDialogForm.Create(nil);
    DerivativeWordExtentionDialogForm.BaseWord := dsWord.DataSet.FieldByName('Word').AsString;
    DerivativeWordExtentionDialogForm.BaseType := 1;
    //TypeWordExtentionDialogForm.ExtendWord := dsTypeWordExtention.DataSet.FieldByName('Word').AsString;
    DerivativeWordExtentionDialogForm.ExtendWord := dsWord.DataSet.FieldByName('Word').AsString;
    DerivativeWordExtentionDialogForm.ExtendType := 1;

    if DerivativeWordExtentionDialogForm.ShowModal  <> mrOk then
      Exit;

//    typeWordExtendInfo := TTypeWordExtention.Create;
//    typeWordExtendInfo.BaseWord := TypeWordExtentionDialogForm.BaseWord;
//    typeWordExtendInfo.BaseType := TypeWordExtentionDialogForm.BaseType;
//    typeWordExtendInfo.ExtendWord := TypeWordExtentionDialogForm.ExtendWord;
//    typeWordExtendInfo.ExtendType := TypeWordExtentionDialogForm.ExtendType;
    DerivativeExtendInfo.OriginalWord := DerivativeWordExtentionDialogForm.BaseWord;
    DerivativeExtendInfo.OriginalType := DerivativeWordExtentionDialogForm.BaseType;
    DerivativeExtendInfo.DerivedWord := DerivativeWordExtentionDialogForm.ExtendWord;
    DerivativeExtendInfo.DerivedType := DerivativeWordExtentionDialogForm.ExtendType;

    grdDerivativeWordExtention.BeginUpdate;

//    FWordExtensionController.InsertTypeWordExtention(typeWordExtendInfo);
    FWordExtensionController.InsertDerivativeExtention(DerivativeExtendInfo);

    grdWordRowChanging(Sender, grdWord.SelectedRow[0], grdWord.SelectedRow[0], Allow);
//    dsTypeWordExtention.DataSet.Locate('Word', typeWordExtendInfo.ExtendWord, []);
    dsDerivativeExtention.DataSet.Locate('Word', DerivativeExtendInfo.DerivedWord, []);

    grdDerivativeWordExtention.EndUpdate;
  finally
    DerivativeWordExtentionDialogForm.Free;
//    typeWordExtendInfo.Free;
    DerivativeExtendInfo.Free;
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
//var
//  ExplanationID:Integer;
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

procedure TWordExtensionForm.actDeleteDerivativeExtentionExecute(Sender: TObject);
var
//  typeWordExtendInfo:TTypeWordExtention;
  DerivativeExtendInfo:TDerivativeExtention;
  Allow:Boolean;
begin
  try
//    typeWordExtendInfo := TTypeWordExtention.Create;
    DerivativeExtendInfo := TDerivativeExtention.Create;

    if MessageDlg('您确认要删除吗？', mtconfirmation, [mbYes, mbNo], 0) <> mrYes then
    begin
      exit;
    end;

//    typeWordExtendInfo.BaseWord := dsWord.DataSet.FieldByName('Word').AsString;
//    typeWordExtendInfo.BaseType := dsTypeWordExtention.DataSet.FieldByName('BaseWordTypeID').AsInteger;
//    typeWordExtendInfo.ExtendWord := dsTypeWordExtention.DataSet.FieldByName('Word').AsString;
//    typeWordExtendInfo.ExtendType := dsTypeWordExtention.DataSet.FieldByName('WordTypeID').AsInteger;
    DerivativeExtendInfo.OriginalWord := dsWord.DataSet.FieldByName('Word').AsString;
    DerivativeExtendInfo.OriginalType := dsDerivativeExtention.DataSet.FieldByName('BaseWordTypeID').AsInteger;
    DerivativeExtendInfo.DerivedWord := dsDerivativeExtention.DataSet.FieldByName('Word').AsString;
    DerivativeExtendInfo.DerivedType := dsDerivativeExtention.DataSet.FieldByName('WordTypeID').AsInteger;

    grdDerivativeWordExtention.BeginUpdate;

//    FWordExtensionController.DeleteTypeWordExtention(typeWordExtendInfo);
    FWordExtensionController.DeleteDerivativeExtention(DerivativeExtendInfo);

    grdWordRowChanging(Sender, grdWord.SelectedRow[0], grdWord.SelectedRow[0], Allow);
    //dsTypeWordExtention.DataSet.Locate('Word', typeWordExtendInfo.Word, []);

    grdDerivativeWordExtention.EndUpdate;
  finally
    //if Assigned(typeWordExtendInfo) then
    //typeWordExtendInfo.Free;
    DerivativeExtendInfo.Free;
  end;
end;

procedure TWordExtensionForm.actDeleteHomoionymExtentionExecute(
  Sender: TObject);
var
  HomoionymWordExtendInfo:THomoionymExtention;
  Allow:Boolean;
begin
  try
    HomoionymWordExtendInfo := THomoionymExtention.Create;

    if MessageDlg('您确认要删除吗？', mtconfirmation, [mbYes, mbNo], 0) <> mrYes then
    begin
      exit;
    end;

    HomoionymWordExtendInfo.Word := dsWord.DataSet.FieldByName('Word').AsString;
    //HomoionymWordExtendInfo.WordType := dsHomoionymWordExtention.DataSet.FieldByName('WordTypeID').AsInteger;
    //HomoionymWordExtendInfo.WordType := dsHomoionymWordExtention.DataSet.FieldByName('WordTypeID').AsInteger;
    HomoionymWordExtendInfo.HomoionymWord := dsHomoionymWordExtention.DataSet.FieldByName('Word').AsString;
    //HomoionymWordExtendInfo.HomoionymWordType := dsHomoionymWordExtention.DataSet.FieldByName('WordTypeID').AsInteger;
    //HomoionymWordExtendInfo.WordType := dsHomoionymWordExtention.DataSet.FieldByName('WordTypeID').AsInteger;

    grdHomoionymWordExtention.BeginUpdate;

    FWordExtensionController.DeleteHomoionymExtention(HomoionymWordExtendInfo);

    grdWordRowChanging(Sender, grdWord.SelectedRow[0], grdWord.SelectedRow[0], Allow);
    //dsAntonymWordExtention.DataSet.Locate('Word', typeWordExtendInfo.Word, []);

    grdHomoionymWordExtention.EndUpdate;
  finally
    //if Assigned(AntonymWordExtendInfo) then
    HomoionymWordExtendInfo.Free;
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

procedure TWordExtensionForm.actHomoionymViewExplanationExecute(
  Sender: TObject);
begin
  try
    WordExplainForm := TWordExplainForm.Create(nil);
    WordExplainForm.Word := dsHomoionymWordExtention.DataSet.FieldByName('Word').AsString;
    WordExplainForm.ShowModal;

    if WordExplainForm.IsChanged then
    begin
      grdHomoionymWordExtention.BeginUpdate;

//      ShowWords('%');
//
//      qryWord.Locate('Word', edtWordEdit.Text, []);

      grdHomoionymWordExtention.EndUpdate;
    end;
  finally
    WordExplainForm.Free;
  end;
end;

procedure TWordExtensionForm.actHomoionymViewPictureExecute(Sender: TObject);
//var
//  ExplanationID:Integer;
begin
  try
    WordPictureForm := TWordPictureForm.Create(nil);
    WordPictureForm.Word := dsHomoionymWordExtention.DataSet.FieldByName('Word').AsString;
    WordPictureForm.WordType := dsHomoionymWordExtention.DataSet.FieldByName('WordTypeID').AsInteger;
//    WordPictureForm.ExplanationID := qryWordExplanation.FieldByName('ExplanationID').AsInteger;
    WordPictureForm.ShowModal;

    if WordPictureForm.IsChanged then
    begin
//      FIsChanged := True;

//      ExplanationID := qryWordExplanation.FieldByName('ExplanationID').AsInteger;

      grdHomoionymWordExtention.BeginUpdate;
//      ShowWordExplanation;
//      qryWordExplanation.Locate('ExplanationID', ExplanationID, []);
      grdHomoionymWordExtention.EndUpdate;
    end;
  finally
    WordPictureForm.Free;
  end;
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
    antonymWordExtendInfo := TAntonymExtention.Create;

    SynonymWordExtentionDialogForm := TSynonymWordExtentionDialogForm.Create(nil);
    SynonymWordExtentionDialogForm.ExtentionType := 3;
    SynonymWordExtentionDialogForm.Word := dsWord.DataSet.FieldByName('Word').AsString;
    SynonymWordExtentionDialogForm.WordType := 0;
    SynonymWordExtentionDialogForm.SynonymWord := dsWord.DataSet.FieldByName('Word').AsString;
    SynonymWordExtentionDialogForm.SynonymWordType := 0;

    if SynonymWordExtentionDialogForm.ShowModal  <> mrOk then
      Exit;

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
       actAddDerivativeExtentionExecute(Sender);
     2:
       actAddSynonymExtentionExecute(Sender);
     3:
       actAddAntonymExtentionExecute(Sender);
     4:
       actAddHomoionymExtentionExecute(Sender);
  end;
end;

procedure TWordExtensionForm.actAddHomoionymExtentionExecute(Sender: TObject);
var
//  antonymWordExtendInfo:TAntonymExtention;
  HomoionymWordExtendInfo:THomoionymExtention;
  Allow:Boolean;
begin
  try
    HomoionymWordExtendInfo := THomoionymExtention.Create;

    SynonymWordExtentionDialogForm := TSynonymWordExtentionDialogForm.Create(nil);
    SynonymWordExtentionDialogForm.ExtentionType := 4;
    SynonymWordExtentionDialogForm.Word := dsWord.DataSet.FieldByName('Word').AsString;
    SynonymWordExtentionDialogForm.WordType := 0;
    SynonymWordExtentionDialogForm.SynonymWord := dsWord.DataSet.FieldByName('Word').AsString;
    SynonymWordExtentionDialogForm.SynonymWordType := 0;

    if SynonymWordExtentionDialogForm.ShowModal  <> mrOk then
      Exit;

    HomoionymWordExtendInfo.Word := SynonymWordExtentionDialogForm.Word;
    HomoionymWordExtendInfo.WordType := SynonymWordExtentionDialogForm.WordType;
    HomoionymWordExtendInfo.ExplanationID := SynonymWordExtentionDialogForm.ExplanationID;

    HomoionymWordExtendInfo.HomoionymWord := SynonymWordExtentionDialogForm.SynonymWord;
    HomoionymWordExtendInfo.HomoionymWordType := SynonymWordExtentionDialogForm.SynonymWordType;
    HomoionymWordExtendInfo.HomoionymExplanationID := SynonymWordExtentionDialogForm.SynonymExplanationID;

    grdHomoionymWordExtention.BeginUpdate;

    FWordExtensionController.InsertHomoionymExtention(HomoionymWordExtendInfo);

    grdWordRowChanging(Sender, grdWord.SelectedRow[0], grdWord.SelectedRow[0], Allow);
    dsHomoionymWordExtention.DataSet.Locate('Word', HomoionymWordExtendInfo.HomoionymWord, []);

    grdHomoionymWordExtention.EndUpdate;
  finally
    SynonymWordExtentionDialogForm.Free;
    HomoionymWordExtendInfo.Free;
  end;
end;

procedure TWordExtensionForm.actRemoveExtentionExecute(Sender: TObject);
begin
  case aopWordExtension.ActivePageIndex of
     0:
       actDeleteDerivativeExtentionExecute(Sender);
     2:
       actDeleteSynonymExtentionExecute(Sender);
     3:
       actDeleteAntonymExtentionExecute(Sender);
     4:
       actDeleteHomoionymExtentionExecute(Sender);
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
//var
//  ExplanationID:Integer;
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
    oldAntonymWordExtendInfo := TAntonymExtention.Create;
    antonymWordExtendInfo := TAntonymExtention.Create;

    SynonymWordExtentionDialogForm := TSynonymWordExtentionDialogForm.Create(nil);
    SynonymWordExtentionDialogForm.ExtentionType := 3;
    SynonymWordExtentionDialogForm.Word := dsWord.DataSet.FieldByName('Word').AsString;
    SynonymWordExtentionDialogForm.WordType := dsAntonymWordExtention.DataSet.FieldByName('BaseWordTypeID').AsInteger;
    SynonymWordExtentionDialogForm.ExplanationID := dsAntonymWordExtention.DataSet.FieldByName('BaseExplanationID').AsInteger;
    SynonymWordExtentionDialogForm.SynonymWord := dsAntonymWordExtention.DataSet.FieldByName('Word').AsString;
    SynonymWordExtentionDialogForm.SynonymWordType := dsAntonymWordExtention.DataSet.FieldByName('WordTypeID').AsInteger;
    SynonymWordExtentionDialogForm.SynonymExplanationID := dsAntonymWordExtention.DataSet.FieldByName('ExplanationID').AsInteger;

    oldAntonymWordExtendInfo.Word := SynonymWordExtentionDialogForm.Word;
    oldAntonymWordExtendInfo.WordType := SynonymWordExtentionDialogForm.WordType;
    oldAntonymWordExtendInfo.ExplanationID := SynonymWordExtentionDialogForm.ExplanationID;
    oldAntonymWordExtendInfo.AntonymWord := SynonymWordExtentionDialogForm.SynonymWord;
    oldAntonymWordExtendInfo.AntonymWordType := SynonymWordExtentionDialogForm.SynonymWordType;
    oldAntonymWordExtendInfo.AntonymExplanationID := SynonymWordExtentionDialogForm.SynonymExplanationID;

    if SynonymWordExtentionDialogForm.ShowModal  <> mrOk then
      Exit;

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
       actUpdateDerivativeExtentionExecute(Sender);
     2:
       actUpdateSynonymExtentionExecute(Sender);
     3:
       actUpdateAntonymExtentionExecute(Sender);
     4:
       actUpdateHomoionymExtentionExecute(Sender);
   end;
end;

procedure TWordExtensionForm.actUpdateHomoionymExtentionExecute(
  Sender: TObject);
var
  HomoionymWordExtendInfo, oldHomoionymWordExtendInfo:THomoionymExtention;
  Allow:Boolean;
begin
  try
    oldHomoionymWordExtendInfo := THomoionymExtention.Create;
    HomoionymWordExtendInfo := THomoionymExtention.Create;

    SynonymWordExtentionDialogForm := TSynonymWordExtentionDialogForm.Create(nil);
    SynonymWordExtentionDialogForm.ExtentionType := 4;
    SynonymWordExtentionDialogForm.Word := dsWord.DataSet.FieldByName('Word').AsString;
    SynonymWordExtentionDialogForm.WordType := dsHomoionymWordExtention.DataSet.FieldByName('BaseWordTypeID').AsInteger;
    SynonymWordExtentionDialogForm.ExplanationID := dsHomoionymWordExtention.DataSet.FieldByName('BaseExplanationID').AsInteger;
    SynonymWordExtentionDialogForm.SynonymWord := dsHomoionymWordExtention.DataSet.FieldByName('Word').AsString;
    SynonymWordExtentionDialogForm.SynonymWordType := dsHomoionymWordExtention.DataSet.FieldByName('WordTypeID').AsInteger;
    SynonymWordExtentionDialogForm.SynonymExplanationID := dsHomoionymWordExtention.DataSet.FieldByName('ExplanationID').AsInteger;

    oldHomoionymWordExtendInfo.Word := SynonymWordExtentionDialogForm.Word;
    oldHomoionymWordExtendInfo.WordType := SynonymWordExtentionDialogForm.WordType;
    oldHomoionymWordExtendInfo.ExplanationID := SynonymWordExtentionDialogForm.ExplanationID;
    oldHomoionymWordExtendInfo.HomoionymWord := SynonymWordExtentionDialogForm.SynonymWord;
    oldHomoionymWordExtendInfo.HomoionymWordType := SynonymWordExtentionDialogForm.SynonymWordType;
    oldHomoionymWordExtendInfo.HomoionymExplanationID := SynonymWordExtentionDialogForm.SynonymExplanationID;

    if SynonymWordExtentionDialogForm.ShowModal  <> mrOk then
      Exit;

    HomoionymWordExtendInfo.Word := SynonymWordExtentionDialogForm.Word;
    HomoionymWordExtendInfo.WordType := SynonymWordExtentionDialogForm.WordType;
    HomoionymWordExtendInfo.ExplanationID := SynonymWordExtentionDialogForm.ExplanationID;
    HomoionymWordExtendInfo.HomoionymWord := SynonymWordExtentionDialogForm.SynonymWord;
    HomoionymWordExtendInfo.HomoionymWordType := SynonymWordExtentionDialogForm.SynonymWordType;
    HomoionymWordExtendInfo.HomoionymExplanationID := SynonymWordExtentionDialogForm.SynonymExplanationID;

    grdHomoionymWordExtention.BeginUpdate;

    FWordExtensionController.UpdateHomoionymExtention(HomoionymWordExtendInfo, oldHomoionymWordExtendInfo);

    grdWordRowChanging(Sender, grdWord.SelectedRow[0], grdWord.SelectedRow[0], Allow);
    dsHomoionymWordExtention.DataSet.Locate('Word', HomoionymWordExtendInfo.HomoionymWord, []);

    grdHomoionymWordExtention.EndUpdate;
  finally
    SynonymWordExtentionDialogForm.Free;
    oldHomoionymWordExtendInfo.Free;
    HomoionymWordExtendInfo.Free;
  end;
end;

procedure TWordExtensionForm.actUpdateSynonymExtentionExecute(Sender: TObject);
var
  synonymWordExtendInfo, oldSynonymWordExtendInfo:TSynonymExtention;
  Allow:Boolean;
begin
  try
    oldSynonymWordExtendInfo := TSynonymExtention.Create;
    synonymWordExtendInfo := TSynonymExtention.Create;

    SynonymWordExtentionDialogForm := TSynonymWordExtentionDialogForm.Create(nil);
    SynonymWordExtentionDialogForm.Word := dsWord.DataSet.FieldByName('Word').AsString;
    SynonymWordExtentionDialogForm.WordType := dsSynonymWordExtention.DataSet.FieldByName('BaseWordTypeID').AsInteger;
    SynonymWordExtentionDialogForm.ExplanationID := dsSynonymWordExtention.DataSet.FieldByName('BaseExplanationID').AsInteger;
    SynonymWordExtentionDialogForm.SynonymWord := dsSynonymWordExtention.DataSet.FieldByName('Word').AsString;
    SynonymWordExtentionDialogForm.SynonymWordType := dsSynonymWordExtention.DataSet.FieldByName('WordTypeID').AsInteger;
    SynonymWordExtentionDialogForm.SynonymExplanationID := dsSynonymWordExtention.DataSet.FieldByName('ExplanationID').AsInteger;

    oldSynonymWordExtendInfo.Word := SynonymWordExtentionDialogForm.Word;
    oldSynonymWordExtendInfo.WordType := SynonymWordExtentionDialogForm.WordType;
    oldSynonymWordExtendInfo.ExplanationID := SynonymWordExtentionDialogForm.ExplanationID;
    oldSynonymWordExtendInfo.SynonymWord := SynonymWordExtentionDialogForm.SynonymWord;
    oldSynonymWordExtendInfo.SynonymWordType := SynonymWordExtentionDialogForm.SynonymWordType;
    oldSynonymWordExtendInfo.SynonymExplanationID := SynonymWordExtentionDialogForm.SynonymExplanationID;

    if SynonymWordExtentionDialogForm.ShowModal  <> mrOk then
      Exit;

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

procedure TWordExtensionForm.actUpdateDerivativeExtentionExecute(Sender: TObject);
var
//  typeWordExtendInfo, oldTypeWordExtendInfo:TTypeWordExtention;
  DerivativeExtendInfo, oldDerivativeExtendInfo:TDerivativeExtention;
  Allow:Boolean;
begin
  try
    oldDerivativeExtendInfo := TDerivativeExtention.Create;
    DerivativeExtendInfo := TDerivativeExtention.Create;

    DerivativeWordExtentionDialogForm := TDerivativeWordExtentionDialogForm.Create(nil);
    DerivativeWordExtentionDialogForm.BaseWord := dsWord.DataSet.FieldByName('Word').AsString;
    DerivativeWordExtentionDialogForm.BaseType := dsDerivativeExtention.DataSet.FieldByName('BaseWordTypeID').AsInteger;
    DerivativeWordExtentionDialogForm.ExtendWord := dsDerivativeExtention.DataSet.FieldByName('Word').AsString;
    DerivativeWordExtentionDialogForm.ExtendType := dsDerivativeExtention.DataSet.FieldByName('WordTypeID').AsInteger;

//    oldTypeWordExtendInfo := TTypeWordExtention.Create;
//    oldTypeWordExtendInfo.BaseWord := TypeWordExtentionDialogForm.BaseWord;
//    oldTypeWordExtendInfo.BaseType := TypeWordExtentionDialogForm.BaseType;
//    oldTypeWordExtendInfo.ExtendWord := TypeWordExtentionDialogForm.ExtendWord;
//    oldTypeWordExtendInfo.ExtendType := TypeWordExtentionDialogForm.ExtendType;
    oldDerivativeExtendInfo.OriginalWord := DerivativeWordExtentionDialogForm.BaseWord;
    oldDerivativeExtendInfo.OriginalType := DerivativeWordExtentionDialogForm.BaseType;
    oldDerivativeExtendInfo.DerivedWord := DerivativeWordExtentionDialogForm.ExtendWord;
    oldDerivativeExtendInfo.DerivedType := DerivativeWordExtentionDialogForm.ExtendType;

    if DerivativeWordExtentionDialogForm.ShowModal  <> mrOk then
      Exit;

//    typeWordExtendInfo := TTypeWordExtention.Create;
//    typeWordExtendInfo.BaseWord := TypeWordExtentionDialogForm.BaseWord;
//    typeWordExtendInfo.BaseType := TypeWordExtentionDialogForm.BaseType;
//    typeWordExtendInfo.ExtendWord := TypeWordExtentionDialogForm.ExtendWord;
//    typeWordExtendInfo.ExtendType := TypeWordExtentionDialogForm.ExtendType;
    DerivativeExtendInfo.OriginalWord := DerivativeWordExtentionDialogForm.BaseWord;
    DerivativeExtendInfo.OriginalType := DerivativeWordExtentionDialogForm.BaseType;
    DerivativeExtendInfo.DerivedWord := DerivativeWordExtentionDialogForm.ExtendWord;
    DerivativeExtendInfo.DerivedType := DerivativeWordExtentionDialogForm.ExtendType;

    grdDerivativeWordExtention.BeginUpdate;

    //FWordExtensionController.UpdateTypeWordExtention(typeWordExtendInfo, oldTypeWordExtendInfo);
    FWordExtensionController.UpdateDerivativeExtention(DerivativeExtendInfo, oldDerivativeExtendInfo);

    grdWordRowChanging(Sender, grdWord.SelectedRow[0], grdWord.SelectedRow[0], Allow);
//    dsTypeWordExtention.DataSet.Locate('Word', typeWordExtendInfo.ExtendWord, []);
    dsDerivativeExtention.DataSet.Locate('Word', DerivativeExtendInfo.DerivedWord, []);

    grdDerivativeWordExtention.EndUpdate;
  finally
    DerivativeWordExtentionDialogForm.Free;
//    oldTypeWordExtendInfo.Free;
//    typeWordExtendInfo.Free;
    DerivativeExtendInfo.Free;
    oldDerivativeExtendInfo.Free;
  end;
end;

procedure TWordExtensionForm.actViewExplanationExecute(Sender: TObject);
begin
  try
    WordExplainForm := TWordExplainForm.Create(nil);
    //WordExplainForm.Word := dsTypeWordExtention.DataSet.FieldByName('Word').AsString;
    WordExplainForm.Word := dsDerivativeExtention.DataSet.FieldByName('Word').AsString;
    WordExplainForm.ShowModal;

    if WordExplainForm.IsChanged then
    begin
      grdDerivativeWordExtention.BeginUpdate;

//      ShowWords('%');
//
//      qryWord.Locate('Word', edtWordEdit.Text, []);

      grdDerivativeWordExtention.EndUpdate;
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
    WordPictureForm.Word := dsDerivativeExtention.DataSet.FieldByName('Word').AsString;
    WordPictureForm.WordType := dsDerivativeExtention.DataSet.FieldByName('WordTypeID').AsInteger;
//    WordPictureForm.ExplanationID := qryWordExplanation.FieldByName('ExplanationID').AsInteger;
    WordPictureForm.ShowModal;

    if WordPictureForm.IsChanged then
    begin
//      FIsChanged := True;

//      ExplanationID := qryWordExplanation.FieldByName('ExplanationID').AsInteger;

      grdDerivativeWordExtention.BeginUpdate;
//      ShowWordExplanation;
//      qryWordExplanation.Locate('ExplanationID', ExplanationID, []);
      grdDerivativeWordExtention.EndUpdate;
    end;
  finally
    WordPictureForm.Free;
  end;
end;

procedure TWordExtensionForm.advpmn1Popup(Sender: TObject);
begin
  mnuAddExplanation.Enabled := (dsWord.DataSet.RecordCount > 0) and
    (grdWord.RowSelectCount > 0);
  mnuUpdateExplanation.Enabled := (dsDerivativeExtention.DataSet.RecordCount > 0) and
   (grdDerivativeWordExtention.RowSelectCount > 0);
  mnuDelete.Enabled := (dsDerivativeExtention.DataSet.RecordCount > 0) and
   (grdDerivativeWordExtention.RowSelectCount > 0);
  mnuViewPicture.Enabled := (dsDerivativeExtention.DataSet.RecordCount > 0) and
   (grdDerivativeWordExtention.RowSelectCount > 0);
  mnuViewExplanation.Enabled := (dsDerivativeExtention.DataSet.RecordCount > 0) and
   (grdDerivativeWordExtention.RowSelectCount > 0);
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

procedure TWordExtensionForm.advpmn4Popup(Sender: TObject);
begin
  mnuAddHomoionymExtention.Enabled := (dsWord.DataSet.RecordCount > 0) and
    (grdWord.RowSelectCount > 0);
  mnuUpdateHomoionymExtention.Enabled := (dsHomoionymWordExtention.DataSet.RecordCount > 0) and
   (grdHomoionymWordExtention.RowSelectCount > 0);
  mnuDeleteHomoionymExtention.Enabled := (dsHomoionymWordExtention.DataSet.RecordCount > 0) and
   (grdHomoionymWordExtention.RowSelectCount > 0);
  mnuHomoionymViewPicture.Enabled := (dsHomoionymWordExtention.DataSet.RecordCount > 0) and
   (grdHomoionymWordExtention.RowSelectCount > 0);
  mnuHomoionymViewExplanation.Enabled := (dsHomoionymWordExtention.DataSet.RecordCount > 0) and
   (grdHomoionymWordExtention.RowSelectCount > 0);
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
  if Owner = nil then
  begin
    advtlbr1.Enabled := False;
    advtlbr3.Enabled := False;

    btnNextPage.Enabled := False;
    btnPreviousPage.Enabled := False;
    btnGoto.Enabled := False;
    btnFind.Enabled := False;

    grdWord.Enabled := False;
  end;

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

//  FWordExtensionController.ShowTypeWordExtention(word);
  FWordExtensionController.ShowDerivativeExtention(word);
  FWordExtensionController.ShowSynonymExtention(word);
  FWordExtensionController.ShowAntonymExtention(word);
  FWordExtensionController.ShowHomoionymExtention(word);

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
  dsDerivativeExtention.DataSet := value;
end;

procedure TWordExtensionForm.ShowDerivativeExtention(value:TCustomADODataSet);
begin
  //grdWord.DataSource.DataSet := value;
  dsDerivativeExtention.DataSet := value;
end;

procedure TWordExtensionForm.ShowSynonymExtention(value:TCustomADODataSet);
begin
  dsSynonymWordExtention.DataSet := value;
end;

procedure TWordExtensionForm.ShowAntonymExtention(value:TCustomADODataSet);
begin
  dsAntonymWordExtention.DataSet := value;
end;

procedure TWordExtensionForm.ShowHomoionymExtention(value:TCustomADODataSet);
begin
  dsHomoionymWordExtention.DataSet := value;
end;

procedure TWordExtensionForm.SetEditMenuStatus;
begin
  if FFormInit then
    exit;

  case aopWordExtension.ActivePageIndex of
    0:
      begin
        actAddExtention.Enabled := (dsWord.DataSet.RecordCount > 0) and (grdWord.RowSelectCount > 0);
        actUpdateExtention.Enabled := (dsDerivativeExtention.DataSet.RecordCount > 0) and (grdDerivativeWordExtention.RowSelectCount > 0);
        actRemoveExtention.Enabled := (dsDerivativeExtention.DataSet.RecordCount > 0) and (grdDerivativeWordExtention.RowSelectCount > 0);
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
    4:
      begin
        actAddExtention.Enabled := (dsWord.DataSet.RecordCount > 0) and (grdWord.RowSelectCount > 0);
        actUpdateExtention.Enabled := (dsHomoionymWordExtention.DataSet.RecordCount > 0) and (grdHomoionymWordExtention.RowSelectCount > 0);
        actRemoveExtention.Enabled := (dsHomoionymWordExtention.DataSet.RecordCount > 0) and (grdHomoionymWordExtention.RowSelectCount > 0);
      end;
  end;
end;

procedure TWordExtensionForm.ShowWordRecordCount;
begin
  grpWord.Caption := Format('单词一览(记录数：%d)' , [dsWord.DataSet.RecordCount]);
end;

end.
