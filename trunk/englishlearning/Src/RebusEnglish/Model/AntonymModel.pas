unit AntonymModel;

interface

uses
  DB, ADODB, MVC, ViewData, SysUtils, Dialogs;

type
  IAntonymModel = interface(IModel)
    function QueryWord:TCustomADODataSet;
    function QueryAntonymExtention(const value:TWord):TCustomADODataSet;
    function InsertAntonymExtention(const value:TAntonymExtention):_Recordset;
    function UpdateAntonymExtention(const value, oldValue:TAntonymExtention):_Recordset;
    function DeleteAntonymExtention(const value:TAntonymExtention):_Recordset;
  end;

  TAntonymModel = class(TModel, IAntonymModel)
  private

  public
    function QueryWord:TCustomADODataSet;
    function QueryAntonymExtention(const value:TWord):TCustomADODataSet;
    function InsertAntonymExtention(const value:TAntonymExtention):_Recordset;
    function UpdateAntonymExtention(const value, oldValue:TAntonymExtention):_Recordset;
    function DeleteAntonymExtention(const value:TAntonymExtention):_Recordset;

    constructor Create({Controller: IController});
  end;

implementation

uses Variants;

constructor TAntonymModel.Create;
begin
  inherited Create;
end;

function TAntonymModel.QueryWord:TCustomADODataSet;
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
'    CASE WHEN (SELECT COUNT(*) FROM WordCatalogRelation WHERE WordCatalogRelation.Word = Word.Word AND WordCatalogRelation.CatalogID BETWEEN ''WC00001'' AND ''WC00010'') > 0 THEN ''¡ð'' ELSE ''¡Á'' END AS IsCataloged,' + #13#10 +
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

//function TAntonymModel.QueryWordCatalogTree:TCustomADODataSet;
//const
//  sql:string ='GetCatalogRelationTree';
//begin
//  Result := ExeProc(sql);
//end;

function TAntonymModel.QueryAntonymExtention(const value:TWord):TCustomADODataSet;
const
  sql:string =
