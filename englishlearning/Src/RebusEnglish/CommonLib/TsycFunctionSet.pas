unit TsycFunctionSet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Dialogs, DB, ComCtrls, DBGrids;

function sycExportDateToExcel(ASender: TDBGrid): Boolean;

implementation

uses Forms;

//采用BIFF8格式规范二进制流写入XLS文件
function sycExportDateToExcel(ASender: TDBGrid): Boolean;
var arXlsBegin: array[0..5] of Word ;
var arXlsEnd: array[0..1] of Word;
var arXlsString: array[0..5] of Word;
var arXlsNumber: array[0..4] of Word;
var arXlsInteger: array[0..4] of Word;
var arXlsBlank: array[0..4] of Word;
var i : Integer;
var Col, Row: WORD;
var aBookMark: TBookMark;
var aFileStream: TFileStream;
var aSaveDlg : TSaveDialog;
var xlsFileName : string;
//--------------内嵌写单元格函数开始-----------------------
procedure XLSWriteStringCell(nRow,nCol : WORD;AValue: String);//写字符串数据
var L: Word;
var _str : AnsiString;
begin
_str:=AnsiString(AValue);//强制类型转换,兼容Delphi2009,采用String类型要乱码,Delphi2007以下此行代码无所谓
L := Length(_str);//Length返回的字符个数,采用AnsiString也就是字节长度
arXlsString[1] := 8 + L;
arXlsString[2] := nRow;
arXlsString[3] := nCol;
arXlsString[5] := L;
aFileStream.WriteBuffer(arXlsString, SizeOf(arXlsString));
aFileStream.WriteBuffer(Pointer(_str)^, L);//字节长度
end;

procedure XLSWriteIntegerCell(nRow,nCol : WORD;AValue: Integer);//写整数
var V: DWORD;
begin
arXlsInteger[2] := nRow;
arXlsInteger[3] := nCol;
aFileStream.WriteBuffer(arXlsInteger, SizeOf(arXlsInteger));
V := (AValue shl 2) or 2;
aFileStream.WriteBuffer(V, 4);
end;

procedure XLSWriteFloatCell(nRow,nCol : WORD;AValue: Double);//写浮点数
begin
arXlsNumber[2] := nRow;
arXlsNumber[3] := nCol;
aFileStream.WriteBuffer(arXlsNumber, SizeOf(arXlsNumber));
aFileStream.WriteBuffer(AValue, 8);
end;
//--------------内嵌写单元格函数结束-----------------------
begin
//-----------------------主函数体开始------------------------
//单元格记录的BIFF8定义,直所以用代码初始化数组，就是为了函数绿色嘛。。。
arXlsBegin[0]:=$809;arXlsBegin[1]:=8;arXlsBegin[2]:=0;arXlsBegin[3]:=$10;arXlsBegin[4]:=0;arXlsBegin[5]:=0 ;
arXlsEnd[0]:=$0A;arXlsEnd[1]:=0;
arXlsString[0]:=$204;arXlsString[1]:=0;arXlsString[2]:=0;arXlsString[3]:=0;arXlsString[4]:=0;arXlsString[5]:=0;
arXlsNumber[0]:=$203;arXlsNumber[1]:=14;arXlsNumber[2]:=0;arXlsNumber[3]:=0;arXlsNumber[4]:=0;
arXlsInteger[0]:=$27E;arXlsInteger[1]:=10;arXlsInteger[2]:=0;arXlsInteger[3]:=0;arXlsInteger[4]:=0;
arXlsBlank[0]:=$201;arXlsBlank[1]:=6;arXlsBlank[2]:=0;arXlsBlank[3]:=0;arXlsBlank[4]:=$17;

//将DBGrid数据导出到Excel表
Result:=False;
if ASender=nil then
    Exit;
if not Assigned(ASender) then
    Exit; //数据表未分配
if ASender.Columns.Count=0 then
    Exit;//DBGrid没有固定列
if not Assigned(ASender.DataSource) then
    Exit; //数据源表未分配
