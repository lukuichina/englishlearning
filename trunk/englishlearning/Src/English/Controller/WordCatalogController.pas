unit WordCatalogController;

interface

uses
  DB, ADODB, MVC, ViewData, WordCatalogView, WordCatalogModel, CatalogWordModel,
  CatalogRelationModel;

type
  IWordCatalogController = interface(IController)
    function GetModel: IWordCatalogModel;
    function GetView: IWordCatalogView;

    procedure SetModel(Value: IWordCatalogModel);
    procedure SetView(Value: IWordCatalogView);

    property Model: IWordCatalogModel read GetModel write SetModel;
    property View: IWordCatalogView read GetView write SetView;

    procedure ShowWordCatalog;
    procedure ShowWordCatalogTree;
    procedure InsertCatalogInfo(const value:TWordCatalog);
    procedure UpdateCatalogInfo(const value:TWordCatalog);
    procedure DeleteCatalogInfo;
//    procedure SetWordCatalogDialogInfo;

    procedure ShowCatalogWord;
    procedure InsertCatalogWord({const catalog:TWordCatalog;}const word:TWord);
    procedure DeleteCatalogWord({const catalog:TWordCatalog;}const word:TWord);

    procedure InsertCatalogRelation(const value:TCatalogRelation);
    procedure DeleteCatalogRelation; overload;
    procedure DeleteCatalogRelation(const value:TCatalogRelation); overload;
  end;

  TWordCatalogController = class(TController, IWordCatalogController)
  private
    FCatalogWordModel:TCatalogWordModel;
    FCatalogRelationModel:TCatalogRelationModel;
  protected
    function GetModel: IWordCatalogModel;
    function GetView: IWordCatalogView;

    procedure SetModel(Value: IWordCatalogModel);
    procedure SetView(Value: IWordCatalogView);

  public
    property Model: IWordCatalogModel read GetModel write SetModel;
    property View: IWordCatalogView read GetView write SetView;

    constructor Create(view:IWordCatalogView);
    procedure ShowWordCatalog;
    procedure ShowWordCatalogTree;
    procedure InsertCatalogInfo(const value:TWordCatalog);
    procedure UpdateCatalogInfo(const value:TWordCatalog);
    procedure DeleteCatalogInfo;
//    procedure SetWordCatalogDialogInfo;

    procedure ShowCatalogWord;
    procedure InsertCatalogWord({const catalog:TWordCatalog;}const word:TWord);
    procedure DeleteCatalogWord({const catalog:TWordCatalog;}const word:TWord);

    procedure InsertCatalogRelation(const value:TCatalogRelation);
    procedure DeleteCatalogRelation; overload;
    procedure DeleteCatalogRelation(const value:TCatalogRelation); overload;
  end;

implementation

function TWordCatalogController.GetModel: IWordCatalogModel;
begin
  Result := IWordCatalogModel(inherited GetModel);
end;

function TWordCatalogController.GetView: IWordCatalogView;
begin
  Result := IWordCatalogView(inherited GetView);
end;

procedure TWordCatalogController.SetModel(Value: IWordCatalogModel);
begin
  inherited SetModel(Value);
end;

procedure TWordCatalogController.SetView(Value: IWordCatalogView);
begin
  inherited SetView(Value);
end;

constructor TWordCatalogController.Create(view:IWordCatalogView);
var
  md:IWordCatalogModel;
begin
  inherited Create(view);

  md:=TWordCatalogModel.Create;
  inherited SetModel(md);

  FCatalogWordModel := TCatalogWordModel.Create;
  FCatalogRelationModel := TCatalogRelationModel.Create;
end;

procedure TWordCatalogController.ShowWordCatalog;
var
 ds:TCustomADODataSet;
begin
  ds := GetModel.QueryWordCatalog;
  GetView.ShowWordCatalog(ds);
end;

procedure TWordCatalogController.ShowWordCatalogTree;
var
 ds:TCustomADODataSet;
begin
  ds := FCatalogRelationModel.QueryWordCatalogTree;
  GetView.ShowWordCatalogTree(ds);
end;

procedure TWordCatalogController.InsertCatalogInfo(const value:TWordCatalog);
begin
  Model.InsertWordCatalog(value);
end;

procedure TWordCatalogController.UpdateCatalogInfo(const value:TWordCatalog);
begin
  Model.UpdateWordCatalog(value);
end;

procedure TWordCatalogController.DeleteCatalogInfo;
begin
  Model.DeleteWordCatalog(View.CatalogInfo);
end;

//procedure TWordCatalogController.SetWordCatalogDialogInfo;
//begin
//
//end;

procedure TWordCatalogController.ShowCatalogWord;
var
 ds:TCustomADODataSet;
begin
  if GetView.CatalogInfo.CatalogID = '' then
    exit;

  ds := FCatalogWordModel.QueryCatalogWord(GetView.CatalogInfo);
  GetView.ShowCatalogWord(ds);
end;

procedure TWordCatalogController.InsertCatalogWord({const catalog:TWordCatalog;}const word:TWord);
begin
  FCatalogWordModel.InsertCatalogWord(GetView.CatalogInfo, word);
end;

procedure TWordCatalogController.DeleteCatalogWord({const catalog:TWordCatalog;}const word:TWord);
begin
  FCatalogWordModel.DeleteCatalogWord(GetView.CatalogInfo, word);
end;

procedure TWordCatalogController.InsertCatalogRelation(const value:TCatalogRelation);
begin
  FCatalogRelationModel.InsertCatalogRelation(value);
end;

procedure TWordCatalogController.DeleteCatalogRelation;
begin
  FCatalogRelationModel.DeleteCatalogRelation(GetView.CatalogRelationInfo);
end;

procedure TWordCatalogController.DeleteCatalogRelation(const value:TCatalogRelation);
begin
  FCatalogRelationModel.DeleteCatalogRelation(value);
end;

end.
