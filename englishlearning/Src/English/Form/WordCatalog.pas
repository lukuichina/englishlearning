unit WordCatalog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AdvShapeButton, AdvToolBar, AdvToolBarStylers, AdvAppStyler, Grids,
  AdvObj, BaseGrid, AdvGrid, DBAdvGrid, StdCtrls, AdvGroupBox,
  AdvSmoothExpanderGroup, MVC, WordCatalogView, WordCatalogController,
  WordCatalogModel, DB, ADODB, Menus, AdvMenus, ActnList, ImgList,
  InterfaceDef, AdvGlowButton, ExtCtrls, ComCtrls, TreeList, dxtree, dxdbtree,
  dxmdaset, ToolPanels, AdvGridCSVPager, AdvOfficePager,
  ViewData;

type
  TWordCatalogForm = class(TAdvToolBarForm, IWordCatalogView, ICursorable)
    AdvFormStyler1: TAdvFormStyler;
    AdvToolBarOfficeStyler1: TAdvToolBarOfficeStyler;
    advtlbrpgr1: TAdvToolBarPager;
    advtlbrpgrAdvToolBarPager11: TAdvPage;
    advtlbrpgrAdvToolBarPager12: TAdvPage;
    advtlbrpgrAdvToolBarPager13: TAdvPage;
    AdvQuickAccessToolBar1: TAdvQuickAccessToolBar;
    sbnMain: TAdvShapeButton;
    grp2: TAdvSmoothExpanderGroup;
    dsWordCatalog: TDataSource;
    dlgSave1: TSaveDialog;
    ilGridPopMenu: TImageList;
    actlst1: TActionList;
    actAddCatalog: TAction;
    actUpdateCatalog: TAction;
    actDeleteCatalog: TAction;
    actImportCatalogToExcel: TAction;
    actViewPicture: TAction;
    apmWordCatalog: TAdvPopupMenu;
    mnuAddExplanation: TMenuItem;
    mnuUpdateExplanation: TMenuItem;
    mnuDelete: TMenuItem;
    mnuExportToCsv: TMenuItem;
    N1: TMenuItem;
    tbWordCatalog: TAdvToolBar;
    btnAddCatalog: TAdvGlowButton;
    btnRemoveCatalog: TAdvGlowButton;
    btnReplaceCatalog: TAdvGlowButton;
    btnRefreshCatalog: TAdvGlowButton;
    actRefreshCatalog: TAction;
    mdWordCatalogTree: TdxMemData;
    mdWordCatalogTreeCatalogID: TStringField;
    mdWordCatalogTreeCatalogName: TStringField;
    mdWordCatalogTreeCatalogDisp: TStringField;
    mdWordCatalogTreeCreateTime: TDateTimeField;
    mdWordCatalogTreeUpdateTime: TStringField;
    dsWordCatalogTree: TDataSource;
    mdWordCatalogTreeParentCatalogID: TStringField;
    ilBars: TImageList;
    ImageList: TImageList;
    mdWordCatalogTreeRowID: TIntegerField;
    mdWordCatalogTreeParentRowID: TIntegerField;
    AdvToolBar1: TAdvToolBar;
    AdvGlowButton1: TAdvGlowButton;
    btnDeleteCatalogRelation: TAdvGlowButton;
    AdvGlowButton3: TAdvGlowButton;
    btnRefreshCatalogTree: TAdvGlowButton;
    actRefreshCatalogTree: TAction;
    AdvGridCSVPager1: TAdvGridCSVPager;
    opClient: TAdvOfficePager;
    opgWordCatalog: TAdvOfficePage;
    opgChildCatalog: TAdvOfficePage;
    opgWord: TAdvOfficePage;
    grpWordCatalog: TAdvGroupBox;
    grdWordCatalog: TDBAdvGrid;
    tptWordCatalogTree: TAdvToolPanelTab;
    tplWordCatalogTree: TAdvToolPanel;
    dtvWordCatalogTree: TdxDBTreeView;
    tplWordInfo: TAdvToolPanel;
    grpWord: TGroupBox;
    grdWord: TDBAdvGrid;
    dsWord: TDataSource;
    pmWord: TAdvPopupMenu;
    mnuAddCatalogWord: TMenuItem;
    mnuLocateCatalogWord: TMenuItem;
    mnuDeleteCatalogWord: TMenuItem;
    mnuImportWordToExcel: TMenuItem;
    mnuViewPicture: TMenuItem;
    actAddCatalogWord: TAction;
    actDeleteCatalogWord: TAction;
    actImportWordToExcel: TAction;
    actDeleteCatalogRelation: TAction;
    mnuViewExplanation: TMenuItem;
    actViewExplanation: TAction;
    actLocateCatalogWord: TAction;
    apmWordCatalogNode: TAdvPopupMenu;
    mnuDelCatalogRelation: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure actAddCatalogExecute(Sender: TObject);
    procedure actUpdateCatalogExecute(Sender: TObject);
    procedure actDeleteCatalogExecute(Sender: TObject);
    procedure actImportCatalogToExcelExecute(Sender: TObject);
    procedure actRefreshCatalogExecute(Sender: TObject);
    procedure actRefreshCatalogTreeExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tplWordCatalogTreeLock(Sender: TObject);
    procedure tplWordInfoLock(Sender: TObject);
    procedure tplWordCatalogTreeUnlock(Sender: TObject);
    procedure tplWordInfoUnlock(Sender: TObject);
    procedure grdWordCatalogRowChanging(Sender: TObject; OldRow,
      NewRow: Integer; var Allow: Boolean);
    procedure dtvWordCatalogTreeChange(Sender: TObject; Node: TTreeNode);
    procedure actAddCatalogWordExecute(Sender: TObject);
    procedure actDeleteCatalogWordExecute(Sender: TObject);
    procedure pmWordPopup(Sender: TObject);
    procedure actViewPictureExecute(Sender: TObject);
    procedure actImportWordToExcelExecute(Sender: TObject);
    procedure opClientChange(Sender: TObject);
    procedure actDeleteCatalogRelationExecute(Sender: TObject);
    procedure actViewExplanationExecute(Sender: TObject);
    procedure actLocateCatalogWordExecute(Sender: TObject);
    procedure dtvWordCatalogTreeStartDrag(Sender: TObject;
      var DragObject: TDragObject);
    procedure dtvWordCatalogTreeDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure dtvWordCatalogTreeEndDragTreeNode(Destination, Source: TTreeNode;
      var AttachMode: TNodeAttachMode);
    procedure dtvWordCatalogTreeContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure grdWordCatalogContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
  private
    { Private declarations }
    FWordCatalogController:IWordCatalogController;
    //FCatalogRelationController:IWordCatalogController;
    FWordCatalog:TWordCatalog;
    FSrcCatalogRelationInfo, FDesCatalogRelationInfo:TCatalogRelation;
    FShowCompleted:Boolean;
  protected
    procedure ShowWordCatalog(value:TCustomADODataSet);
    procedure ShowWordCatalogTree(value:TCustomADODataSet);
    procedure ShowCatalogWord(value:TCustomADODataSet);
    function  GetCatalogRelationInfo:TCatalogRelation;
    function  GetSrcCatalogRelationInfo:TCatalogRelation;
    function  GetDesCatalogRelationInfo:TCatalogRelation;
    function  GetCatalogInfo:TWordCatalog;
    function  GetWordInfo:TWord;
    //procedure SetWordInfo;
