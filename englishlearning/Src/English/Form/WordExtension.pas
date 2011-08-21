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
    dsSynonymExtention: TDataSource;
    advpmn3: TAdvPopupMenu;
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
    dsAntonymExtention: TDataSource;
    advpmn4: TAdvPopupMenu;
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
    btnReplacePicture: TAdvGlowButton;
    grdAntonymWordExtention: TDBAdvGrid;
    dsDerivativeExtention: TDataSource;
    dsHomoionymExtention: TDataSource;
    advpmn5: TAdvPopupMenu;
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
    btnPreviousPage: TAdvGlowButton;
    btnNextPage: TAdvGlowButton;
    btnGoto: TAdvGlowButton;
    btnRemovePicture: TAdvGlowButton;
    dsResemblanceExtention: TDataSource;
    grdResemblanceWordExtention: TDBAdvGrid;
    advfcpg6: TAdvOfficePage;
    grdCongenerWordExtention: TDBAdvGrid;
    dsCongenerExtention: TDataSource;
    advpmn2: TAdvPopupMenu;
    mnuAddResemblanceExtention: TMenuItem;
    mnuUpdateResemblanceExtention: TMenuItem;
    mnuDeleteResemblanceExtention: TMenuItem;
    MenuItem7: TMenuItem;
    mnuResemblanceViewExplanation: TMenuItem;
    mnuResemblanceViewPicture: TMenuItem;
    advpmn6: TAdvPopupMenu;
    mnuAddCongenerExtention: TMenuItem;
    mnuUpdateCongenerExtention: TMenuItem;
    mnuDeleteCongenerExtention: TMenuItem;
    MenuItem13: TMenuItem;
    mnuCongenerViewExplanation: TMenuItem;
    mnuCongenerViewPicture: TMenuItem;
    actAddResemblanceExtention: TAction;
    actUpdateResemblanceExtention: TAction;
    actDeleteResemblanceExtention: TAction;
    actResemblanceViewExplanation: TAction;
    actResemblanceViewPicture: TAction;
    actAddCongenerExtention: TAction;
    actUpdateCongenerExtention: TAction;
    actDeleteCongenerExtention: TAction;
    actCongenerViewExplanation: TAction;
    actCongenerViewPicture: TAction;
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
    procedure advpmn3Popup(Sender: TObject);
    procedure actSynonymViewPictureExecute(Sender: TObject);
    procedure actSynonymViewExplanationExecute(Sender: TObject);
    procedure aopWordExtensionChange(Sender: TObject);
    procedure advpmn4Popup(Sender: TObject);
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
    procedure advpmn5Popup(Sender: TObject);
    procedure advpmn2Popup(Sender: TObject);
    procedure advpmn6Popup(Sender: TObject);
    procedure actUpdateCongenerExtentionExecute(Sender: TObject);
    procedure actUpdateResemblanceExtentionExecute(Sender: TObject);
    procedure actAddResemblanceExtentionExecute(Sender: TObject);
    procedure actAddCongenerExtentionExecute(Sender: TObject);
    procedure actDeleteResemblanceExtentionExecute(Sender: TObject);
    procedure actDeleteCongenerExtentionExecute(Sender: TObject);
    procedure actResemblanceViewExplanationExecute(Sender: TObject);
    procedure actCongenerViewExplanationExecute(Sender: TObject);
    procedure actCongenerViewPictureExecute(Sender: TObject);
    procedure actResemblanceViewPictureExecute(Sender: TObject);
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
    procedure ShowResemblanceExtention(value:TCustomADODataSet);
    procedure ShowSynonymExtention(value:TCustomADODataSet);
    procedure ShowAntonymExtention(value:TCustomADODataSet);
    procedure ShowHomoionymExtention(value:TCustomADODataSet);
    procedure ShowCongenerExtention(value:TCustomADODataSet);
  end;

var
  WordExtensionForm: TWordExtensionForm;

implementation

uses {TypeWordExtentionDialog, }WordPicture, WordExplain,
  SynonymWordExtentionDialog, DerivativeWordExtentionDialog, ResemblanceModel;

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
    dsSynonymExtention.DataSet.Locate('Word', synonymWordExtendInfo.SynonymWord, []);

    grdSynonymWordExtention.EndUpdate;
  finally
    SynonymWordExtentionDialogForm.Free;
    synonymWordExtendInfo.Free;
  end;
end;

procedure TWordExtensionForm.actAddCongenerExtentionExecute(Sender: TObject);
var
  CongenerWordExtendInfo:TCongenerExtention;
  Allow:Boolean;
