unit AutoSaver;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  ComObj, ActiveX, PictureSaver_TLB, StdVcl;

const
   PICTURE_SAVE_PATH_VALUE = 'C:\Images\';
   INF_SAVE_PATH_VALUE = 'C:\Images\information.csv';
   MENU_TEXT = '�Զ�����ͼƬ';
   PICTURE_SAVE_PATH = 'SavePath';
   INF_SAVE_PATH = 'InfPath';

type
  TAutoSaver = class(TAutoObject, IAutoSaver)
  protected
    procedure SaveImage(const Word, URL, Discription: WideString); safecall;

  end;

implementation

uses ComServ, UrlMon, SysUtils, Dialogs, StrUtils, Registry, Windows, Classes, UserStrUtils;

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

procedure TAutoSaver.SaveImage(const Word, URL, Discription: WideString);
var
   {UrlStr,} DestFile, name, rname, PictureSavePath, InfSavePath, strWord: string;
   len, p: integer;
   res: TStringList;
   F: TextFile;
begin
  try
    if Word = '' then
      strWord := InputBox('�����뵥��', '����', '')
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

    name := replace(name);
    if rpos('.', name) > Length(name) then
      name := name + '.jpg';

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
    // ���ļ���F�����������ӣ��������ʹ��F�������ļ����в�
    Append(F); // ��׷�ӵķ�ʽ���ļ�

//    if PictureSavePath = '' then
    if GetPictureSavePath = '' then
    begin
      Writeln(F, Format('%s, %s, %s, %s',
        [strWord, EscapeComma(URL), '', EscapeComma(Discription)]));
      exit;
    end;

    Writeln(F, Format('%s, %s, %s, %s',
      [strWord, EscapeComma(URL), EscapeComma(DestFile), EscapeComma(Discription)]));

    if not DirectoryExists(PictureSavePath) then
      ForceDirectories(PictureSavePath);

    if DownloadFile(Url, DestFile) then
    begin
     MessageDlg(Format('����ɹ�!' + #13#10+'URL: %s' + #13#10+'Path:%s', [Url, DestFile]),
      mtConfirmation, [mbOK], 0);
    end
    else
    begin
     MessageDlg('���治�ɹ���', mtError, [mbOK], 0);
    end;
  finally
    //res.Free;
    CloseFile(F); // �ر��ļ�
  end;

end;

initialization
  TAutoObjectFactory.Create(ComServer, TAutoSaver, Class_AutoSaver,
    ciMultiInstance, tmApartment);
end.