//    procedure SetCatalogInfo(const value:TWordCatalog);
    procedure CashCursor(const value:TActionType; data:TViewData=nil);
    procedure ResetCursor;
  public
    { Public declarations }
    property CatalogRelationInfo:TCatalogRelation read GetCatalogRelationInfo;
    property SrcCatalogRelationInfo:TCatalogRelation read GetSrcCatalogRelationInfo;
    property DesCatalogRelationInfo:TCatalogRelation read GetDesCatalogRelationInfo;
    property CatalogInfo:TWordCatalog read GetCatalogInfo;// write SetCatalogInfo;
    property WordInfo:TWord read GetWordInfo;
  end;

var
  WordCatalogForm: TWordCatalogForm;

implementation

uses WordCatalogDialog, Excel, WordSearch, WordPicture, WordExplain;

{$R *.dfm}

procedure TWordCatalogForm.actAddCatalogExecute(Sender: TObject);
begin
  try
    WordCatalogDialogFrom := TWordCatalogDialogFrom.Create(self);
    WordCatalogDialogFrom.EditMode := emInsert;

    if WordCatalogDialogFrom.ShowModal <> mrOK then
      exit;

    FWordCatalogController.InsertCatalogInfo(WordCatalogDialogFrom.CatalogInfo);

    dtvWordCatalogTree.Items.BeginUpdate;

    dtvWordCatalogTree.DoubleBuffered := True;
    dtvWordCatalogTree.Items.Clear;

    FWordCatalogController.ShowWordCatalogTree;
    FWordCatalogController.ShowWordCatalog;

    dtvWordCatalogTree.Items.EndUpdate;
