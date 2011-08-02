unit DownloadThread;

interface

uses
  Classes, advgrid;

type
  TUpdateEvent = procedure (const RowIndex:Integer;const DestFile,FDownloadStatus:string)
                    of object;

type
  TDownloadThread = class(TThread)
  private
    { Private declarations }
    grdCsvInfo:TAdvStringGrid;
    FSavePath:string;
    FDestFile:string;
    FDownloadStatus:string;
    FRowIndex:integer;
  protected
    procedure Execute; override;
    procedure UpdateGrid;
  public
     property CsvInfo:TAdvStringGrid write grdCsvInfo;
     property SavePath:string write FSavePath;
  end;

implementation

uses SysUtils, UserStrUtils;

{ 
  Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);  

  and UpdateCaption could look like,

    procedure DownloadThread.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; 
    
    or 
    
    Synchronize( 
      procedure 
      begin
        Form1.Caption := 'Updated in thread via an anonymous method' 
      end
      )
    );
    
  where an anonymous method is passed.
  
  Similarly, the developer can call the Queue method with similar parameters as 
  above, instead passing another TThread class as the first parameter, putting
  the calling thread in a queue with the other thread.
    
}

{ DownloadThread }

procedure TDownloadThread.Execute;
var
  RowIndex: Integer; //需要设置的列
  URL:string;
  DestFile, name, rname, PictureSavePath, strWord: string;
  len, p: integer;
begin
  { Place thread code here }

  for RowIndex := 1 to grdCsvInfo.RowCount - 1 do
  begin
   //PictureSavePath := edtSavePath.Text + '\';
   PictureSavePath := FSavePath;

   strWord := grdCsvInfo.Rows[RowIndex][1];
   URL := grdCsvInfo.Rows[RowIndex][2];

   if strWord <> '' then
      PictureSavePath := PictureSavePath + UpperCase(Copy(strWord, 1, 1)) + '\' + strWord + '\'
    else
      PictureSavePath := PictureSavePath + 'temp\';

   len := length(Url);
   p := rpos('/', Url);
   name := copy(Url, p + 1, len - p);

   name := replace(name);
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

    if DownloadFile(Url, DestFile) and FileExists(DestFile) then
    begin
      //grdCsvInfo.Rows[RowIndex][4] := '成功';
      FDownloadStatus := '成功';
    end
    else
    begin
      //grdCsvInfo.Rows[RowIndex][4] := '失败';
      FDownloadStatus := '失败';
    end;

    FRowIndex := RowIndex;
    FDestFile := DestFile;
    Synchronize(UpdateGrid);
    //grdCsvInfo.Rows[RowIndex][3] := DestFile;
  end;
end;

procedure TDownloadThread.UpdateGrid;
begin
  grdCsvInfo.Rows[FRowIndex][3] := FDestFile;
  grdCsvInfo.Rows[FRowIndex][4] := FDownloadStatus;
end;

end.
