unit DataModule;

interface

uses
  SysUtils, Classes, DB, ADODB, AdvAppStyler, IniFiles;

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
  TdmManager = class(TDataModule)
    conEnglish: TADOConnection;
    TAdvAppStyler1: TAdvAppStyler;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmManager: TdmManager;
  ConfigInfo :TConfigInfo;

implementation

uses Forms, Windows;

var
  myinifile:TInifile;

{$R *.dfm}

procedure TdmManager.DataModuleCreate(Sender: TObject);
const
  connectString:string='Provider=SQLOLEDB.1;Password=%s;Persist Security Info=True;User ID=%s;' +
    'Initial Catalog=%s;Data Source=%s;Use Procedure for Prepare=1;' +
    'Auto Translate=True;Packet Size=4096;Workstation ID=%s;Use Encryption for Data=False;' +
    'Tag with column collation when possible=False';
  connectString_ODBC:string='Provider=MSDASQL.1;Password=%s;Persist Security Info=True;' +
    'User ID=%s;Initial Catalog=%s;Data Source=%s';
begin
  try
    try


      conEnglish.Connected := False;

      if LowerCase(ConfigInfo.OdbcOption) = 'yes' then
      begin
        conEnglish.ConnectionString := Format(connectString_ODBC,
          [ConfigInfo.Password, ConfigInfo.UserName,
           ConfigInfo.DbName, ConfigInfo.DsnName]);
      end
      else if (LowerCase(ConfigInfo.OdbcOption) = 'no') or (ConfigInfo.OdbcOption = '') then
      begin
        conEnglish.ConnectionString := Format(connectString,
          [ConfigInfo.Password, ConfigInfo.UserName,
           ConfigInfo.DbName, ConfigInfo.Server, ConfigInfo.Server]);
      end;

      conEnglish.Connected := True;
    except on err:Exception do
      begin
        //Application.ShowMainForm := False;
        Application.MessageBox(PWideChar(err.Message), 'Error', MB_OK + MB_ICONSTOP);

        if LowerCase(ConfigInfo.ExitOnErr) = 'yes' then
          ExitProcess(0);//Application.Terminate;
      end;
    end;
  finally
    myinifile.Free;
  end;

end;

initialization
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
end.