//    actRefreshCatalogExecute(nil);

    dsWordCatalog.DataSet.Locate('CatalogName', WordCatalogDialogFrom.CatalogInfo.CatalogName, []);
  finally
    WordCatalogDialogFrom.Free;
  end;
end;

procedure TWordCatalogForm.actDeleteCatalogExecute(Sender: TObject);
begin
  CashCursor(atUpdate);

  FWordCatalogController.DeleteCatalogInfo;
//  FWordCatalogController.ShowWordCatalog;
//  FWordCatalogController.ShowWordCatalogTree;
  dtvWordCatalogTree.Items.BeginUpdate;

  dtvWordCatalogTree.DoubleBuffered := True;
  dtvWordCatalogTree.Items.Clear;

  FWordCatalogController.ShowWordCatalogTree;
  FWordCatalogController.ShowWordCatalog;

  dtvWordCatalogTree.Items.EndUpdate;

  ResetCursor;
end;

procedure TWordCatalogForm.actDeleteCatalogRelationExecute(Sender: TObject);
begin
  CashCursor(atDelete);

  FSrcCatalogRelationInfo := TCatalogRelation.Create;
  FSrcCatalogRelationInfo.CatalogID := mdWordCatalogTree.FieldByName('ParentCatalogID').AsString;
  FSrcCatalogRelationInfo.ChildCatalogID := mdWordCatalogTree.FieldByName('CatalogID').AsString;

  FWordCatalogController.DeleteCatalogRelation(FSrcCatalogRelationInfo);

  dtvWordCatalogTree.Items.BeginUpdate;

  dtvWordCatalogTree.DoubleBuffered := True;
  dtvWordCatalogTree.Items.Clear;

  //FWordCatalogController.ShowWordCatalog;
  FWordCatalogController.ShowWordCatalogTree;

  dtvWordCatalogTree.Items.EndUpdate;

  ResetCursor;

  FSrcCatalogRelationInfo.Free;
end;

procedure TWordCatalogForm.actAddCatalogWordExecute(Sender: TObject);
begin
  try
    WordSearchForm := TWordSearchForm.Create(nil);
    //WordSearchForm.Word := edtWord.Text;

    if WordSearchForm.ShowModal <> mrOk then
    begin
//      if not IsWordExist(edtWord.Text) then
//        edtWord.SetFocus;

      exit;
    end;

    FWordCatalogController.InsertCatalogWord({CatalogInfo,} WordSearchForm.WordInfo);

    grdWord.BeginUpdate;

    FWordCatalogController.ShowCatalogWord;

    dsWord.DataSet.Locate('Word', WordSearchForm.WordInfo.Word, []);

    grdWord.EndUpdate;
  finally
    WordSearchForm.Free;
  end;
end;

