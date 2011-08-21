unit CongenerModel;

interface

uses
  DB, ADODB, MVC, ViewData, SysUtils, Dialogs;

type
  ICongenerModel = interface(IModel)
    function QueryWord:TCustomADODataSet;
    function QueryCongenerExtention(const value:TWord):TCustomADODataSet;
    function InsertCongenerExtention(const value:TCongenerExtention):_Recordset;
    function UpdateCongenerExtention(const value, oldValue:TCongenerExtention):_Recordset;
    function DeleteCongenerExtention(const value:TCongenerExtention):_Recordset;
  end;

  TCongenerModel = class(TModel, ICongenerModel)
  private

  public
    function QueryWord:TCustomADODataSet;
    function QueryCongenerExtention(const value:TWord):TCustomADODataSet;
    function InsertCongenerExtention(const value:TCongenerExtention):_Recordset;
    function UpdateCongenerExtention(const value, oldValue:TCongenerExtention):_Recordset;
    function DeleteCongenerExtention(const value:TCongenerExtention):_Recordset;

    constructor Create({Controller: IController});
  end;

implementation

uses Variants;

constructor TCongenerModel.Create;
begin
  inherited Create;
end;

function TCongenerModel.QueryWord:TCustomADODataSet;
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

//function TCongenerModel.QueryWordCatalogTree:TCustomADODataSet;
//const
//  sql:string ='GetCatalogRelationTree';
//begin
//  Result := ExeProc(sql);
//end;

function TCongenerModel.QueryCongenerExtention(const value:TWord):TCustomADODataSet;
const
  sql:string =
'SELECT' + #13#10 +
'    ROW_NUMBER() OVER(ORDER BY WordCongener.Word ASC,WordCongener.CongenerWord ASC,WordCongener.CongenerWordType ASC) AS RowId,' + #13#10 +
'    WordCongener.Word as BaseWord,' + #13#10 +
'    WordType.ID as BaseWordTypeID,' + #13#10 +
'    WordType.Disp as BaseWordType,' + #13#10 +
'    WordCongener.ExplanationID as BaseExplanationID,' + #13#10 +
'    WordExplanation.Explanation as BaseExplanation,' + #13#10 +
'    WordCongener.CongenerWord as Word,' + #13#10 +
'    CongenerWordType.ID as WordTypeID,' + #13#10 +
'    CongenerWordType.Disp as WordType,' + #13#10 +
'    CongenerExplanation.ExplanationID,' + #13#10 +
'    CongenerExplanation.Explanation,' + #13#10 +
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
'    WordCongener.CreateTime,' + #13#10 +
'    WordCongener.UpdateTime' + #13#10 +
'FROM' + #13#10 +
'    WordCongener' + #13#10 +
'LEFT JOIN' + #13#10 +
'    Word ON Word.Word = WordCongener.CongenerWord' + #13#10 +
'LEFT JOIN' + #13#10 +
'    WordExplanation ON WordCongener.Word = WordExplanation.Word AND' + #13#10 +
'    WordCongener.WordType = WordExplanation.WordType AND' + #13#10 +
'    WordCongener.ExplanationID = WordExplanation.ExplanationID' + #13#10 +
'LEFT JOIN' + #13#10 +
'    WordExplanation CongenerExplanation ON WordCongener.CongenerWord = CongenerExplanation.Word AND' + #13#10 +
'    WordCongener.CongenerWordType = CongenerExplanation.WordType AND' + #13#10 +
'    WordCongener.CongenerExplanationID = CongenerExplanation.ExplanationID' + #13#10 +
'LEFT JOIN' + #13#10 +
'    WordType ON WordType.ID =  WordCongener.WordType' + #13#10 +
'LEFT JOIN' + #13#10 +
'    WordType CongenerWordType ON CongenerWordType.ID =  WordCongener.CongenerWordType' + #13#10 +
'LEFT JOIN' + #13#10 +
'    Importance ON Importance.ID = Word.ImportanceLevel' + #13#10 +
'LEFT JOIN' + #13#10 +
'    Difficulty ON Difficulty.ID =Word.DifficultyLevel' + #13#10 +
'WHERE' + #13#10 +
'    WordCongener.Word = ''%s''' + #13#10 +
'ORDER BY' + #13#10 +
'    WordCongener.Word ASC,' + #13#10 +
'    WordCongener.CongenerWord ASC,' + #13#10 +
'    WordCongener.CongenerWordType ASC';
begin
  SetSelectSql(Format(sql, [value.Word]));
  //SetSelectSql(sql);
  //showmessage(sql);
  //Query.Parameters.ParamByName('BaseWord').Value := value.Word;

  Result := DoSelect;
end;

function TCongenerModel.InsertCongenerExtention(const value:TCongenerExtention):_Recordset;
const
  sql:string =
