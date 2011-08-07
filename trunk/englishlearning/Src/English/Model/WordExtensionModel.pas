unit WordExtensionModel;

interface

uses
  DB, ADODB, MVC, ViewData, SysUtils;

type
  IWordExtensionModel = interface(IModel)
    function QueryWord:TCustomADODataSet;
    function QueryTypeWordExtention(const value:TWord):TCustomADODataSet;
//    function QueryCatalogWord(const value:TWordCatalog):TCustomADODataSet;
    function InsertTypeWordExtention(const value:TTypeWordExtention):_Recordset;
    function UpdateTypeWordExtention(const value, oldValue:TTypeWordExtention):_Recordset;
    //function InsertCatalogRelation(const value:TCatalogRelation):_Recordset;
    function DeleteTypeWordExtention(const value:TTypeWordExtention):_Recordset;
  end;

  TWordExtensionModel = class(TModel, IWordExtensionModel)
  private

  public
    function QueryWord:TCustomADODataSet;
    function QueryTypeWordExtention(const value:TWord):TCustomADODataSet;
//    function QueryCatalogWord(const value:TWordCatalog):TCustomADODataSet;
    function InsertTypeWordExtention(const value:TTypeWordExtention):_Recordset;
    function UpdateTypeWordExtention(const value, oldValue:TTypeWordExtention):_Recordset;
    //function InsertCatalogRelation(const value:TCatalogRelation):_Recordset;
    function DeleteTypeWordExtention(const value:TTypeWordExtention):_Recordset;

    constructor Create({Controller: IController});
  end;

implementation

constructor TWordExtensionModel.Create;
begin
  inherited Create;
end;

function TWordExtensionModel.QueryWord:TCustomADODataSet;
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

//function TWordExtensionModel.QueryWordCatalogTree:TCustomADODataSet;
//const
//  sql:string ='GetCatalogRelationTree';
//begin
//  Result := ExeProc(sql);
//end;

function TWordExtensionModel.QueryTypeWordExtention(const value:TWord):TCustomADODataSet;
const
  sql:string =
'SELECT' + #13#10 +
'    ROW_NUMBER() OVER(ORDER BY WordExtention.BaseWord ASC,WordExtention.ExtendWord ASC,WordExtention.ExtendType ASC) AS RowId,' + #13#10 +
'    WordExtention.ExtendWord as Word,' + #13#10 +
'    BaseWordType.ID as BaseWordTypeID,' + #13#10 +
'    BaseWordType.Disp as BaseWordType,' + #13#10 +
'    WordType.ID as WordTypeID,' + #13#10 +
'    WordType.Disp as WordType,' + #13#10 +
'    NULL as ExplanationID,' + #13#10 +
'    NULL as Explanation,' + #13#10 +
//'    WordExplanation.ExplanationID,' + #13#10 +
//'    WordExplanation.Explanation,' + #13#10 +
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
'    WordExtention.CreateTime,' + #13#10 +
'    WordExtention.UpdateTime' + #13#10 +
'FROM' + #13#10 +
'    WordExtention' + #13#10 +
'LEFT JOIN' + #13#10 +
'    Word ON Word.Word = WordExtention.ExtendWord' + #13#10 +
//'LEFT JOIN' + #13#10 +
//--'    WordExplanation ON WordExplanation.Word = WordExtention.ExtendWord' + #13#10 +
'INNER JOIN' + #13#10 +
'    WordType BaseWordType ON BaseWordType.ID =  WordExtention.BaseType' + #13#10 +
'INNER JOIN' + #13#10 +
'    WordType ON WordType.ID =  WordExtention.ExtendType' + #13#10 +
'LEFT JOIN' + #13#10 +
'    Importance ON Importance.ID = Word.ImportanceLevel' + #13#10 +
'LEFT JOIN' + #13#10 +
'    Difficulty ON Difficulty.ID =Word.DifficultyLevel' + #13#10 +
'WHERE' + #13#10 +
'    WordExtention.BaseWord = ''%s''' + #13#10 +
'ORDER BY' + #13#10 +
'    WordExtention.BaseWord ASC,' + #13#10 +
'    WordExtention.ExtendWord ASC,' + #13#10 +
'    WordExtention.ExtendType ASC';
begin
  SetSelectSql(Format(sql, [value.Word]));
  //SetSelectSql(sql);

  //Query.Parameters.ParamByName('BaseWord').Value := value.Word;

  Result := DoSelect;