procedure TWordCatalogForm.actDeleteCatalogWordExecute(Sender: TObject);
begin
  if MessageDlg('您确认要删除吗？', mtconfirmation, [mbYes, mbNo], 0) <> mrYes then
  begin
    exit;
  end;

  FWordCatalogController.DeleteCatalogWord({CatalogInfo,} WordInfo);

  grdWord.BeginUpdate;
  FWordCatalogController.ShowCatalogWord;
  grdWord.EndUpdate;
end;

procedure TWordCatalogForm.actImportCatalogToExcelExecute(Sender: TObject);
begin
  try
    FShowCompleted := False;

    CopyDbAdvDataToExcel([grdWordCatalog]);
  finally
    FShowCompleted := True;
  end;

end;

procedure TWordCatalogForm.actImportWordToExcelExecute(Sender: TObject);
begin
  CopyDbAdvDataToExcel([grdWord]);
end;

procedure TWordCatalogForm.actLocateCatalogWordExecute(Sender: TObject);
begin
  try
    WordSearchForm := TWordSearchForm.Create(nil);
    WordSearchForm.Word := dsWord.DataSet.FieldByName('Word').AsString;

    if WordSearchForm.ShowModal <> mrOk then
    begin
//      if not IsWordExist(edtWord.Text) then
//        edtWord.SetFocus;

      exit;
    end;

    FWordCatalogController.InsertCatalogWord({CatalogInfo,} WordSearchForm.WordInfo);

    grdWord.BeginUpdate;

    FWordCatalogController.ShowCatalogWord;

    dsWord.DataSet.Locate('Word', WordSearchForm.WordInfo.Word, []);

    grdWord.EndUpdate;
  finally
    WordSearchForm.Free;
  end;
end;

procedure TWordCatalogForm.actRefreshCatalogExecute(Sender: TObject);
begin
  CashCursor(atRefresh);

  dtvWordCatalogTree.Items.BeginUpdate;

  dtvWordCatalogTree.DoubleBuffered := True;
  dtvWordCatalogTree.Items.Clear;

  FWordCatalogController.ShowWordCatalogTree;
  FWordCatalogController.ShowWordCatalog;

  dtvWordCatalogTree.Items.EndUpdate;

  ResetCursor;
end;

procedure TWordCatalogForm.actRefreshCatalogTreeExecute(Sender: TObject);
begin
  FWordCatalogController.ShowWordCatalogTree;
end;

procedure TWordCatalogForm.actUpdateCatalogExecute(Sender: TObject);
begin
  try
    CashCursor(atUpdate);

    WordCatalogDialogFrom := TWordCatalogDialogFrom.Create(self);
    WordCatalogDialogFrom.EditMode := emUpdate;
    WordCatalogDialogFrom.SetCatalogInfo(CatalogInfo);

    if WordCatalogDialogFrom.ShowModal <> mrOK then
      exit;

    FWordCatalogController.UpdateCatalogInfo(WordCatalogDialogFrom.CatalogInfo);

    FWordCatalogController.ShowWordCatalog;
    FWordCatalogController.ShowWordCatalogTree;

    ResetCursor;
  finally
    WordCatalogDialogFrom.Free;
  end;
end;

procedure TWordCatalogForm.actViewExplanationExecute(Sender: TObject);
begin
  try
    WordExplainForm := TWordExplainForm.Create(nil);
    WordExplainForm.Word := dsWord.DataSet.FieldByName('Word').AsString;
    WordExplainForm.ShowModal;

    if WordExplainForm.IsChanged then
    begin
      grdWord.BeginUpdate;

      FWordCatalogController.ShowCatalogWord;

      dsWord.DataSet.Locate('Word', WordExplainForm.Word, []);

      grdWord.EndUpdate;
    end;
  finally
    WordExplainForm.Free;
  end;
end;

procedure TWordCatalogForm.actViewPictureExecute(Sender: TObject);
begin
  try
    WordPictureForm := TWordPictureForm.Create(nil);
    WordPictureForm.Word := dsWord.DataSet.FieldByName('Word').AsString;
    WordPictureForm.WordType := 0;
    WordPictureForm.ExplanationID := 0;
    WordPictureForm.ShowModal;

    if WordPictureForm.IsChanged then
    begin
      grdWord.BeginUpdate;

      FWordCatalogController.ShowCatalogWord;

      dsWord.DataSet.Locate('Word', WordPictureForm.Word, []);

      grdWord.EndUpdate;
    end;
  finally
    WordPictureForm.Free;
  end;
