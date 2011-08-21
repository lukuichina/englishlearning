unit ResemblanceModel;

interface

uses
  DB, ADODB, MVC, ViewData, SysUtils, Dialogs;

type
  IResemblanceModel = interface(IModel)
    function QueryWord:TCustomADODataSet;
    function QueryResemblanceExtention(const value:TWord):TCustomADODataSet;
    function InsertResemblanceExtention(const value:TResemblanceExtention):_Recordset;
    function UpdateResemblanceExtention(const value, oldValue:TResemblanceExtention):_Recordset;
    function DeleteResemblanceExtention(const value:TResemblanceExtention):_Recordset;
  end;

  TResemblanceModel = class(TModel, IResemblanceModel)
  private

  public
    function QueryWord:TCustomADODataSet;
    function QueryResemblanceExtention(const value:TWord):TCustomADODataSet;
    function InsertResemblanceExtention(const value:TResemblanceExtention):_Recordset;
    function UpdateResemblanceExtention(const value, oldValue:TResemblanceExtention):_Recordset;
    function DeleteResemblanceExtention(const value:TResemblanceExtention):_Recordset;

    constructor Create({Controller: IController});
  end;

implementation

uses Variants;

constructor TResemblanceModel.Create;
begin
  inherited Create;
end;

function TResemblanceModel.QueryWord:TCustomADODataSet;
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

//function TResemblanceModel.QueryWordCatalogTree:TCustomADODataSet;
//const
//  sql:string ='GetCatalogRelationTree';
//begin
//  Result := ExeProc(sql);
//end;

function TResemblanceModel.QueryResemblanceExtention(const value:TWord):TCustomADODataSet;
const
  sql:string =
'SELECT' + #13#10 +
'    ROW_NUMBER() OVER(ORDER BY WordResemblance.Word ASC,WordResemblance.ResemblanceWord ASC,WordResemblance.ResemblanceWordType ASC) AS RowId,' + #13#10 +
'    WordResemblance.Word as BaseWord,' + #13#10 +
'    WordType.ID as BaseWordTypeID,' + #13#10 +
'    WordType.Disp as BaseWordType,' + #13#10 +
'    WordResemblance.ExplanationID as BaseExplanationID,' + #13#10 +
'    WordExplanation.Explanation as BaseExplanation,' + #13#10 +
'    WordResemblance.ResemblanceWord as Word,' + #13#10 +
'    ResemblanceWordType.ID as WordTypeID,' + #13#10 +
'    ResemblanceWordType.Disp as WordType,' + #13#10 +
'    ResemblanceExplanation.ExplanationID,' + #13#10 +
'    ResemblanceExplanation.Explanation,' + #13#10 +
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
'    WordResemblance.CreateTime,' + #13#10 +
'    WordResemblance.UpdateTime' + #13#10 +
'FROM' + #13#10 +
'    WordResemblance' + #13#10 +
'LEFT JOIN' + #13#10 +
'    Word ON Word.Word = WordResemblance.ResemblanceWord' + #13#10 +
'LEFT JOIN' + #13#10 +
'    WordExplanation ON WordResemblance.Word = WordExplanation.Word AND' + #13#10 +
'    WordResemblance.WordType = WordExplanation.WordType AND' + #13#10 +
'    WordResemblance.ExplanationID = WordExplanation.ExplanationID' + #13#10 +
'LEFT JOIN' + #13#10 +
'    WordExplanation ResemblanceExplanation ON WordResemblance.ResemblanceWord = ResemblanceExplanation.Word AND' + #13#10 +
'    WordResemblance.ResemblanceWordType = ResemblanceExplanation.WordType AND' + #13#10 +
'    WordResemblance.ResemblanceExplanationID = ResemblanceExplanation.ExplanationID' + #13#10 +
'LEFT JOIN' + #13#10 +
'    WordType ON WordType.ID =  WordResemblance.WordType' + #13#10 +
'LEFT JOIN' + #13#10 +
'    WordType ResemblanceWordType ON ResemblanceWordType.ID =  WordResemblance.ResemblanceWordType' + #13#10 +
'LEFT JOIN' + #13#10 +
'    Importance ON Importance.ID = Word.ImportanceLevel' + #13#10 +
'LEFT JOIN' + #13#10 +
'    Difficulty ON Difficulty.ID =Word.DifficultyLevel' + #13#10 +
'WHERE' + #13#10 +
'    WordResemblance.Word = ''%s''' + #13#10 +
'ORDER BY' + #13#10 +
'    WordResemblance.Word ASC,' + #13#10 +
'    WordResemblance.ResemblanceWord ASC,' + #13#10 +
'    WordResemblance.ResemblanceWordType ASC';
begin
  SetSelectSql(Format(sql, [value.Word]));
  //SetSelectSql(sql);
  //showmessage(sql);
  //Query.Parameters.ParamByName('BaseWord').Value := value.Word;

  Result := DoSelect;
end;

function TResemblanceModel.InsertResemblanceExtention(const value:TResemblanceExtention):_Recordset;
const
  sql:string =
