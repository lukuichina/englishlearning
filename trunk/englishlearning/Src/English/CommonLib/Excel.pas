unit Excel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, DBCtrls, StdCtrls, Grids, DBGrids, ComCtrls, ExtCtrls,
  ComObj, DBAdvGrid;

type
  TExcelThread = class(TThread)
  private
    { Private declarations }

  protected
    procedure Execute; override;
    procedure OutputToExcel;

  public

  end;

procedure CopyDbAdvDataToExcel(Args: array of const; const ShowProgress:Boolean = True);
function  getData(grid: TDBAdvGrid): OleVariant; overload;
function  getData(ds: TDataSet): OleVariant; overload;
function  RefToCell(RowID, ColID: Integer): string;

implementation

uses gauges;

var
  Args:array of TVarRec;

var
//fileName: string;
//xlApp, Sheet: OleVariant;
  rowCount, Colcount, index: Integer;
//t1,t2: Int64;
  FProgressForm: TForm;                                  {进度窗体}
  FGauge: TGauge;                                        {进度条}
  ShowProgress: Boolean;
  FGrid:TDBAdvGrid;

procedure CreateProcessForm(AOwner: TComponent);
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
//        MaxValue := DBGrid.DataSource.DataSet.RecordCount;
        MaxValue := FGrid.DataSource.DataSet.RecordCount;
      end;
    except

    end;
  end;

  FProgressForm.Show;
  FProgressForm.Update;

  SetWindowPos(FProgressForm.Handle, HWND_TOPMOST, 0, 0, 0, 0,
      SWP_NOMOVE OR SWP_NOSIZE OR SWP_SHOWWINDOW);
end;

{
功能描述：把DBGrid输出到Excel表格（支持多Sheet）
调用格式：CopyDbAdvDataToExcel([DBAdvGrid1, DBAdvGrid2]);
}
//procedure CopyDbAdvDataToExcel(Args: array of const);
////var
////  I:integer;
////  ExcelThread:TExcelThread;
//var
//  iCount, jCount: Integer;
//  XLApp: Variant;
//  Sheet: Variant;
//  I: Integer;
//  RecNo:Integer;
//begin
////  SetLength(Excel.Args, Length(Args));
////  for I := 0 to Length(Args) - 1 do
////    Excel.Args[I] := Args[I];
////
////  ExcelThread := TExcelThread.Create(True);
////  ExcelThread.Resume;
//  Screen.Cursor := crHourGlass;
//  if not VarIsEmpty(XLApp) then
//  begin
//    XLApp.DisplayAlerts := False;
//    XLApp.Quit;
//    VarClear(XLApp);
//  end;
//
//  try
//    XLApp := CreateOleObject('Excel.Application');
//  except
//    Screen.Cursor := crDefault;
//    Exit;
//  end;
//
//  XLApp.WorkBooks.Add;
//  XLApp.SheetsInNewWorkbook := High(Args) + 1;
//
//  for I := Low(Args) to High(Args) do
//  begin
//    XLApp.WorkBooks[1].WorkSheets[I+1].Name := TDBAdvGrid(Args[I].VObject).Name;
//    Sheet := XLApp.Workbooks[1].WorkSheets[TDBAdvGrid(Args[I].VObject).Name];
//
//    if not TDBAdvGrid(Args[I].VObject).DataSource.DataSet.Active then
//    begin
//      Screen.Cursor := crDefault;
//      Exit;
//    end;
//
//    TDBAdvGrid(Args[I].VObject).BeginUpdate;
//
//    //TDBAdvGrid(Args[I].VObject).DataSource.DataSet.DisableControls;
//    RecNo := TDBAdvGrid(Args[I].VObject).DataSource.DataSet.RecNo;
//    SendMessage(TDBAdvGrid(Args[I].VObject).Handle, WM_SETREDRAW, 0, 0);
//
//    TDBAdvGrid(Args[I].VObject).DataSource.DataSet.first;
//    for iCount := 0 to TDBAdvGrid(Args[I].VObject).Columns.Count - 1 do
//    begin
//      Sheet.Columns[iCount + 1].ColumnWidth  :=
//          TDBAdvGrid(Args[I].VObject).Columns.Items[iCount].Width div 6 ;
//      Sheet.Cells[1, iCount + 1] :=
//          TDBAdvGrid(Args[I].VObject).Columns.Items[iCount].Header;
//    end;
//
//    jCount := 1;
//    while not TDBAdvGrid(Args[I].VObject).DataSource.DataSet.Eof do
//    begin
//      for iCount := 0 to TDBAdvGrid(Args[I].VObject).Columns.Count - 1 do
//      begin
//        if (TDBAdvGrid(Args[I].VObject).Columns.Items[iCount].FieldName = '') then
//        begin
//          Sheet.Cells[jCount + 1, iCount + 1] := '';
//          Continue;
//        end;
//
//        Sheet.Cells[jCount + 1, iCount + 1] :=
//        TDBAdvGrid(Args[I].VObject).Columns.Items[iCount].Field.AsString;
//      end;
//
//
//      Inc(jCount);
//      TDBAdvGrid(Args[I].VObject).DataSource.DataSet.Next;
//    end;
//
//    for iCount := 0 to TDBAdvGrid(Args[I].VObject).Columns.Count - 1 do
//    begin
//      if (TDBAdvGrid(Args[I].VObject).Columns.Items[iCount].Width = 0) or
//         (TDBAdvGrid(Args[I].VObject).Columns.Items[iCount].FieldName = '') then
//        Sheet.Columns[iCount + 1].EntireColumn.delete;
//    end;
//
//    XlApp.Visible := True;
//
//    //TDBAdvGrid(Args[I].VObject).DataSource.DataSet.EnableControls;
//    SendMessage(TDBAdvGrid(Args[I].VObject).Handle, WM_SETREDRAW, 1, 0);
//    TDBAdvGrid(Args[I].VObject).DataSource.DataSet.RecNo := RecNo;
//    TDBAdvGrid(Args[I].VObject).Refresh;
//
//    TDBAdvGrid(Args[I].VObject).EndUpdate;
//  end;
//  Screen.Cursor := crDefault;
//end;