begin
  try
    CongenerWordExtendInfo := TCongenerExtention.Create;

    SynonymWordExtentionDialogForm := TSynonymWordExtentionDialogForm.Create(nil);
    SynonymWordExtentionDialogForm.ExtentionType := 5;
    SynonymWordExtentionDialogForm.Word := dsWord.DataSet.FieldByName('Word').AsString;
    SynonymWordExtentionDialogForm.WordType := 0;
    SynonymWordExtentionDialogForm.SynonymWord := dsWord.DataSet.FieldByName('Word').AsString;
    SynonymWordExtentionDialogForm.SynonymWordType := 0;

    if SynonymWordExtentionDialogForm.ShowModal  <> mrOk then
      Exit;

    CongenerWordExtendInfo.Word := SynonymWordExtentionDialogForm.Word;
    CongenerWordExtendInfo.WordType := SynonymWordExtentionDialogForm.WordType;
    CongenerWordExtendInfo.ExplanationID := SynonymWordExtentionDialogForm.ExplanationID;

    CongenerWordExtendInfo.CongenerWord := SynonymWordExtentionDialogForm.SynonymWord;
    CongenerWordExtendInfo.CongenerWordType := SynonymWordExtentionDialogForm.SynonymWordType;
    CongenerWordExtendInfo.CongenerExplanationID := SynonymWordExtentionDialogForm.SynonymExplanationID;

    grdCongenerWordExtention.BeginUpdate;

    FWordExtensionController.InsertCongenerExtention(CongenerWordExtendInfo);

    grdWordRowChanging(Sender, grdWord.SelectedRow[0], grdWord.SelectedRow[0], Allow);
    dsCongenerExtention.DataSet.Locate('Word', CongenerWordExtendInfo.CongenerWord, []);

    grdCongenerWordExtention.EndUpdate;
  finally
    SynonymWordExtentionDialogForm.Free;
    CongenerWordExtendInfo.Free;
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
    WordExplainForm.Word := dsAntonymExtention.DataSet.FieldByName('Word').AsString;
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
    WordPictureForm.Word := dsAntonymExtention.DataSet.FieldByName('Word').AsString;
    WordPictureForm.WordType := dsAntonymExtention.DataSet.FieldByName('WordTypeID').AsInteger;
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

procedure TWordExtensionForm.actCongenerViewExplanationExecute(Sender: TObject);
begin
  try
    WordExplainForm := TWordExplainForm.Create(nil);
    WordExplainForm.Word := dsCongenerExtention.DataSet.FieldByName('Word').AsString;
    WordExplainForm.ShowModal;

    if WordExplainForm.IsChanged then
    begin
      grdCongenerWordExtention.BeginUpdate;

//      ShowWords('%');
//
//      qryWord.Locate('Word', edtWordEdit.Text, []);

      grdCongenerWordExtention.EndUpdate;
    end;
  finally
    WordExplainForm.Free;
  end;
end;

procedure TWordExtensionForm.actCongenerViewPictureExecute(Sender: TObject);
//var
//  ExplanationID:Integer;
begin
  try
    WordPictureForm := TWordPictureForm.Create(nil);
    WordPictureForm.Word := dsCongenerExtention.DataSet.FieldByName('Word').AsString;
    WordPictureForm.WordType := dsCongenerExtention.DataSet.FieldByName('WordTypeID').AsInteger;
//    WordPictureForm.ExplanationID := qryWordExplanation.FieldByName('ExplanationID').AsInteger;
    WordPictureForm.ShowModal;

    if WordPictureForm.IsChanged then
    begin
//      FIsChanged := True;

//      ExplanationID := qryWordExplanation.FieldByName('ExplanationID').AsInteger;

      grdCongenerWordExtention.BeginUpdate;
//      ShowWordExplanation;
//      qryWordExplanation.Locate('ExplanationID', ExplanationID, []);
      grdCongenerWordExtention.EndUpdate;
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
    AntonymWordExtendInfo.AntonymWord := dsAntonymExtention.DataSet.FieldByName('Word').AsString;
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

procedure TWordExtensionForm.actDeleteCongenerExtentionExecute(Sender: TObject);
var
  CongenerWordExtendInfo:TCongenerExtention;
  Allow:Boolean;
