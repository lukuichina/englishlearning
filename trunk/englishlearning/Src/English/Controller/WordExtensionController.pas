unit WordExtensionController;

interface

uses
  DB, ADODB, MVC, ViewData, WordExtensionView, WordExtensionModel,
  DerivativeModel, SynonymModel, AntonymModel, HomoionymModel;

type
  IWordExtensionController = interface(IController)
    function GetModel: IWordExtensionModel;
    function GetView: IWordExtensionView;

    procedure SetModel(Value: IWordExtensionModel);
    procedure SetView(Value: IWordExtensionView);

    property Model: IWordExtensionModel read GetModel write SetModel;
    property View: IWordExtensionView read GetView write SetView;

    procedure ShowWord;
//    procedure ShowTypeWordExtention(const value:TWord);
//    procedure InsertTypeWordExtention(const value:TTypeWordExtention);
//    procedure UpdateTypeWordExtention(const value, oldValue:TTypeWordExtention);
//    procedure DeleteTypeWordExtention(const value:TTypeWordExtention);

    procedure ShowDerivativeExtention(const value:TWord);
    procedure InsertDerivativeExtention(const value:TDerivativeExtention);
    procedure UpdateDerivativeExtention(const value, oldValue:TDerivativeExtention);
    procedure DeleteDerivativeExtention(const value:TDerivativeExtention);

    procedure ShowSynonymExtention(const value:TWord);
    procedure InsertSynonymExtention(const value:TSynonymExtention);
    procedure UpdateSynonymExtention(const value, oldValue:TSynonymExtention);
    procedure DeleteSynonymExtention(const value:TSynonymExtention);

    procedure ShowAntonymExtention(const value:TWord);
    procedure InsertAntonymExtention(const value:TAntonymExtention);
    procedure UpdateAntonymExtention(const value, oldValue:TAntonymExtention);
    procedure DeleteAntonymExtention(const value:TAntonymExtention);

    procedure ShowHomoionymExtention(const value:TWord);
    procedure InsertHomoionymExtention(const value:THomoionymExtention);
    procedure UpdateHomoionymExtention(const value, oldValue:THomoionymExtention);
    procedure DeleteHomoionymExtention(const value:THomoionymExtention);
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
    FDerivativeModel:TDerivativeModel;
    FSynonymModel:TSynonymModel;
    FAntonymModel:TAntonymModel;
    FHomoionymModel:THomoionymModel;
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
//    procedure ShowTypeWordExtention(const value:TWord);
//    procedure InsertTypeWordExtention(const value:TTypeWordExtention);
//    procedure UpdateTypeWordExtention(const value, oldValue:TTypeWordExtention);
//    procedure DeleteTypeWordExtention(const value:TTypeWordExtention);

    procedure ShowDerivativeExtention(const value:TWord);
    procedure InsertDerivativeExtention(const value:TDerivativeExtention);
    procedure UpdateDerivativeExtention(const value, oldValue:TDerivativeExtention);
    procedure DeleteDerivativeExtention(const value:TDerivativeExtention);

    procedure ShowSynonymExtention(const value:TWord);
    procedure InsertSynonymExtention(const value:TSynonymExtention);
    procedure UpdateSynonymExtention(const value, oldValue:TSynonymExtention);
    procedure DeleteSynonymExtention(const value:TSynonymExtention);

    procedure ShowAntonymExtention(const value:TWord);
    procedure InsertAntonymExtention(const value:TAntonymExtention);
    procedure UpdateAntonymExtention(const value, oldValue:TAntonymExtention);
    procedure DeleteAntonymExtention(const value:TAntonymExtention);

    procedure ShowHomoionymExtention(const value:TWord);
    procedure InsertHomoionymExtention(const value:THomoionymExtention);
    procedure UpdateHomoionymExtention(const value, oldValue:THomoionymExtention);
    procedure DeleteHomoionymExtention(const value:THomoionymExtention);
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

  FDerivativeModel := TDerivativeModel.Create;
  FSynonymModel := TSynonymModel.Create;
  FAntonymModel := TAntonymModel.Create;
  FHomoionymModel := THomoionymModel.Create;
end;

