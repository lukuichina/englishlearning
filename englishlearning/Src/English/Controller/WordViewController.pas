unit WordViewController;

interface

uses
  DB, ADODB, MVC, ViewData, WordCatalogView, WordCatalogModel, CatalogWordModel,
  CatalogRelationModel, WordViewModel, WordViewView, WordModel;

type
  IWordViewController = interface(IController)
    function GetModel: IWordViewModel;
    function GetView: IWordViewView;

    procedure SetModel(Value: IWordViewModel);
    procedure SetView(Value: IWordViewView);

    property Model: IWordViewModel read GetModel write SetModel;
    property View: IWordViewView read GetView write SetView;

//    procedure ShowWordCatalog;
//    procedure ShowWordCatalogTree;
//    procedure InsertCatalogInfo(const value:TWordCatalog);
//    procedure UpdateCatalogInfo(const value:TWordCatalog);
//    procedure DeleteCatalogInfo;
////    procedure SetWordCatalogDialogInfo;
//
//    procedure ShowCatalogWord;
//    procedure InsertCatalogWord({const catalog:TWordCatalog;}const word:TWord);
//    procedure DeleteCatalogWord({const catalog:TWordCatalog;}const word:TWord);
//    procedure InsertCatalogWords({const catalog:TWordCatalog;}const words:TWords);
//
//    procedure InsertCatalogRelation(const value:TCatalogRelation);
//    procedure DeleteCatalogRelation; overload;
//    procedure DeleteCatalogRelation(const value:TCatalogRelation); overload;

    procedure InsertWordView(const BeginWord, EndWord:string);
    procedure DeleteWordView;
  end;

  TWordViewController = class(TController, IWordViewController)
  private
    FWordModel:TWordModel;
//    FCatalogRelationModel:TCatalogRelationModel;
    FWordViewModel:TWordViewModel;
  protected
    function GetModel: IWordViewModel;
    function GetView: IWordViewView;

    procedure SetModel(Value: IWordViewModel);
    procedure SetView(Value: IWordViewView);

  public
    property Model: IWordViewModel read GetModel write SetModel;
    property View: IWordViewView read GetView write SetView;

    constructor Create(view:IWordViewView);
//    procedure ShowWordCatalog;
//    procedure ShowWordCatalogTree;
//    procedure InsertCatalogInfo(const value:TWordCatalog);
//    procedure UpdateCatalogInfo(const value:TWordCatalog);
//    procedure DeleteCatalogInfo;
//    //procedure SetWordCatalogDialogInfo;
//
//    procedure ShowCatalogWord;
//    procedure InsertCatalogWord({const catalog:TWordCatalog;}const word:TWord);
//    procedure DeleteCatalogWord({const catalog:TWordCatalog;}const word:TWord);
//
//    procedure InsertCatalogWords({const catalog:TWordCatalog;}const words:TWords);
//
//    procedure InsertCatalogRelation(const value:TCatalogRelation);
//    procedure DeleteCatalogRelation; overload;
//    procedure DeleteCatalogRelation(const value:TCatalogRelation); overload;

    procedure InsertWordView(const BeginWord, EndWord:string);
    procedure DeleteWordView;
  end;

implementation

uses SysUtils, CommonInfo;

function TWordViewController.GetModel: IWordViewModel;
begin
  Result := IWordViewModel(inherited GetModel);
end;

function TWordViewController.GetView: IWordViewView;
begin
  Result := IWordViewView(inherited GetView);
end;

procedure TWordViewController.SetModel(Value: IWordViewModel);
begin
  inherited SetModel(Value);
end;

procedure TWordViewController.SetView(Value: IWordViewView);
begin
  inherited SetView(Value);
end;

constructor TWordViewController.Create(view:IWordViewView);
var
  md:IWordCatalogModel;
begin
  inherited Create(view);

  md:=TWordCatalogModel.Create;
  inherited SetModel(md);

  FWordModel := TWordModel.Create;