begin
  try
    CongenerWordExtendInfo := TCongenerExtention.Create;

    if MessageDlg('您确认要删除吗？', mtconfirmation, [mbYes, mbNo], 0) <> mrYes then
    begin
      exit;
    end;

    CongenerWordExtendInfo.Word := dsWord.DataSet.FieldByName('Word').AsString;
    //HomoionymWordExtendInfo.WordType := dsHomoionymWordExtention.DataSet.FieldByName('WordTypeID').AsInteger;
    //HomoionymWordExtendInfo.WordType := dsHomoionymWordExtention.DataSet.FieldByName('WordTypeID').AsInteger;
    CongenerWordExtendInfo.CongenerWord := dsCongenerExtention.DataSet.FieldByName('Word').AsString;
    //HomoionymWordExtendInfo.HomoionymWordType := dsHomoionymWordExtention.DataSet.FieldByName('WordTypeID').AsInteger;
    //HomoionymWordExtendInfo.WordType := dsHomoionymWordExtention.DataSet.FieldByName('WordTypeID').AsInteger;

    grdCongenerWordExtention.BeginUpdate;

    FWordExtensionController.DeleteCongenerExtention(CongenerWordExtendInfo);

    grdWordRowChanging(Sender, grdWord.SelectedRow[0], grdWord.SelectedRow[0], Allow);
    //dsAntonymWordExtention.DataSet.Locate('Word', typeWordExtendInfo.Word, []);

    grdCongenerWordExtention.EndUpdate;
  finally
    //if Assigned(AntonymWordExtendInfo) then
    CongenerWordExtendInfo.Free;
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
    synonymWordExtendInfo.SynonymWord := dsSynonymExtention.DataSet.FieldByName('Word').AsString;
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
    HomoionymWordExtendInfo.HomoionymWord := dsHomoionymExtention.DataSet.FieldByName('Word').AsString;
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

procedure TWordExtensionForm.actDeleteResemblanceExtentionExecute(
  Sender: TObject);
var
  ResemblanceWordExtendInfo:TResemblanceExtention;
  Allow:Boolean;
begin
  try
    ResemblanceWordExtendInfo := TResemblanceExtention.Create;

    if MessageDlg('您确认要删除吗？', mtconfirmation, [mbYes, mbNo], 0) <> mrYes then
    begin
      exit;
    end;

    ResemblanceWordExtendInfo.Word := dsWord.DataSet.FieldByName('Word').AsString;
    //HomoionymWordExtendInfo.WordType := dsHomoionymWordExtention.DataSet.FieldByName('WordTypeID').AsInteger;
    //HomoionymWordExtendInfo.WordType := dsHomoionymWordExtention.DataSet.FieldByName('WordTypeID').AsInteger;
    ResemblanceWordExtendInfo.ResemblanceWord := dsResemblanceExtention.DataSet.FieldByName('Word').AsString;
    //HomoionymWordExtendInfo.HomoionymWordType := dsHomoionymWordExtention.DataSet.FieldByName('WordTypeID').AsInteger;
    //HomoionymWordExtendInfo.WordType := dsHomoionymWordExtention.DataSet.FieldByName('WordTypeID').AsInteger;

    grdResemblanceWordExtention.BeginUpdate;

    FWordExtensionController.DeleteResemblanceExtention(ResemblanceWordExtendInfo);

    grdWordRowChanging(Sender, grdWord.SelectedRow[0], grdWord.SelectedRow[0], Allow);
    //dsAntonymWordExtention.DataSet.Locate('Word', typeWordExtendInfo.Word, []);

    grdResemblanceWordExtention.EndUpdate;
  finally
    //if Assigned(AntonymWordExtendInfo) then
    ResemblanceWordExtendInfo.Free;
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
    WordExplainForm.Word := dsHomoionymExtention.DataSet.FieldByName('Word').AsString;
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
    WordPictureForm.Word := dsHomoionymExtention.DataSet.FieldByName('Word').AsString;
    WordPictureForm.WordType := dsHomoionymExtention.DataSet.FieldByName('WordTypeID').AsInteger;
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
    dsAntonymExtention.DataSet.Locate('Word', antonymWordExtendInfo.AntonymWord, []);

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
     1:
       actAddResemblanceExtentionExecute(Sender);
     2:
       actAddSynonymExtentionExecute(Sender);
     3:
       actAddAntonymExtentionExecute(Sender);
     4:
       actAddHomoionymExtentionExecute(Sender);
     5:
       actAddCongenerExtentionExecute(Sender);
  end;
end;

procedure TWordExtensionForm.actAddHomoionymExtentionExecute(Sender: TObject);
var
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
    dsHomoionymExtention.DataSet.Locate('Word', HomoionymWordExtendInfo.HomoionymWord, []);

    grdHomoionymWordExtention.EndUpdate;
  finally
    SynonymWordExtentionDialogForm.Free;
    HomoionymWordExtendInfo.Free;
  end;
end;

procedure TWordExtensionForm.actAddResemblanceExtentionExecute(Sender: TObject);
var
  ResemblanceWordExtendInfo:TResemblanceExtention;
  Allow:Boolean;
