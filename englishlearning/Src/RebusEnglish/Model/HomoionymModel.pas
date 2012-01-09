unit HomoionymModel;

interface

uses
  DB, ADODB, MVC, ViewData, SysUtils, Dialogs;

type
  IHomoionymModel = interface(IModel)
    function QueryWord:TCustomADODataSet;
    function QueryHomoionymExtention(const value:TWord):TCustomADODataSet;
    function InsertHomoionymExtention(const value:THomoionymExtention):_Recordset;
    function UpdateHomoionymExtention(const value, oldValue:THomoionymExtention):_Recordset;
    function DeleteHomoionymExtention(const value:THomoionymExtention):_Recordset;
  end;

  THomoionymModel = class(TModel, IHomoionymModel)
  private

  public
    function QueryWord:TCustomADODataSet;
    function QueryHomoionymExtention(const value:TWord):TCustomADODataSet;
    function InsertHomoionymExtention(const value:THomoionymExtention):_Recordset;
    function UpdateHomoionymExtention(const value, oldValue:THomoionymExtention):_Recordset;
    function DeleteHomoionymExtention(const value:THomoionymExtention):_Recordset;

    constructor Create({Controller: IController});
  end;

implementation

uses Variants;

constructor THomoionymModel.Create;
begin
  inherited Create;
end;

function THomoionymModel.QueryWord:TCustomADODataSet;
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

//function THomoionymModel.QueryWordCatalogTree:TCustomADODataSet;
//const
//  sql:string ='GetCatalogRelationTree';
//begin
//  Result := ExeProc(sql);
//end;

function THomoionymModel.QueryHomoionymExtention(const value:TWord):TCustomADODataSet;
const
  sql:string =
'SELECT' + #13#10 +
'    ROW_NUMBER() OVER(ORDER BY WordHomoionym.Word ASC,WordHomoionym.HomoionymWord ASC,WordHomoionym.HomoionymWordType ASC) AS RowId,' + #13#10 +
'    WordHomoionym.Word as BaseWord,' + #13#10 +
'    WordType.ID as BaseWordTypeID,' + #13#10 +
'    WordType.Disp as BaseWordType,' + #13#10 +
'    WordHomoionym.ExplanationID as BaseExplanationID,' + #13#10 +
'    WordExplanation.Explanation as BaseExplanation,' + #13#10 +
'    WordHomoionym.HomoionymWord as Word,' + #13#10 +
'    HomoionymWordType.ID as WordTypeID,' + #13#10 +
'    HomoionymWordType.Disp as WordType,' + #13#10 +
'    HomoionymExplanation.ExplanationID,' + #13#10 +
'    HomoionymExplanation.Explanation,' + #13#10 +
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
'    WordHomoionym.CreateTime,' + #13#10 +
'    WordHomoionym.UpdateTime' + #13#10 +
'FROM' + #13#10 +
'    WordHomoionym' + #13#10 +
'LEFT JOIN' + #13#10 +
'    Word ON Word.Word = WordHomoionym.HomoionymWord' + #13#10 +
'LEFT JOIN' + #13#10 +
'    WordExplanation ON WordHomoionym.Word = WordExplanation.Word AND' + #13#10 +
'    WordHomoionym.WordType = WordExplanation.WordType AND' + #13#10 +
'    WordHomoionym.ExplanationID = WordExplanation.ExplanationID' + #13#10 +
'LEFT JOIN' + #13#10 +
'    WordExplanation HomoionymExplanation ON WordHomoionym.HomoionymWord = HomoionymExplanation.Word AND' + #13#10 +
'    WordHomoionym.HomoionymWordType = HomoionymExplanation.WordType AND' + #13#10 +
'    WordHomoionym.HomoionymExplanationID = HomoionymExplanation.ExplanationID' + #13#10 +
'LEFT JOIN' + #13#10 +
'    WordType ON WordType.ID =  WordHomoionym.WordType' + #13#10 +
'LEFT JOIN' + #13#10 +
'    WordType HomoionymWordType ON HomoionymWordType.ID =  WordHomoionym.HomoionymWordType' + #13#10 +
'LEFT JOIN' + #13#10 +
'    Importance ON Importance.ID = Word.ImportanceLevel' + #13#10 +
'LEFT JOIN' + #13#10 +
'    Difficulty ON Difficulty.ID =Word.DifficultyLevel' + #13#10 +
'WHERE' + #13#10 +
'    WordHomoionym.Word = ''%s''' + #13#10 +
'ORDER BY' + #13#10 +
'    WordHomoionym.Word ASC,' + #13#10 +
'    WordHomoionym.HomoionymWord ASC,' + #13#10 +
'    WordHomoionym.HomoionymWordType ASC';
begin
  SetSelectSql(Format(sql, [value.Word]));
  //SetSelectSql(sql);
  //showmessage(sql);
  //Query.Parameters.ParamByName('BaseWord').Value := value.Word;

  Result := DoSelect;
end;

