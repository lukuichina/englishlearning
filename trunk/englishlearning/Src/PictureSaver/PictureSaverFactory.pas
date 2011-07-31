unit PictureSaverFactory;

interface

uses
  ComObj, ActiveX, StdVcl;

type

  TPictureSaverFactory = class(TAutoObjectFactory)

  public
    procedure UpdateRegistry(Register: Boolean); override;

  end;

implementation

uses ComServ, Registry, Windows, SysUtils, AutoSaver, PictureSaver_TLB;

function GetDllName: string;
var
  Buffer: array[0..261] of Char;
begin
  GetModuleFileName(HInstance, Buffer, SizeOf(Buffer));

  Result := string(Buffer);
end;

procedure AddExtMenuItem(MenuText, Url: string; Contexts:DWord);
var
  reg: TRegistry;
begin
  Reg := TRegistry.Create;

  with Reg do try
    RootKey := HKEY_CURRENT_USER;

    OpenKey('\Software\Microsoft\Internet Explorer\MenuExt\' + MenuText, True);

    WriteString('', Url);

    WriteInteger('Contexts', contexts);

    WriteString(PICTURE_SAVE_PATH, PICTURE_SAVE_PATH_VALUE);
    WriteString(INF_SAVE_PATH, INF_SAVE_PATH_VALUE);

    CloseKey;
  finally
    Free;
  end;

end;

procedure RemoveExtMenuItem(MenuText: string);
var
  reg: TRegistry;
begin
  Reg := TRegistry.Create;

  with Reg do try
    RootKey := HKEY_CURRENT_USER;

    DeleteKey('\Software\Microsoft\Internet Explorer\MenuExt\' + MenuText);
  finally
    Free;
  end;
end;

procedure TPictureSaverFactory.UpdateRegistry(Register: Boolean);
begin
  inherited;

  if Register then
    AddExtMenuItem(MENU_TEXT, ExtractFilePath(GetDllName)+'PictureSaver.htm', 2)
  else
    RemoveExtMenuItem(MENU_TEXT);
end;

initialization
  TPictureSaverFactory.Create(ComServer, TAutoSaver, Class_AutoSaver,
    ciMultiInstance, tmApartment);

end.