end;

procedure TWordCatalogForm.FormCreate(Sender: TObject);
begin
  FWordCatalog := TWordCatalog.Create;
  FWordCatalogController := TWordCatalogController.Create(self);

  tptWordCatalogTree.RollOut(tplWordCatalogTree);
  tplWordCatalogTree.Locked := True;

  opClient.ActivePageIndex := 0;
end;

procedure TWordCatalogForm.FormShow(Sender: TObject);
begin
  FWordCatalogController.ShowWordCatalog;
  FWordCatalogController.ShowWordCatalogTree;

  FWordCatalogController.ShowCatalogWord;

  if not dsWordCatalog.DataSet.Eof then
    mdWordCatalogTree.Locate('RowID', dsWordCatalog.DataSet.FieldByName('RowID').Value, []);

  FShowCompleted := True;
end;

procedure TWordCatalogForm.ShowWordCatalog(value:TCustomADODataSet);
begin
  dsWordCatalog.DataSet := value;

  grpWordCatalog.Caption := Format('分类一览(记录数：%d)' , [dsWordCatalog.DataSet.RecordCount]);
end;

procedure TWordCatalogForm.ShowWordCatalogTree(value:TCustomADODataSet);
begin
  dtvWordCatalogTree.Items.Clear;

//  if mdWordCatalogTree.RecordCount > 0 then
//  begin
//    while not mdWordCatalogTree.Eof do
//    begin
//      mdWordCatalogTree.Delete;
//      mdWordCatalogTree.Next;
//    end;
//  end;

  while not value.Eof do
  begin
    mdWordCatalogTree.Insert;

    mdWordCatalogTree.FieldByName('RowID').AsString := value.FieldByName('RowID').AsString;
    mdWordCatalogTree.FieldByName('CatalogID').AsString := value.FieldByName('CatalogID').AsString;
    mdWordCatalogTree.FieldByName('ParentCatalogID').AsString := value.FieldByName('ParentCatalogID').AsString;
    mdWordCatalogTree.FieldByName('CatalogName').AsString := value.FieldByName('CatalogName').AsString;
    mdWordCatalogTree.FieldByName('CatalogDisp').AsString := value.FieldByName('CatalogDisp').AsString;
    mdWordCatalogTree.FieldByName('CreateTime').Value := value.FieldByName('CreateTime').Value;
    mdWordCatalogTree.FieldByName('UpdateTime').Value := value.FieldByName('UpdateTime').Value;

    mdWordCatalogTree.Post;

    dtvWordCatalogTree.DBTreeNodes.Items[dtvWordCatalogTree.DBTreeNodes.Count - 1].Data :=
        (mdWordCatalogTree.Data);
//    dtvWordCatalogTree.Items[dtvWordCatalogTree.Items.Count - 1].Data :=
//        mdWordCatalogTree.Data;

    value.Next;
  end;

  //mdWordCatalogTree.First;
  if not value.Eof then
    dtvWordCatalogTree.Items[0].Selected := True;
end;

procedure TWordCatalogForm.ShowCatalogWord(value:TCustomADODataSet);
begin
  dsWord.DataSet := value;

  grpWord.Caption := Format('单词一览(记录数：%d)' , [dsWord.DataSet.RecordCount]);
end;

procedure TWordCatalogForm.tplWordInfoLock(Sender: TObject);
begin
//  if tplWordCatalogTree.Locked then
//  begin
//    tplWordCatalogTree.Align := alTop;
//    tpl2.Align := alClient;
//  end
//  else
//  begin
//    tpl2.Align := alClient;
//  end;

end;

procedure TWordCatalogForm.tplWordInfoUnlock(Sender: TObject);
begin
  tptWordCatalogTree.RollIn(tplWordInfo);