'SELECT' + #13#10 +
'    ROW_NUMBER() OVER(ORDER BY WordAntonym.Word ASC,WordAntonym.AntonymWord ASC,WordAntonym.AntonymWordType ASC) AS RowId,' + #13#10 +
'    WordAntonym.Word as BaseWord,' + #13#10 +
'    WordType.ID as BaseWordTypeID,' + #13#10 +
'    WordType.Disp as BaseWordType,' + #13#10 +
'    WordAntonym.ExplanationID as BaseExplanationID,' + #13#10 +
'    WordExplanation.Explanation as BaseExplanation,' + #13#10 +
'    WordAntonym.AntonymWord as Word,' + #13#10 +
'    AntonymWordType.ID as WordTypeID,' + #13#10 +
'    AntonymWordType.Disp as WordType,' + #13#10 +
'    AntonymExplanation.ExplanationID,' + #13#10 +
'    AntonymExplanation.Explanation,' + #13#10 +
'    Importance.ID as  ImportanceID,' + #13#10 +
'    Importance.Disp as ImportanceLevel,' + #13#10 +
'    Difficulty.ID as DifficultyID,' + #13#10 +
'    Difficulty.Disp as DifficultyLevel,' + #13#10 +
//'    CASE WHEN (SELECT COUNT(*) FROM Picture WHERE Picture.Word = WordExplanation.Word AND Picture.WordType = WordExplanation.WordType AND Picture.ExplanationID = WordExplanation.ExplanationID) > 0 THEN ''¡ð'' ELSE ''¡Á'' END AS IsPictured,' + #13#10 +
//'    (SELECT COUNT(*) FROM Picture WHERE Picture.Word = WordExplanation.Word AND Picture.WordType = WordExplanation.WordType AND Picture.ExplanationID = WordExplanation.ExplanationID) AS PictureCount,' + #13#10 +
//'    (SELECT COUNT(*) FROM Picture WHERE Picture.Word = WordExplanation.Word AND Picture.WordType = WordExplanation.WordType AND Picture.ExplanationID = WordExplanation.ExplanationID AND Picture.MainPicture = 1) AS MainPictureCount,' + #13#10 +
'    CASE WHEN (SELECT COUNT(*) FROM WordExplanation WHERE WordExplanation.Word = Word.Word) > 0 THEN ''¡ð'' ELSE ''¡Á'' END AS IsExplained,' + #13#10 +
'    CASE WHEN (SELECT COUNT(*) FROM Picture WHERE Picture.Word = Word.Word) > 0 THEN ''¡ð'' ELSE ''¡Á'' END AS IsPictured,' + #13#10 +
'    CASE WHEN (SELECT COUNT(*) FROM WordCatalogRelation WHERE WordCatalogRelation.Word = Word.Word AND WordCatalogRelation.CatalogID BETWEEN ''WC00001'' AND ''WC00010'') > 0 THEN ''¡ð'' ELSE ''¡Á'' END AS IsCataloged,' + #13#10 +
'    (SELECT COUNT(*) FROM (SELECT Distinct WordType FROM WordExplanation WHERE WordExplanation.Word = Word.Word) wt) AS WordTypeCount,' + #13#10 +
'    (SELECT COUNT(*) FROM WordExplanation WHERE WordExplanation.Word = Word.Word) AS ExplanationCount,' + #13#10 +
'    (SELECT COUNT(*) FROM Picture WHERE Picture.Word = Word.Word) AS PictureCount,' + #13#10 +
'    (SELECT COUNT(*) FROM Picture WHERE Picture.Word = Word.Word AND Picture.MainPicture = 1) AS MainPictureCount,' + #13#10 +
'    WordAntonym.CreateTime,' + #13#10 +
'    WordAntonym.UpdateTime' + #13#10 +
'FROM' + #13#10 +
'    WordAntonym' + #13#10 +
'LEFT JOIN' + #13#10 +
'    Word ON Word.Word = WordAntonym.AntonymWord' + #13#10 +
'LEFT JOIN' + #13#10 +
'    WordExplanation ON WordAntonym.Word = WordExplanation.Word AND' + #13#10 +
'    WordAntonym.WordType = WordExplanation.WordType AND' + #13#10 +
'    WordAntonym.ExplanationID = WordExplanation.ExplanationID' + #13#10 +
'LEFT JOIN' + #13#10 +
'    WordExplanation AntonymExplanation ON WordAntonym.AntonymWord = AntonymExplanation.Word AND' + #13#10 +
'    WordAntonym.AntonymWordType = AntonymExplanation.WordType AND' + #13#10 +
'    WordAntonym.AntonymExplanationID = AntonymExplanation.ExplanationID' + #13#10 +
'LEFT JOIN' + #13#10 +
'    WordType ON WordType.ID =  WordAntonym.WordType' + #13#10 +
'LEFT JOIN' + #13#10 +
'    WordType AntonymWordType ON AntonymWordType.ID =  WordAntonym.AntonymWordType' + #13#10 +
'LEFT JOIN' + #13#10 +
'    Importance ON Importance.ID = Word.ImportanceLevel' + #13#10 +
'LEFT JOIN' + #13#10 +
'    Difficulty ON Difficulty.ID =Word.DifficultyLevel' + #13#10 +
'WHERE' + #13#10 +
'    WordAntonym.Word = ''%s''' + #13#10 +
'ORDER BY' + #13#10 +
'    WordAntonym.Word ASC,' + #13#10 +
'    WordAntonym.AntonymWord ASC,' + #13#10 +
'    WordAntonym.AntonymWordType ASC';
begin
  SetSelectSql(Format(sql, [value.Word]));
  //SetSelectSql(sql);
  //showmessage(sql);
  //Query.Parameters.ParamByName('BaseWord').Value := value.Word;

  Result := DoSelect;
end;

function TAntonymModel.InsertAntonymExtention(const value:TAntonymExtention):_Recordset;
const
  sql:string =
'INSERT INTO' + #13#10 +
'	WordAntonym(Word, WordType, ExplanationID, AntonymWord, AntonymWordType, AntonymExplanationID, CreateTime, UpdateTime)' + #13#10 +
'VALUES' + #13#10 +
'	(:Word, :WordType, :ExplanationID, :AntonymWord, :AntonymWordType, :AntonymExplanationID, GetDate(), NULL)';
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

  Command.Parameters.ParamByName('AntonymWord').Value := value.AntonymWord;

  if value.AntonymWordType = 0-1 then
    Command.Parameters.ParamByName('AntonymWordType').Value := Null
  else
    Command.Parameters.ParamByName('AntonymWordType').Value := value.AntonymWordType;

  if value.AntonymExplanationID = 0 then
    Command.Parameters.ParamByName('AntonymExplanationID').Value := Null
  else
    Command.Parameters.ParamByName('AntonymExplanationID').Value := value.AntonymExplanationID;

  Result := DoExecute;
