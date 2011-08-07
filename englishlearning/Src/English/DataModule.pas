unit DataModule;

interface

uses
  SysUtils, Classes, DB, ADODB, AdvAppStyler, IniFiles;

type
  TConfigInfo = record
    Server  :string;
    UserName:string;
    Password:string;
    DbName  :string;

    ImgPath :string;
    LibPath :string;
    PicPath :string;
    RtfPath :string;
    TmpPath :string;
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

{$R *.dfm}

procedure TdmManager.DataModuleCreate(Sender: TObject);
const
  connectString:string='Provider=SQLOLEDB.1;Password=%s;Persist Security Info=True;User ID=%s;' +
    'Initial Catalog=%s;Data Source=%s;Use Procedure for Prepare=1;' +
    'Auto Translate=True;Packet Size=4096;Workstation ID=%s;Use Encryption for Data=False;' +
    'Tag with column collation when possible=False';
var
  myinifile:TInifile;
begin
  try
    myinifile := TInifile.Create(GetCurrentDir + '\Config.ini');

    ConfigInfo.Server := myinifile.ReadString('DBServer','Server','');
    ConfigInfo.UserName := myinifile.ReadString('DBServer','UserName','');
    ConfigInfo.Password := myinifile.ReadString('DBServer','Password','');
    ConfigInfo.DbName := myinifile.ReadString('DBServer','DbName','');

    ConfigInfo.ImgPath := myinifile.ReadString('LocalPath','ImgPath','');
    ConfigInfo.LibPath := myinifile.ReadString('LocalPath','LibPath','');
    ConfigInfo.PicPath := myinifile.ReadString('LocalPath','PicPath','');
    ConfigInfo.RtfPath := myinifile.ReadString('LocalPath','RtfPath','');
    ConfigInfo.TmpPath := myinifile.ReadString('LocalPath','TmpPath','');

    conEnglish.Connected := False;
    conEnglish.ConnectionString := Format(connectString,
      [ConfigInfo.Password, ConfigInfo.UserName,
       ConfigInfo.DbName, ConfigInfo.Server, ConfigInfo.Server]);
    conEnglish.Connected := True;
  finally
    myinifile.Free;
  end;

end;

end.
