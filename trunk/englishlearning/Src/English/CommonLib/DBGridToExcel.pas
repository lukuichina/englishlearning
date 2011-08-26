unit DBGridToExcel;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ComCtrls, ExtCtrls, StdCtrls, Gauges, ShellApi, DBAdvGrid;

type
  TTitleCell = array of array of String;

  //分解DBGrid的标题
  TDBGridTitle = class
  private
    FDBGrid: TDBAdvGrid;  //对应DBGrid
    FColumnCount: integer; //DBGrid列数(指visible为True的列数)
    FRowCount: integer;    //DBGrid多表头层数(没有多表头则层数为1)
    procedure SetDBGrid(const Value: TDBAdvGrid);
    function GetTitleRow: integer;    //获取DBGrid多表头层数
    function GetTitleColumn: integer; //获取DBGrid列数
  public
    //分解DBGrid标题，由TitleCell二维动态数组返回
    procedure GetTitleData(var TitleCell: TTitleCell);
  published
    property DBGrid: TDBAdvGrid read FDBGrid write SetDBGrid;
    property ColumnCount: integer read FColumnCount;
    property RowCount: integer read FRowCount;
  end;

  TDBGridToExcel = class(TComponent)
  private
    FCol: integer;
    FRow: integer;
    FProgressForm: TForm;                                  {进度窗体}
    FGauge: TGauge;                                        {进度条}
    Stream: TStream;                                       {输出文件流}
    FBookMark: TBookmark;                                  
    FShowProgress: Boolean;                                {是否显示进度窗体}
    FDBGrid: TDBAdvGrid;
    FBeginDate: TCaption;                                  {开始日期}
    FTitleName: TCaption;                                  {Excel文件标题}
    FEndDate: TCaption;                                    {结束日期}
    FUserName: TCaption;                                   {制表人}
    FFileName: String;                                     {保存文件名}
    FOpen:Boolean;{设置是没直接打开文件}
    procedure SetShowProgress(const Value: Boolean);
    procedure SetDBGrid(const Value: TDBAdvGrid);
    procedure SetBeginDate(const Value: TCaption);
    procedure SetEndDate(const Value: TCaption);
    procedure SetTitleName(const Value: TCaption);
    procedure SetUserName(const Value: TCaption);
    procedure SetFileName(const Value: String);
    procedure SetOpen(const Value: Boolean);

    procedure IncColRow;
    procedure WriteBlankCell;                              {写空单元格}
    {写数字单元格}
    procedure WriteFloatCell(const AValue: Double; const IncStatus: Boolean=True);
    {写整型单元格}
    procedure WriteIntegerCell(const AValue: Integer; const IncStatus: Boolean=True);
    {写字符单元格}
    procedure WriteStringCell(const AValue: string; const IncStatus: Boolean=True);
    procedure WritePrefix;
    procedure WriteSuffix;
    procedure WriteHeader;                                 {输出Excel标题}
    procedure WriteTitle;                                  {输出Excel列标题}
    procedure WriteDataCell;                               {输出数据集内容}
    procedure WriteFooter;                                 {输出DBGrid表脚}
    procedure SaveStream(aStream: TStream);
    procedure CreateProcessForm(AOwner: TComponent);       {生成进度窗体}
    {根据表格修改数据集字段顺序及字段中文标题}
    procedure SetDataSetCrossIndexDBGrid;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure ExportToExcel; {输出Excel文件}
  published
    property DBGrid: TDBAdvGrid read FDBGrid write SetDBGrid;
    property ShowProgress: Boolean read FShowProgress write SetShowProgress;
    property TitleName: TCaption read FTitleName write SetTitleName;
    property BeginDate: TCaption read FBeginDate write SetBeginDate;
    property EndDate: TCaption read FEndDate write SetEndDate;
    property UserName: TCaption read FUserName write SetUserName;
    property FileName: String read FFileName write SetFileName;
    property Open: Boolean read FOpen write SetOpen;
  end;

