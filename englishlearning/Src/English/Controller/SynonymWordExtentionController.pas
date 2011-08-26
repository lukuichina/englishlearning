unit SynonymWordExtentionController;

interface

uses
  DB, ADODB, MVC, SynonymWordExtentionView, WordExplanationModel;

type
  ISynonymWordExtentionController = interface(IController)
    //function GetModel: IWordExtensionModel;
    function GetView: ISynonymWordExtentionView;

    //procedure SetModel(Value: IWordExtensionModel);
    procedure SetView(Value: ISynonymWordExtentionView);

    //property Model: IWordExtensionModel read GetModel write SetModel;
    property View: ISynonymWordExtentionView read GetView write SetView;

    procedure ShowBaseWordExplanation(const word:string;const wordtype:integer);
    procedure ShowExtendWordExplanation(const word:string;const wordtype:integer);
  end;

  TSynonymWordExtentionController = class(TController, ISynonymWordExtentionController)
  private
    FWordExplanationModel:TWordExplanationModel;

  protected
    //function GetModel: IWordExtensionModel;
    function GetView: ISynonymWordExtentionView;

    //procedure SetModel(Value: IWordExtensionModel);
    procedure SetView(Value: ISynonymWordExtentionView);

    //property Model: IWordExtensionModel read GetModel write SetModel;
    property View: ISynonymWordExtentionView read GetView write SetView;

  public
    constructor Create(view:ISynonymWordExtentionView);
    destructor  Destroy;

    procedure ShowBaseWordExplanation(const word:string;const wordtype:integer);
    procedure ShowExtendWordExplanation(const word:string;const wordtype:integer);
  end;

implementation

//function TSynonymWordExtentionController.GetModel: IWordExtensionModel;
//begin
//  Result := IWordExtensionModel(inherited GetModel);
//end;

function TSynonymWordExtentionController.GetView: ISynonymWordExtentionView;
begin
  Result := ISynonymWordExtentionView(inherited GetView);
end;

//procedure TSynonymWordExtentionController.SetModel(Value: IWordExtensionModel);
//begin
//  inherited SetModel(Value);
//end;

procedure TSynonymWordExtentionController.SetView(Value: ISynonymWordExtentionView);
begin
  inherited SetView(Value);
end;

constructor TSynonymWordExtentionController.Create(view:ISynonymWordExtentionView);
//var
//  md:IWordExtensionModel;
begin
  inherited Create(view);

//  md:=TWordExplanationModel.Create;
//  inherited SetModel(md);

  FWordExplanationModel := TWordExplanationModel.Create;
end;

destructor TSynonymWordExtentionController.Destroy;
begin
  FWordExplanationModel.Free;
end;

procedure TSynonymWordExtentionController.ShowBaseWordExplanation(const word:string;const wordtype:integer);
var
 ds:TCustomADODataSet;
begin
  ds := FWordExplanationModel.QueryWordExplanation(word, wordtype);
  GetView.ShowBaseWordExplanation(ds);
end;
procedure TSynonymWordExtentionController.ShowExtendWordExplanation(const word:string;const wordtype:integer);
var
 ds:TCustomADODataSet;
begin
  ds := FWordExplanationModel.QueryWordExplanation(word, wordtype);
  GetView.ShowExtendWordExplanation(ds);
end;

end.
