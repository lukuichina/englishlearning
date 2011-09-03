unit WordViewController;

interface

uses
  DB, ADODB, MVC, WordCatalogModel,
  WordViewModel, WordViewView, WordModel;

type
  IWordViewController = interface(IController)
    function GetModel: IWordViewModel;
    function GetView: IWordViewView;

    procedure SetModel(Value: IWordViewModel);
    procedure SetView(Value: IWordViewView);

    property Model: IWordViewModel read GetModel write SetModel;
    property View: IWordViewView read GetView write SetView;

    procedure InsertWordView(const BeginWord, EndWord:string);
    procedure DeleteWordView;
  end;

  TWordViewController = class(TController, IWordViewController)
  private
    FWordModel:TWordModel;
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
  FWordViewModel := TWordViewModel.Create;
end;

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