begin
  try
    ResemblanceWordExtendInfo := TResemblanceExtention.Create;

    SynonymWordExtentionDialogForm := TSynonymWordExtentionDialogForm.Create(nil);
    SynonymWordExtentionDialogForm.ExtentionType := 1;
    SynonymWordExtentionDialogForm.Word := dsWord.DataSet.FieldByName('Word').AsString;
    SynonymWordExtentionDialogForm.WordType := 0;
    SynonymWordExtentionDialogForm.SynonymWord := dsWord.DataSet.FieldByName('Word').AsString;
    SynonymWordExtentionDialogForm.SynonymWordType := 0;

    if SynonymWordExtentionDialogForm.ShowModal  <> mrOk then
      Exit;

    ResemblanceWordExtendInfo.Word := SynonymWordExtentionDialogForm.Word;
    ResemblanceWordExtendInfo.WordType := SynonymWordExtentionDialogForm.WordType;
    ResemblanceWordExtendInfo.ExplanationID := SynonymWordExtentionDialogForm.ExplanationID;

    ResemblanceWordExtendInfo.ResemblanceWord := SynonymWordExtentionDialogForm.SynonymWord;
    ResemblanceWordExtendInfo.ResemblanceWordType := SynonymWordExtentionDialogForm.SynonymWordType;
    ResemblanceWordExtendInfo.ResemblanceExplanationID := SynonymWordExtentionDialogForm.SynonymExplanationID;

    grdResemblanceWordExtention.BeginUpdate;

    FWordExtensionController.InsertResemblanceExtention(ResemblanceWordExtendInfo);

    grdWordRowChanging(Sender, grdWord.SelectedRow[0], grdWord.SelectedRow[0], Allow);
    dsResemblanceExtention.DataSet.Locate('Word', ResemblanceWordExtendInfo.ResemblanceWord, []);

    grdResemblanceWordExtention.EndUpdate;
  finally
    SynonymWordExtentionDialogForm.Free;
    ResemblanceWordExtendInfo.Free;
  end;
end;

procedure TWordExtensionForm.actRemoveExtentionExecute(Sender: TObject);
begin
  case aopWordExtension.ActivePageIndex of
     0:
       actDeleteDerivativeExtentionExecute(Sender);
     1:
       actDeleteResemblanceExtentionExecute(Sender);
     2:
       actDeleteSynonymExtentionExecute(Sender);
     3:
       actDeleteAntonymExtentionExecute(Sender);
     4:
       actDeleteHomoionymExtentionExecute(Sender);
     5:
       actDeleteCongenerExtentionExecute(Sender);
  end;
end;

procedure TWordExtensionForm.actResemblanceViewExplanationExecute(
  Sender: TObject);
begin
  try
    WordExplainForm := TWordExplainForm.Create(nil);
    //WordExplainForm.Word := dsTypeWordExtention.DataSet.FieldByName('Word').AsString;
    WordExplainForm.Word := dsResemblanceExtention.DataSet.FieldByName('Word').AsString;
    WordExplainForm.ShowModal;

    if WordExplainForm.IsChanged then
    begin
      grdResemblanceWordExtention.BeginUpdate;

//      ShowWords('%');
//
//      qryWord.Locate('Word', edtWordEdit.Text, []);

      grdResemblanceWordExtention.EndUpdate;
    end;
  finally
    WordExplainForm.Free;
  end;
end;

procedure TWordExtensionForm.actResemblanceViewPictureExecute(Sender: TObject);
//var
//  ExplanationID:Integer;
begin
  try
    WordPictureForm := TWordPictureForm.Create(nil);
    WordPictureForm.Word := dsResemblanceExtention.DataSet.FieldByName('Word').AsString;
    WordPictureForm.WordType := dsResemblanceExtention.DataSet.FieldByName('WordTypeID').AsInteger;
//    WordPictureForm.ExplanationID := qryWordExplanation.FieldByName('ExplanationID').AsInteger;
    WordPictureForm.ShowModal;

    if WordPictureForm.IsChanged then
    begin
//      FIsChanged := True;

//      ExplanationID := qryWordExplanation.FieldByName('ExplanationID').AsInteger;

      grdResemblanceWordExtention.BeginUpdate;
//      ShowWordExplanation;
//      qryWordExplanation.Locate('ExplanationID', ExplanationID, []);
      grdResemblanceWordExtention.EndUpdate;
    end;
  finally
    WordPictureForm.Free;
  end;
end;

procedure TWordExtensionForm.actSynonymViewExplanationExecute(Sender: TObject);
begin
  try
    WordExplainForm := TWordExplainForm.Create(nil);
    WordExplainForm.Word := dsSynonymExtention.DataSet.FieldByName('Word').AsString;
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
    WordPictureForm.Word := dsSynonymExtention.DataSet.FieldByName('Word').AsString;
    WordPictureForm.WordType := dsSynonymExtention.DataSet.FieldByName('WordTypeID').AsInteger;
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
    SynonymWordExtentionDialogForm.WordType := dsAntonymExtention.DataSet.FieldByName('BaseWordTypeID').AsInteger;
    SynonymWordExtentionDialogForm.ExplanationID := dsAntonymExtention.DataSet.FieldByName('BaseExplanationID').AsInteger;
    SynonymWordExtentionDialogForm.SynonymWord := dsAntonymExtention.DataSet.FieldByName('Word').AsString;
    SynonymWordExtentionDialogForm.SynonymWordType := dsAntonymExtention.DataSet.FieldByName('WordTypeID').AsInteger;
    SynonymWordExtentionDialogForm.SynonymExplanationID := dsAntonymExtention.DataSet.FieldByName('ExplanationID').AsInteger;

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
    dsAntonymExtention.DataSet.Locate('Word', antonymWordExtendInfo.AntonymWord, []);

    grdAntonymWordExtention.EndUpdate;
  finally
    SynonymWordExtentionDialogForm.Free;
    oldAntonymWordExtendInfo.Free;
    antonymWordExtendInfo.Free;
  end;