'INSERT INTO' + #13#10 +
'	WordResemblance(Word, WordType, ExplanationID, ResemblanceWord, ResemblanceWordType, ResemblanceExplanationID, CreateTime, UpdateTime)' + #13#10 +
'VALUES' + #13#10 +
'	(:Word, :WordType, :ExplanationID, :ResemblanceWord, :ResemblanceWordType, :ResemblanceExplanationID, GetDate(), NULL)';
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

  Command.Parameters.ParamByName('ResemblanceWord').Value := value.ResemblanceWord;

  if value.ResemblanceWordType = 0-1 then
    Command.Parameters.ParamByName('ResemblanceWordType').Value := Null
  else
    Command.Parameters.ParamByName('ResemblanceWordType').Value := value.ResemblanceWordType;

  if value.ResemblanceExplanationID = 0 then
    Command.Parameters.ParamByName('ResemblanceExplanationID').Value := Null
  else
    Command.Parameters.ParamByName('ResemblanceExplanationID').Value := value.ResemblanceExplanationID;

  Result := DoExecute;
end;

function TResemblanceModel.UpdateResemblanceExtention(const value, oldValue:TResemblanceExtention):_Recordset;
const
  sql:string =
'UPDATE' + #13#10 +
'	WordResemblance' + #13#10 +
'SET' + #13#10 +
'	Word = :Word,' + #13#10 +
'	WordType = :WordType,' + #13#10 +
'	ExplanationID = :ExplanationID,' + #13#10 +
'	ResemblanceWord = :ResemblanceWord,' + #13#10 +
'	ResemblanceWordType = :ResemblanceWordType,' + #13#10 +
'	ResemblanceExplanationID = :ResemblanceExplanationID,' + #13#10 +
'	UpdateTime = GetDate()' + #13#10 +
'WHERE' + #13#10 +
'	Word = :OldWord AND' + #13#10 +
//'	WordType = :OldWordType AND' + #13#10 +
//'	ResemblanceWord = :OldResemblanceWord AND' + #13#10 +
//'	ResemblanceWordType = :OldResemblanceWordType';
'	ResemblanceWord = :OldResemblanceWord';
begin
  SetExecuteSql(sql);

//  Command.Parameters.ParamByName('Word').Value := value.Word;
//  Command.Parameters.ParamByName('WordType').Value := value.WordType;
//  Command.Parameters.ParamByName('ExplanationID').Value := value.ExplanationID;
//  Command.Parameters.ParamByName('ResemblanceWord').Value := value.ResemblanceWord;
//  Command.Parameters.ParamByName('ResemblanceWordType').Value := value.ResemblanceWordType;
//  Command.Parameters.ParamByName('ResemblanceExplanationID').Value := value.ResemblanceExplanationID;

  Command.Parameters.ParamByName('Word').Value := value.Word;

  if value.WordType = 0 then
    Command.Parameters.ParamByName('WordType').Value := Null
  else
    Command.Parameters.ParamByName('WordType').Value := value.WordType;

  if value.ExplanationID = 0 then
    Command.Parameters.ParamByName('ExplanationID').Value := Null
  else
    Command.Parameters.ParamByName('ExplanationID').Value := value.ExplanationID;

  Command.Parameters.ParamByName('ResemblanceWord').Value := value.ResemblanceWord;

  if value.ResemblanceWordType = 0 then
    Command.Parameters.ParamByName('ResemblanceWordType').Value := Null
  else
    Command.Parameters.ParamByName('ResemblanceWordType').Value := value.ResemblanceWordType;

  if value.ResemblanceExplanationID = 0 then
    Command.Parameters.ParamByName('ResemblanceExplanationID').Value := Null
  else
    Command.Parameters.ParamByName('ResemblanceExplanationID').Value := value.ResemblanceExplanationID;

  Command.Parameters.ParamByName('OldWord').Value := oldValue.Word;
  //Command.Parameters.ParamByName('OldBaseType').Value := oldValue.WordType;
  Command.Parameters.ParamByName('OldResemblanceWord').Value := oldValue.ResemblanceWord;
  //Command.Parameters.ParamByName('OldExtendType').Value := oldValue.ResemblanceWordType;

  Result := DoExecute;
end;

//function TResemblanceModel.InsertCatalogRelation(const value:TCatalogRelation):_Recordset;
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


function TResemblanceModel.DeleteResemblanceExtention(const value:TResemblanceExtention):_Recordset;
const
  sql:string = 'DELETE FROM WordResemblance WHERE Word = :Word AND ResemblanceWord = :ResemblanceWord';
begin
  SetExecuteSql(sql);

  Command.Parameters.ParamByName('Word').Value := value.Word;
  //Command.Parameters.ParamByName('WordType').Value := value.WordType;
  Command.Parameters.ParamByName('ResemblanceWord').Value := value.ResemblanceWord;
  //Command.Parameters.ParamByName('ResemblanceWordType').Value := value.ResemblanceWordType;

  Result := DoExecute;
end;

end.
