unit PictureLibraryModel;

interface

uses
  DB, ADODB, MVC, ViewData;

type
  IPictureLibraryModel = interface(IModel)
    function QueryBetweenWord(const BeginWord, EndWord:string):TCustomADODataSet;
    function QueryWord:TCustomADODataSet;
    function QueryWordTree:TCustomADODataSet;
    function QueryPicture(const value:TWord):TCustomADODataSet;
    function InsertPicture(const value:TPicture):_Recordset;
    function UpdatePicture(const value:TPicture):_Recordset;
    function DeletePicture(const value:TPicture):_Recordset;

    function ReplacePicture(const value:TPicture):_Recordset;
    function UpdatePictureDisp(const value:TPicture):_Recordset;
  end;

  TPictureLibraryModel = class(TModel, IPictureLibraryModel)
  private

  public
    function QueryBetweenWord(const BeginWord, EndWord:string):TCustomADODataSet;
    function QueryWord:TCustomADODataSet;
    function QueryWordTree:TCustomADODataSet;
    function QueryPicture(const value:TWord):TCustomADODataSet;
    function InsertPicture(const value:TPicture):_Recordset;
    function UpdatePicture(const value:TPicture):_Recordset;
    function DeletePicture(const value:TPicture):_Recordset;

    function ReplacePicture(const value:TPicture):_Recordset;
    function UpdatePictureDisp(const value:TPicture):_Recordset;

    constructor Create({Controller: IController});
  end;

implementation

constructor TPictureLibraryModel.Create;
begin
  inherited Create;
end;

function TPictureLibraryModel.QueryWord:TCustomADODataSet;
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

function TPictureLibraryModel.QueryWordTree:TCustomADODataSet;
const
  sql:string ='GetCatalogRelationTree';
begin
  Result := ExeProc(sql);
end;

function TPictureLibraryModel.QueryPicture(const value:TWord):TCustomADODataSet;
const
  sql:string =
'SELECT' + #13#10 +
'    ROW_NUMBER() OVER(ORDER BY PictureLibrary.Word ASC, PictureLibrary.PictureID ASC) AS RowId,' + #13#10 +
'    PictureLibrary.Word,' + #13#10 +
'    PictureLibrary.PictureID,' + #13#10 +
'    PictureLibrary.PictureName,' + #13#10 +
'    PictureLibrary.PictureDisp,' + #13#10 +
'    Importance.ID as  ImportanceID,' + #13#10 +
'    Importance.Disp as ImportanceLevel,' + #13#10 +
'    Difficulty.ID as DifficultyID,' + #13#10 +
'    Difficulty.Disp as DifficultyLevel,' + #13#10 +
'    CASE WHEN (SELECT COUNT(*) FROM WordExplanation WHERE WordExplanation.Word = Word.Word) > 0 THEN ''¡ð'' ELSE ''¡Á'' END AS IsExplained,' + #13#10 +
'    CASE WHEN (SELECT COUNT(*) FROM Picture WHERE Picture.Word = Word.Word) > 0 THEN ''¡ð'' ELSE ''¡Á'' END AS IsPictured,' + #13#10 +
'    (SELECT COUNT(*) FROM (SELECT Distinct WordType FROM WordExplanation WHERE WordExplanation.Word = Word.Word) wt) AS WordTypeCount,' + #13#10 +
'    (SELECT COUNT(*) FROM WordExplanation WHERE WordExplanation.Word = Word.Word) AS ExplanationCount,' + #13#10 +
//'    (SELECT COUNT(*) FROM Picture WHERE Picture.Word = Word.Word) AS PictureCount,' + #13#10 +
//'    (SELECT COUNT(*) FROM Picture WHERE Picture.Word = Word.Word AND Picture.MainPicture = 1) AS MainPictureCount,' + #13#10 +
'    Word.CreateTime,' + #13#10 +
'    Word.UpdateTime' + #13#10 +
'FROM' + #13#10 +
'    PictureLibrary' + #13#10 +
'INNER JOIN Word ON' + #13#10 +
'    PictureLibrary.Word = Word.Word' + #13#10 +
'INNER JOIN' + #13#10 +
'    Importance on Importance.ID = Word.ImportanceLevel' + #13#10 +
'INNER JOIN' + #13#10 +
'    Difficulty on Difficulty.ID = Word.DifficultyLevel' + #13#10 +
'WHERE' + #13#10 +
'    PictureLibrary.Word = :Word' + #13#10 +
//'    PictureLibrary.PictureID = :PictureID' + #13#10 +
'ORDER BY' + #13#10 +
'    PictureLibrary.Word ASC, PictureLibrary.PictureID ASC';
begin
  SetSelectSql(sql);

  Query.Parameters.ParamByName('Word').Value := value.Word;

  Result := DoSelect;