end;

procedure TWordCatalogForm.tplWordCatalogTreeLock(Sender: TObject);
begin
//  if tpl2.Locked then
//  begin
//    tplWordCatalogTree.Align := alTop;
//    tpl2.Align := alClient;
//  end
//  else
//  begin
//    tplWordCatalogTree.Align := alClient;
//  end;
end;

procedure TWordCatalogForm.tplWordCatalogTreeUnlock(Sender: TObject);
begin
  tplWordCatalogTree.Hide;
end;

function  TWordCatalogForm.GetCatalogRelationInfo:TCatalogRelation;
var
  CatalogRelationInfo:TCatalogRelation;
  ds:TCustomADODataSet;
begin
  CatalogRelationInfo := TCatalogRelation.Create;

  ds := TCustomADODataSet(dsWordCatalogTree.DataSet);

  CatalogRelationInfo.CatalogID := ds.FieldByName('ParentCatalogID').AsString;
  CatalogRelationInfo.ChildCatalogID := ds.FieldByName('CatalogID').AsString;

  if not ds.FieldByName('CreateTime').IsNull then
    CatalogRelationInfo.CreateTime := ds.FieldByName('CreateTime').AsDateTime;

  if not ds.FieldByName('UpdateTime').IsNull then
    CatalogRelationInfo.UpdateTime := ds.FieldByName('UpdateTime').AsDateTime;

  Result := CatalogRelationInfo;
end;

function  TWordCatalogForm.GetSrcCatalogRelationInfo:TCatalogRelation;
begin
  Result := nil;
end;

function  TWordCatalogForm.GetDesCatalogRelationInfo:TCatalogRelation;
begin
  Result := nil;
end;


function  TWordCatalogForm.GetCatalogInfo:TWordCatalog;
var
  WordCatalogInfo:TWordCatalog;
  ds:TCustomADODataSet;
begin
  WordCatalogInfo := TWordCatalog.Create;

  ds := TCustomADODataSet(dsWordCatalog.DataSet);

  WordCatalogInfo.CatalogID := ds.FieldByName('CatalogID').AsString;
  WordCatalogInfo.CatalogName := ds.FieldByName('CatalogName').AsString;
  WordCatalogInfo.CatalogDisp := ds.FieldByName('CatalogDisp').AsString;

  if not ds.FieldByName('CreateTime').IsNull then
    WordCatalogInfo.CreateTime := ds.FieldByName('CreateTime').AsDateTime;

  if not ds.FieldByName('UpdateTime').IsNull then
    WordCatalogInfo.UpdateTime := ds.FieldByName('UpdateTime').AsDateTime;

  Result := WordCatalogInfo;
end;

function TWordCatalogForm.GetWordInfo:TWord;
var
  WordInfo:TWord;
  ds:TCustomADODataSet;
begin
  WordInfo := TWord.Create;

  ds := TCustomADODataSet(dsWord.DataSet);

  WordInfo.Word := ds.FieldByName('Word').AsString;

  if not ds.FieldByName('CreateTime').IsNull then
    WordInfo.CreateTime := ds.FieldByName('CreateTime').AsDateTime;

  if not ds.FieldByName('UpdateTime').IsNull then
    WordInfo.UpdateTime := ds.FieldByName('UpdateTime').AsDateTime;

  Result := WordInfo;
end;

procedure TWordCatalogForm.grdWordCatalogContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
var
  p:TPoint;
  rec:TRect;
begin
  rec.Top := grdWordCatalog.Selection.TopLeft.Y;
  rec.Left := grdWordCatalog.Selection.TopLeft.X;
  rec.Bottom := grdWordCatalog.Selection.BottomRight.Y;
  rec.Right := grdWordCatalog.Selection.BottomRight.X;

  if not PtInRect(rec, MousePos) then
    exit;

  p:= grdWordCatalog.ClientToScreen(MousePos);
  apmWordCatalog.Popup(p.X, p.Y);
end;