{
功能描述：把DBGrid输出到Excel表格（支持多Sheet）
调用格式：CopyDbAdvDataToExcel([DBAdvGrid1, DBAdvGrid2]);
}
procedure CopyDbAdvDataToExcel(Args: array of const; const ShowProgress:Boolean = True);
var
  iCount, jCount: Integer;
  XLApp: Variant;
  Sheet: Variant;
  I: Integer;
  RecNo:Integer;
begin
  Screen.Cursor := crHourGlass;
  if not VarIsEmpty(XLApp) then
  begin
    XLApp.DisplayAlerts := False;
    XLApp.Quit;
    VarClear(XLApp);
  end;

  try
    XLApp := CreateOleObject('Excel.Application');
  except
    Screen.Cursor := crDefault;
    Exit;
  end;

  XLApp.WorkBooks.Add;
  XLApp.SheetsInNewWorkbook := High(Args) + 1;

  for I := Low(Args) to High(Args) do
  begin
    Excel.ShowProgress := ShowProgress;
    Excel.FGrid := TDBAdvGrid(Args[I].VObject);

    //显示进度窗体
    if ShowProgress then
      CreateProcessForm(nil);

    XLApp.WorkBooks[1].WorkSheets[I+1].Name := TDBAdvGrid(Args[I].VObject).Name;
    Sheet := XLApp.Workbooks[1].WorkSheets[TDBAdvGrid(Args[I].VObject).Name];

    if not TDBAdvGrid(Args[I].VObject).DataSource.DataSet.Active then
    begin
      Screen.Cursor := crDefault;
      Exit;
    end;

    TDBAdvGrid(Args[I].VObject).BeginUpdate;

    //TDBAdvGrid(Args[I].VObject).DataSource.DataSet.DisableControls;
    RecNo := TDBAdvGrid(Args[I].VObject).DataSource.DataSet.RecNo;
    SendMessage(TDBAdvGrid(Args[I].VObject).Handle, WM_SETREDRAW, 0, 0);

    TDBAdvGrid(Args[I].VObject).DataSource.DataSet.first;
    for iCount := 0 to TDBAdvGrid(Args[I].VObject).Columns.Count - 1 do
    begin
      Sheet.Columns[iCount + 1].ColumnWidth  :=
          TDBAdvGrid(Args[I].VObject).Columns.Items[iCount].Width div 6 ;
    end;

    jCount := 1;
    while not TDBAdvGrid(Args[I].VObject).DataSource.DataSet.Eof do
    begin
      Sheet.Range[RefToCell(1, 1), RefToCell(rowCount + 1, colCount + 1)].Value :=
          getData(TDBAdvGrid(Args[I].VObject));
    end;

    for iCount := 0 to TDBAdvGrid(Args[I].VObject).Columns.Count - 1 do
    begin
      if (TDBAdvGrid(Args[I].VObject).Columns.Items[iCount].Width = 0) or
         (TDBAdvGrid(Args[I].VObject).Columns.Items[iCount].FieldName = '') then
        Sheet.Columns[iCount + 1].EntireColumn.delete;
    end;

    XlApp.Visible := True;

    //TDBAdvGrid(Args[I].VObject).DataSource.DataSet.EnableControls;
    SendMessage(TDBAdvGrid(Args[I].VObject).Handle, WM_SETREDRAW, 1, 0);
    TDBAdvGrid(Args[I].VObject).DataSource.DataSet.RecNo := RecNo;
    TDBAdvGrid(Args[I].VObject).Refresh;

    TDBAdvGrid(Args[I].VObject).EndUpdate;
  end;

  if ShowProgress then
    FreeAndNil(FProgressForm);

  Screen.Cursor := crDefault;