'INSERT INTO' + #13#10 +
'	WordCongener(Word, WordType, ExplanationID, CongenerWord, CongenerWordType, CongenerExplanationID, CreateTime, UpdateTime)' + #13#10 +
'VALUES' + #13#10 +
'	(:Word, :WordType, :ExplanationID, :CongenerWord, :CongenerWordType, :CongenerExplanationID, GetDate(), NULL)';
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

  Command.Parameters.ParamByName('CongenerWord').Value := value.CongenerWord;

  if value.CongenerWordType = 0-1 then
    Command.Parameters.ParamByName('CongenerWordType').Value := Null
  else
    Command.Parameters.ParamByName('CongenerWordType').Value := value.CongenerWordType;

  if value.CongenerExplanationID = 0 then
    Command.Parameters.ParamByName('CongenerExplanationID').Value := Null
  else
    Command.Parameters.ParamByName('CongenerExplanationID').Value := value.CongenerExplanationID;

  Result := DoExecute;
end;

function TCongenerModel.UpdateCongenerExtention(const value, oldValue:TCongenerExtention):_Recordset;
const
  sql:string =
'UPDATE' + #13#10 +
'	WordCongener' + #13#10 +
'SET' + #13#10 +
'	Word = :Word,' + #13#10 +
'	WordType = :WordType,' + #13#10 +
'	ExplanationID = :ExplanationID,' + #13#10 +
'	CongenerWord = :CongenerWord,' + #13#10 +
'	CongenerWordType = :CongenerWordType,' + #13#10 +
'	CongenerExplanationID = :CongenerExplanationID,' + #13#10 +
'	UpdateTime = GetDate()' + #13#10 +
'WHERE' + #13#10 +
'	Word = :OldWord AND' + #13#10 +
//'	WordType = :OldWordType AND' + #13#10 +
//'	CongenerWord = :OldCongenerWord AND' + #13#10 +
//'	CongenerWordType = :OldCongenerWordType';
'	CongenerWord = :OldCongenerWord';
begin
  SetExecuteSql(sql);

//  Command.Parameters.ParamByName('Word').Value := value.Word;
//  Command.Parameters.ParamByName('WordType').Value := value.WordType;
//  Command.Parameters.ParamByName('ExplanationID').Value := value.ExplanationID;
//  Command.Parameters.ParamByName('CongenerWord').Value := value.CongenerWord;
//  Command.Parameters.ParamByName('CongenerWordType').Value := value.CongenerWordType;
//  Command.Parameters.ParamByName('CongenerExplanationID').Value := value.CongenerExplanationID;

  Command.Parameters.ParamByName('Word').Value := value.Word;

  if value.WordType = 0 then
    Command.Parameters.ParamByName('WordType').Value := Null
  else
    Command.Parameters.ParamByName('WordType').Value := value.WordType;

  if value.ExplanationID = 0 then
    Command.Parameters.ParamByName('ExplanationID').Value := Null
  else
    Command.Parameters.ParamByName('ExplanationID').Value := value.ExplanationID;

  Command.Parameters.ParamByName('CongenerWord').Value := value.CongenerWord;

  if value.CongenerWordType = 0 then
    Command.Parameters.ParamByName('CongenerWordType').Value := Null
  else
    Command.Parameters.ParamByName('CongenerWordType').Value := value.CongenerWordType;

  if value.CongenerExplanationID = 0 then
    Command.Parameters.ParamByName('CongenerExplanationID').Value := Null
  else
    Command.Parameters.ParamByName('CongenerExplanationID').Value := value.CongenerExplanationID;

  Command.Parameters.ParamByName('OldWord').Value := oldValue.Word;
  //Command.Parameters.ParamByName('OldBaseType').Value := oldValue.WordType;
  Command.Parameters.ParamByName('OldCongenerWord').Value := oldValue.CongenerWord;
  //Command.Parameters.ParamByName('OldExtendType').Value := oldValue.CongenerWordType;

  Result := DoExecute;
end;

//function TCongenerModel.InsertCatalogRelation(const value:TCatalogRelation):_Recordset;
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


function TCongenerModel.DeleteCongenerExtention(const value:TCongenerExtention):_Recordset;
const
  sql:string = 'DELETE FROM WordCongener WHERE Word = :Word AND CongenerWord = :CongenerWord';
begin
  SetExecuteSql(sql);

  Command.Parameters.ParamByName('Word').Value := value.Word;
  //Command.Parameters.ParamByName('WordType').Value := value.WordType;
  Command.Parameters.ParamByName('CongenerWord').Value := value.CongenerWord;
  //Command.Parameters.ParamByName('CongenerWordType').Value := value.CongenerWordType;

  Result := DoExecute;
end;

end.