procedure TWordCatalogForm.grdWordCatalogRowChanging(Sender: TObject; OldRow,
  NewRow: Integer; var Allow: Boolean);
begin
  if not FShowCompleted then
    exit;
    
  try
    FShowCompleted := False;

    //mdWordCatalogTree.Lookup('RowID', , 'CatalogID');
    mdWordCatalogTree.Locate('RowID', NewRow, []);
    //dtvWordCatalogTree.Selected.Focused := True;
    dtvWordCatalogTree.Refresh;

//    FWordCatalogController.ShowCatalogWord;
  finally
    FShowCompleted := True;
  end;

end;

procedure TWordCatalogForm.opClientChange(Sender: TObject);
begin
  if opClient.ActivePageIndex = 2 then
    FWordCatalogController.ShowCatalogWord;


  tbWordCatalog.Enabled := opClient.ActivePageIndex = 0;

end;

procedure TWordCatalogForm.pmWordPopup(Sender: TObject);
begin
  mnuAddCatalogWord.Enabled := (not dtvWordCatalogTree.Selected.HasChildren) or
      ((mdWordCatalogTree.FieldByName('CatalogID').AsString = 'WC00001') or
       (mdWordCatalogTree.FieldByName('CatalogID').AsString = 'WC00002') or
       (mdWordCatalogTree.FieldByName('CatalogID').AsString = 'WC00003') or
       (mdWordCatalogTree.FieldByName('CatalogID').AsString = 'WC00004') or
       (mdWordCatalogTree.FieldByName('CatalogID').AsString = 'WC00005') or
       (mdWordCatalogTree.FieldByName('CatalogID').AsString = 'WC00006') or
       (mdWordCatalogTree.FieldByName('CatalogID').AsString = 'WC00007') or
       (mdWordCatalogTree.FieldByName('CatalogID').AsString = 'WC00008') or
       (mdWordCatalogTree.FieldByName('CatalogID').AsString = 'WC00009') or
       (mdWordCatalogTree.FieldByName('CatalogID').AsString = 'WC00010'));
  mnuDeleteCatalogWord.Enabled := (dsWord.DataSet.RecordCount > 0) and
      ((not dtvWordCatalogTree.Selected.HasChildren) or
      ((mdWordCatalogTree.FieldByName('CatalogID').AsString = 'WC00001') or
       (mdWordCatalogTree.FieldByName('CatalogID').AsString = 'WC00002') or
       (mdWordCatalogTree.FieldByName('CatalogID').AsString = 'WC00003') or
       (mdWordCatalogTree.FieldByName('CatalogID').AsString = 'WC00004') or
       (mdWordCatalogTree.FieldByName('CatalogID').AsString = 'WC00005') or
       (mdWordCatalogTree.FieldByName('CatalogID').AsString = 'WC00006') or
       (mdWordCatalogTree.FieldByName('CatalogID').AsString = 'WC00007') or
       (mdWordCatalogTree.FieldByName('CatalogID').AsString = 'WC00008') or
       (mdWordCatalogTree.FieldByName('CatalogID').AsString = 'WC00009') or
       (mdWordCatalogTree.FieldByName('CatalogID').AsString = 'WC00010'))
      );
  mnuImportWordToExcel.Enabled := (dsWord.DataSet.RecordCount > 0);
  mnuViewPicture.Enabled := (dsWord.DataSet.RecordCount > 0);
end;

//procedure TWordCatalogForm.SetCatalogInfo(const value:TWordCatalog);
//begin
//
//end;

procedure TWordCatalogForm.CashCursor(const value:TActionType; data:TViewData=nil);
begin
  case value of
    atInsert:
    begin
      if not (data is TWordCatalog) then
        exit;

      FWordCatalog := TWordCatalog(data);
    end;
    atUpdate:
    begin
      FWordCatalog := CatalogInfo;
    end;
    atDelete:
    begin
      FWordCatalog := CatalogInfo;
    end;
    else
    begin
      FWordCatalog := CatalogInfo;
    end;
  end;
end;

procedure TWordCatalogForm.dtvWordCatalogTreeChange(Sender: TObject;
  Node: TTreeNode);