var
  //CXlsBof: array[0..5] of Word = ($809, 8, 0, $10, 0, 0);
  CXlsBof: array[0..4] of Word = ($0809, 6, 0, $0010, 0);
  //CXlsBof   : array[0..5] of Word = ($809, 8, 0, $10, 0, 0);
  XLSPalette: array[0..2] of Word = ($92, $36, $0D);
  XLSDimension: array [0..6] of Word = ($200, $0A, 0, $FFFF, 0, $FF, 0);

  CXlsEof: array[0..1] of Word = ($0A, 00);
  CXlsLabel: array[0..5] of Word = ($204, 0, 0, 0, 0, 0);
  CXlsNumber: array[0..4] of Word = ($203, 14, 0, 0, 0);
  CXlsRk: array[0..4] of Word = ($27E, 10, 0, 0, 0);
  CXlsBlank: array[0..4] of Word = ($201, 6, 0, 0, $17);

implementation
{ TDBGridTitle }


function TDBGridTitle.GetTitleColumn: integer;
var
  i, ColumnCount: integer;
begin
  ColumnCount := 0;
  for i := 0 to DBGrid.Columns.Count - 1 do
  begin
//    if DBGrid.Columns[i].Visible then
    if DBGrid.Columns[i].Width > 0 then
      Inc(ColumnCount);
  end;

  Result := ColumnCount;
end;

procedure TDBGridTitle.GetTitleData(var TitleCell: TTitleCell);
var
  i, Row, Col: integer;
  Caption: String;
begin
  FColumnCount := GetTitleColumn;
  FRowCount := GetTitleRow;
  SetLength(TitleCell,FColumnCount,FRowCount);
  Row := 0;
  for i := 0 to DBGrid.Columns.Count - 1 do
  begin
//    if DBGrid.Columns[i].Visible then
    if DBGrid.Columns[i].Width > 0 then
    begin
      Col := 0;
//      Caption := DBGrid.Columns[i].Title.Caption;
      Caption := DBGrid.Columns[i].Header;
      while POS('|', Caption) > 0 do
      begin
        TitleCell[Row,Col] := Copy(Caption, 1, Pos('|',Caption)-1);
        Caption := Copy(Caption,Pos('|', Caption)+1, Length(Caption));
        Inc(Col);
      end;
      TitleCell[Row, Col] := Caption;
      Inc(Row);
    end;
  end;
end;

function TDBGridTitle.GetTitleRow: integer;
var
  i, j: integer;
  MaxRow, Row: integer;
begin
  MaxRow := 1;
  for i := 0 to DBGrid.Columns.Count - 1 do
  begin
    Row := 1;
//    for j := 0 to Length(DBGrid.Columns[i].Title.Caption) do
    for j := 1 to Length(DBGrid.Columns[i].Header) do
    begin
//      if DBGrid.Columns[i].Title.Caption[j] = '|' then
      if DBGrid.Columns[i].Header[j] = '|' then
        Inc(Row);
    end;

    if MaxRow < Row then
      MaxRow :=  Row;
  end;

  Result := MaxRow;
end;

procedure TDBGridTitle.SetDBGrid(const Value: TDBAdvGrid);
begin
  FDBGrid := Value;
end;

{ TDBGridToExcel }

constructor TDBGridToExcel.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FShowProgress := True;
end;

procedure TDBGridToExcel.SetShowProgress(const Value: Boolean);
begin
  FShowProgress := Value;
end;

procedure TDBGridToExcel.SetDBGrid(const Value: TDBAdvGrid);
begin
  FDBGrid := Value;
end;

procedure TDBGridToExcel.SetBeginDate(const Value: TCaption);
begin
  FBeginDate := Value;
end;

procedure TDBGridToExcel.SetEndDate(const Value: TCaption);
begin
  FEndDate := Value;
end;

procedure TDBGridToExcel.SetTitleName(const Value: TCaption);
begin
  FTitleName := Value;
end;

procedure TDBGridToExcel.SetUserName(const Value: TCaption);
begin
  FUserName := Value;