end;

procedure TWordExtensionForm.actUpdateCongenerExtentionExecute(Sender: TObject);
var
  CongenerWordExtendInfo, oldCongenerWordExtendInfo:TCongenerExtention;
  Allow:Boolean;
begin
  try
    oldCongenerWordExtendInfo := TCongenerExtention.Create;
    CongenerWordExtendInfo := TCongenerExtention.Create;

    SynonymWordExtentionDialogForm := TSynonymWordExtentionDialogForm.Create(nil);
    SynonymWordExtentionDialogForm.ExtentionType := 5;
    SynonymWordExtentionDialogForm.Word := dsWord.DataSet.FieldByName('Word').AsString;
    SynonymWordExtentionDialogForm.WordType := dsCongenerExtention.DataSet.FieldByName('BaseWordTypeID').AsInteger;
    SynonymWordExtentionDialogForm.ExplanationID := dsCongenerExtention.DataSet.FieldByName('BaseExplanationID').AsInteger;
    SynonymWordExtentionDialogForm.SynonymWord := dsCongenerExtention.DataSet.FieldByName('Word').AsString;
    SynonymWordExtentionDialogForm.SynonymWordType := dsCongenerExtention.DataSet.FieldByName('WordTypeID').AsInteger;
    SynonymWordExtentionDialogForm.SynonymExplanationID := dsCongenerExtention.DataSet.FieldByName('ExplanationID').AsInteger;

    oldCongenerWordExtendInfo.Word := SynonymWordExtentionDialogForm.Word;
    oldCongenerWordExtendInfo.WordType := SynonymWordExtentionDialogForm.WordType;
    oldCongenerWordExtendInfo.ExplanationID := SynonymWordExtentionDialogForm.ExplanationID;
    oldCongenerWordExtendInfo.CongenerWord := SynonymWordExtentionDialogForm.SynonymWord;
    oldCongenerWordExtendInfo.CongenerWordType := SynonymWordExtentionDialogForm.SynonymWordType;
    oldCongenerWordExtendInfo.CongenerExplanationID := SynonymWordExtentionDialogForm.SynonymExplanationID;

    if SynonymWordExtentionDialogForm.ShowModal  <> mrOk then
      Exit;

    CongenerWordExtendInfo.Word := SynonymWordExtentionDialogForm.Word;
    CongenerWordExtendInfo.WordType := SynonymWordExtentionDialogForm.WordType;
    CongenerWordExtendInfo.ExplanationID := SynonymWordExtentionDialogForm.ExplanationID;
    CongenerWordExtendInfo.CongenerWord := SynonymWordExtentionDialogForm.SynonymWord;
    CongenerWordExtendInfo.CongenerWordType := SynonymWordExtentionDialogForm.SynonymWordType;
    CongenerWordExtendInfo.CongenerExplanationID := SynonymWordExtentionDialogForm.SynonymExplanationID;

    grdCongenerWordExtention.BeginUpdate;

    FWordExtensionController.UpdateCongenerExtention(CongenerWordExtendInfo, oldCongenerWordExtendInfo);

    grdWordRowChanging(Sender, grdWord.SelectedRow[0], grdWord.SelectedRow[0], Allow);
    dsCongenerExtention.DataSet.Locate('Word', CongenerWordExtendInfo.CongenerWord, []);

    grdCongenerWordExtention.EndUpdate;
  finally
    SynonymWordExtentionDialogForm.Free;
    oldCongenerWordExtendInfo.Free;
    CongenerWordExtendInfo.Free;
  end;
end;