end;

function TPictureLibraryModel.InsertPicture(const value:TPicture):_Recordset;
const
  sql:string =
'INSERT INTO' + #13#10 +
'	PictureLibrary(Word, PictureID, PictureName, PictureDisp, CreateTime, UpdateTime)' + #13#10 +
'VALUES' + #13#10 +
'	(:Word, :PictureID, :PictureName, :PictureDisp, GetDate(), NULL)';
begin
  SetExecuteSql(sql);

  Command.Parameters.ParamByName('Word').Value := value.Word;
  Command.Parameters.ParamByName('PictureID').Value := value.PictureID;
  Command.Parameters.ParamByName('PictureName').Value := value.PictureName;
  Command.Parameters.ParamByName('PictureDisp').Value := value.PictureDisp;

  Result := DoExecute;
end;

function TPictureLibraryModel.UpdatePicture(const value:TPicture):_Recordset;
const
  sql:string =
'UPDATE' + #13#10 +
'	PictureLibrary' + #13#10 +
'SET' + #13#10 +
'	PictureName = :PictureName,' + #13#10 +
'	PictureDisp = :PictureDisp,' + #13#10 +
'	UpdateTime = GetDate()' + #13#10 +
'WHERE' + #13#10 +
'	Word = :Word AND ' +
'	PictureID = :PictureID';
begin
  SetExecuteSql(sql);

  Command.Parameters.ParamByName('Word').Value := value.Word;
  Command.Parameters.ParamByName('PictureID').Value := value.PictureID;
  Command.Parameters.ParamByName('PictureName').Value := value.PictureName;
  Command.Parameters.ParamByName('PictureDisp').Value := value.PictureDisp;

  Result := DoExecute;
end;

function TPictureLibraryModel.DeletePicture(const value:TPicture):_Recordset;
const
  sql:string = 'DELETE FROM PictureLibrary WHERE Word = :Word AND PictureID = :PictureID';
begin
  SetExecuteSql(sql);

  Command.Parameters.ParamByName('Word').Value := value.Word;
  Command.Parameters.ParamByName('PictureID').Value := value.PictureID;

  Result := DoExecute;
end;

function TPictureLibraryModel.QueryBetweenWord(const BeginWord, EndWord:string):TCustomADODataSet;
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

function TPictureLibraryModel.ReplacePicture(const value:TPicture):_Recordset;
const
  sql:string =
'UPDATE' + #13#10 +
'	PictureLibrary' + #13#10 +
'SET' + #13#10 +
'	UpdateTime = GetDate()' + #13#10 +
'WHERE' + #13#10 +
'	Word = :Word AND ' +
'	PictureID = :PictureID';
begin
  SetExecuteSql(sql);

  Command.Parameters.ParamByName('Word').Value := value.Word;
  Command.Parameters.ParamByName('PictureID').Value := value.PictureID;

  Result := DoExecute;
end;

function TPictureLibraryModel.UpdatePictureDisp(const value:TPicture):_Recordset;
const
  sql:string =
'UPDATE' + #13#10 +
'	PictureLibrary' + #13#10 +
'SET' + #13#10 +
'	PictureDisp = :PictureDisp,' + #13#10 +
'	UpdateTime = GetDate()' + #13#10 +
'WHERE' + #13#10 +
'	Word = :Word AND ' +
'	PictureID = :PictureID';
begin
  SetExecuteSql(sql);

  Command.Parameters.ParamByName('Word').Value := value.Word;
  Command.Parameters.ParamByName('PictureID').Value := value.PictureID;
  Command.Parameters.ParamByName('PictureDisp').Value := value.PictureDisp;

  Result := DoExecute;
end;

end.
