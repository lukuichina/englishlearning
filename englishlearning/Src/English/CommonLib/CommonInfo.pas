unit CommonInfo;

interface

uses SysUtils, Dialogs;

type
  TSessionInfo = record
    Session:TGUID;
    SessionID:string;
  end;

var
  SessionInfo:TSessionInfo;

implementation


initialization
  CreateGUID(SessionInfo.Session);
  SessionInfo.SessionID := GuidToString(SessionInfo.Session);

end.
