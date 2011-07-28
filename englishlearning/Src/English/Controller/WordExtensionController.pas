unit WordExtensionController;

interface

uses
  DB, ADODB, MVC, ViewData, WordExtensionView, WordExtensionModel;

type
  IWordExtensionController = interface(IController)
    function GetModel: IWordExtensionModel;
    function GetView: IWordExtensionView;

    procedure SetModel(Value: IWordExtensionModel);
    procedure SetView(Value: IWordExtensionView);

    property Model: IWordExtensionModel read GetModel write SetModel;
    property View: IWordExtensionView read GetView write SetView;

    procedure ShowWord;
    procedure ShowTypeWordExtention(const value:TWord);
    procedure InsertTypeWordExtention(const value:TTypeWordExtension);
    procedure UpdateTypeWordExtention(const value, oldValue:TTypeWordExtension);
    procedure DeleteTypeWordExtention(const value:TTypeWordExtension);
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
  end;

  TWordExtensionController = class(TController, IWordExtensionController)
  private
    FCatalogWordModel:TWordExtensionModel;
    //FCatalogRelationModel:TCatalogRelationModel;
  protected
    function GetModel: IWordExtensionModel;
    function GetView: IWordExtensionView;

    procedure SetModel(Value: IWordExtensionModel);
    procedure SetView(Value: IWordExtensionView);

  public
    property Model: IWordExtensionModel read GetModel write SetModel;
    property View: IWordExtensionView read GetView write SetView;

    constructor Create(view:IWordExtensionView);
    procedure ShowWord;
    procedure ShowTypeWordExtention(const value:TWord);
    procedure InsertTypeWordExtention(const value:TTypeWordExtension);
    procedure UpdateTypeWordExtention(const value, oldValue:TTypeWordExtension);
    procedure DeleteTypeWordExtention(const value:TTypeWordExtension);
////    procedure SetWordCatalogDialogInfo;
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
  end;

implementation

function TWordExtensionController.GetModel: IWordExtensionModel;
begin
  Result := IWordExtensionModel(inherited GetModel);
end;

function TWordExtensionController.GetView: IWordExtensionView;
begin
  Result := IWordExtensionView(inherited GetView);
end;

procedure TWordExtensionController.SetModel(Value: IWordExtensionModel);
begin
  inherited SetModel(Value);
end;

procedure TWordExtensionController.SetView(Value: IWordExtensionView);
begin
  inherited SetView(Value);
end;

constructor TWordExtensionController.Create(view:IWordExtensionView);
var
  md:IWordExtensionModel;
begin
  inherited Create(view);

  md:=TWordExtensionModel.Create;
  inherited SetModel(md);

//  FCatalogWordModel := TCatalogWordModel.Create;
//  FCatalogRelationModel := TCatalogRelationModel.Create;
end;

procedure TWordExtensionController.ShowWord;
var
 ds:TCustomADODataSet;
begin
  ds := GetModel.QueryWord;
  GetView.ShowWord(ds);
end;

procedure TWordExtensionController.ShowTypeWordExtention(const value:TWord);
var
 ds:TCustomADODataSet;
begin
  ds := GetModel.QueryTypeWordExtention(value);
  GetView.ShowTypeWordExtention(ds);
end;

procedure TWordExtensionController.InsertTypeWordExtention(const value:TTypeWordExtension);
begin
  Model.InsertTypeWordExtention(value);
end;

procedure TWordExtensionController.UpdateTypeWordExtention(const value, oldValue:TTypeWordExtension);
begin
  Model.UpdateTypeWordExtention(value, oldValue);
end;

procedure TWordExtensionController.DeleteTypeWordExtention(const value:TTypeWordExtension);
begin
  Model.DeleteTypeWordExtention(value);
end;

//procedure TWordExtensionController.SetWordCatalogDialogInfo;
//begin
//
//end;

//procedure TWordExtensionController.ShowCatalogWord;
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
//procedure TWordExtensionController.InsertCatalogWord({const catalog:TWordCatalog;}const word:TWord);
//begin
//  FCatalogWordModel.InsertCatalogWord(GetView.CatalogInfo, word);
//end;
//
//procedure TWordExtensionController.DeleteCatalogWord({const catalog:TWordCatalog;}const word:TWord);
//begin
//  FCatalogWordModel.DeleteCatalogWord(GetView.CatalogInfo, word);
//end;
//
//procedure TWordExtensionController.InsertCatalogWords({const catalog:TWordCatalog;}const words:TWords);
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
//procedure TWordExtensionController.InsertCatalogRelation(const value:TCatalogRelation);
//begin
//  FCatalogRelationModel.InsertCatalogRelation(value);
//end;
//
//procedure TWordExtensionController.DeleteCatalogRelation;
//begin
//  FCatalogRelationModel.DeleteCatalogRelation(GetView.CatalogRelationInfo);
//end;
//
//procedure TWordExtensionController.DeleteCatalogRelation(const value:TCatalogRelation);
//begin
//  FCatalogRelationModel.DeleteCatalogRelation(value);
//end;


end.
