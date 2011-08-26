unit DBGridToExcel;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ComCtrls, ExtCtrls, StdCtrls, Gauges, ShellApi, DBAdvGrid;

type
  TTitleCell = array of array of String;

  //�ֽ�DBGrid�ı���
  TDBGridTitle = class
  private
    FDBGrid: TDBAdvGrid;  //��ӦDBGrid
    FColumnCount: integer; //DBGrid����(ָvisibleΪTrue������)
    FRowCount: integer;    //DBGrid���ͷ����(û�ж��ͷ�����Ϊ1)
    procedure SetDBGrid(const Value: TDBAdvGrid);
    function GetTitleRow: integer;    //��ȡDBGrid���ͷ����
    function GetTitleColumn: integer; //��ȡDBGrid����
  public
    //�ֽ�DBGrid���⣬��TitleCell��ά��̬���鷵��
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
    FProgressForm: TForm;                                  {���ȴ���}
    FGauge: TGauge;                                        {������}
    Stream: TStream;                                       {����ļ���}
    FBookMark: TBookmark;                                  
    FShowProgress: Boolean;                                {�Ƿ���ʾ���ȴ���}
    FDBGrid: TDBAdvGrid;
    FBeginDate: TCaption;                                  {��ʼ����}
    FTitleName: TCaption;                                  {Excel�ļ�����}
    FEndDate: TCaption;                                    {��������}
    FUserName: TCaption;                                   {�Ʊ���}
    FFileName: String;                                     {�����ļ���}
    FOpen:Boolean;{������ûֱ�Ӵ��ļ�}
    procedure SetShowProgress(const Value: Boolean);
    procedure SetDBGrid(const Value: TDBAdvGrid);
    procedure SetBeginDate(const Value: TCaption);
    procedure SetEndDate(const Value: TCaption);
    procedure SetTitleName(const Value: TCaption);
    procedure SetUserName(const Value: TCaption);
    procedure SetFileName(const Value: String);
    procedure SetOpen(const Value: Boolean);

    procedure IncColRow;
    procedure WriteBlankCell;                              {д�յ�Ԫ��}
    {д���ֵ�Ԫ��}
    procedure WriteFloatCell(const AValue: Double; const IncStatus: Boolean=True);
    {д���͵�Ԫ��}
    procedure WriteIntegerCell(const AValue: Integer; const IncStatus: Boolean=True);
    {д�ַ���Ԫ��}
    procedure WriteStringCell(const AValue: string; const IncStatus: Boolean=True);
    procedure WritePrefix;
    procedure WriteSuffix;
    procedure WriteHeader;                                 {���Excel����}
    procedure WriteTitle;                                  {���Excel�б���}
    procedure WriteDataCell;                               {������ݼ�����}
    procedure WriteFooter;                                 {���DBGrid���}
    procedure SaveStream(aStream: TStream);
    procedure CreateProcessForm(AOwner: TComponent);       {���ɽ��ȴ���}
    {���ݱ���޸����ݼ��ֶ�˳���ֶ����ı���}
    procedure SetDataSetCrossIndexDBGrid;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure ExportToExcel; {���Excel�ļ�}
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
  //����
  FCol := 3;
  WriteStringCell(TitleName,False);
  FCol := 0;

  Inc(FRow);

  if Trim(BeginDate) <> '' then
  begin
    //��ʼ����
    FCol := 0;
    WriteStringCell(BeginDate,False);
    FCol := 0
  end;

  if Trim(EndDate) <> '' then
  begin
    //��������
    FCol := 5;
    WriteStringCell(EndDate,False);
    FCol := 0;
  end;

  if (Trim(BeginDate) <> '') or (Trim(EndDate) <> '') then
    Inc(FRow);

  //�Ʊ���
  OpName := '�Ʊ��ˣ�' + UserName;
  FCol := 0;
  WriteStringCell(OpName,False);
  FCol := 0;

  //�Ʊ�ʱ��
  OpDate := '�Ʊ�ʱ�䣺' + DateTimeToStr(Now);
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
            if DBGrid.DataSource.DataSet.Fields[i] Is TBlobfield then  // �����͵��ֶ�(ͼ���)���޷���ȡ��ʾ
              WriteStringCell('')
            else
              WriteStringCell(DBGrid.DataSource.DataSet.Fields[i].AsString);
          end;
        end;
      end;

      //��ʾ���������ȹ���
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

  //���ǰ׺
  WritePrefix;

  //���������
  //WriteHeader;

  //����б���
  //WriteTitle;

  //������ݼ�����
  WriteDataCell;

  //���DBGrid���
  //WriteFooter;

  //�����׺
  WriteSuffix;
end;

procedure TDBGridToExcel.ExportToExcel;
var
  FileStream: TFileStream;
  Msg: String;
begin
  //������ݼ�Ϊ�ջ�û�д����˳�
  if (DBGrid.DataSource.DataSet.IsEmpty) or (not DBGrid.DataSource.DataSet.Active) then
    exit;

  //���������ļ���Ϊ�����˳� 
  if Trim(FileName) = '' then
    exit;
    
  //���ݱ���޸����ݼ��ֶ�˳���ֶ����ı���
  SetDataSetCrossIndexDBGrid;

  Screen.Cursor := crHourGlass;
  try
    try
      if FileExists(FileName) then
      begin
        Msg := '�Ѵ����ļ���' + FileName + '�����Ƿ񸲸ǣ�';
        if Application.MessageBox(PChar(Msg),'��ʾ',MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2) = IDYES then
        begin
          //ɾ���ļ�
          DeleteFile(FileName)
        end
        else
          exit;
      end;

      //��ʾ���ȴ���
      if ShowProgress then
        CreateProcessForm(nil);
        
      FileStream := TFileStream.Create(FileName, fmCreate);
      try
        //����ļ�
        SaveStream(FileStream);
      finally
        FileStream.Free;
      end;
      
      //��Excel�ļ�
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
  Prompt: TLabel;                                           {��ʾ�ı�ǩ}
begin
  if Assigned(FProgressForm) then
    exit;

  FProgressForm := TForm.Create(AOwner);
  with FProgressForm do
  begin
    try
      Font.Name := '����';                                  {��������}
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
        Caption := '���ڵ������ݣ����Ժ�......';
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