procedure TWordExtensionForm.actUpdateExtentionExecute(Sender: TObject);
begin
   case aopWordExtension.ActivePageIndex of
     0:
       actUpdateDerivativeExtentionExecute(Sender);
     1:
       actUpdateResemblanceExtentionExecute(Sender);
     2:
       actUpdateSynonymExtentionExecute(Sender);
     3:
       actUpdateAntonymExtentionExecute(Sender);
     4:
       actUpdateHomoionymExtentionExecute(Sender);
     5:
       actUpdateCongenerExtentionExecute(Sender);
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
    SynonymWordExtentionDialogForm.WordType := dsHomoionymExtention.DataSet.FieldByName('BaseWordTypeID').AsInteger;
    SynonymWordExtentionDialogForm.ExplanationID := dsHomoionymExtention.DataSet.FieldByName('BaseExplanationID').AsInteger;
    SynonymWordExtentionDialogForm.SynonymWord := dsHomoionymExtention.DataSet.FieldByName('Word').AsString;
    SynonymWordExtentionDialogForm.SynonymWordType := dsHomoionymExtention.DataSet.FieldByName('WordTypeID').AsInteger;
    SynonymWordExtentionDialogForm.SynonymExplanationID := dsHomoionymExtention.DataSet.FieldByName('ExplanationID').AsInteger;

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
    dsHomoionymExtention.DataSet.Locate('Word', HomoionymWordExtendInfo.HomoionymWord, []);

    grdHomoionymWordExtention.EndUpdate;
  finally
    SynonymWordExtentionDialogForm.Free;
    oldHomoionymWordExtendInfo.Free;
    HomoionymWordExtendInfo.Free;
  end;
end;

procedure TWordExtensionForm.actUpdateResemblanceExtentionExecute(
  Sender: TObject);
var
  ResemblanceWordExtendInfo, oldResemblanceWordExtendInfo:TResemblanceExtention;
  Allow:Boolean;
begin
  try
    oldResemblanceWordExtendInfo := TResemblanceExtention.Create;
    ResemblanceWordExtendInfo := TResemblanceExtention.Create;

    SynonymWordExtentionDialogForm := TSynonymWordExtentionDialogForm.Create(nil);
    SynonymWordExtentionDialogForm.ExtentionType := 1;
    SynonymWordExtentionDialogForm.Word := dsWord.DataSet.FieldByName('Word').AsString;
    SynonymWordExtentionDialogForm.WordType := dsResemblanceExtention.DataSet.FieldByName('BaseWordTypeID').AsInteger;
    SynonymWordExtentionDialogForm.ExplanationID := dsResemblanceExtention.DataSet.FieldByName('BaseExplanationID').AsInteger;
    SynonymWordExtentionDialogForm.SynonymWord := dsResemblanceExtention.DataSet.FieldByName('Word').AsString;
    SynonymWordExtentionDialogForm.SynonymWordType := dsResemblanceExtention.DataSet.FieldByName('WordTypeID').AsInteger;
    SynonymWordExtentionDialogForm.SynonymExplanationID := dsResemblanceExtention.DataSet.FieldByName('ExplanationID').AsInteger;

    oldResemblanceWordExtendInfo.Word := SynonymWordExtentionDialogForm.Word;
    oldResemblanceWordExtendInfo.WordType := SynonymWordExtentionDialogForm.WordType;
    oldResemblanceWordExtendInfo.ExplanationID := SynonymWordExtentionDialogForm.ExplanationID;
    oldResemblanceWordExtendInfo.ResemblanceWord := SynonymWordExtentionDialogForm.SynonymWord;
    oldResemblanceWordExtendInfo.ResemblanceWordType := SynonymWordExtentionDialogForm.SynonymWordType;
    oldResemblanceWordExtendInfo.ResemblanceExplanationID := SynonymWordExtentionDialogForm.SynonymExplanationID;

    if SynonymWordExtentionDialogForm.ShowModal  <> mrOk then
      Exit;

    ResemblanceWordExtendInfo.Word := SynonymWordExtentionDialogForm.Word;
    ResemblanceWordExtendInfo.WordType := SynonymWordExtentionDialogForm.WordType;
    ResemblanceWordExtendInfo.ExplanationID := SynonymWordExtentionDialogForm.ExplanationID;
    ResemblanceWordExtendInfo.ResemblanceWord := SynonymWordExtentionDialogForm.SynonymWord;
    ResemblanceWordExtendInfo.ResemblanceWordType := SynonymWordExtentionDialogForm.SynonymWordType;
    ResemblanceWordExtendInfo.ResemblanceExplanationID := SynonymWordExtentionDialogForm.SynonymExplanationID;

    grdHomoionymWordExtention.BeginUpdate;

    FWordExtensionController.UpdateResemblanceExtention(ResemblanceWordExtendInfo, oldResemblanceWordExtendInfo);

    grdWordRowChanging(Sender, grdWord.SelectedRow[0], grdWord.SelectedRow[0], Allow);
    dsResemblanceExtention.DataSet.Locate('Word', ResemblanceWordExtendInfo.ResemblanceWord, []);

    grdResemblanceWordExtention.EndUpdate;
  finally
    SynonymWordExtentionDialogForm.Free;
    oldResemblanceWordExtendInfo.Free;
    ResemblanceWordExtendInfo.Free;
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
    SynonymWordExtentionDialogForm.WordType := dsSynonymExtention.DataSet.FieldByName('BaseWordTypeID').AsInteger;
    SynonymWordExtentionDialogForm.ExplanationID := dsSynonymExtention.DataSet.FieldByName('BaseExplanationID').AsInteger;
    SynonymWordExtentionDialogForm.SynonymWord := dsSynonymExtention.DataSet.FieldByName('Word').AsString;
    SynonymWordExtentionDialogForm.SynonymWordType := dsSynonymExtention.DataSet.FieldByName('WordTypeID').AsInteger;
    SynonymWordExtentionDialogForm.SynonymExplanationID := dsSynonymExtention.DataSet.FieldByName('ExplanationID').AsInteger;

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
    dsSynonymExtention.DataSet.Locate('Word', synonymWordExtendInfo.SynonymWord, []);

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
  mnuAddResemblanceExtention.Enabled := (dsWord.DataSet.RecordCount > 0) and
    (grdWord.RowSelectCount > 0);
  mnuUpdateResemblanceExtention.Enabled := (dsResemblanceExtention.DataSet.RecordCount > 0) and
   (grdResemblanceWordExtention.RowSelectCount > 0);
  mnuDeleteResemblanceExtention.Enabled := (dsResemblanceExtention.DataSet.RecordCount > 0) and
   (grdResemblanceWordExtention.RowSelectCount > 0);
  mnuResemblanceViewPicture.Enabled := (dsResemblanceExtention.DataSet.RecordCount > 0) and
   (grdResemblanceWordExtention.RowSelectCount > 0);
  mnuResemblanceViewExplanation.Enabled := (dsResemblanceExtention.DataSet.RecordCount > 0) and
   (grdResemblanceWordExtention.RowSelectCount > 0);
