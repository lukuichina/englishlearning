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

uses UrlMon, StrUtils;

{$R *.dfm}

function rPos(const substr, str: AnsiString): Integer;
begin
   Result := length(str) - pos(AnsiReverseString(substr), AnsiReverseString(str)) + 1;
end;

function rename(filename: string): string;
var
   i, p: integer;
   randomchar: char;
   name, ext: string;
begin
   p := rpos('.', filename);
   name := copy(filename, 1, p - 1);
   ext := copy(filename, p + 1, length(filename) - p);
   result := name;
   for i := 1 to 5 do
   begin
     randomchar := Chr(random(300) mod 26 + 65);
     result := result + randomchar;
   end;
   result := result + '.' + ext;
end;

function DownloadFile(SourceFile, DestFile: string): Boolean;
begin
   try
     Result := UrlDownloadToFile(nil, PChar(SourceFile), PChar(DestFile), 0, nil) = 0;
   except
     Result := False;
   end;
end;

function GetColMaxDataLength(ASGrid: TStringGrid; ACol, AStartRow: Integer): Integer;
 //�����Զ��庯���͹��̷���implementation ����
 //----------------------------------------------------------------------------//
//ȡ��ĳһ�����ݵ���󳤶�
//----------------------------------------------------------------------------//
var
   ColIndex, RowIndex: Integer;
   MaxColLength: Integer; //�����ݵ���󳤶�
begin
   MaxColLength := 0;
   with ASGrid do
   begin
     //ȡ�������ݵ���󳤶�
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
//�������ݳ����Զ�����ָ���е��п�
//----------------------------------------------------------------------------//
procedure SetOneColWidth(ASGrid: TStringGrid; ACol: Integer);
var
   OneCharPixel: Integer; //һ���ַ���ռ��������
   RightSpaceWidth: Integer; //�ұ߾��϶
begin
   RightSpaceWidth := 3; //����Ϊ3�ﵽ����߾�һ�µ�Ч��
   OneCharPixel := 6; //6��Ӧ9����[*�˴����д��һ�������ֺŻ������ֵ�ĺ���*]
   ASGrid.ColWidths[ACol] := GetColMaxDataLength(ASGrid, ACol, 0) * OneCharPixel
   + RightSpaceWidth + 30;  //+30
end;

//----------------------------------------------------------------------------//
//�������ݳ����Զ�����ȫ���е��п�
//----------------------------------------------------------------------------//
procedure SetAllColWidth(ASGrid: TStringGrid);
var
   ColIndex: Integer; //��Ҫ���õ���
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
  RowIndex: Integer; //��Ҫ���õ���
  URL:string;
  {UrlStr,} DestFile, name, rname, PictureSavePath, InfSavePath, strWord: string;
   len, p: integer;
begin
  for RowIndex := 1 to grdCsvInfo.RowCount - 1 do
  begin
   PictureSavePath := edtSavePath.Text + '\';

   if strWord <> '' then
      PictureSavePath := PictureSavePath + UpperCase(Copy(strWord, 1, 1)) + '\' + strWord + '\'
    else
      PictureSavePath := PictureSavePath + 'temp\';

   strWord := grdCsvInfo.Rows[RowIndex][1];
   URL := grdCsvInfo.Rows[RowIndex][2];

   len := length(Url);
   p := rpos('/', Url);
   name := copy(Url, p + 1, len - p);

   name := ReplaceStr(name, '?', '');
   name := ReplaceStr(name, '=', '');
   if rpos('.', name) > Length(name) then
    name := name + '.jpg';


   rname := name;

    while fileexists(PictureSavePath + rname) do
    begin
     rname := rename(name);
    end;
    name := rname;
    DestFile := PictureSavePath + name;

    if not DirectoryExists(PictureSavePath) then
      ForceDirectories(PictureSavePath);

    if DownloadFile(Url, DestFile) then
    begin
      grdCsvInfo.Rows[RowIndex][4] := '�ɹ�';
    end
    else
    begin
      grdCsvInfo.Rows[RowIndex][4] := 'ʧ��';
    end;

    grdCsvInfo.Rows[RowIndex][3] := DestFile;

    //Inc(RowIndex);
  end;
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
    grdCsvInfo.RowCount := 1;  //Ҋ�Ѥ��Τ������С�ˤ��Ƥ���
    grdCsvInfo.ColCount := 1;

    //����Ф�����Ϥ碌�뤿���1�εĤʥǩ`����{����
    TmpStringList := TStringList.Create;

    AssignFile(InputFile, dlgCsv.FileName);
    Reset(InputFile);
    try
      while not SeekEof(InputFile) do //�ե�����νK���ޤǾA����
      begin
        ReadLn(InputFile, TxtLineData);//1���i���z��

        TxtLineData := IntToStr(I) + ', ' + TxtLineData + 'δ����';

        //1�Ф�CSV��ʽ�Υǩ`����1��1�ĤΥǩ`���˷ֽ⤹��
        //������CommaText�ץ�ѥƥ���1�Ф�CSV�ǩ`���������
        //�ԄӵĤ˷ֽ⤵������ФΤ褦�˒Q���룩
        TmpStringList.CommaText := TxtLineData;

        //����if�Ĥ��i��ȡ�ä��ե�����Υǩ`������������Ф�����
        //����󂎤򥰥�åɤ�Col�ˤ��碌�ޤ�
        if TmpStringList.Count > grdCsvInfo.ColCount then
        begin
          grdCsvInfo.ColCount := TmpStringList.Count;
        end;

        //����åɤ��Ф������i���z����ե�������Ф����˺Ϥ碌�Ɖ��䤹
        grdCsvInfo.RowCount := I + 1;

        //�����ФΥ��ԩ`
        grdCsvInfo.Rows[I].Assign(TmpStringList);

        Inc(I);
      end;
      grdCsvInfo.FixedCols := 1;   //����2�ФϹ̶���������
      grdCsvInfo.FixedRows := 1;   //����ɫ�β��֣�

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
