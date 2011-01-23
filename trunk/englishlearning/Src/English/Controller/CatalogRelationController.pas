unit CatalogRelationController;

interface

uses
  DB, ADODB, MVC, ViewData, WordCatalogView, WordCatalogModel, CatalogWordModel,
  CatalogRelationModel;

//type
//  ICatalogRelationController = interface(IController)
//    function GetModel: ICatalogRelationModel;
//    function GetView: IWordCatalogView;
//
//    procedure SetModel(Value: ICatalogRelationModel);
//    procedure SetView(Value: IWordCatalogView);
//
//    property Model: ICatalogRelationModel read GetModel write SetModel;
//    property View: IWordCatalogView read GetView write SetView;
//
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
//  end;
//
//  TCatalogRelationController = class(TController, ICatalogRelationController)
//  private
//    FCatalogRelationModel:TCatalogRelationModel;
//  protected
//    function GetModel: ICatalogRelationModel;
//    function GetView: IWordCatalogView;
//
//    procedure SetModel(Value: ICatalogRelationModel);
//    procedure SetView(Value: IWordCatalogView);
//
//  public
//    property Model: ICatalogRelationModel read GetModel write SetModel;
//    property View: IWordCatalogView read GetView write SetView;
//
//    constructor Create(view:IWordCatalogView);
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
//  end;

implementation

//function TCatalogRelationController.GetModel: ICatalogRelationModel;
//begin
//  Result := ICatalogRelationModel(inherited GetModel);
//end;
//
//function TCatalogRelationController.GetView: IWordCatalogView;
//begin
//  Result := IWordCatalogView(inherited GetView);
//end;
//
//procedure TCatalogRelationController.SetModel(Value: ICatalogRelationModel);
//begin
//  inherited SetModel(Value);
//end;
//
//procedure TCatalogRelationController.SetView(Value: IWordCatalogView);
//begin
//  inherited SetView(Value);
//end;
//
//constructor TCatalogRelationController.Create(view:IWordCatalogView);
//var
//  md:IWordCatalogModel;
//begin
//  inherited Create(view);
//
//  md:=TWordCatalogModel.Create;
//  inherited SetModel(md);
//
//  FCatalogRelationModel := TCatalogRelationModel.Create;
//end;
//
//procedure TCatalogRelationController.ShowWordCatalog;
//var
// ds:TCustomADODataSet;
//begin
//  ds := GetModel.QueryWordCatalog;
//  GetView.ShowWordCatalog(ds);
//end;
//
//procedure TCatalogRelationController.ShowWordCatalogTree;
//var
// ds:TCustomADODataSet;
//begin
//  ds := GetModel.QueryWordCatalogTree;
//  GetView.ShowWordCatalogTree(ds);
//end;
//
//procedure TCatalogRelationController.InsertCatalogInfo(const value:TWordCatalog);
//begin
//  Model.InsertWordCatalog(value);
//end;
//
//procedure TCatalogRelationController.UpdateCatalogInfo(const value:TWordCatalog);
//begin
//  Model.UpdateWordCatalog(value);
//end;
//
//procedure TCatalogRelationController.DeleteCatalogInfo;
//begin
//  Model.DeleteWordCatalog(View.CatalogInfo);
//end;
//
////procedure TWordCatalogController.SetWordCatalogDialogInfo;
////begin
////
////end;
//
//procedure TCatalogRelationController.ShowCatalogWord;
//var
// ds:TCustomADODataSet;
//begin
////  ds := FCatalogRelationModel.QueryCatalogWord(GetView.CatalogInfo);
////  GetView.ShowCatalogWord(ds);
//end;
//
//procedure TCatalogRelationController.InsertCatalogWord({const catalog:TWordCatalog;}const word:TWord);
//begin
////  FCatalogRelationModel.InsertCatalogWord(GetView.CatalogInfo, word);
//end;
//
//procedure TCatalogRelationController.DeleteCatalogWord({const catalog:TWordCatalog;}const word:TWord);
//begin
////  FCatalogRelationModel.DeleteCatalogWord(GetView.CatalogInfo, word);
//end;

end.
