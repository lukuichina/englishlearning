unit PictureLibraryController;


interface

uses
  DB, ADODB, MVC, ViewData,
  PictureLibraryModel, PictureLibraryView, WordModel;

type
  IPictureLibraryController = interface(IController)
    function GetModel: IPictureLibraryModel;
    function GetView: IPictureLibraryView;

    procedure SetModel(Value: IPictureLibraryModel);
    procedure SetView(Value: IPictureLibraryView);

    property Model: IPictureLibraryModel read GetModel write SetModel;
    property View: IPictureLibraryView read GetView write SetView;

    procedure ShowPicture(const value:TWord);
    procedure InsertPicture(const value:TPicture);
    procedure UpdatePicture(const value:TPicture);
    procedure DeletePicture(const value:TPicture);

    procedure ReplacePicture(const value:TPicture);
    procedure UpdatePictureDisp(const value:TPicture);
  end;

  TPictureLibraryController = class(TController, IPictureLibraryController)
  private
    FWordModel:TWordModel;
    FPictureLibraryModel:TPictureLibraryModel;
  protected
    function GetModel: IPictureLibraryModel;
    function GetView: IPictureLibraryView;

    procedure SetModel(Value: IPictureLibraryModel);
    procedure SetView(Value: IPictureLibraryView);

  public
    property Model: IPictureLibraryModel read GetModel write SetModel;
    property View: IPictureLibraryView read GetView write SetView;

    constructor Create(view:IPictureLibraryView);

    procedure ShowPicture(const value:TWord);
    procedure InsertPicture(const value:TPicture);
    procedure UpdatePicture(const value:TPicture);
    procedure DeletePicture(const value:TPicture);

    procedure ReplacePicture(const value:TPicture);
    procedure UpdatePictureDisp(const value:TPicture);
  end;

implementation

uses SysUtils, CommonInfo;

function TPictureLibraryController.GetModel: IPictureLibraryModel;
begin
  Result := IPictureLibraryModel(inherited GetModel);
end;

function TPictureLibraryController.GetView: IPictureLibraryView;
begin
  Result := IPictureLibraryView(inherited GetView);
end;

procedure TPictureLibraryController.SetModel(Value: IPictureLibraryModel);
begin
  inherited SetModel(Value);
end;

procedure TPictureLibraryController.SetView(Value: IPictureLibraryView);
begin
  inherited SetView(Value);
end;

constructor TPictureLibraryController.Create(view:IPictureLibraryView);
var
  md:IPictureLibraryModel;
begin
  inherited Create(view);

  md:=TPictureLibraryModel.Create;
  inherited SetModel(md);

//  FPictureLibraryModel := TWordModel.Create;
//  FWordViewModel := TWordViewModel.Create;
end;

procedure TPictureLibraryController.ShowPicture(const value:TWord);
var
 ds:TCustomADODataSet;
begin
  ds := GetModel.QueryPicture(value);

  GetView.ShowPicture(ds);
end;

procedure TPictureLibraryController.InsertPicture(const value:TPicture);
begin
  GetModel.InsertPicture(value);
end;

procedure TPictureLibraryController.UpdatePicture(const value:TPicture);
begin
  GetModel.UpdatePicture(value);
end;

procedure TPictureLibraryController.DeletePicture(const value:TPicture);
begin
  GetModel.DeletePicture(value);
end;

procedure TPictureLibraryController.ReplacePicture(const value:TPicture);
begin
  GetModel.ReplacePicture(value);
end;

procedure TPictureLibraryController.UpdatePictureDisp(const value:TPicture);
begin
  GetModel.UpdatePictureDisp(value);
end;

end.
