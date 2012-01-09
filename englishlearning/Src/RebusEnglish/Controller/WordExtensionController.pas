unit WordExtensionController;

interface

uses
  DB, ADODB, MVC, ViewData, WordExtensionView, WordExtensionModel,
  DerivativeModel, SynonymModel, AntonymModel, HomoionymModel, ResemblanceModel,
  CongenerModel;

type
  IWordExtensionController = interface(IController)
    function GetModel: IWordExtensionModel;
    function GetView: IWordExtensionView;

    procedure SetModel(Value: IWordExtensionModel);
    procedure SetView(Value: IWordExtensionView);

    property Model: IWordExtensionModel read GetModel write SetModel;
    property View: IWordExtensionView read GetView write SetView;

    procedure ShowWord;
    procedure ShowDerivativeExtention(const value:TWord);
    procedure InsertDerivativeExtention(const value:TDerivativeExtention);
    procedure UpdateDerivativeExtention(const value, oldValue:TDerivativeExtention);
    procedure DeleteDerivativeExtention(const value:TDerivativeExtention);

    procedure ShowResemblanceExtention(const value:TWord);
    procedure InsertResemblanceExtention(const value:TResemblanceExtention);
    procedure UpdateResemblanceExtention(const value, oldValue:TResemblanceExtention);
    procedure DeleteResemblanceExtention(const value:TResemblanceExtention);

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

    procedure ShowCongenerExtention(const value:TWord);
    procedure InsertCongenerExtention(const value:TCongenerExtention);
    procedure UpdateCongenerExtention(const value, oldValue:TCongenerExtention);
    procedure DeleteCongenerExtention(const value:TCongenerExtention);

  end;

  TWordExtensionController = class(TController, IWordExtensionController)
  private
    FCatalogWordModel:TWordExtensionModel;
    FDerivativeModel:TDerivativeModel;
    FResemblanceModel:TResemblanceModel;
    FSynonymModel:TSynonymModel;
    FAntonymModel:TAntonymModel;
    FHomoionymModel:THomoionymModel;
    FCongenerModel:TCongenerModel;
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

    procedure ShowDerivativeExtention(const value:TWord);
    procedure InsertDerivativeExtention(const value:TDerivativeExtention);
    procedure UpdateDerivativeExtention(const value, oldValue:TDerivativeExtention);
    procedure DeleteDerivativeExtention(const value:TDerivativeExtention);

    procedure ShowResemblanceExtention(const value:TWord);
    procedure InsertResemblanceExtention(const value:TResemblanceExtention);
    procedure UpdateResemblanceExtention(const value, oldValue:TResemblanceExtention);
    procedure DeleteResemblanceExtention(const value:TResemblanceExtention);

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

    procedure ShowCongenerExtention(const value:TWord);
    procedure InsertCongenerExtention(const value:TCongenerExtention);
    procedure UpdateCongenerExtention(const value, oldValue:TCongenerExtention);
    procedure DeleteCongenerExtention(const value:TCongenerExtention);

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
  FResemblanceModel := TResemblanceModel.Create;
  FSynonymModel := TSynonymModel.Create;
  FAntonymModel := TAntonymModel.Create;
  FHomoionymModel := THomoionymModel.Create;
  FCongenerModel := TCongenerModel.Create;
end;

procedure TWordExtensionController.ShowWord;
var
 ds:TCustomADODataSet;
begin
  ds := GetModel.QueryWord;
  GetView.ShowWord(ds);
end;

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

procedure TWordExtensionController.ShowResemblanceExtention(const value:TWord);
var
 ds:TCustomADODataSet;
begin
  ds := FResemblanceModel.QueryResemblanceExtention(value);
  GetView.ShowResemblanceExtention(ds);
end;

procedure TWordExtensionController.InsertResemblanceExtention(const value:TResemblanceExtention);
begin
  FResemblanceModel.InsertResemblanceExtention(value);
end;

procedure TWordExtensionController.UpdateResemblanceExtention(const value, oldValue:TResemblanceExtention);
begin
  FResemblanceModel.UpdateResemblanceExtention(value, oldValue);
end;

procedure TWordExtensionController.DeleteResemblanceExtention(const value:TResemblanceExtention);
begin
  FResemblanceModel.DeleteResemblanceExtention(value);
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

procedure TWordExtensionController.ShowCongenerExtention(const value:TWord);
var
 ds:TCustomADODataSet;
begin
  ds := FCongenerModel.QueryCongenerExtention(value);
  GetView.ShowCongenerExtention(ds);
end;

procedure TWordExtensionController.InsertCongenerExtention(const value:TCongenerExtention);
begin
  FCongenerModel.InsertCongenerExtention(value)
end;

procedure TWordExtensionController.UpdateCongenerExtention(const value, oldValue:TCongenerExtention);
begin
  FCongenerModel.UpdateCongenerExtention(value, oldValue)
end;

procedure TWordExtensionController.DeleteCongenerExtention(const value:TCongenerExtention);
begin
  FCongenerModel.DeleteCongenerExtention(value)
end;

end.
