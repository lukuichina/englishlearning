unit SynonymModel;

interface

uses
  DB, ADODB, MVC, ViewData, SysUtils, Dialogs;

type
  ISynonymModel = interface(IModel)
    function QueryWord:TCustomADODataSet;
    function QuerySynonymExtention(const value:TWord):TCustomADODataSet;
    function InsertSynonymExtention(const value:TSynonymExtention):_Recordset;
    function UpdateSynonymExtention(const value, oldValue:TSynonymExtention):_Recordset;
    function DeleteSynonymExtention(const value:TSynonymExtention):_Recordset;
  end;

  TSynonymModel = class(TModel, ISynonymModel)
  private

  public
    function QueryWord:TCustomADODataSet;
    function QuerySynonymExtention(const value:TWord):TCustomADODataSet;
    function InsertSynonymExtention(const value:TSynonymExtention):_Recordset;
    function UpdateSynonymExtention(const value, oldValue:TSynonymExtention):_Recordset;
    function DeleteSynonymExtention(const value:TSynonymExtention):_Recordset;

    constructor Create({Controller: IController});
  end;

implementation

uses Variants;

constructor TSynonymModel.Create;
begin
  inherited Create;
end;

function TSynonymModel.QueryWord:TCustomADODataSet;
const
  sql:string =
'SELECT' + #13#10 +
'    ROW_NUMBER() OVER(ORDER BY Word.Word ASC) AS RowId,' + #13#10 +
'    Word.Word,' + #13#10 +
'    Importance.ID as  ImportanceID,' + #13#10 +
'    Importance.Disp as ImportanceLevel,' + #13#10 +
'    Difficulty.ID as DifficultyID,' + #13#10 +
'    Difficulty.Disp as DifficultyLevel,' + #13#10 +
'    CASE WHEN (SELECT COUNT(*) FROM WordExplanation WHERE WordExplanation.Word = Word.Word) > 0 THEN ''��'' ELSE ''��'' END AS IsExplained,' + #13#10 +
'    CASE WHEN (SELECT COUNT(*) FROM Picture WHERE Picture.Word = Word.Word) > 0 THEN ''��'' ELSE ''��'' END AS IsPictured,' + #13#10 +
'    CASE WHEN (SELECT COUNT(*) FROM WordCatalogRelation WHERE WordCatalogRelation.Word = Word.Word AND WordCatalogRelation.CatalogID BETWEEN ''WC00001'' AND ''WC00010'') > 0 THEN ''��'' ELSE ''��'' END AS IsCataloged,' + #13#10 +
'    (SELECT COUNT(*) FROM (SELECT Distinct WordType FROM WordExplanation WHERE WordExplanation.Word = Word.Word) wt) AS WordTypeCount,' + #13#10 +
'    (SELECT COUNT(*) FROM WordExplanation WHERE WordExplanation.Word = Word.Word) AS ExplanationCount,' + #13#10 +
'    (SELECT COUNT(*) FROM Picture WHERE Picture.Word = Word.Word) AS PictureCount,' + #13#10 +
'    (SELECT COUNT(*) FROM Picture WHERE Picture.Word = Word.Word AND Picture.MainPicture = 1) AS MainPictureCount,' + #13#10 +
'    Word.CreateTime,' + #13#10 +
'    Word.UpdateTime' + #13#10 +
'FROM' + #13#10 +
'  Word' + #13#10 +
'INNER JOIN' + #13#10 +
'  Importance on Importance.ID = Word.ImportanceLevel' + #13#10 +
'INNER JOIN' + #13#10 +
'  Difficulty on Difficulty.ID = Word.DifficultyLevel' + #13#10 +
//'WHERE' + #13#10 +
//'  Word.Word like :Word' + #13#10 +
'ORDER BY' + #13#10 +
'  Word.Word ASC';
begin
  Result := Select(sql);
end;

//function TSynonymModel.QueryWordCatalogTree:TCustomADODataSet;
//const
//  sql:string ='GetCatalogRelationTree';
//begin
//  Result := ExeProc(sql);
//end;

