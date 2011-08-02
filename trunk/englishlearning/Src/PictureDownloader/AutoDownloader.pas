unit AutoDownloader;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DB, ADODB, AdvObj,
  BaseGrid, AdvGrid, AdvGridCSVPager, FolderDialog;

type
  TAutoDownloderForm = class(TForm)
    dlgCsv: TOpenDialog;
    pnlTop: TPanel;
    lblInfoPath: TLabel;
    edtCsvPath: TEdit;
    btnSelect: TButton;
    pnlCenter: TPanel;
    pnlBottom: TPanel;
    dsCsv: TDataSource;
    tblCsv: TADOTable;
    csvParser: TAdvGridCSVPager;
    edtSavePath: TEdit;
    btnSavePath: TButton;
    Label1: TLabel;
    grdCsvInfo: TAdvStringGrid;
    btnCancel: TBitBtn;
    btnOK: TBitBtn;
    dlgSavePath: TFolderDialog;
    procedure btnSelectClick(Sender: TObject);
    procedure btnSavePathClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AutoDownloderForm: TAutoDownloderForm;

implementation

uses UrlMon, UserStrUtils, DownloadThread;

{$R *.dfm}

function GetColMaxDataLength(ASGrid: TStringGrid; ACol, AStartRow: Integer): Integer;
 //三个自定义函数和过程放在implementation 后面
 //----------------------------------------------------------------------------//
//取得某一列数据的最大长度
//----------------------------------------------------------------------------//
var
   ColIndex, RowIndex: Integer;
   MaxColLength: Integer; //列数据的最大长度
begin
   MaxColLength := 0;
   with ASGrid do
   begin
     //取得列数据的最大长度
     for RowIndex := AStartRow to RowCount - 1 do
     begin
       if length(Cells[ACol, RowIndex]) > MaxColLength then
       begin
         MaxColLength:= length(Cells[ACol, RowIndex]);
       end;
     end;
   end;
   result := MaxColLength;
end;
//----------------------------------------------------------------------------//
//根据数据长度自动设置指定列的列宽
//----------------------------------------------------------------------------//
procedure SetOneColWidth(ASGrid: TStringGrid; ACol: Integer);
var
   OneCharPixel: Integer; //一个字符所占的像素数
   RightSpaceWidth: Integer; //右边距空隙
begin
   RightSpaceWidth := 3; //设置为3达到和左边距一致的效果
   OneCharPixel := 6; //6对应9号字[*此处最好写成一个根据字号获得像素值的函数*]
   ASGrid.ColWidths[ACol] := GetColMaxDataLength(ASGrid, ACol, 0) * OneCharPixel
   + RightSpaceWidth + 30;  //+30
end;

//----------------------------------------------------------------------------//
//根据数据长度自动设置全部列的列宽
//----------------------------------------------------------------------------//
procedure SetAllColWidth(ASGrid: TStringGrid);
var
   ColIndex: Integer; //需要设置的列
begin
   for ColIndex := 2 to ASGrid.ColCount - 1 do
   begin
     SetOneColWidth(ASGrid, ColIndex);
   end;
end;

//--------------------------------------------------------------------------------

procedure TAutoDownloderForm.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TAutoDownloderForm.btnOKClick(Sender: TObject);
var
  downloadThread:TDownloadThread;
//  RowIndex: Integer; //需要设置的列
//  URL:string;
//  {UrlStr,} DestFile, name, rname, PictureSavePath, InfSavePath, strWord: string;
//   len, p: integer;
begin
  downloadThread := TDownloadThread.Create(True);
  downloadThread.CsvInfo := grdCsvInfo;
  downloadThread.SavePath := edtSavePath.Text + '\';
  downloadThread.Resume;