begin
  if not FShowCompleted then
    exit;

  try
    FShowCompleted := False;
    
    dsWordCatalog.DataSet.Locate('CatalogID', mdWordCatalogTree.FieldByName('CatalogID').AsString, []);

    FWordCatalogController.ShowCatalogWord;
  finally
     FShowCompleted := True;
  end;
  
end;

procedure TWordCatalogForm.dtvWordCatalogTreeContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
var
  p:TPoint;
  node:TTreeNode;
begin
  node := dtvWordCatalogTree.GetNodeAt(MousePos.X, MousePos.Y);

  if not PtInRect(node.DisplayRect(True), MousePos) then
    exit;

  node.Selected := True;

  mnuDelCatalogRelation.Enabled :=
      (mdWordCatalogTree.RecordCount > 0) and
      (mdWordCatalogTree.FieldByName('ParentCatalogID').AsString <> '');

  p:= dtvWordCatalogTree.ClientToScreen(MousePos);
  apmWordCatalogNode.Popup(p.X, p.Y);
end;

procedure TWordCatalogForm.dtvWordCatalogTreeDragOver(Sender, Source: TObject;
  X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Caption :=  mdWordCatalogTree.FieldByName('CatalogName').AsString;
end;

procedure TWordCatalogForm.dtvWordCatalogTreeEndDragTreeNode(Destination,
  Source: TTreeNode; var AttachMode: TNodeAttachMode);
begin
  Caption :=  mdWordCatalogTree.FieldByName('CatalogName').AsString;

  FDesCatalogRelationInfo := TCatalogRelation.Create;
  FDesCatalogRelationInfo.CatalogID := mdWordCatalogTree.FieldByName('CatalogID').AsString;
  FDesCatalogRelationInfo.ChildCatalogID := FSrcCatalogRelationInfo.ChildCatalogID;
//  FDesCatalogRelationInfo.CatalogID :=
//      TdxMemFields(Destination.Data).DataSet.FieldByName('CatalogID').AsString;

  if not mdWordCatalogTree.FieldByName('CreateTime').IsNull then
    FDesCatalogRelationInfo.CreateTime := mdWordCatalogTree.FieldByName('CreateTime').AsDateTime;

  if not mdWordCatalogTree.FieldByName('UpdateTime').IsNull then
    FDesCatalogRelationInfo.UpdateTime := mdWordCatalogTree.FieldByName('UpdateTime').AsDateTime;

  FWordCatalogController.DeleteCatalogRelation(FSrcCatalogRelationInfo);
  FWordCatalogController.InsertCatalogRelation(FDesCatalogRelationInfo);

  Destination.Expand(True);
  Destination.Expanded := True;

  FSrcCatalogRelationInfo.Free;
  FDesCatalogRelationInfo.Free;
end;

procedure TWordCatalogForm.dtvWordCatalogTreeStartDrag(Sender: TObject;
  var DragObject: TDragObject);
begin
  Caption :=  mdWordCatalogTree.FieldByName('CatalogName').AsString;

  FSrcCatalogRelationInfo := TCatalogRelation.Create;
  FSrcCatalogRelationInfo.CatalogID := mdWordCatalogTree.FieldByName('ParentCatalogID').AsString;
  FSrcCatalogRelationInfo.ChildCatalogID := mdWordCatalogTree.FieldByName('CatalogID').AsString;

  if not mdWordCatalogTree.FieldByName('CreateTime').IsNull then
    FSrcCatalogRelationInfo.CreateTime := mdWordCatalogTree.FieldByName('CreateTime').AsDateTime;

  if not mdWordCatalogTree.FieldByName('UpdateTime').IsNull then
    FSrcCatalogRelationInfo.UpdateTime := mdWordCatalogTree.FieldByName('UpdateTime').AsDateTime;
end;

procedure TWordCatalogForm.ResetCursor;
begin
  dsWordCatalog.DataSet.Locate('CatalogID', FWordCatalog.CatalogID, []);
end;

end.