function TSynonymModel.QuerySynonymExtention(const value:TWord):TCustomADODataSet;
const
  sql:string =
'SELECT' + #13#10 +
'    ROW_NUMBER() OVER(ORDER BY WordSynonym.Word ASC,WordSynonym.SynonymWord ASC,WordSynonym.SynonymWordType ASC) AS RowId,' + #13#10 +
'    WordSynonym.Word as BaseWord,' + #13#10 +
'    WordType.ID as BaseWordTypeID,' + #13#10 +
'    WordType.Disp as BaseWordType,' + #13#10 +
'    WordSynonym.ExplanationID as BaseExplanationID,' + #13#10 +
'    WordExplanation.Explanation as BaseExplanation,' + #13#10 +
'    WordSynonym.SynonymWord as Word,' + #13#10 +
'    SynonymWordType.ID as WordTypeID,' + #13#10 +
'    SynonymWordType.Disp as WordType,' + #13#10 +
'    SynonymExplanation.ExplanationID,' + #13#10 +
'    SynonymExplanation.Explanation,' + #13#10 +
'    Importance.ID as  ImportanceID,' + #13#10 +
'    Importance.Disp as ImportanceLevel,' + #13#10 +
'    Difficulty.ID as DifficultyID,' + #13#10 +
'    Difficulty.Disp as DifficultyLevel,' + #13#10 +
//'    CASE WHEN (SELECT COUNT(*) FROM Picture WHERE Picture.Word = WordExplanation.Word AND Picture.WordType = WordExplanation.WordType AND Picture.ExplanationID = WordExplanation.ExplanationID) > 0 THEN ''��'' ELSE ''��'' END AS IsPictured,' + #13#10 +
//'    (SELECT COUNT(*) FROM Picture WHERE Picture.Word = WordExplanation.Word AND Picture.WordType = WordExplanation.WordType AND Picture.ExplanationID = WordExplanation.ExplanationID) AS PictureCount,' + #13#10 +
//'    (SELECT COUNT(*) FROM Picture WHERE Picture.Word = WordExplanation.Word AND Picture.WordType = WordExplanation.WordType AND Picture.ExplanationID = WordExplanation.ExplanationID AND Picture.MainPicture = 1) AS MainPictureCount,' + #13#10 +
'    CASE WHEN (SELECT COUNT(*) FROM WordExplanation WHERE WordExplanation.Word = Word.Word) > 0 THEN ''��'' ELSE ''��'' END AS IsExplained,' + #13#10 +
'    CASE WHEN (SELECT COUNT(*) FROM Picture WHERE Picture.Word = Word.Word) > 0 THEN ''��'' ELSE ''��'' END AS IsPictured,' + #13#10 +
'    CASE WHEN (SELECT COUNT(*) FROM WordCatalogRelation WHERE WordCatalogRelation.Word = Word.Word AND WordCatalogRelation.CatalogID BETWEEN ''WC00001'' AND ''WC00010'') > 0 THEN ''��'' ELSE ''��'' END AS IsCataloged,' + #13#10 +
'    (SELECT COUNT(*) FROM (SELECT Distinct WordType FROM WordExplanation WHERE WordExplanation.Word = Word.Word) wt) AS WordTypeCount,' + #13#10 +
'    (SELECT COUNT(*) FROM WordExplanation WHERE WordExplanation.Word = Word.Word) AS ExplanationCount,' + #13#10 +
'    (SELECT COUNT(*) FROM Picture WHERE Picture.Word = Word.Word) AS PictureCount,' + #13#10 +
'    (SELECT COUNT(*) FROM Picture WHERE Picture.Word = Word.Word AND Picture.MainPicture = 1) AS MainPictureCount,' + #13#10 +
'    WordSynonym.CreateTime,' + #13#10 +
'    WordSynonym.UpdateTime' + #13#10 +
'FROM' + #13#10 +
'    WordSynonym' + #13#10 +
'LEFT JOIN' + #13#10 +
'    Word ON Word.Word = WordSynonym.SynonymWord' + #13#10 +
'LEFT JOIN' + #13#10 +
'    WordExplanation ON WordSynonym.Word = WordExplanation.Word AND' + #13#10 +
'    WordSynonym.WordType = WordExplanation.WordType AND' + #13#10 +
'    WordSynonym.ExplanationID = WordExplanation.ExplanationID' + #13#10 +
'LEFT JOIN' + #13#10 +
'    WordExplanation SynonymExplanation ON WordSynonym.SynonymWord = SynonymExplanation.Word AND' + #13#10 +
'    WordSynonym.SynonymWordType = SynonymExplanation.WordType AND' + #13#10 +
'    WordSynonym.SynonymExplanationID = SynonymExplanation.ExplanationID' + #13#10 +
'LEFT JOIN' + #13#10 +
'    WordType ON WordType.ID =  WordSynonym.WordType' + #13#10 +
'LEFT JOIN' + #13#10 +
'    WordType SynonymWordType ON SynonymWordType.ID =  WordSynonym.SynonymWordType' + #13#10 +
'LEFT JOIN' + #13#10 +
'    Importance ON Importance.ID = Word.ImportanceLevel' + #13#10 +
'LEFT JOIN' + #13#10 +
'    Difficulty ON Difficulty.ID =Word.DifficultyLevel' + #13#10 +
'WHERE' + #13#10 +
'    WordSynonym.Word = ''%s''' + #13#10 +
'ORDER BY' + #13#10 +
'    WordSynonym.Word ASC,' + #13#10 +
'    WordSynonym.SynonymWord ASC,' + #13#10 +
'    WordSynonym.SynonymWordType ASC';
begin
  SetSelectSql(Format(sql, [value.Word]));
  //SetSelectSql(sql);
  //showmessage(sql);
  //Query.Parameters.ParamByName('BaseWord').Value := value.Word;

  Result := DoSelect;
