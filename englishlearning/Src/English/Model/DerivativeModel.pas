unit DerivativeModel;

interface

uses
  DB, ADODB, MVC, ViewData, SysUtils;

type
  IDerivativeModel = interface(IModel)
    function QueryWord:TCustomADODataSet;
    function QueryDerivativeExtention(const value:TWord):TCustomADODataSet;
//    function QueryCatalogWord(const value:TWordCatalog):TCustomADODataSet;
    function InsertDerivativeExtention(const value:TDerivativeExtention):_Recordset;
    function UpdateDerivativeExtention(const value, oldValue:TDerivativeExtention):_Recordset;
    //function InsertCatalogRelation(const value:TCatalogRelation):_Recordset;
    function DeleteDerivativeExtention(const value:TDerivativeExtention):_Recordset;
  end;

  TDerivativeModel = class(TModel, IDerivativeModel)
  private

  public
    function QueryWord:TCustomADODataSet;
    function QueryDerivativeExtention(const value:TWord):TCustomADODataSet;
//    function QueryCatalogWord(const value:TWordCatalog):TCustomADODataSet;
    function InsertDerivativeExtention(const value:TDerivativeExtention):_Recordset;
    function UpdateDerivativeExtention(const value, oldValue:TDerivativeExtention):_Recordset;
    //function InsertCatalogRelation(const value:TCatalogRelation):_Recordset;
    function DeleteDerivativeExtention(const value:TDerivativeExtention):_Recordset;

    constructor Create({Controller: IController});
  end;

implementation

constructor TDerivativeModel.Create;
begin
  inherited Create;
end;

function TDerivativeModel.QueryWord:TCustomADODataSet;
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

//function TDerivativeModel.QueryWordCatalogTree:TCustomADODataSet;
//const
//  sql:string ='GetCatalogRelationTree';
//begin
//  Result := ExeProc(sql);
//end;

function TDerivativeModel.QueryDerivativeExtention(const value:TWord):TCustomADODataSet;
const
  sql:string =
'SELECT' + #13#10 +
'    ROW_NUMBER() OVER(ORDER BY WordDerivative.OriginalWord ASC,WordDerivative.DerivedWord ASC,WordDerivative.DerivedType ASC) AS RowId,' + #13#10 +
'    WordDerivative.DerivedWord as Word,' + #13#10 +
'    OriginalWordType.ID as BaseWordTypeID,' + #13#10 +
'    OriginalWordType.Disp as BaseWordType,' + #13#10 +
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
'    WordDerivative.CreateTime,' + #13#10 +
'    WordDerivative.UpdateTime' + #13#10 +
'FROM' + #13#10 +
'    WordDerivative' + #13#10 +
'LEFT JOIN' + #13#10 +
'    Word ON Word.Word = WordDerivative.DerivedWord' + #13#10 +
//'LEFT JOIN' + #13#10 +
//--'    WordExplanation ON WordExplanation.Word = Derivative.ExtendWord' + #13#10 +
'INNER JOIN' + #13#10 +
'    WordType OriginalWordType ON OriginalWordType.ID =  WordDerivative.OriginalType' + #13#10 +
'INNER JOIN' + #13#10 +
'    WordType ON WordType.ID =  WordDerivative.DerivedType' + #13#10 +
'LEFT JOIN' + #13#10 +
'    Importance ON Importance.ID = Word.ImportanceLevel' + #13#10 +
'LEFT JOIN' + #13#10 +
'    Difficulty ON Difficulty.ID =Word.DifficultyLevel' + #13#10 +
'WHERE' + #13#10 +
'    WordDerivative.OriginalWord = ''%s''' + #13#10 +
'ORDER BY' + #13#10 +
'    WordDerivative.OriginalWord ASC,' + #13#10 +
'    WordDerivative.DerivedWord ASC,' + #13#10 +
'    WordDerivative.DerivedType ASC';
begin
  SetSelectSql(Format(sql, [value.Word]));
  //SetSelectSql(sql);

  //Query.Parameters.ParamByName('BaseWord').Value := value.Word;

  Result := DoSelect;
end;

function TDerivativeModel.InsertDerivativeExtention(const value:TDerivativeExtention):_Recordset;
const
  sql:string =
'INSERT INTO' + #13#10 +
'	WordDerivative(OriginalWord, DerivedWord, OriginalType, DerivedType, CreateTime, UpdateTime)' + #13#10 +
'VALUES' + #13#10 +
'	(:OriginalWord, :DerivedWord, :OriginalType, :DerivedType, GetDate(), NULL)';
begin
  SetExecuteSql(sql);

  Command.Parameters.ParamByName('OriginalWord').Value := value.OriginalWord;
  Command.Parameters.ParamByName('OriginalType').Value := value.OriginalType;
  Command.Parameters.ParamByName('DerivedWord').Value := value.DerivedWord;
  Command.Parameters.ParamByName('DerivedType').Value := value.DerivedType;

  Result := DoExecute;
end;

function TDerivativeModel.UpdateDerivativeExtention(const value, oldValue:TDerivativeExtention):_Recordset;
const
  sql:string =
'UPDATE' + #13#10 +
'	WordDerivative' + #13#10 +
'SET' + #13#10 +
'	OriginalWord = :OriginalWord,' + #13#10 +
'	DerivedWord = :DerivedWord,' + #13#10 +
'	OriginalType = :OriginalType,' + #13#10 +
'	DerivedType = :DerivedType,' + #13#10 +
'	UpdateTime = GetDate()' + #13#10 +
'WHERE' + #13#10 +
'	OriginalWord = :OldOriginalWord AND' + #13#10 +
'	DerivedWord = :OldDerivedWord AND' + #13#10 +
'	OriginalType = :OldOriginalType AND' + #13#10 +
'	DerivedType = :OldDerivedType';
begin
  SetExecuteSql(sql);

  Command.Parameters.ParamByName('OriginalWord').Value := value.OriginalWord;
  Command.Parameters.ParamByName('OriginalType').Value := value.OriginalType;
  Command.Parameters.ParamByName('DerivedWord').Value := value.DerivedWord;
  Command.Parameters.ParamByName('DerivedType').Value := value.DerivedType;

  Command.Parameters.ParamByName('OldOriginalWord').Value := oldValue.OriginalWord;
  Command.Parameters.ParamByName('OldOriginalType').Value := oldValue.OriginalType;
  Command.Parameters.ParamByName('OldDerivedWord').Value := oldValue.DerivedWord;
  Command.Parameters.ParamByName('OldDerivedType').Value := oldValue.DerivedType;

  Result := DoExecute;
end;

//function TDerivativeModel.InsertCatalogRelation(const value:TCatalogRelation):_Recordset;
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


function TDerivativeModel.DeleteDerivativeExtention(const value:TDerivativeExtention):_Recordset;
const
  sql:string = 'DELETE FROM WordDerivative WHERE OriginalWord = :OriginalWord AND DerivedWord = :DerivedWord AND OriginalType = :OriginalType AND DerivedType = :DerivedType';
begin
  SetExecuteSql(sql);

  Command.Parameters.ParamByName('OriginalWord').Value := value.OriginalWord;
  Command.Parameters.ParamByName('OriginalType').Value := value.OriginalType;
  Command.Parameters.ParamByName('DerivedWord').Value := value.DerivedWord;
  Command.Parameters.ParamByName('DerivedType').Value := value.DerivedType;

  Result := DoExecute;
end;

end.
