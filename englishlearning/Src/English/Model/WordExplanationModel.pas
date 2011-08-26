unit WordExplanationModel;

interface

uses
  DB, ADODB, MVC;

type
  IWordExplanationModel = interface(IModel)
    function QueryWordExplanation(const word:string;const wordtype:integer):TCustomADODataSet;
//    function QueryWordCatalogTree:TCustomADODataSet;
//    function QueryCatalogWord(const value:TWordCatalog):TCustomADODataSet;
//    function InsertWordCatalog(const value:TWordCatalog):_Recordset;
//    function UpdateWordCatalog(const value:TWordCatalog):_Recordset;
//    function DeleteWordCatalog(const value:TWordCatalog):_Recordset;
  end;

  TWordExplanationModel = class(TModel, IWordExplanationModel)
  private

  public
    function QueryWordExplanation(const word:string;const wordtype:integer):TCustomADODataSet;
//    function QueryWordCatalogTree:TCustomADODataSet;
//    function QueryCatalogWord(const value:TWordCatalog):TCustomADODataSet;
//    function InsertWordCatalog(const value:TWordCatalog):_Recordset;
//    function UpdateWordCatalog(const value:TWordCatalog):_Recordset;
//    function DeleteWordCatalog(const value:TWordCatalog):_Recordset;

    constructor Create({Controller: IController});
  end;

implementation

constructor TWordExplanationModel.Create;
begin
  inherited Create;
end;

function TWordExplanationModel.QueryWordExplanation(const word:string;const wordtype:integer):TCustomADODataSet;
const
  sql:string =
'SELECT' + #13#10 +
'	ROW_NUMBER() OVER(ORDER BY WordExplanation.Word ASC, WordExplanation.WordType ASC) AS RowId,' + #13#10 +
'	WordExplanation.Word,' + #13#10 +
'	WordExplanation.WordType,' + #13#10 +
'	WordExplanation.ExplanationID,' + #13#10 +
'	WordExplanation.Explanation,' + #13#10 +
'	WordExplanation.DifficultyLevel,' + #13#10 +
'	WordExplanation.ImportanceLevel,' + #13#10 +
'	WordExplanation.CreateTime,' + #13#10 +
'	WordExplanation.UpdateTime' + #13#10 +
'FROM' + #13#10 +
'	WordExplanation' + #13#10 +
'WHERE' + #13#10 +
'    WordExplanation.Word = :Word AND' + #13#10 +
'    WordExplanation.WordType = :WordType' + #13#10 +
'ORDER BY WordExplanation.Word ASC, WordExplanation.WordType ASC';
begin
  SetSelectSql(sql);

  Query.Parameters.ParamByName('Word').Value := word;
  Query.Parameters.ParamByName('WordType').Value := wordtype;

  Result := DoSelect;
end;

//function TWordExplanationModel.QueryWordCatalogTree:TCustomADODataSet;
//const
//  sql:string ='GetCatalogRelationTree';
//begin
//  Result := ExeProc(sql);
//end;
//
//function TWordExplanationModel.QueryCatalogWord(const value:TWordCatalog):TCustomADODataSet;
//const
//  sql:string =
//'SELECT' + #13#10 +
//'    ROW_NUMBER() OVER(ORDER BY Word.Word ASC) AS RowId,' + #13#10 +
//'    Word.Word,' + #13#10 +
//'    Importance.ID as  ImportanceID,' + #13#10 +
//'    Importance.Disp as ImportanceLevel,' + #13#10 +
//'    Difficulty.ID as DifficultyID,' + #13#10 +
//'    Difficulty.Disp as DifficultyLevel,' + #13#10 +
//'    CASE WHEN (SELECT COUNT(*) FROM WordExplanation WHERE WordExplanation.Word = Word.Word) > 0 THEN ''¡ð'' ELSE ''¡Á'' END AS IsExplained,' + #13#10 +
//'    CASE WHEN (SELECT COUNT(*) FROM Picture WHERE Picture.Word = Word.Word) > 0 THEN ''¡ð'' ELSE ''¡Á'' END AS IsPictured,' + #13#10 +
//'    (SELECT COUNT(*) FROM (SELECT Distinct WordType FROM WordExplanation WHERE WordExplanation.Word = Word.Word) wt) AS WordTypeCount,' + #13#10 +
//'    (SELECT COUNT(*) FROM WordExplanation WHERE WordExplanation.Word = Word.Word) AS ExplanationCount,' + #13#10 +
//'    (SELECT COUNT(*) FROM Picture WHERE Picture.Word = Word.Word) AS PictureCount,' + #13#10 +
//'    (SELECT COUNT(*) FROM Picture WHERE Picture.Word = Word.Word AND Picture.MainPicture = 1) AS MainPictureCount,' + #13#10 +
//'    Word.CreateTime,' + #13#10 +
//'    Word.UpdateTime' + #13#10 +
//'FROM' + #13#10 +
//'    WordCatalogRelation' + #13#10 +
//'INNER JOIN Word ON' + #13#10 +
//'    WordCatalogRelation.Word = Word.Word' + #13#10 +
//'INNER JOIN' + #13#10 +
//'    Importance on Importance.ID = Word.ImportanceLevel' + #13#10 +
//'INNER JOIN' + #13#10 +
//'    Difficulty on Difficulty.ID = Word.DifficultyLevel' + #13#10 +
//'WHERE' + #13#10 +
//'    WordCatalogRelation.CatalogID = :CatalogID' + #13#10 +
//'ORDER BY' + #13#10 +
//'    Word.Word ASC';
//begin
//  SetSelectSql(sql);
//
//  Query.Parameters.ParamByName('CatalogID').Value := value.CatalogID;
//
//  Result := DoSelect;
//end;
//
//function TWordExplanationModel.InsertWordCatalog(const value:TWordCatalog):_Recordset;
//const
//  sql:string =
//'INSERT INTO' + #13#10 +
//'	WordCatalog(CatalogID, CatalogName, CatalogDisp, CreateTime, UpdateTime)' + #13#10 +
//'VALUES' + #13#10 +
//'	((SELECT ''WC'' + RIGHT(''100000'' + (SELECT CASE WHEN MAX(CatalogID) IS NULL THEN 1 ELSE MAX(SUBSTRING(CatalogID,3,5)) + 1 END FROM WordCatalog), 5)), :CatalogName, :CatalogDisp, GetDate(), NULL)';
////'	((SELECT CASE WHEN MAX(CatalogID) IS NULL THEN 1 ELSE MAX(CatalogID) + 1 END FROM WordCatalog), :CatalogName, :CatalogDisp, GetDate(), NULL)';
//begin
//  SetExecuteSql(sql);
//
//  //Command.Parameters.ParamByName('CatalogID').Value := value.CatalogID;
//  Command.Parameters.ParamByName('CatalogName').Value := value.CatalogName;
//  Command.Parameters.ParamByName('CatalogDisp').Value := value.CatalogDisp;
//
//  Result := DoExecute;
//end;
//
//function TWordExplanationModel.UpdateWordCatalog(const value:TWordCatalog):_Recordset;
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
//
//function TWordExplanationModel.DeleteWordCatalog(const value:TWordCatalog):_Recordset;
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
