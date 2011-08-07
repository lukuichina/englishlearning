unit WordModel;

interface

uses
  DB, ADODB, MVC, ViewData;

type
  IWordModel = interface(IModel)
    function QueryBetweenWord(const BeginWord, EndWord:string):TCustomADODataSet;
    function QueryWord:TCustomADODataSet;
    function QueryWordTree:TCustomADODataSet;
    function QueryCatalogWord(const value:TWord):TCustomADODataSet;
    function InsertWord(const value:TWord):_Recordset;
    function UpdateWord(const value:TWord):_Recordset;
    function DeleteWord(const value:TWord):_Recordset;
  end;

  TWordModel = class(TModel, IWordModel)
  private

  public
    function QueryBetweenWord(const BeginWord, EndWord:string):TCustomADODataSet;
    function QueryWord:TCustomADODataSet;
    function QueryWordTree:TCustomADODataSet;
    function QueryCatalogWord(const value:TWord):TCustomADODataSet;
    function InsertWord(const value:TWord):_Recordset;
    function UpdateWord(const value:TWord):_Recordset;
    function DeleteWord(const value:TWord):_Recordset;

    constructor Create({Controller: IController});
  end;

implementation

constructor TWordModel.Create;
begin
  inherited Create;
end;

function TWordModel.QueryWord:TCustomADODataSet;
const
  sql:string =
'SELECT' + #13#10 +
'	ROW_NUMBER() OVER(ORDER BY Word.CatalogID ASC) AS RowId,' + #13#10 +
'	Word.CatalogID,' + #13#10 +
'	Word.CatalogName,' + #13#10 +
'	Word.CatalogDisp,' + #13#10 +
'	Word.CreateTime,' + #13#10 +
'	Word.UpdateTime' + #13#10 +
'FROM' + #13#10 +
'	Word' + #13#10 +
'ORDER BY Word.CatalogID ASC';
begin
  Result := Select(sql);
end;

function TWordModel.QueryWordTree:TCustomADODataSet;
const
  sql:string ='GetCatalogRelationTree';
begin
  Result := ExeProc(sql);
end;

function TWordModel.QueryCatalogWord(const value:TWord):TCustomADODataSet;
const
  sql:string =
'SELECT' + #13#10 +
'    ROW_NUMBER() OVER(ORDER BY Word.Word ASC) AS RowId,' + #13#10 +
'    Word.Word,' + #13#10 +
'    Importance.ID as  ImportanceID,' + #13#10 +
'    Importance.Disp as ImportanceLevel,' + #13#10 +
'    Difficulty.ID as DifficultyID,' + #13#10 +
'    Difficulty.Disp as DifficultyLevel,' + #13#10 +
'    CASE WHEN (SELECT COUNT(*) FROM WordExplanation WHERE WordExplanation.Word = Word.Word) > 0 THEN ''¡ð'' ELSE ''¡Á'' END AS IsExplained,' + #13#10 +
'    CASE WHEN (SELECT COUNT(*) FROM Picture WHERE Picture.Word = Word.Word) > 0 THEN ''¡ð'' ELSE ''¡Á'' END AS IsPictured,' + #13#10 +
'    (SELECT COUNT(*) FROM (SELECT Distinct WordType FROM WordExplanation WHERE WordExplanation.Word = Word.Word) wt) AS WordTypeCount,' + #13#10 +
'    (SELECT COUNT(*) FROM WordExplanation WHERE WordExplanation.Word = Word.Word) AS ExplanationCount,' + #13#10 +
'    (SELECT COUNT(*) FROM Picture WHERE Picture.Word = Word.Word) AS PictureCount,' + #13#10 +
'    (SELECT COUNT(*) FROM Picture WHERE Picture.Word = Word.Word AND Picture.MainPicture = 1) AS MainPictureCount,' + #13#10 +
'    Word.CreateTime,' + #13#10 +
'    Word.UpdateTime' + #13#10 +
'FROM' + #13#10 +
'    WordRelation' + #13#10 +
'INNER JOIN Word ON' + #13#10 +
'    WordRelation.Word = Word.Word' + #13#10 +
'INNER JOIN' + #13#10 +
'    Importance on Importance.ID = Word.ImportanceLevel' + #13#10 +
'INNER JOIN' + #13#10 +
'    Difficulty on Difficulty.ID = Word.DifficultyLevel' + #13#10 +
'WHERE' + #13#10 +
'    WordRelation.CatalogID = :CatalogID' + #13#10 +
'ORDER BY' + #13#10 +
'    Word.Word ASC';
begin
  SetSelectSql(sql);

  //Query.Parameters.ParamByName('CatalogID').Value := value.CatalogID;

  Result := DoSelect;