//  FCatalogRelationModel := TCatalogRelationModel.Create;
  FWordViewModel := TWordViewModel.Create;
end;

//procedure TWordViewController.ShowWordCatalog;
//var
// ds:TCustomADODataSet;
//begin
//  ds := GetModel.QueryWordCatalog;
//  GetView.ShowWordCatalog(ds);
//end;
//
//procedure TWordViewController.ShowWordCatalogTree;
//var
// ds:TCustomADODataSet;
//begin
//  ds := FCatalogRelationModel.QueryWordCatalogTree;
//  GetView.ShowWordCatalogTree(ds);
//end;
//
//procedure TWordViewController.InsertCatalogInfo(const value:TWordCatalog);
//begin
//  Model.InsertWordCatalog(value);
//end;
//
//procedure TWordViewController.UpdateCatalogInfo(const value:TWordCatalog);
//begin
//  Model.UpdateWordCatalog(value);
//end;
//
//procedure TWordViewController.DeleteCatalogInfo;
//begin
//  Model.DeleteWordCatalog(View.CatalogInfo);
//end;
//
////procedure TWordViewController.SetWordCatalogDialogInfo;
////begin
////
////end;
//
//procedure TWordViewController.ShowCatalogWord;
//var
// ds:TCustomADODataSet;
//begin
//  if GetView.CatalogInfo.CatalogID = '' then
//    exit;
//
//  ds := FCatalogWordModel.QueryCatalogWord(GetView.CatalogInfo);
//  GetView.ShowCatalogWord(ds);
//end;
//
//procedure TWordViewController.InsertCatalogWord({const catalog:TWordCatalog;}const word:TWord);
//begin
//  FCatalogWordModel.InsertCatalogWord(GetView.CatalogInfo, word);
//end;
//
//procedure TWordViewController.DeleteCatalogWord({const catalog:TWordCatalog;}const word:TWord);
//begin
//  FCatalogWordModel.DeleteCatalogWord(GetView.CatalogInfo, word);
//end;
//
//procedure TWordViewController.InsertCatalogWords({const catalog:TWordCatalog;}const words:TWords);
//var
//  i:integer;
//begin
//  for i := Low(words) to High(words) do
//  begin
//    if FCatalogWordModel.Exist(GetView.CatalogInfo, words[i]) then
//      Continue;
//
//    FCatalogWordModel.InsertCatalogWord(GetView.CatalogInfo, words[i]);
//  end;
//
//end;
//
//procedure TWordViewController.InsertCatalogRelation(const value:TCatalogRelation);
//begin
//  FCatalogRelationModel.InsertCatalogRelation(value);
//end;
//
//procedure TWordViewController.DeleteCatalogRelation;
//begin
//  FCatalogRelationModel.DeleteCatalogRelation(GetView.CatalogRelationInfo);
//end;
//
//procedure TWordViewController.DeleteCatalogRelation(const value:TCatalogRelation);
//begin
//  FCatalogRelationModel.DeleteCatalogRelation(value);
//end;

procedure TWordViewController.InsertWordView(const BeginWord, EndWord:string);
var
 ds:TCustomADODataSet;
begin
//  if GetView.CatalogInfo.CatalogID = '' then
//    exit;

  ds := FWordModel.QueryBetweenWord(BeginWord, EndWord);
  //ds := FCatalogWordModel.QueryCatalogWord(GetView.CatalogInfo);
  //GetView.ShowCatalogWord(ds);

  FWordViewModel.DeleteWordView(SessionInfo.SessionID);

  while not ds.Eof do
  begin
    FWordViewModel.InsertWordView(GuidToString(SessionInfo.Session),
        ds.FieldByName('RowId').AsInteger, ds.FieldByName('Word').AsString);

    ds.Next;
  end;
end;

procedure TWordViewController.DeleteWordView;
begin
  FWordViewModel.DeleteWordView(GuidToString(SessionInfo.Session));
end;

end.
