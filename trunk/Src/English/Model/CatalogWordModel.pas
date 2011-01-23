unit CatalogWordModel;

interface

uses
  DB, ADODB, MVC, ViewData;

type
  ICatalogWordModel = interface(IModel)
//    function QueryWordCatalog:TCustomADODataSet;
//    function QueryWordCatalogTree:TCustomADODataSet;
    function QueryCatalogWord(const value:TWordCatalog):TCustomADODataSet;
    function InsertCatalogWord(const catalog:TWordCatalog;const word:TWord):_Recordset;
//    function UpdateWordCatalog(const value:TWordCatalog):_Recordset;
    function DeleteCatalogWord(const catalog:TWordCatalog;const word:TWord):_Recordset;
  end;

  TCatalogWordModel = class(TModel, ICatalogWordModel)
  private

  public
//    function QueryWordCatalog:TCustomADODataSet;
//    function QueryWordCatalogTree:TCustomADODataSet;
    function QueryCatalogWord(const value:TWordCatalog):TCustomADODataSet;
    function InsertCatalogWord(const catalog:TWordCatalog;const word:TWord):_Recordset;
//    function UpdateWordCatalog(const value:TWordCatalog):_Recordset;
    function DeleteCatalogWord(const catalog:TWordCatalog;const word:TWord):_Recordset;

    constructor Create({Controller: IController});
  end;

implementation

constructor TCatalogWordModel.Create;
begin
  inherited Create;
end;

//function TCatalogWordModel.QueryWordCatalog:TCustomADODataSet;
//const
//  sql:string =
//'SELECT' + #13#10 +
//'	ROW_NUMBER() OVER(ORDER BY WordCatalog.CatalogID ASC) AS RowId,' + #13#10 +
//'	WordCatalog.CatalogID,' + #13#10 +
//'	WordCatalog.CatalogName,' + #13#10 +
//'	WordCatalog.CatalogDisp,' + #13#10 +
//'	WordCatalog.CreateTime,' + #13#10 +
//'	WordCatalog.UpdateTime' + #13#10 +
//'FROM' + #13#10 +
//'	WordCatalog' + #13#10 +
//'ORDER BY WordCatalog.CatalogID ASC';
//begin
//  Result := Select(sql);
//end;
//
//function TCatalogWordModel.QueryWordCatalogTree:TCustomADODataSet;
//const
//  sql:string ='GetCatalogRelationTree';
//begin
//  Result := ExeProc(sql);
//end;

function TCatalogWordModel.QueryCatalogWord(const value:TWordCatalog):TCustomADODataSet;
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
'    WordCatalogRelation' + #13#10 +
'INNER JOIN Word ON' + #13#10 +
'    WordCatalogRelation.Word = Word.Word' + #13#10 +
'INNER JOIN' + #13#10 +
'    Importance on Importance.ID = Word.ImportanceLevel' + #13#10 +
'INNER JOIN' + #13#10 +
'    Difficulty on Difficulty.ID = Word.DifficultyLevel' + #13#10 +
'WHERE' + #13#10 +
'    WordCatalogRelation.CatalogID = :CatalogID' + #13#10 +
'ORDER BY' + #13#10 +
'    Word.Word ASC';
begin
  SetSelectSql(sql);

  Query.Parameters.ParamByName('CatalogID').Value := value.CatalogID;

  Result := DoSelect;
end;

function TCatalogWordModel.InsertCatalogWord(const catalog:TWordCatalog;const word:TWord):_Recordset;
const
  sql:string =
'INSERT INTO' + #13#10 +
'	WordCatalogRelation(CatalogID, Word, CreateTime, UpdateTime)' + #13#10 +
'VALUES' + #13#10 +
'	(:CatalogID, :Word, GetDate(), NULL)';
begin
  SetExecuteSql(sql);

  Command.Parameters.ParamByName('CatalogID').Value := catalog.CatalogID;
  Command.Parameters.ParamByName('Word').Value := word.Word;

  Result := DoExecute;
end;

function TCatalogWordModel.DeleteCatalogWord(const catalog:TWordCatalog;const word:TWord):_Recordset;
const
  sql:string = 'DELETE FROM WordCatalogRelation WHERE CatalogID = :CatalogID AND Word = :Word';
begin
  SetExecuteSql(sql);

  Command.Parameters.ParamByName('CatalogID').Value := catalog.CatalogID;
  Command.Parameters.ParamByName('Word').Value := word.Word;

  Result := DoExecute;
end;

//function TCatalogWordModel.UpdateWordCatalog(const value:TWordCatalog):_Recordset;
//const
//  sql:string =
//'UPDATE' + #13#10 +
//'	WordCatalog' + #13#10 +
//'SET' + #13#10 +
//'	CatalogName = :CatalogName,' + #13#10 +
//'	CatalogDisp = :CatalogDisp,' + #13#10 +
//'	UpdateTime = GetDate()' + #13#10 +
//'WHERE' + #13#10 +
//'	CatalogID = :CatalogID';
//begin
//  SetExecuteSql(sql);
//
//  Command.Parameters.ParamByName('CatalogName').Value := value.CatalogName;
//  Command.Parameters.ParamByName('CatalogDisp').Value := value.CatalogDisp;
//  Command.Parameters.ParamByName('CatalogID').Value := value.CatalogID;
//
//  Result := DoExecute;
//end;

//function TCatalogWordModel.DeleteWordCatalog(const value:TWordCatalog):_Recordset;
//const
//  sql:string = 'DELETE FROM WordCatalog WHERE CatalogID = :CatalogID';
//begin
//  SetExecuteSql(sql);
//
//  Command.Parameters.ParamByName('CatalogID').Value := value.CatalogID;
//
//  Result := DoExecute;
//end;

end.