end;

procedure TWordExtensionForm.advpmn3Popup(Sender: TObject);
begin
  mnuAddSynonymExtention.Enabled := (dsWord.DataSet.RecordCount > 0) and
    (grdWord.RowSelectCount > 0);
  mnuUpdateSynonymExtention.Enabled := (dsSynonymExtention.DataSet.RecordCount > 0) and
   (grdSynonymWordExtention.RowSelectCount > 0);
  mnuDeleteSynonymExtention.Enabled := (dsSynonymExtention.DataSet.RecordCount > 0) and
   (grdSynonymWordExtention.RowSelectCount > 0);
  mnuSynonymViewPicture.Enabled := (dsSynonymExtention.DataSet.RecordCount > 0) and
   (grdSynonymWordExtention.RowSelectCount > 0);
  mnuSynonymViewExplanation.Enabled := (dsSynonymExtention.DataSet.RecordCount > 0) and
   (grdSynonymWordExtention.RowSelectCount > 0);
end;

procedure TWordExtensionForm.advpmn4Popup(Sender: TObject);
begin
  mnuAddAntonymExtention.Enabled := (dsWord.DataSet.RecordCount > 0) and
    (grdWord.RowSelectCount > 0);
  mnuUpdateAntonymExtention.Enabled := (dsAntonymExtention.DataSet.RecordCount > 0) and
   (grdAntonymWordExtention.RowSelectCount > 0);
  mnuDeleteAntonymExtention.Enabled := (dsAntonymExtention.DataSet.RecordCount > 0) and
   (grdAntonymWordExtention.RowSelectCount > 0);
  mnuAntonymViewPicture.Enabled := (dsAntonymExtention.DataSet.RecordCount > 0) and
   (grdAntonymWordExtention.RowSelectCount > 0);
  mnuAntonymViewExplanation.Enabled := (dsAntonymExtention.DataSet.RecordCount > 0) and
   (grdAntonymWordExtention.RowSelectCount > 0);
end;

procedure TWordExtensionForm.advpmn5Popup(Sender: TObject);
begin
  mnuAddHomoionymExtention.Enabled := (dsWord.DataSet.RecordCount > 0) and
    (grdWord.RowSelectCount > 0);
  mnuUpdateHomoionymExtention.Enabled := (dsHomoionymExtention.DataSet.RecordCount > 0) and
   (grdHomoionymWordExtention.RowSelectCount > 0);
  mnuDeleteHomoionymExtention.Enabled := (dsHomoionymExtention.DataSet.RecordCount > 0) and
   (grdHomoionymWordExtention.RowSelectCount > 0);
  mnuHomoionymViewPicture.Enabled := (dsHomoionymExtention.DataSet.RecordCount > 0) and
   (grdHomoionymWordExtention.RowSelectCount > 0);
  mnuHomoionymViewExplanation.Enabled := (dsHomoionymExtention.DataSet.RecordCount > 0) and
   (grdHomoionymWordExtention.RowSelectCount > 0);