//  for RowIndex := 1 to grdCsvInfo.RowCount - 1 do
//  begin
//   grdCsvInfo.BeginUpdate;
//   PictureSavePath := edtSavePath.Text + '\';
//
//   strWord := grdCsvInfo.Rows[RowIndex][1];
//   URL := grdCsvInfo.Rows[RowIndex][2];
//
//   if strWord <> '' then
//      PictureSavePath := PictureSavePath + UpperCase(Copy(strWord, 1, 1)) + '\' + strWord + '\'
//    else
//      PictureSavePath := PictureSavePath + 'temp\';
//
//   len := length(Url);
//   p := rpos('/', Url);
//   name := copy(Url, p + 1, len - p);
//
//   name := replace(name);
//   if rpos('.', name) > Length(name) then
//    name := name + '.jpg';
//
//   rname := name;
//
//    while fileexists(PictureSavePath + rname) do
//    begin
//     rname := rename(name);
//    end;
//    name := rname;
//    DestFile := PictureSavePath + name;
//
//    if not DirectoryExists(PictureSavePath) then
//      ForceDirectories(PictureSavePath);
//
//    if DownloadFile(Url, DestFile) and FileExists(DestFile) then
//    begin
//      grdCsvInfo.Rows[RowIndex][4] := '成功';
//    end
//    else
//    begin
//      grdCsvInfo.Rows[RowIndex][4] := '失败';
//    end;
//
//    grdCsvInfo.Rows[RowIndex][3] := DestFile;
//
//    grdCsvInfo.EndUpdate;
//  end;
end;

procedure TAutoDownloderForm.btnSavePathClick(Sender: TObject);
begin
  if not dlgSavePath.Execute then
    exit;

  edtSavePath.Text := dlgSavePath.Directory;
end;

procedure TAutoDownloderForm.btnSelectClick(Sender: TObject);
var
  InputFile: TextFile;
  TmpStringList: TStringList;
  TxtLineData: String;
  I: Integer;
begin
  if not dlgCsv.Execute then
    exit;

  edtCsvPath.Text := dlgCsv.FileName;
//  csvParser.filename := dlgCsv.FileName;
//  csvParser.Open;
//  //csvParser.

  begin
    I := 1;
    grdCsvInfo.RowCount := 1;  //見栄えのために最小にしておく
    grdCsvInfo.ColCount := 1;

    //横の列の数を合わせるための1次的なデータ格納場所
    TmpStringList := TStringList.Create;

    AssignFile(InputFile, dlgCsv.FileName);
    Reset(InputFile);
    try
      while not SeekEof(InputFile) do //ファイルの終わりまで続ける
      begin
        ReadLn(InputFile, TxtLineData);//1行読み込み

        TxtLineData := IntToStr(I) + ', ' + TxtLineData + '未下载';

        //1行のCSV形式のデータを1つ1つのデータに分解する
        //（このCommaTextプロパティに1行のCSVデータを入れると
        //自動的に分解されて配列のように扱える）
        TmpStringList.CommaText := TxtLineData;

        //このif文は読み取ったファイルのデータの数（横の列の数）
        //の最大値をグリッドのColにあわせます
        if TmpStringList.Count > grdCsvInfo.ColCount then
        begin
          grdCsvInfo.ColCount := TmpStringList.Count;
        end;

        //グリッドの行の数を読み込んだファイルの行の数に合わせて増やす
        grdCsvInfo.RowCount := I + 1;

        //文字列のコピー
        grdCsvInfo.Rows[I].Assign(TmpStringList);

        Inc(I);
      end;
      grdCsvInfo.FixedCols := 1;   //この2行は固定カラムの数
      grdCsvInfo.FixedRows := 1;   //（灰色の部分）

      SetAllColWidth(grdCsvInfo);
    finally
      TmpStringList.Free;
      CloseFile(InputFile);
    end;
  end;
end;

procedure TAutoDownloderForm.FormShow(Sender: TObject);
begin
  //Panel1.Left := Trunc((Width - pnlBottom.Width) * 0.5);
end;

end.
