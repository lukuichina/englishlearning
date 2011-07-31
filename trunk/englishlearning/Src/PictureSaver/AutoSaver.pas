unit AutoSaver;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  ComObj, ActiveX, PictureSaver_TLB, StdVcl;

const
   PICTURE_SAVE_PATH_VALUE = 'C:\Images\';
   INF_SAVE_PATH_VALUE = 'C:\Images\information.csv';
   MENU_TEXT = '自动保存图片';
   PICTURE_SAVE_PATH = 'SavePath';
   INF_SAVE_PATH = 'InfPath';

type
  TAutoSaver = class(TAutoObject, IAutoSaver)
  protected
    procedure SaveImage(const Word, URL, Discription: WideString); safecall;

  end;

implementation

uses ComServ, UrlMon, SysUtils, Dialogs, StrUtils, Registry, Windows, Classes;

function GetInfSavePath:string;
var
  reg: TRegistry;
begin
  Reg := TRegistry.Create;

  with Reg do try
    RootKey := HKEY_CURRENT_USER;

    OpenKey('\Software\Microsoft\Internet Explorer\MenuExt\' + MENU_TEXT, True);

    Result := ReadString(INF_SAVE_PATH);

    CloseKey;
  finally
    Free;
  end;

end;

function GetPictureSavePath:string;
var
  reg: TRegistry;
begin
  Reg := TRegistry.Create;

  with Reg do try
    RootKey := HKEY_CURRENT_USER;

    OpenKey('\Software\Microsoft\Internet Explorer\MenuExt\' + MENU_TEXT, True);

    Result := ReadString(PICTURE_SAVE_PATH);

    CloseKey;
  finally
    Free;
  end;

end;

function DownloadFile(SourceFile, DestFile: string): Boolean;
begin
   try
     Result := UrlDownloadToFile(nil, PChar(SourceFile), PChar(DestFile), 0, nil) = 0;
   except
     Result := False;
   end;
end;

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

procedure TAutoSaver.SaveImage(const Word, URL, Discription: WideString);
var
   {UrlStr,} DestFile, name, rname, PictureSavePath, InfSavePath, strWord: string;
   len, p: integer;
   res: TStringList;
   F: TextFile;
begin
  try
    if Word = '' then
      strWord := InputBox('请输入单词', '单词', '')
    else
      strWord := Word;

    InfSavePath := GetInfSavePath;
    PictureSavePath := GetPictureSavePath;

    if strWord <> '' then
      PictureSavePath := PictureSavePath + UpperCase(Copy(strWord, 1, 1)) + '\' + strWord + '\'
    else
      PictureSavePath := PictureSavePath + 'temp\';

    if not DirectoryExists(ExtractFilePath(InfSavePath)) then
      ForceDirectories(ExtractFilePath(InfSavePath));

    if not FileExists(InfSavePath) then
    begin
      res := TStringList.create;
      res.SaveToFile(InfSavePath);
      res.Free;
    end;

    //UrlStr := URL;
    //parse file name and get destfile name
    len := length(Url);
    p := rpos('/', Url);
    name := copy(Url, p + 1, len - p);

//    if strWord <> '' then
//      rname := strWord + ExtractFileExt(name)
//    else
      rname := name;

    while fileexists(PictureSavePath + rname) do
    begin
     rname := rename(name);
    end;
    name := rname;
    DestFile := PictureSavePath + name;

    AssignFile(F, InfSavePath);
    // 将文件与F变量建立连接，后面可以使用F变量对文件进行操
    Append(F); // 以追加的方式打开文件

//    if PictureSavePath = '' then
    if GetPictureSavePath = '' then
    begin
      Writeln(F, Format('%s, %s, %s, %s', [strWord, URL, '', Discription]));
      exit;
    end;

    Writeln(F, Format('%s, %s, %s, %s', [strWord, URL, DestFile, Discription]));

    if not DirectoryExists(PictureSavePath) then
      ForceDirectories(PictureSavePath);

    if DownloadFile(Url, DestFile) then
    begin
     MessageDlg(Format('保存成功!' + #13#10+'URL: %s' + #13#10+'Path:%s', [Url, DestFile]),
      mtConfirmation, [mbOK], 0);
    end
    else
    begin
     MessageDlg('保存不成功！', mtError, [mbOK], 0);
    end;
  finally
    //res.Free;
    CloseFile(F); // 关闭文件
  end;

end;

initialization
  TAutoObjectFactory.Create(ComServer, TAutoSaver, Class_AutoSaver,
    ciMultiInstance, tmApartment);
end.
