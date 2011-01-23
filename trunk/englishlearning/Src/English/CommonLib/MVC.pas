unit MVC;

interface

uses
  DB, ADODB;

type
  IModel = interface
    function Select(const value:string):TCustomADODataSet;
//    function Insert(const value:string):_Recordset;
//    function Update(const value:string):_Recordset;
//    function Delete(const value:string):_Recordset;
    function Execute(const value:string):_Recordset;
    function ExeProc(const value:string):TCustomADODataSet;

    procedure SetSelectSql(const value:string);
    procedure SetExecuteSql(const value:string);
    procedure SetExeProcSql(const value:string);

    function DoSelect:TCustomADODataSet;
    function DoExecute:_Recordset;
    function DoExeProc:TCustomADODataSet;

    function GetQuery: TADOQuery;
    function GetCommand: TADOCommand;
    function GetStoredProc: TADOStoredProc;

    procedure SetQuery(Value: TADOQuery);
    procedure SetCommand(Value: TADOCommand);
    procedure SetStoredProc(Value: TADOStoredProc);

    property Query: TADOQuery read GetQuery write SetQuery;
    property Command: TADOCommand read GetCommand write SetCommand;
    property StoredProc: TADOStoredProc read GetStoredProc write SetStoredProc;
  end;

  IView = interface
  end;

  IController = interface
  //['{xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx}']
    function GetModel: IModel;
    function GetView: IView;

    procedure SetModel(Value: IModel);
    procedure SetView(Value: IView);

    property Model: IModel read GetModel write SetModel;
    property View: IView read GetView write SetView;
  end;

type
  TModel = class(TInterfacedObject, IModel)
  private
    FController:IController;
    FQuery:TADOQuery;
//    FInsert:TADOCommand;
//    FUpdate:TADOCommand;
//    FDelete:TADOCommand;
    FCommand:TADOCommand;
    FStoredProc:TADOStoredProc;

  private
    function CreateQueryInstance:TADOQuery;
    function CreateCommandInstance:TADOCommand;
    function CreateStoredProcInstance:TADOStoredProc;
  public
    function Select(const value:string):TCustomADODataSet;
//    function Insert(const value:string):_Recordset;
//    function Update(const value:string):_Recordset;
//    function Delete(const value:string):_Recordset;
    function Execute(const value:string):_Recordset;
    function ExeProc(const value:string):TCustomADODataSet;

    procedure SetSelectSql(const value:string);
    procedure SetExecuteSql(const value:string);
    procedure SetExeProcSql(const value:string);

    function DoSelect:TCustomADODataSet;
    function DoExecute:_Recordset;
    function DoExeProc:TCustomADODataSet;

    function GetQuery: TADOQuery;
    function GetCommand: TADOCommand;
    function GetStoredProc: TADOStoredProc;

    procedure SetQuery(Value: TADOQuery);
    procedure SetCommand(Value: TADOCommand);
    procedure SetStoredProc(Value: TADOStoredProc);

    property Query: TADOQuery read GetQuery write SetQuery;
    property Command: TADOCommand read GetCommand write SetCommand;
    property StoredProc: TADOStoredProc read GetStoredProc write SetStoredProc;

    constructor Create({Controller: IController});
  end;

  TController = class(TInterfacedObject, IController)
  private
    FView:IView;
    FModel:IModel;

  protected
    function GetModel: IModel;
    function GetView: IView;

    procedure SetModel(Value: IModel);
    procedure SetView(Value: IView);
  public
    property Model: IModel read GetModel write SetModel;
    property View: IView read GetView write SetView;

    constructor Create(View: IView);
  end;

implementation

uses
  DataModule;

constructor TModel.Create({Controller: IController});
begin
  //FController := Controller;

//  FQuery := TADOQuery.Create(nil);
//  FQuery.Connection := dmManager.conEnglish;

//  FInsert := TADOCommand.Create(nil);
//  FInsert.Connection := dmManager.conEnglish;
//
//  FUpdate := TADOCommand.Create(nil);
//  FUpdate.Connection := dmManager.conEnglish;
//
//  FDelete := TADOCommand.Create(nil);
//  FDelete.Connection := dmManager.conEnglish;

  FCommand := TADOCommand.Create(nil);
  FCommand.Connection := dmManager.conEnglish;