function THomoionymModel.InsertHomoionymExtention(const value:THomoionymExtention):_Recordset;
const
  sql:string =
'INSERT INTO' + #13#10 +
'	WordHomoionym(Word, WordType, ExplanationID, HomoionymWord, HomoionymWordType, HomoionymExplanationID, CreateTime, UpdateTime)' + #13#10 +
'VALUES' + #13#10 +
'	(:Word, :WordType, :ExplanationID, :HomoionymWord, :HomoionymWordType, :HomoionymExplanationID, GetDate(), NULL)';
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

  Command.Parameters.ParamByName('HomoionymWord').Value := value.HomoionymWord;

  if value.HomoionymWordType = 0-1 then
    Command.Parameters.ParamByName('HomoionymWordType').Value := Null
  else
    Command.Parameters.ParamByName('HomoionymWordType').Value := value.HomoionymWordType;

  if value.HomoionymExplanationID = 0 then
    Command.Parameters.ParamByName('HomoionymExplanationID').Value := Null
  else
    Command.Parameters.ParamByName('HomoionymExplanationID').Value := value.HomoionymExplanationID;

  Result := DoExecute;
end;

function THomoionymModel.UpdateHomoionymExtention(const value, oldValue:THomoionymExtention):_Recordset;
const
  sql:string =
'UPDATE' + #13#10 +
'	WordHomoionym' + #13#10 +
'SET' + #13#10 +
'	Word = :Word,' + #13#10 +
'	WordType = :WordType,' + #13#10 +
'	ExplanationID = :ExplanationID,' + #13#10 +
'	HomoionymWord = :HomoionymWord,' + #13#10 +
'	HomoionymWordType = :HomoionymWordType,' + #13#10 +
'	HomoionymExplanationID = :HomoionymExplanationID,' + #13#10 +
'	UpdateTime = GetDate()' + #13#10 +
'WHERE' + #13#10 +
'	Word = :OldWord AND' + #13#10 +
//'	WordType = :OldWordType AND' + #13#10 +
//'	HomoionymWord = :OldHomoionymWord AND' + #13#10 +
//'	HomoionymWordType = :OldHomoionymWordType';
'	HomoionymWord = :OldHomoionymWord';
begin
  SetExecuteSql(sql);

//  Command.Parameters.ParamByName('Word').Value := value.Word;
//  Command.Parameters.ParamByName('WordType').Value := value.WordType;
//  Command.Parameters.ParamByName('ExplanationID').Value := value.ExplanationID;
//  Command.Parameters.ParamByName('HomoionymWord').Value := value.HomoionymWord;
//  Command.Parameters.ParamByName('HomoionymWordType').Value := value.HomoionymWordType;
//  Command.Parameters.ParamByName('HomoionymExplanationID').Value := value.HomoionymExplanationID;

  Command.Parameters.ParamByName('Word').Value := value.Word;

  if value.WordType = 0 then
    Command.Parameters.ParamByName('WordType').Value := Null
  else
    Command.Parameters.ParamByName('WordType').Value := value.WordType;

  if value.ExplanationID = 0 then
    Command.Parameters.ParamByName('ExplanationID').Value := Null
  else
    Command.Parameters.ParamByName('ExplanationID').Value := value.ExplanationID;

  Command.Parameters.ParamByName('HomoionymWord').Value := value.HomoionymWord;

  if value.HomoionymWordType = 0 then
    Command.Parameters.ParamByName('HomoionymWordType').Value := Null
  else
    Command.Parameters.ParamByName('HomoionymWordType').Value := value.HomoionymWordType;

  if value.HomoionymExplanationID = 0 then
    Command.Parameters.ParamByName('HomoionymExplanationID').Value := Null
  else
    Command.Parameters.ParamByName('HomoionymExplanationID').Value := value.HomoionymExplanationID;

  Command.Parameters.ParamByName('OldWord').Value := oldValue.Word;
  //Command.Parameters.ParamByName('OldBaseType').Value := oldValue.WordType;
  Command.Parameters.ParamByName('OldHomoionymWord').Value := oldValue.HomoionymWord;
  //Command.Parameters.ParamByName('OldExtendType').Value := oldValue.HomoionymWordType;

  Result := DoExecute;
end;

//function THomoionymModel.InsertCatalogRelation(const value:TCatalogRelation):_Recordset;
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


function THomoionymModel.DeleteHomoionymExtention(const value:THomoionymExtention):_Recordset;
const
  sql:string = 'DELETE FROM WordHomoionym WHERE Word = :Word AND HomoionymWord = :HomoionymWord';
begin
  SetExecuteSql(sql);

  Command.Parameters.ParamByName('Word').Value := value.Word;
  //Command.Parameters.ParamByName('WordType').Value := value.WordType;
  Command.Parameters.ParamByName('HomoionymWord').Value := value.HomoionymWord;
  //Command.Parameters.ParamByName('HomoionymWordType').Value := value.HomoionymWordType;

  Result := DoExecute;
end;

end.