end;

function TWordModel.InsertWord(const value:TWord):_Recordset;
const
  sql:string =
'INSERT INTO' + #13#10 +
'	Word(CatalogID, CatalogName, CatalogDisp, CreateTime, UpdateTime)' + #13#10 +
'VALUES' + #13#10 +
'	((SELECT ''WC'' + RIGHT(''100000'' + (SELECT CASE WHEN MAX(CatalogID) IS NULL THEN 1 ELSE MAX(SUBSTRING(CatalogID,3,5)) + 1 END FROM Word), 5)), :CatalogName, :CatalogDisp, GetDate(), NULL)';
//'	((SELECT CASE WHEN MAX(CatalogID) IS NULL THEN 1 ELSE MAX(CatalogID) + 1 END FROM Word), :CatalogName, :CatalogDisp, GetDate(), NULL)';
begin
  SetExecuteSql(sql);

  //Command.Parameters.ParamByName('CatalogID').Value := value.CatalogID;
  //Command.Parameters.ParamByName('CatalogName').Value := value.CatalogName;
  //Command.Parameters.ParamByName('CatalogDisp').Value := value.CatalogDisp;

  Result := DoExecute;
end;

function TWordModel.UpdateWord(const value:TWord):_Recordset;
const
  sql:string =
'UPDATE' + #13#10 +
'	Word' + #13#10 +
'SET' + #13#10 +
'	CatalogName = :CatalogName,' + #13#10 +
'	CatalogDisp = :CatalogDisp,' + #13#10 +
'	UpdateTime = GetDate()' + #13#10 +
'WHERE' + #13#10 +
'	CatalogID = :CatalogID';
begin
  SetExecuteSql(sql);

  //Command.Parameters.ParamByName('CatalogName').Value := value.CatalogName;
  //Command.Parameters.ParamByName('CatalogDisp').Value := value.CatalogDisp;
  //Command.Parameters.ParamByName('CatalogID').Value := value.CatalogID;

  Result := DoExecute;
end;

function TWordModel.DeleteWord(const value:TWord):_Recordset;
const
  sql:string = 'DELETE FROM Word WHERE CatalogID = :CatalogID';
begin
  SetExecuteSql(sql);

  //Command.Parameters.ParamByName('CatalogID').Value := value.CatalogID;

  Result := DoExecute;
end;

function TWordModel.QueryBetweenWord(const BeginWord, EndWord:string):TCustomADODataSet;
const
  sql:string =
'SELECT' + #13#10 +
'	ROW_NUMBER() OVER(ORDER BY Word.Word ASC) AS RowId,' + #13#10 +
'	Word.Word,' + #13#10 +
'	Word.CreateTime,' + #13#10 +
'	Word.UpdateTime' + #13#10 +
'FROM' + #13#10 +
'	Word' + #13#10 +
'WHERE' + #13#10 +
'	Word BETWEEN :BeginWord AND :EndWord' + #13#10 +
'ORDER BY Word.Word ASC';
begin
  SetSelectSql(sql);

  Query.Parameters.ParamByName('BeginWord').Value := BeginWord;
  Query.Parameters.ParamByName('EndWord').Value := EndWord;

  Result := DoSelect;
end;

end.
