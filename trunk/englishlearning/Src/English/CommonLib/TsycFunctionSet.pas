unit TsycFunctionSet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Dialogs, DB, ComCtrls, DBGrids;

function sycExportDateToExcel(ASender: TDBGrid): Boolean;

implementation

uses Forms;

//����BIFF8��ʽ�淶��������д��XLS�ļ�
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
//--------------��Ƕд��Ԫ������ʼ-----------------------
procedure XLSWriteStringCell(nRow,nCol : WORD;AValue: String);//д�ַ�������
var L: Word;
var _str : AnsiString;
begin
_str:=AnsiString(AValue);//ǿ������ת��,����Delphi2009,����String����Ҫ����,Delphi2007���´��д�������ν
L := Length(_str);//Length���ص��ַ�����,����AnsiStringҲ�����ֽڳ���
arXlsString[1] := 8 + L;
arXlsString[2] := nRow;
arXlsString[3] := nCol;
arXlsString[5] := L;
aFileStream.WriteBuffer(arXlsString, SizeOf(arXlsString));
aFileStream.WriteBuffer(Pointer(_str)^, L);//�ֽڳ���
end;

procedure XLSWriteIntegerCell(nRow,nCol : WORD;AValue: Integer);//д����
var V: DWORD;
begin
arXlsInteger[2] := nRow;
arXlsInteger[3] := nCol;
aFileStream.WriteBuffer(arXlsInteger, SizeOf(arXlsInteger));
V := (AValue shl 2) or 2;
aFileStream.WriteBuffer(V, 4);
end;

procedure XLSWriteFloatCell(nRow,nCol : WORD;AValue: Double);//д������
begin
arXlsNumber[2] := nRow;
arXlsNumber[3] := nCol;
aFileStream.WriteBuffer(arXlsNumber, SizeOf(arXlsNumber));
aFileStream.WriteBuffer(AValue, 8);
end;
//--------------��Ƕд��Ԫ��������-----------------------
begin
//-----------------------�������忪ʼ------------------------
//��Ԫ���¼��BIFF8����,ֱ�����ô����ʼ�����飬����Ϊ�˺�����ɫ�����
arXlsBegin[0]:=$809;arXlsBegin[1]:=8;arXlsBegin[2]:=0;arXlsBegin[3]:=$10;arXlsBegin[4]:=0;arXlsBegin[5]:=0 ;
arXlsEnd[0]:=$0A;arXlsEnd[1]:=0;
arXlsString[0]:=$204;arXlsString[1]:=0;arXlsString[2]:=0;arXlsString[3]:=0;arXlsString[4]:=0;arXlsString[5]:=0;
arXlsNumber[0]:=$203;arXlsNumber[1]:=14;arXlsNumber[2]:=0;arXlsNumber[3]:=0;arXlsNumber[4]:=0;
arXlsInteger[0]:=$27E;arXlsInteger[1]:=10;arXlsInteger[2]:=0;arXlsInteger[3]:=0;arXlsInteger[4]:=0;
arXlsBlank[0]:=$201;arXlsBlank[1]:=6;arXlsBlank[2]:=0;arXlsBlank[3]:=0;arXlsBlank[4]:=$17;

//��DBGrid���ݵ�����Excel��
Result:=False;
if ASender=nil then
    Exit;
if not Assigned(ASender) then
    Exit; //���ݱ�δ����
if ASender.Columns.Count=0 then
    Exit;//DBGridû�й̶���
if not Assigned(ASender.DataSource) then
    Exit; //����Դ��δ����
if not Assigned(ASender.DataSource.DataSet) then
    Exit; //���ݼ�δ����
if not ASender.DataSource.DataSet.Active then
    Exit; //���ݼ�δ��
if ASender.DataSource.DataSet.RecordCount=0 then
    Exit; //���ݼ��޼�¼