end;

procedure TWordExtensionForm.advpmn6Popup(Sender: TObject);
begin
  mnuAddCongenerExtention.Enabled := (dsWord.DataSet.RecordCount > 0) and
    (grdWord.RowSelectCount > 0);
  mnuUpdateCongenerExtention.Enabled := (dsCongenerExtention.DataSet.RecordCount > 0) and
   (grdCongenerWordExtention.RowSelectCount > 0);
  mnuDeleteCongenerExtention.Enabled := (dsCongenerExtention.DataSet.RecordCount > 0) and
   (grdCongenerWordExtention.RowSelectCount > 0);
  mnuCongenerViewPicture.Enabled := (dsCongenerExtention.DataSet.RecordCount > 0) and
   (grdCongenerWordExtention.RowSelectCount > 0);
  mnuCongenerViewExplanation.Enabled := (dsCongenerExtention.DataSet.RecordCount > 0) and
   (grdCongenerWordExtention.RowSelectCount > 0);
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
  FWordExtensionController.ShowResemblanceExtention(word);
  FWordExtensionController.ShowSynonymExtention(word);
  FWordExtensionController.ShowAntonymExtention(word);
  FWordExtensionController.ShowHomoionymExtention(word);
  FWordExtensionController.ShowCongenerExtention(word);

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

procedure TWordExtensionForm.ShowResemblanceExtention(value:TCustomADODataSet);
begin
  dsResemblanceExtention.DataSet := value;
end;

procedure TWordExtensionForm.ShowSynonymExtention(value:TCustomADODataSet);
begin
  dsSynonymExtention.DataSet := value;
end;

procedure TWordExtensionForm.ShowAntonymExtention(value:TCustomADODataSet);
begin
  dsAntonymExtention.DataSet := value;
end;

procedure TWordExtensionForm.ShowHomoionymExtention(value:TCustomADODataSet);
begin
  dsHomoionymExtention.DataSet := value;
end;

procedure TWordExtensionForm.ShowCongenerExtention(value:TCustomADODataSet);
begin
  dsCongenerExtention.DataSet := value;
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
    1:
      begin
        actAddExtention.Enabled := (dsWord.DataSet.RecordCount > 0) and (grdWord.RowSelectCount > 0);
        actUpdateExtention.Enabled := (dsResemblanceExtention.DataSet.RecordCount > 0) and (grdResemblanceWordExtention.RowSelectCount > 0);
        actRemoveExtention.Enabled := (dsResemblanceExtention.DataSet.RecordCount > 0) and (grdResemblanceWordExtention.RowSelectCount > 0);
      end;
    2:
      begin
        actAddExtention.Enabled := (dsWord.DataSet.RecordCount > 0) and (grdWord.RowSelectCount > 0);
        actUpdateExtention.Enabled := (dsSynonymExtention.DataSet.RecordCount > 0) and (grdSynonymWordExtention.RowSelectCount > 0);
        actRemoveExtention.Enabled := (dsSynonymExtention.DataSet.RecordCount > 0) and (grdSynonymWordExtention.RowSelectCount > 0);
      end;
    3:
      begin
        actAddExtention.Enabled := (dsWord.DataSet.RecordCount > 0) and (grdWord.RowSelectCount > 0);
        actUpdateExtention.Enabled := (dsAntonymExtention.DataSet.RecordCount > 0) and (grdAntonymWordExtention.RowSelectCount > 0);
        actRemoveExtention.Enabled := (dsAntonymExtention.DataSet.RecordCount > 0) and (grdAntonymWordExtention.RowSelectCount > 0);
      end;
    4:
      begin
        actAddExtention.Enabled := (dsWord.DataSet.RecordCount > 0) and (grdWord.RowSelectCount > 0);
        actUpdateExtention.Enabled := (dsHomoionymExtention.DataSet.RecordCount > 0) and (grdHomoionymWordExtention.RowSelectCount > 0);
        actRemoveExtention.Enabled := (dsHomoionymExtention.DataSet.RecordCount > 0) and (grdHomoionymWordExtention.RowSelectCount > 0);
      end;
    5:
      begin
        actAddExtention.Enabled := (dsWord.DataSet.RecordCount > 0) and (grdWord.RowSelectCount > 0);
        actUpdateExtention.Enabled := (dsCongenerExtention.DataSet.RecordCount > 0) and (grdCongenerWordExtention.RowSelectCount > 0);
        actRemoveExtention.Enabled := (dsCongenerExtention.DataSet.RecordCount > 0) and (grdCongenerWordExtention.RowSelectCount > 0);
      end;
  end;
end;

procedure TWordExtensionForm.ShowWordRecordCount;
begin
  grpWord.Caption := Format('单词一览(记录数：%d)' , [dsWord.DataSet.RecordCount]);
end;

end.