procedure TWordExtensionController.ShowWord;
var
 ds:TCustomADODataSet;
begin
  ds := GetModel.QueryWord;
  GetView.ShowWord(ds);
end;

//procedure TWordExtensionController.ShowTypeWordExtention(const value:TWord);
//var
// ds:TCustomADODataSet;
//begin
//  ds := GetModel.QueryTypeWordExtention(value);
//  GetView.ShowTypeWordExtention(ds);
//end;
//
//procedure TWordExtensionController.InsertTypeWordExtention(const value:TTypeWordExtention);
//begin
//  Model.InsertTypeWordExtention(value);
//end;
//
//procedure TWordExtensionController.UpdateTypeWordExtention(const value, oldValue:TTypeWordExtention);
//begin
//  Model.UpdateTypeWordExtention(value, oldValue);
//end;
//
//procedure TWordExtensionController.DeleteTypeWordExtention(const value:TTypeWordExtention);
//begin
//  Model.DeleteTypeWordExtention(value);
//end;

procedure TWordExtensionController.ShowDerivativeExtention(const value:TWord);
var
 ds:TCustomADODataSet;
begin
  ds := FDerivativeModel.QueryDerivativeExtention(value);
  GetView.ShowDerivativeExtention(ds);
end;

procedure TWordExtensionController.InsertDerivativeExtention(const value:TDerivativeExtention);
begin
  FDerivativeModel.InsertDerivativeExtention(value);
end;

procedure TWordExtensionController.UpdateDerivativeExtention(const value, oldValue:TDerivativeExtention);
begin
  FDerivativeModel.UpdateDerivativeExtention(value, oldValue);
end;

procedure TWordExtensionController.DeleteDerivativeExtention(const value:TDerivativeExtention);
begin
  FDerivativeModel.DeleteDerivativeExtention(value);
end;

procedure TWordExtensionController.ShowSynonymExtention(const value:TWord);
var
 ds:TCustomADODataSet;
begin
  ds := FSynonymModel.QuerySynonymExtention(value);
  GetView.ShowSynonymExtention(ds);
end;

procedure TWordExtensionController.InsertSynonymExtention(const value:TSynonymExtention);
begin
  FSynonymModel.InsertSynonymExtention(value)
end;

procedure TWordExtensionController.UpdateSynonymExtention(const value, oldValue:TSynonymExtention);
begin
  FSynonymModel.UpdateSynonymExtention(value, oldValue)
end;

procedure TWordExtensionController.DeleteSynonymExtention(const value:TSynonymExtention);
begin
  FSynonymModel.DeleteSynonymExtention(value)
end;

procedure TWordExtensionController.ShowAntonymExtention(const value:TWord);
var
 ds:TCustomADODataSet;
begin
  ds := FAntonymModel.QueryAntonymExtention(value);
  GetView.ShowAntonymExtention(ds);
end;

procedure TWordExtensionController.InsertAntonymExtention(const value:TAntonymExtention);
begin
  FAntonymModel.InsertAntonymExtention(value)
end;

procedure TWordExtensionController.UpdateAntonymExtention(const value, oldValue:TAntonymExtention);
begin
  FAntonymModel.UpdateAntonymExtention(value, oldValue)
end;

procedure TWordExtensionController.DeleteAntonymExtention(const value:TAntonymExtention);
begin
  FAntonymModel.DeleteAntonymExtention(value)
end;

procedure TWordExtensionController.ShowHomoionymExtention(const value:TWord);
var
 ds:TCustomADODataSet;
begin
  ds := FHomoionymModel.QueryHomoionymExtention(value);
  GetView.ShowHomoionymExtention(ds);
end;

procedure TWordExtensionController.InsertHomoionymExtention(const value:THomoionymExtention);
begin
  FHomoionymModel.InsertHomoionymExtention(value)
end;

procedure TWordExtensionController.UpdateHomoionymExtention(const value, oldValue:THomoionymExtention);
begin
  FHomoionymModel.UpdateHomoionymExtention(value, oldValue)
end;

procedure TWordExtensionController.DeleteHomoionymExtention(const value:THomoionymExtention);
begin
  FHomoionymModel.DeleteHomoionymExtention(value)
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