end;

function TWordExtensionModel.InsertTypeWordExtention(const value:TTypeWordExtention):_Recordset;
const
  sql:string =
'INSERT INTO' + #13#10 +
'	WordExtention(BaseWord, ExtendWord, BaseType, ExtendType, CreateTime, UpdateTime)' + #13#10 +
'VALUES' + #13#10 +
'	(:BaseWord, :ExtendWord, :BaseType, :ExtendType, GetDate(), NULL)';
begin
  SetExecuteSql(sql);

  Command.Parameters.ParamByName('BaseWord').Value := value.BaseWord;
  Command.Parameters.ParamByName('BaseType').Value := value.BaseType;
  Command.Parameters.ParamByName('ExtendWord').Value := value.ExtendWord;
  Command.Parameters.ParamByName('ExtendType').Value := value.ExtendType;

  Result := DoExecute;
end;

function TWordExtensionModel.UpdateTypeWordExtention(const value, oldValue:TTypeWordExtention):_Recordset;
const
  sql:string =
'UPDATE' + #13#10 +
'	WordExtention' + #13#10 +
'SET' + #13#10 +
'	BaseWord = :BaseWord,' + #13#10 +
'	ExtendWord = :ExtendWord,' + #13#10 +
'	BaseType = :BaseType,' + #13#10 +
'	ExtendType = :ExtendType,' + #13#10 +
'	UpdateTime = GetDate()' + #13#10 +
'WHERE' + #13#10 +
'	BaseWord = :OldBaseWord AND' + #13#10 +
'	ExtendWord = :OldExtendWord AND' + #13#10 +
'	BaseType = :OldBaseType AND' + #13#10 +
'	ExtendType = :OldExtendType';
begin
  SetExecuteSql(sql);

  Command.Parameters.ParamByName('BaseWord').Value := value.BaseWord;
  Command.Parameters.ParamByName('BaseType').Value := value.BaseType;
  Command.Parameters.ParamByName('ExtendWord').Value := value.ExtendWord;
  Command.Parameters.ParamByName('ExtendType').Value := value.ExtendType;

  Command.Parameters.ParamByName('OldBaseWord').Value := oldValue.BaseWord;
  Command.Parameters.ParamByName('OldBaseType').Value := oldValue.BaseType;
  Command.Parameters.ParamByName('OldExtendWord').Value := oldValue.ExtendWord;
  Command.Parameters.ParamByName('OldExtendType').Value := oldValue.ExtendType;

  Result := DoExecute;
end;

//function TWordExtensionModel.InsertCatalogRelation(const value:TCatalogRelation):_Recordset;
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


function TWordExtensionModel.DeleteTypeWordExtention(const value:TTypeWordExtention):_Recordset;
const
  sql:string = 'DELETE FROM WordExtention WHERE BaseWord = :BaseWord AND ExtendWord = :ExtendWord AND BaseType = :BaseType AND ExtendType = :ExtendType';
begin
  SetExecuteSql(sql);

  Command.Parameters.ParamByName('BaseWord').Value := value.BaseWord;
  Command.Parameters.ParamByName('BaseType').Value := value.BaseType;
  Command.Parameters.ParamByName('ExtendWord').Value := value.ExtendWord;
  Command.Parameters.ParamByName('ExtendType').Value := value.ExtendType;

  Result := DoExecute;
end;

end.