end;

function TSynonymModel.InsertSynonymExtention(const value:TSynonymExtention):_Recordset;
const
  sql:string =
'INSERT INTO' + #13#10 +
'	WordSynonym(Word, WordType, ExplanationID, SynonymWord, SynonymWordType, SynonymExplanationID, CreateTime, UpdateTime)' + #13#10 +
'VALUES' + #13#10 +
'	(:Word, :WordType, :ExplanationID, :SynonymWord, :SynonymWordType, :SynonymExplanationID, GetDate(), NULL)';
begin
  SetExecuteSql(sql);

  Command.Parameters.ParamByName('Word').Value := value.Word;

  if value.WordType = 0 then
    Command.Parameters.ParamByName('WordType').Value := Null
  else
    Command.Parameters.ParamByName('WordType').Value := value.WordType;

  if value.ExplanationID = 0 then
    Command.Parameters.ParamByName('ExplanationID').Value := Null
  else
    Command.Parameters.ParamByName('ExplanationID').Value := value.ExplanationID;

  Command.Parameters.ParamByName('SynonymWord').Value := value.SynonymWord;

  if value.SynonymWordType = 0-1 then
    Command.Parameters.ParamByName('SynonymWordType').Value := Null
  else
    Command.Parameters.ParamByName('SynonymWordType').Value := value.SynonymWordType;

  if value.SynonymExplanationID = 0 then
    Command.Parameters.ParamByName('SynonymExplanationID').Value := Null
  else
    Command.Parameters.ParamByName('SynonymExplanationID').Value := value.SynonymExplanationID;

  Result := DoExecute;
end;

function TSynonymModel.UpdateSynonymExtention(const value, oldValue:TSynonymExtention):_Recordset;
const
  sql:string =