end;

function TAntonymModel.UpdateAntonymExtention(const value, oldValue:TAntonymExtention):_Recordset;
const
  sql:string =
'UPDATE' + #13#10 +
'	WordAntonym' + #13#10 +
'SET' + #13#10 +
'	Word = :Word,' + #13#10 +
'	WordType = :WordType,' + #13#10 +
'	ExplanationID = :ExplanationID,' + #13#10 +
'	AntonymWord = :AntonymWord,' + #13#10 +
'	AntonymWordType = :AntonymWordType,' + #13#10 +
'	AntonymExplanationID = :AntonymExplanationID,' + #13#10 +
'	UpdateTime = GetDate()' + #13#10 +
'WHERE' + #13#10 +
'	Word = :OldWord AND' + #13#10 +
//'	WordType = :OldWordType AND' + #13#10 +
//'	AntonymWord = :OldAntonymWord AND' + #13#10 +
//'	AntonymWordType = :OldAntonymWordType';
'	AntonymWord = :OldAntonymWord';
begin
  SetExecuteSql(sql);

//  Command.Parameters.ParamByName('Word').Value := value.Word;
//  Command.Parameters.ParamByName('WordType').Value := value.WordType;
//  Command.Parameters.ParamByName('ExplanationID').Value := value.ExplanationID;
//  Command.Parameters.ParamByName('AntonymWord').Value := value.AntonymWord;
//  Command.Parameters.ParamByName('AntonymWordType').Value := value.AntonymWordType;
//  Command.Parameters.ParamByName('AntonymExplanationID').Value := value.AntonymExplanationID;

  Command.Parameters.ParamByName('Word').Value := value.Word;

  if value.WordType = 0 then
    Command.Parameters.ParamByName('WordType').Value := Null
  else
    Command.Parameters.ParamByName('WordType').Value := value.WordType;

  if value.ExplanationID = 0 then
    Command.Parameters.ParamByName('ExplanationID').Value := Null
  else
    Command.Parameters.ParamByName('ExplanationID').Value := value.ExplanationID;

  Command.Parameters.ParamByName('AntonymWord').Value := value.AntonymWord;

  if value.AntonymWordType = 0 then
    Command.Parameters.ParamByName('AntonymWordType').Value := Null
  else
    Command.Parameters.ParamByName('AntonymWordType').Value := value.AntonymWordType;

  if value.AntonymExplanationID = 0 then
    Command.Parameters.ParamByName('AntonymExplanationID').Value := Null
  else
    Command.Parameters.ParamByName('AntonymExplanationID').Value := value.AntonymExplanationID;

  Command.Parameters.ParamByName('OldWord').Value := oldValue.Word;
  //Command.Parameters.ParamByName('OldBaseType').Value := oldValue.WordType;
  Command.Parameters.ParamByName('OldAntonymWord').Value := oldValue.AntonymWord;
  //Command.Parameters.ParamByName('OldExtendType').Value := oldValue.AntonymWordType;

  Result := DoExecute;
end;

//function TAntonymModel.InsertCatalogRelation(const value:TCatalogRelation):_Recordset;
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


function TAntonymModel.DeleteAntonymExtention(const value:TAntonymExtention):_Recordset;
const
  sql:string = 'DELETE FROM WordAntonym WHERE Word = :Word AND AntonymWord = :AntonymWord';
begin
  SetExecuteSql(sql);

  Command.Parameters.ParamByName('Word').Value := value.Word;
  //Command.Parameters.ParamByName('WordType').Value := value.WordType;
  Command.Parameters.ParamByName('AntonymWord').Value := value.AntonymWord;
  //Command.Parameters.ParamByName('AntonymWordType').Value := value.AntonymWordType;

  Result := DoExecute;
end;

end.