if ASender.DataSource.DataSet.RecordCount>65535 then
    begin
    if Application.MessageBox('����������̫��,Excel���ӱ��ֻ��������ǰ���65535������,֮��������޷�����,ȷ��Ҫ������!','��ʾ',MB_ICONQUESTION or MB_YESNO) <>mrYes then
        Exit;//�û���������
    end;

aSaveDlg:=TSaveDialog.Create(nil);
aSaveDlg.Title:='���뵼�����ݵ�Excel���ӱ���ļ�����';
aSaveDlg.Filter:='Microsoft Excel���ӱ���ļ�|*.XLS';
aSaveDlg.DefaultExt:='XLS';
aSaveDlg.Options:=[ofHideReadOnly,ofFileMustExist,ofPathMustExist];
if not aSaveDlg.Execute then
    begin //ע��˶Ի����û����ܸı����ġ���ǰ�ļ��С�λ�ã����������Ϊ�˳������׳�����鴦�����õ�ǰ�ļ���λ��
    aSaveDlg.Free;
    Exit;//�ļ���ʧ�ܻ��û�����
    end;
xlsFileName:=aSaveDlg.FileName;//�����ļ�����
aSaveDlg.Free;

if FileExists(xlsFileName) then
    DeleteFile(xlsFileName); //���ѡ��ĵ����ļ����ڣ���ɾ��

aFileStream := TFileStream.Create(xlsFileName, fmCreate);
ASender.DataSource.DataSet.DisableControls;
try
    //д�ļ�ͷ
    aFileStream.WriteBuffer(arXlsBegin, SizeOf(arXlsBegin));

    Col:=0;Row:=0;//��XSL����������
    //д��ͷ,Ϊ��0��
    for i:=0 to ASender.Columns.Count-1 do
        begin //������ѡ���еı���,���Ҹ����ǿɼ���,�����б���û������ɾ���߷��
        XLSWriteStringCell(Row,Col,ASender.Columns.Items[i].Title.Caption);
        Inc(Col);
        end;

    //д���ݼ��е�����,�ӵ�1��
    Row:=1;Col:=0;
    aBookMark := ASender.DataSource.DataSet.GetBookmark;//�������ݼ�����ǰ�Ĺ��λ��
    ASender.DataSource.DataSet.First;
    while not ASender.DataSource.DataSet.Eof do
        begin
        for i := 0 to ASender.Columns.Count-1 do
            begin
                case ASender.Columns[i].Field.DataType of
                ftSmallint, ftInteger, ftWord, ftAutoInc: //�����ֶ�
                    XLSWriteIntegerCell(Row,Col,ASender.Columns[i].Field.AsInteger);
                ftFloat, ftCurrency, ftBCD://�����ֶ�
                    XLSWriteFloatCell(Row,Col,ASender.Columns[i].Field.AsFloat)
                else //�������������ֶ�,�˴���DisplayText��������AsString ,Ϊ��ģ�º�DBGrid������ȫһ�µ���ʾЧ��,��ν������������Ч����...
                    XLSWriteStringCell(Row,Col,ASender.Columns[i].Field.DisplayText);
                end;//end of case of
                Inc(Col);//һ������������
            end;//end of for
        if Row=65535 then
            Break;//д���65535�к�(�����)��ֱ���˳�ѭ�����������⣬���65536��(�б��0��65535)

        Inc(Row);//��ʼ�µ�һ��
        Col:=0;//�µ�һ�п�ʼ���ӵ�0�п�ʼ����
        ASender.DataSource.DataSet.Next;
        end;// end of while

    //д�ļ�β
    aFileStream.WriteBuffer(arXlsEnd, SizeOf(arXlsEnd));
    if ASender.DataSource.DataSet.BookmarkValid(aBookMark) then
        ASender.DataSource.DataSet.GotoBookmark(aBookMark);//��ԭ���ݼ�����ǰ�Ĺ��λ��
    Result:=True;
except
    Result:=False;
end; //end of try

//�����ļ�
aFileStream.Free;
ASender.DataSource.DataSet.EnableControls;

end;

end.
