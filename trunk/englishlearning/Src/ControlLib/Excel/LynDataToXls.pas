{            记录集数据导出到组件 TLynDataSetToExcel V1.0 版本                 }
{来源：该组件设计思想来自王寒松 CReport 中文报表组件，即直接用流写xls格式文件  }
{特点:该组件直接按照Excel各Cell格式用流的形式写Excel文件，所以无需安装Excel服务}

{-------------- by 天行者 lynmison@126.com @2005.12.27 ------------------------}

unit LynDataToXls;

interface

uses
  SysUtils, Classes, DB;

type
  {表字段字典}
  TLynField=record
    id             : integer;   {序号}
    name     : string;    {字段名称}
    sName         : string;    {显示名称}
    width    : integer;   {宽度}
  end;
  {字段列表--------------------------------------------------------------------}
  TLynFieldList=record
      nField: integer;
    fields: array of TLynField;
  end;

type
  TLynDataSetToExcel = Class(TComponent)
  private
    FMax: Word;
    FCol: Word;
    FRow: Word;
    FFields: TLynFieldList;
    FHeader: TStrings;
    FFooter: TStrings;
    FCaption: String;
    FDataSet: TDataSet;
    FStream: TStream;
    FBookMark: TBookmark;

    procedure SetHeader(Value: TStrings);
    procedure SetFooter(Value: TStrings);

    procedure IncColRow(NewRow: Boolean=FALSE);
    procedure WriteBlankCell(NewRow: Boolean=FALSE);
    procedure WriteFloatCell(const AValue: Double; NewRow: Boolean=FALSE);
    procedure WriteIntegerCell(const AValue: Integer; NewRow: Boolean=FALSE);
    procedure WriteStringCell(const AValue: String; NewRow: Boolean=FALSE);
    procedure WritePrefix;
    procedure WriteSuffix;
    procedure WriteHeader;
    procedure WriteColumnHead();
    procedure WriteCaption;
    procedure WriteFooter;
    procedure WriteDataCell;

    procedure CalcMaxColumn();
    procedure SaveExcelStream(Stream: TStream);
  public
    procedure SaveExcelFile(FileName: String);
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
      property Fields    : TLynFieldList read FFields write FFields;
    property Header    : TStrings read FHeader write SetHeader;
    property Footer    : TStrings read FFooter write SetFooter;
    property Caption: String read FCaption write FCaption;
    property DataSet: TDataSet read FDataSet write FDataSet;
  end;

procedure Register;

implementation

var
  XlsBof   : array[0..5] of Word = ($809, 8, 0, $10, 0, 0);
  XlsEof   : array[0..1] of Word = ($0A, 00);
  XlsLabel : array[0..5] of Word = ($204, 0, 0, 0, 0, 0);
  XlsNumber: array[0..4] of Word = ($203, 14, 0, 0, 0);
  XlsRk    : array[0..4] Of Word = ($27E, 10, 0, 0, 0);
  XlsBlank : array[0..4] of Word = ($201, 6, 0, 0, $17);

procedure TLynDataSetToExcel.SetHeader(Value: TStrings);
begin
  if Value=nil then FHeader.Clear
  else FHeader.Assign(Value);
end;

procedure TLynDataSetToExcel.SetFooter(Value: TStrings);
begin
  if Value=nil then FFooter.Clear
  else FFooter.Assign(Value);
end;

constructor TLynDataSetToExcel.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FDataSet := nil;
  FHeader := TStringList.Create;
  FFooter := TStringList.Create;
end;

procedure TLynDataSetToExcel.IncColRow(NewRow: Boolean=FALSE);
begin
  if (NewRow) or (FCol>=FMax-1) then
  begin
    FCol := 0;
    Inc(FRow);
  end
  else Inc(FCol);
end;

procedure TLynDataSetToExcel.WriteBlankCell(NewRow: Boolean=FALSE);
Begin
  XlsBlank[2] := FRow;
  XlsBlank[3] := FCol;
  FStream.WriteBuffer(XlsBlank, sizeof(XlsBlank));
  IncColRow(NewRow);
End;

procedure TLynDataSetToExcel.WriteFloatCell(const AValue: Double; NewRow: Boolean=FALSE);
Begin
  XlsNumber[2] := FRow;
  XlsNumber[3] := FCol;
  FStream.WriteBuffer(XlsNumber, sizeof(XlsNumber));
  FStream.WriteBuffer(AValue, 8);
  IncColRow(NewRow);
End;

procedure TLynDataSetToExcel.WriteIntegerCell(Const AValue: Integer; NewRow: Boolean=FALSE);
var
  V: Integer;