end;

procedure TExcelThread.Execute;
var
  iCount, jCount: Integer;
  XLApp: Variant;
  Sheet: Variant;
  I: Integer;
  RecNo:Integer;
begin
  Screen.Cursor := crHourGlass;
  if not VarIsEmpty(XLApp) then
  begin
    XLApp.DisplayAlerts := False;
    XLApp.Quit;
    VarClear(XLApp);
  end;

  try
    XLApp := CreateOleObject('Excel.Application');
  except
    Screen.Cursor := crDefault;
    Exit;
  end;

  XLApp.WorkBooks.Add;
  XLApp.SheetsInNewWorkbook := High(Args) + 1;

  for I := Low(Args) to High(Args) do
  begin
    XLApp.WorkBooks[1].WorkSheets[I+1].Name := TDBAdvGrid(Args[I].VObject).Name;
    Sheet := XLApp.Workbooks[1].WorkSheets[TDBAdvGrid(Args[I].VObject).Name];

    if not TDBAdvGrid(Args[I].VObject).DataSource.DataSet.Active then
    begin
      Screen.Cursor := crDefault;
      Exit;
    end;

//    TDBAdvGrid(Args[I].VObject).BeginUpdate;

    //TDBAdvGrid(Args[I].VObject).DataSource.DataSet.DisableControls;
    RecNo := TDBAdvGrid(Args[I].VObject).DataSource.DataSet.RecNo;
    SendMessage(TDBAdvGrid(Args[I].VObject).Handle, WM_SETREDRAW, 0, 0);

    TDBAdvGrid(Args[I].VObject).DataSource.DataSet.first;
    for iCount := 0 to TDBAdvGrid(Args[I].VObject).Columns.Count - 1 do
    begin
      Sheet.Columns[iCount + 1].ColumnWidth  :=
          TDBAdvGrid(Args[I].VObject).Columns.Items[iCount].Width div 6 ;
      Sheet.Cells[1, iCount + 1] :=
          TDBAdvGrid(Args[I].VObject).Columns.Items[iCount].Header;
    end;

            {xlQuery :=} //Sheet.QueryTables.Add(Recordset(TDBAdvGrid(Args[I].VObject).DataSource.DataSet) ,Sheet.Range[Format('A%d', [2])]);
        //xlQuery.FieldNames := false;
        //xlQuery.Refresh;

    jCount := 1;
    while not TDBAdvGrid(Args[I].VObject).DataSource.DataSet.Eof do
    begin
      for iCount := 0 to TDBAdvGrid(Args[I].VObject).Columns.Count - 1 do
      begin
        if (TDBAdvGrid(Args[I].VObject).Columns.Items[iCount].FieldName = '') then
        begin
          Sheet.Cells[jCount + 1, iCount + 1] := '';
          Continue;
        end;