end;

procedure TDBGridToExcel.SetFileName(const Value: String);
begin
  FFileName := Value;
end;

procedure TDBGridToExcel.SetOpen(const Value: Boolean);
begin
  FOpen:=Value;
end;

procedure TDBGridToExcel.IncColRow;
begin
  if FCol = DBGrid.DataSource.DataSet.FieldCount - 1 then
  begin
    Inc(FRow);
    FCol := 0;
  end
  else
    Inc(FCol);
end;

procedure TDBGridToExcel.WriteBlankCell;
begin
  CXlsBlank[2] := FRow;
  CXlsBlank[3] := FCol;
  Stream.WriteBuffer(CXlsBlank, SizeOf(CXlsBlank));
  IncColRow;
end;

procedure TDBGridToExcel.WriteFloatCell(const AValue: Double; const IncStatus: Boolean=True);
begin
  CXlsNumber[2] := FRow;
  CXlsNumber[3] := FCol;
  Stream.WriteBuffer(CXlsNumber, SizeOf(CXlsNumber));
  Stream.WriteBuffer(AValue, 8);

  if IncStatus then
    IncColRow;
end;

procedure TDBGridToExcel.WriteIntegerCell(const AValue: Integer; const IncStatus: Boolean=True);
var
  V: Integer;
begin
  CXlsRk[2] := FRow;
  CXlsRk[3] := FCol;
  Stream.WriteBuffer(CXlsRk, SizeOf(CXlsRk));
  V := (AValue Shl 2) Or 2;
  Stream.WriteBuffer(V, 4);

  if IncStatus then
    IncColRow;
end;

procedure TDBGridToExcel.WriteStringCell(const AValue: string; const IncStatus: Boolean=True);
var
  L: integer;
begin
  L := Length(AnsiString(AValue));
  CXlsLabel[1] := 8 + L;
  CXlsLabel[2] := FRow;
  CXlsLabel[3] := FCol;
  CXlsLabel[5] := L;
  Stream.WriteBuffer(CXlsLabel, SizeOf(CXlsLabel));
  Stream.WriteBuffer(Pointer(AValue)^, L);

  if IncStatus then
    IncColRow;
end;

procedure TDBGridToExcel.WritePrefix;
begin
  Stream.WriteBuffer(CXlsBof, SizeOf(CXlsBof));
end;

procedure TDBGridToExcel.WriteSuffix;
begin
  Stream.WriteBuffer(CXlsEof, SizeOf(CXlsEof));
end;

procedure TDBGridToExcel.WriteHeader;
var
  OpName, OpDate: String; 
begin
  //标题
  FCol := 3;
  WriteStringCell(TitleName,False);
  FCol := 0;

  Inc(FRow);

  if Trim(BeginDate) <> '' then
  begin
    //开始日期
    FCol := 0;
    WriteStringCell(BeginDate,False);
    FCol := 0
  end;

  if Trim(EndDate) <> '' then
  begin
    //结束日期
    FCol := 5;
    WriteStringCell(EndDate,False);
    FCol := 0;
  end;

  if (Trim(BeginDate) <> '') or (Trim(EndDate) <> '') then
    Inc(FRow);

  //制表人
  OpName := '制表人：' + UserName;
  FCol := 0;
  WriteStringCell(OpName,False);
  FCol := 0;

  //制表时间
  OpDate := '制表时间：' + DateTimeToStr(Now);
  FCol := 5;
  WriteStringCell(OpDate,False);
  FCol := 0;

  Inc(FRow);  
end;

procedure TDBGridToExcel.WriteTitle;
var
  i, j: integer;
  DBGridTitle: TDBGridTitle;
  TitleCell: TTitleCell;