//  FStoredProc := TADOStoredProc.Create(nil);
//  FStoredProc.Connection := dmManager.conEnglish;
end;

function TModel.Select(const value:string):TCustomADODataSet;
begin
  FQuery := CreateQueryInstance;

  FQuery.Close;
  FQuery.SQL.Clear;
  FQuery.SQL.Text := value;
  FQuery.Open;

  Result := FQuery;
end;

//function TModel.Insert(const value:string):_Recordset;
//begin
//  FInsert.CommandType := cmdText ;
//  FInsert.CommandText := value;
//
//  Result := FInsert.Execute;
//end;
//
//function TModel.Update(const value:string):_Recordset;
//begin
//  FUpdate.CommandType := cmdText ;
//  FUpdate.CommandText := value;
//
//  Result := FUpdate.Execute;
//end;
//
//function TModel.Delete(const value:string):_Recordset;
//begin
//  FDelete.CommandType := cmdText ;
//  FDelete.CommandText := value;
//
//  Result := FDelete.Execute;
//end;

function TModel.Execute(const value:string):_Recordset;
begin
  FCommand.CommandType := cmdText;
  FCommand.CommandText := value;

  Result := FCommand.Execute;
end;

function TModel.ExeProc(const value:string):TCustomADODataSet;
begin
  FStoredProc := CreateStoredProcInstance;

  FStoredProc.Close;
  FStoredProc.ProcedureName := value;
  FStoredProc.Open;

  Result := FStoredProc;
end;

procedure TModel.SetSelectSql(const value:string);
begin
  FQuery := CreateQueryInstance;

  FQuery.Close;
  FQuery.SQL.Clear;
  FQuery.SQL.Text := value;
end;

procedure TModel.SetExecuteSql(const value:string);
begin
  FCommand.CommandType := cmdText;
  FCommand.CommandText := value;
end;

procedure TModel.SetExeProcSql(const value:string);
begin
  FStoredProc := CreateStoredProcInstance;

  FStoredProc.Close;
  FStoredProc.ProcedureName := value;
end;

function TModel.DoSelect:TCustomADODataSet;
var
  QueryInstance:TADOQuery;
begin
  FQuery.Open;

//  QueryInstance := CreateQueryInstance;
//  QueryInstance.Clone(FQuery, ltReadOnly);
//  Result := QueryInstance;
  Result := FQuery;
end;

function TModel.DoExecute:_Recordset;
begin
  Result := FCommand.Execute;
end;

function TModel.DoExeProc:TCustomADODataSet;
begin
  FStoredProc.Open;

  Result := FStoredProc;
end;

function TModel.GetQuery: TADOQuery;
begin
  Result := FQuery;
end;

function TModel.GetCommand: TADOCommand;
begin
  Result := FCommand;
end;

function TModel.GetStoredProc: TADOStoredProc;
begin
  Result := FStoredProc;
end;

procedure TModel.SetQuery(Value: TADOQuery);
begin
  FQuery := value;
end;

procedure TModel.SetCommand(Value: TADOCommand);
begin
  FCommand := value;
end;

procedure TModel.SetStoredProc(Value: TADOStoredProc);
begin
  FStoredProc := value;
end;

function TModel.CreateQueryInstance:TADOQuery;
begin
  Result := TADOQuery.Create(nil);
  Result.Connection := dmManager.conEnglish;
end;

function TModel.CreateCommandInstance:TADOCommand;
begin
  Result := TADOCommand.Create(nil);
  Result.Connection := dmManager.conEnglish;
end;

function TModel.CreateStoredProcInstance:TADOStoredProc;
begin
  Result := TADOStoredProc.Create(nil);
  Result.Connection := dmManager.conEnglish;
end;

constructor TController.Create(View: IView);
begin
  FView := View;
end;

function TController.GetModel: IModel;
begin
  Result := FModel;
end;

function TController.GetView: IView;
begin
  Result := FView;
end;

procedure TController.SetModel(Value: IModel);
begin
  FModel := value;
end;

procedure TController.SetView(Value: IView);
begin
  FView := value;
end;

end.
