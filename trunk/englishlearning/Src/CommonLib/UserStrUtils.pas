unit UserStrUtils;

interface

uses SysUtils, StrUtils, UrlMon;

function EscapeComma(const value:string):string;
function replace(const value:string):string;
function rPos(const substr, str: AnsiString): Integer;
function rename(filename: string): string;
function DownloadFile(SourceFile, DestFile: string): Boolean;

implementation

function EscapeComma(const value:string):string;
begin
  if Pos(value, ',') > 0 then
    Result := Format('"%s"', [value]);
end;

function replace(const value:string):string;
const
  UNVALID_VALUE = '\/:*?"<>|';
var
  I:integer;
begin
  Result := value;

  for I := 1 to Length(UNVALID_VALUE) do
  begin
    Result := ReplaceStr(Result, UNVALID_VALUE[I], '');
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

function DownloadFile(SourceFile, DestFile: string): Boolean;
begin
   try
     Result := UrlDownloadToFile(nil, PChar(SourceFile), PChar(DestFile), 0, nil) = 0;
   except
     Result := False;
   end;
end;

end.