begin
  DBGridTitle := TDBGridTitle.Create;
  try
    DBGridTitle.DBGrid := FDBGrid;
    DBGridTitle.GetTitleData(TitleCell);

    try
      for i := 0 to DBGridTitle.RowCount - 1 do
      begin
        for j := 0 to DBGridTitle.ColumnCount - 1 do
        begin
          FCol := j;
          WriteStringCell(TitleCell[j,i],False);
        end;
        Inc(FRow);
      end;
      FCol := 0;
    except

    end;
  finally
    DBGridTitle.Free;
  end;
end;


procedure TDBGridToExcel.WriteDataCell;
var
  i: integer;
begin
  DBGrid.DataSource.DataSet.DisableControls;
  FBookMark := DBGrid.DataSource.DataSet.GetBookmark;
  try
    DBGrid.DataSource.DataSet.First;
    while not DBGrid.DataSource.DataSet.Eof do
    begin
      for i := 0 to DBGrid.DataSource.DataSet.FieldCount - 1 do
      begin
        if DBGrid.DataSource.DataSet.Fields[i].IsNull or (not DBGrid.DataSource.DataSet.Fields[i].Visible) then
          WriteBlankCell
        else
        begin
          case DBGrid.DataSource.DataSet.Fields[i].DataType of
            ftSmallint, ftInteger, ftWord, ftAutoInc, ftBytes:
              WriteIntegerCell(DBGrid.DataSource.DataSet.Fields[i].AsInteger);
            ftFloat, ftCurrency, ftBCD:
              WriteFloatCell(DBGrid.DataSource.DataSet.Fields[i].AsFloat);
          else
            if DBGrid.DataSource.DataSet.Fields[i] Is TBlobfield then  // 此类型的字段(图像等)暂无法读取显示
              WriteStringCell('')
            else
              WriteStringCell(DBGrid.DataSource.DataSet.Fields[i].AsString);
          end;
        end;
      end;

      //显示进度条进度过程
      if ShowProgress then
      begin
        FGauge.Progress := DBGrid.DataSource.DataSet.RecNo;
        FGauge.Refresh;
      end;

      DBGrid.DataSource.DataSet.Next;
    end;

  finally
    if DBGrid.DataSource.DataSet.BookmarkValid(FBookMark) then
    DBGrid.DataSource.DataSet.GotoBookmark(FBookMark);

    DBGrid.DataSource.DataSet.EnableControls;
  end;
end;

procedure TDBGridToExcel.WriteFooter;
{var
  i, j: integer;}
begin
{  if DBGrid.FooterRowCount = 0 then exit;

  FCol := 0;
  if DBGrid.FooterRowCount = 1 then
  begin
    for i := 0 to DBGrid.Columns.Count - 1 do
    begin
      if DBGrid.Columns[i].Visible then
      begin
        WriteStringCell(DBGrid.Columns[i].Footer.Value,False);
        Inc(FCol);
      end;
    end;
  end
  else if DBGrid.FooterRowCount > 1 then
  begin
    for i := 0 to DBGrid.Columns.Count - 1 do
    begin
      if DBGrid.Columns[i].Visible then
      begin
        for j := 0 to DBGrid.Columns[i].Footers.Count - 1 do
        begin
          WriteStringCell(DBGrid.Columns[i].Footers[j].Value ,False);
          Inc(FRow);
        end;
        Inc(FCol);
        FRow := FRow - DBGrid.Columns[i].Footers.Count;
      end;
    end;
  end;
  FCol := 0;}
end;

procedure TDBGridToExcel.SaveStream(aStream: TStream);
begin
  FCol := 0;
  FRow := 0;
  Stream := aStream;

  //输出前缀
  WritePrefix;

  //输出表格标题
  //WriteHeader;

  //输出列标题
  //WriteTitle;

  //输出数据集内容
  WriteDataCell;

  //输出DBGrid表脚
  //WriteFooter;

  //输出后缀
  WriteSuffix;
end;

procedure TDBGridToExcel.ExportToExcel;
var
  FileStream: TFileStream;
  Msg: String;