if not Assigned(ASender.DataSource.DataSet) then
    Exit; //数据集未分配
if not ASender.DataSource.DataSet.Active then
    Exit; //数据集未打开
if ASender.DataSource.DataSet.RecordCount=0 then
    Exit; //数据集无记录
if ASender.DataSource.DataSet.RecordCount>65535 then
    begin
    if Application.MessageBox('由于数据量太多,Excel电子表格只能容纳最前面的65535条资料,之后的资料无法导出,确认要导出吗!','提示',MB_ICONQUESTION or MB_YESNO) <>mrYes then
        Exit;//用户放弃导出
    end;

aSaveDlg:=TSaveDialog.Create(nil);
aSaveDlg.Title:='输入导出数据的Excel电子表格文件名称';
aSaveDlg.Filter:='Microsoft Excel电子表格文件|*.XLS';
aSaveDlg.DefaultExt:='XLS';
aSaveDlg.Options:=[ofHideReadOnly,ofFileMustExist,ofPathMustExist];
if not aSaveDlg.Execute then
    begin //注意此对话框用户可能改变程序的“当前文件夹”位置，函数反会后，为了程序更健壮，建议处理重置当前文件夹位置
    aSaveDlg.Free;
    Exit;//文件打开失败或用户撤销
    end;
xlsFileName:=aSaveDlg.FileName;//存盘文件名称
aSaveDlg.Free;

if FileExists(xlsFileName) then
    DeleteFile(xlsFileName); //如果选择的导出文件存在，先删除

aFileStream := TFileStream.Create(xlsFileName, fmCreate);
ASender.DataSource.DataSet.DisableControls;
try
    //写文件头
    aFileStream.WriteBuffer(arXlsBegin, SizeOf(arXlsBegin));

    Col:=0;Row:=0;//内XSL表格坐标变量
    //写列头,为第0行
    for i:=0 to ASender.Columns.Count-1 do
        begin //仅导出选中列的标题,并且该列是可见的,并且列标题没有字体删除线风格
        XLSWriteStringCell(Row,Col,ASender.Columns.Items[i].Title.Caption);
        Inc(Col);
        end;

    //写数据集中的数据,从第1行
    Row:=1;Col:=0;
    aBookMark := ASender.DataSource.DataSet.GetBookmark;//保存数据集导出前的光标位置
    ASender.DataSource.DataSet.First;
    while not ASender.DataSource.DataSet.Eof do
        begin
        for i := 0 to ASender.Columns.Count-1 do
            begin
                case ASender.Columns[i].Field.DataType of
                ftSmallint, ftInteger, ftWord, ftAutoInc: //整数字段
                    XLSWriteIntegerCell(Row,Col,ASender.Columns[i].Field.AsInteger);
                ftFloat, ftCurrency, ftBCD://浮点字段
                    XLSWriteFloatCell(Row,Col,ASender.Columns[i].Field.AsFloat)
                else //其它所有类型字段,此处用DisplayText，而不用AsString ,为了模仿和DBGrid里面完全一致的显示效果,所谓的所见即所得效果嘛...
                    XLSWriteStringCell(Row,Col,ASender.Columns[i].Field.DisplayText);
                end;//end of case of
                Inc(Col);//一行内增加列数
            end;//end of for
        if Row=65535 then
            Break;//写完第65535行后(如果有)，直接退出循环，包括标题，最多65536行(行标从0到65535)

        Inc(Row);//开始新的一行
        Col:=0;//新的一行开始，从第0列开始计数
        ASender.DataSource.DataSet.Next;
        end;// end of while

    //写文件尾
    aFileStream.WriteBuffer(arXlsEnd, SizeOf(arXlsEnd));
    if ASender.DataSource.DataSet.BookmarkValid(aBookMark) then
        ASender.DataSource.DataSet.GotoBookmark(aBookMark);//还原数据集导出前的光标位置
    Result:=True;
except
    Result:=False;
end; //end of try

//存盘文件
aFileStream.Free;
ASender.DataSource.DataSet.EnableControls;

end;

end.
