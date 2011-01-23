unit Excel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, DBCtrls, StdCtrls, Grids, DBGrids, ComCtrls, ExtCtrls,
  ComObj,DBAdvGrid;

procedure CopyDbAdvDataToExcel(Args: array of const);

implementation

{
功能描述：把DBGrid输出到Excel表格（支持多Sheet）
调用格式：CopyDbAdvDataToExcel([DBAdvGrid1, DBAdvGrid2]);
}
procedure CopyDbAdvDataToExcel(Args: array of const);
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

    TDBAdvGrid(Args[I].VObject).BeginUpdate;

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

        Sheet.Cells[jCount + 1, iCount + 1] :=
        TDBAdvGrid(Args[I].VObject).Columns.Items[iCount].Field.AsString;
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
    TDBAdvGrid(Args[I].VObject).Refresh;

    TDBAdvGrid(Args[I].VObject).EndUpdate;
  end;
  Screen.Cursor := crDefault;
end;

end.