begin
  //如果数据集为空或没有打开则退出
  if (DBGrid.DataSource.DataSet.IsEmpty) or (not DBGrid.DataSource.DataSet.Active) then
    exit;

  //如果保存的文件名为空则退出 
  if Trim(FileName) = '' then
    exit;
    
  //根据表格修改数据集字段顺序及字段中文标题
  SetDataSetCrossIndexDBGrid;

  Screen.Cursor := crHourGlass;
  try
    try
      if FileExists(FileName) then
      begin
        Msg := '已存在文件（' + FileName + '），是否覆盖？';
        if Application.MessageBox(PChar(Msg),'提示',MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2) = IDYES then
        begin
          //删除文件
          DeleteFile(FileName)
        end
        else
          exit;
      end;

      //显示进度窗体
      if ShowProgress then
        CreateProcessForm(nil);
        
      FileStream := TFileStream.Create(FileName, fmCreate);
      try
        //输出文件
        SaveStream(FileStream);
      finally
        FileStream.Free;
      end;
      
      //打开Excel文件
      if Open then
      begin
        ShellExecute(0, 'Open', PChar(FileName), nil, nil, SW_SHOW);
      end;
    except

    end;
  finally
    if ShowProgress then
      FreeAndNil(FProgressForm);
    Screen.Cursor := crDefault;
  end;
end;

destructor TDBGridToExcel.Destroy;
begin
  inherited Destroy;
end;

procedure TDBGridToExcel.CreateProcessForm(AOwner: TComponent);
var
  Panel: TPanel;
  Prompt: TLabel;                                           {提示的标签}
begin
  if Assigned(FProgressForm) then
    exit;

  FProgressForm := TForm.Create(AOwner);
  with FProgressForm do
  begin
    try
      Font.Name := '宋体';                                  {设置字体}
      Font.Size := 9;
      BorderStyle := bsNone;
      Width := 300;
      Height := 100;
      BorderWidth := 1;
      Color := clBlack;
      Position := poScreenCenter;

      Panel := TPanel.Create(FProgressForm);
      with Panel do
      begin
        Parent := FProgressForm;
        Align := alClient;
        BevelInner := bvNone;
        BevelOuter := bvRaised;
        Caption := '';
      end;

      Prompt := TLabel.Create(Panel);
      with Prompt do
      begin
        Parent := Panel;
        AutoSize := True;
        Left := 25;
        Top := 25;
        Caption := '正在导出数据，请稍候......';
        Font.Style := [fsBold];
      end;

      FGauge := TGauge.Create(Panel);
      with FGauge do
      begin
        Parent := Panel;
        ForeColor := clBlue;
        Left := 20;
        Top := 50;
        Height := 13;
        Width := 260;
        MinValue := 0;
        MaxValue := DBGrid.DataSource.DataSet.RecordCount;
      end;
    except

    end;
  end;

  FProgressForm.Show;
  FProgressForm.Update;
end;

procedure TDBGridToExcel.SetDataSetCrossIndexDBGrid;
var
  i: integer;
begin
  for i := 0 to DBGrid.Columns.Count - 1 do
  begin
    if DBGrid.Columns.Items[i].FieldName = '' then
      Continue;

    DBGrid.DataSource.DataSet.FieldByName(DBGrid.Columns.Items[i].FieldName).Index := i;
    DBGrid.DataSource.DataSet.FieldByName(DBGrid.Columns.Items[i].FieldName).DisplayLabel
//      := DBGrid.Columns.Items[i].Title.Caption;
      := DBGrid.Columns.Items[i].Header;
    DBGrid.DataSource.DataSet.FieldByName(DBGrid.Columns.Items[i].FieldName).Visible :=
//      DBGrid.Columns.Items[i].Visible;
      DBGrid.Columns.Items[i].Width > 0;
  end;

  for i := 0 to DBGrid.DataSource.DataSet.FieldCount - 1 do
  begin
    if POS('*****',DBGrid.DataSource.DataSet.Fields[i].DisplayLabel) > 0 then
      DBGrid.DataSource.DataSet.Fields[i].Visible := False;
  end;  
end;

end.