//        Sheet.Cells[jCount + 1, iCount + 1] :=
//        TDBAdvGrid(Args[I].VObject).Columns.Items[iCount].Field.AsString;
      Synchronize(OutputToExcel);
      end;


      Inc(jCount);
      TDBAdvGrid(Args[I].VObject).DataSource.DataSet.Next;
    end;

    for iCount := 0 to TDBAdvGrid(Args[I].VObject).Columns.Count - 1 do
    begin
      if (TDBAdvGrid(Args[I].VObject).Columns.Items[iCount].Width = 0) or
         (TDBAdvGrid(Args[I].VObject).Columns.Items[iCount].FieldName = '') then
        Sheet.Columns[iCount + 1].EntireColumn.delete;
    end;

    XlApp.Visible := True;

    //TDBAdvGrid(Args[I].VObject).DataSource.DataSet.EnableControls;
    SendMessage(TDBAdvGrid(Args[I].VObject).Handle, WM_SETREDRAW, 1, 0);
    TDBAdvGrid(Args[I].VObject).DataSource.DataSet.RecNo := RecNo;
    //TDBAdvGrid(Args[I].VObject).Refresh;

    //TDBAdvGrid(Args[I].VObject).EndUpdate;
  end;
  Screen.Cursor := crDefault;
end;

procedure TExcelThread.OutputToExcel;
begin
//  Sheet.Cells[jCount + 1, iCount + 1] :=
//        TDBAdvGrid(Args[I].VObject).Columns.Items[iCount].Field.AsString;
end;

function getData(grid: TDBAdvGrid): OleVariant;
var
  Data: OLEVariant;
  i,j : Integer;
begin
  rowCount := grid.RowCount;
  colCount := grid.Columns.Count;
  Data := VarArrayCreate([1, rowCount + 1, 1, colCount + 1], varVariant);
  //1，rowCount 表示第一维数组的上下标，1，colCount表示第二维数组的上下标
  i := 1;
  for j := 0 to colCount - 1 do
  begin
    Data[i,j + 1] := grid.Columns.Items[j].Header;
  end;

  Inc(i);
  grid.DataSource.DataSet.DisableControls;
  try
    grid.DataSource.DataSet.First;
    while not grid.DataSource.DataSet.Eof do
    begin
      for j := 0 to colCount - 1 do
      begin
        if (grid.Columns.Items[j].FieldName = '') then
        begin
          Data[i,j + 1] := '';
          Continue;
        end;

        Data[i,j + 1] := grid.Columns.Items[j].Field.AsString;
      end;
      Inc(i);

      //显示进度条进度过程
      if ShowProgress then
      begin
        FGauge.Progress := grid.DataSource.DataSet.RecNo;
        FGauge.Refresh;
      end;

      grid.DataSource.DataSet.Next;
      Application.ProcessMessages;
    end;
  finally
    grid.DataSource.DataSet.EnableControls;
  end;
  result := Data;
end;

function getData(ds: TDataSet): OleVariant;
var
  Data: OLEVariant;
  i,j : Integer;
begin
  rowCount := ds.RecordCount;
  colCount := ds.FieldCount;
  Data := VarArrayCreate([1, rowCount + 1, 1, colCount], varVariant);
  //1，rowCount 表示第一维数组的上下标，1，colCount表示第二维数组的上下标
  i := 1;
  for j := 0 to colCount - 1 do
  begin
    if not ds.Fields[j].Visible then
      continue;
    Data[i,j + 1] := ds.Fields[j].DisplayLabel;
  end;

  Inc(i);
  ds.DisableControls;
  try
    ds.First;
    while not ds.Eof do
    begin
      for j := 0 to colCount - 1 do
      begin
        Data[i,j + 1] := ds.Fields[j].AsString;
      end;
      Inc(i);
      ds.Next;
      Application.ProcessMessages;
    end;
  finally
    ds.EnableControls;
  end;
  result := Data;
end;

function RefToCell(RowID, ColID: Integer): string;
var
  ACount, APos: Integer;
begin
  ACount := ColID div 26;
  APos := ColID mod 26;
  if APos = 0 then
  begin
    ACount := ACount - 1;
    APos := 26;
  end;
  if ACount = 0 then
    Result := Chr(Ord('A') + ColID - 1) + IntToStr(RowID);
  if ACount = 1 then
    Result := 'A' + Chr(Ord('A') + APos - 1) + IntToStr(RowID);
  if ACount > 1 then
    Result := Chr(Ord('A') + ACount - 1) + Chr(Ord('A') + APos - 1) + IntToStr(RowID);
end;

end.