Begin
  XlsRk[2] := FRow;
  XlsRk[3] := FCol;
  FStream.WriteBuffer(XlsRk, sizeof(XlsRk));
  V := (AValue Shl 2) Or 2;
  FStream.WriteBuffer(V, 4);
  IncColRow(NewRow);
End;

procedure TLynDataSetToExcel.WriteStringCell(Const AValue: String; NewRow: Boolean=FALSE);
Var
  L: Word;
Begin
  L := Length(AValue);
  XlsLabel[1] := 8 + L;
  XlsLabel[2] := FRow;
  XlsLabel[3] := FCol;
  XlsLabel[5] := L;
  FStream.WriteBuffer(XlsLabel, sizeof(XlsLabel));
  FStream.WriteBuffer(Pointer(AValue)^, L);
  IncColRow(NewRow);
end;

{写入前缀}
procedure TLynDataSetToExcel.WritePrefix;
Begin
  FStream.WriteBuffer(XlsBof, sizeof(XlsBof));
End;

{写入后缀}
procedure TLynDataSetToExcel.WriteSuffix;
begin
  FStream.WriteBuffer(XlsEof, sizeof(XlsEof));
end;

procedure TLynDataSetToExcel.WriteHeader;
var
  i: Integer;
begin
  for i:=0 to FHeader.Count-1 do WriteStringCell(FHeader[i],TRUE);
end;

procedure TLynDataSetToExcel.WriteColumnHead();
var
  n: Word;
begin
    //for n:=0 to FFields.nField-1 do
  begin
      //WriteStringCell(FFields.Fields[n].sName);
  end;
end;

procedure TLynDataSetToExcel.WriteCaption;
begin
  WriteStringCell(FCaption,TRUE);
end;

procedure TLynDataSetToExcel.WriteFooter;
var
  i: Integer;
begin
  for i:=0 to FFooter.Count-1 do WriteStringCell(FFooter[i],TRUE);
end;

procedure TLynDataSetToExcel.WriteDataCell;
var
  n: Word;
  Field: TField;
begin
  WritePrefix();                {写入 Excel 文件头}
  WriteHeader();                {写入题头}
  WriteCaption;                 {写入标题}
  WriteColumnHead();            {写入列标题}

  FDataSet.DisableControls;
  FBookMark := FDataSet.GetBookmark;
//  FDataSet.First;
//  while not FDataSet.Eof do
//  begin
//    for n:=0 to FFields.nField-1 do
//    begin
//        Field :=FDataSet.FindField(FFields.Fields[n].name);
//      if Field<>nil then
//      begin
//          if Field.IsNull then WriteBlankCell
//          else begin
//            case Field.DataType of
//              ftSmallint,
//              ftInteger,
//              ftWord,
//              ftAutoInc,
//              ftBytes,
//            ftLargeint: WriteIntegerCell(Field.AsInteger);
//              ftFloat,
//              ftCurrency,
//              ftBCD:     WriteFloatCell(Field.AsFloat);
//            ftString,
//            ftMemo,
//            ftFixedChar,
//            ftWideString,
//            ftTime,
//            ftDate: WriteStringCell(Field.AsString);
//              else WriteStringCell('');
//            end;
//          end;
//      end
//      else begin
//          WriteBlankCell();
//      end;
//    end;
//    FDataSet.Next;
//  end;
  WriteSuffix;
  WriteFooter;
  FDataSet.GotoBookmark(FBookMark);
  FDataSet.FreeBookmark(FBookMark);
  FDataSet.EnableControls;
end;

procedure TLynDataSetToExcel.CalcMaxColumn();
begin
  FMax := FFields.nField;
end;

procedure TLynDataSetToExcel.SaveExcelStream(Stream: TStream);
begin
  if FDataSet=nil then Exception.Create('未指定导出数据集错误！');
  FCol := 0;
  FRow := 0;
  CalcMaxColumn;
  FStream := Stream;
  WriteDataCell;
end;

procedure TLynDataSetToExcel.SaveExcelFile(FileName: String);
var
  FileStream: TFileStream;
begin
  if FileExists(FileName) then DeleteFile(FileName);
  FileStream := TFileStream.Create(FileName, fmCreate);
  try
    SaveExcelStream(FileStream);
  finally
    FileStream.Free;
  end;
end;

destructor TLynDataSetToExcel.Destroy;
begin
  FHeader.Free;
  FFooter.Free;
  inherited Destroy;
end;

procedure Register;
begin
  RegisterComponents('ControlLib', [TLynDataSetToExcel]);
end;

end.

