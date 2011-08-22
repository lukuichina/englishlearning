unit CommonInfo;

interface

uses SysUtils, Dialogs, TConfiguratorUnit, TLoggerUnit;

type
  TSessionInfo = record
    Session:TGUID;
    SessionID:string;
  end;

var
  SessionInfo:TSessionInfo;
  logger : TLogger;

  procedure InitCommonInfo;

implementation

uses DataModule, DateUtils, TLevelUnit, TFileAppenderUnit, TSimpleLayoutUnit;

const
  LOG_FILE:string = 'log_%s.log';

var
  strLogPath:string;
  appender:TFileAppender;

procedure InitCommonInfo;
begin
  CreateGUID(SessionInfo.Session);
  SessionInfo.SessionID := GuidToString(SessionInfo.Session);

  TConfiguratorUnit.doBasicConfiguration;
  logger := TLogger.getInstance;
  logger.setLevel(TLevelUnit.INFO);//如果要关闭日志功能，这句改为logger.setLevel(TLevelUnit.OFF);

  if logger.GetLevel <> TLevelUnit.OFF then
  begin
    strLogPath := Format('%s\%s%s', [GetCurrentDir, ConfigInfo.LogPath,
        Format(LOG_FILE, [FormatDateTime('yyyyMMdd',Date)])]);

    if not FileExists(strLogPath) then
    begin
      logger.addAppender(TFileAppender.Create(strLogPath))
    end
    else
    begin
      appender := TFileAppender.Create;
      appender.setAppend(True);
      appender.SetLayout(TSimpleLayout.Create);
      appender.SetFile(strLogPath);

      logger.AddAppender(appender);
    end;

  end;
end;

initialization


finalization
   TLogger.freeInstances;

end.