'UPDATE' + #13#10 +
'	WordSynonym' + #13#10 +
'SET' + #13#10 +
'	Word = :Word,' + #13#10 +
'	WordType = :WordType,' + #13#10 +
'	ExplanationID = :ExplanationID,' + #13#10 +
'	SynonymWord = :SynonymWord,' + #13#10 +
'	SynonymWordType = :SynonymWordType,' + #13#10 +
'	SynonymExplanationID = :SynonymExplanationID,' + #13#10 +
'	UpdateTime = GetDate()' + #13#10 +
'WHERE' + #13#10 +
'	Word = :OldWord AND' + #13#10 +
//'	WordType = :OldWordType AND' + #13#10 +
//'	SynonymWord = :OldSynonymWord AND' + #13#10 +
//'	SynonymWordType = :OldSynonymWordType';
'	SynonymWord = :OldSynonymWord';
begin
  SetExecuteSql(sql);

//  Command.Parameters.ParamByName('Word').Value := value.Word;
//  Command.Parameters.ParamByName('WordType').Value := value.WordType;
//  Command.Parameters.ParamByName('ExplanationID').Value := value.ExplanationID;
//  Command.Parameters.ParamByName('SynonymWord').Value := value.SynonymWord;
//  Command.Parameters.ParamByName('SynonymWordType').Value := value.SynonymWordType;
//  Command.Parameters.ParamByName('SynonymExplanationID').Value := value.SynonymExplanationID;

  Command.Parameters.ParamByName('Word').Value := value.Word;

  if value.WordType = 0 then
    Command.Parameters.ParamByName('WordType').Value := Null
  else
    Command.Parameters.ParamByName('WordType').Value := value.WordType;

  if value.ExplanationID = 0 then
    Command.Parameters.ParamByName('ExplanationID').Value := Null
  else
    Command.Parameters.ParamByName('ExplanationID').Value := value.ExplanationID;

  Command.Parameters.ParamByName('SynonymWord').Value := value.SynonymWord;

  if value.SynonymWordType = 0 then
    Command.Parameters.ParamByName('SynonymWordType').Value := Null
  else
    Command.Parameters.ParamByName('SynonymWordType').Value := value.SynonymWordType;

  if value.SynonymExplanationID = 0 then
    Command.Parameters.ParamByName('SynonymExplanationID').Value := Null
  else
    Command.Parameters.ParamByName('SynonymExplanationID').Value := value.SynonymExplanationID;

  Command.Parameters.ParamByName('OldWord').Value := oldValue.Word;
  //Command.Parameters.ParamByName('OldBaseType').Value := oldValue.WordType;
  Command.Parameters.ParamByName('OldSynonymWord').Value := oldValue.SynonymWord;
  //Command.Parameters.ParamByName('OldExtendType').Value := oldValue.SynonymWordType;

  Result := DoExecute;
end;

//function TSynonymModel.InsertCatalogRelation(const value:TCatalogRelation):_Recordset;
//const
//  sql:string =
//'INSERT INTO' + #13#10 +
//'	CatalogRelation(CatalogID, ChildCatalogID, CreateTime, UpdateTime)' + #13#10 +
//'VALUES' + #13#10 +
//'	(:CatalogID, :ChildCatalogID, GetDate(), NULL)';
//begin
//  SetExecuteSql(sql);
//
//  Command.Parameters.ParamByName('CatalogID').Value := value.CatalogID;
//  Command.Parameters.ParamByName('ChildCatalogID').Value := value.ChildCatalogID;
//
//  Result := DoExecute;
//end;


function TSynonymModel.DeleteSynonymExtention(const value:TSynonymExtention):_Recordset;
const
  sql:string = 'DELETE FROM WordSynonym WHERE Word = :Word AND SynonymWord = :SynonymWord';
begin
  SetExecuteSql(sql);

  Command.Parameters.ParamByName('Word').Value := value.Word;
  //Command.Parameters.ParamByName('WordType').Value := value.WordType;
  Command.Parameters.ParamByName('SynonymWord').Value := value.SynonymWord;
  //Command.Parameters.ParamByName('SynonymWordType').Value := value.SynonymWordType;

  Result := DoExecute;
end;

end.
