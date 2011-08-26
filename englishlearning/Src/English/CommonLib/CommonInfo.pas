unit CommonInfo;

interface

uses SysUtils, Dialogs, TConfiguratorUnit, TLoggerUnit, IniFiles;

type
  TConfigInfo = record
    MainForm :integer;
    ExitOnErr:string;

    OdbcOption:string;
    DsnName :string;

    DbType  :string;
    Server  :string;
    UserName:string;
    Password:string;
    DbName  :string;

    ImgPath :string;
    LibPath :string;
    PicPath :string;
    RtfPath :string;
    TmpPath :string;

    LogPath :string;

    Browser :string;
  end;

type
  TSessionInfo = record
    Session:TGUID;
    SessionID:string;
  end;

var
  SessionInfo:TSessionInfo;
  logger : TLogger;

var
  ConfigInfo :TConfigInfo;

  procedure InitConfigInfo;
  procedure InitCommonInfo;

implementation

uses TLevelUnit, TFileAppenderUnit, TSimpleLayoutUnit;

const
  LOG_FILE:string = 'log_%s.log';

var
  strLogPath:string;
  appender:TFileAppender;

var
  myinifile:TInifile;

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

procedure InitConfigInfo;
begin
    myinifile := TInifile.Create(GetCurrentDir + '\Config.ini');

    ConfigInfo.MainForm := myinifile.ReadInteger('StartInfo','MainForm',0);
    ConfigInfo.ExitOnErr := myinifile.ReadString('StartInfo','ExitOnErr','');

    ConfigInfo.OdbcOption := myinifile.ReadString('OdbcInfo','OdbcOption','');
    ConfigInfo.DsnName := myinifile.ReadString('OdbcInfo','DsnName','');

    ConfigInfo.DbType := myinifile.ReadString('DBServer','DbType','');
    ConfigInfo.Server := myinifile.ReadString('DBServer','Server','');
    ConfigInfo.UserName := myinifile.ReadString('DBServer','UserName','');
    ConfigInfo.Password := myinifile.ReadString('DBServer','Password','');
    ConfigInfo.DbName := myinifile.ReadString('DBServer','DbName','');

    ConfigInfo.ImgPath := myinifile.ReadString('LocalPath','ImgPath','');
    ConfigInfo.LibPath := myinifile.ReadString('LocalPath','LibPath','');
    ConfigInfo.PicPath := myinifile.ReadString('LocalPath','PicPath','');
    ConfigInfo.RtfPath := myinifile.ReadString('LocalPath','RtfPath','');
    ConfigInfo.TmpPath := myinifile.ReadString('LocalPath','TmpPath','');

    ConfigInfo.LogPath := myinifile.ReadString('LogInfo','LogPath','');

    ConfigInfo.Browser := myinifile.ReadString('Program','browser','');
end;

initialization


finalization
   TLogger.freeInstances;
   myinifile.Free;

end.
