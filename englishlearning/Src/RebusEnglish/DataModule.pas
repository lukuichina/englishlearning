unit DataModule;

interface

uses
  SysUtils, Classes, DB, ADODB, AdvAppStyler;

type
  TdmManager = class(TDataModule)
    conEnglish: TADOConnection;
    TAdvAppStyler1: TAdvAppStyler;
    tblWord: TADOTable;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
    FWordList:TStrings;

  public
    { Public declarations }
    procedure InitWordList;

    property WordList:TStrings read FWordList write FWordList;
  end;

var
  dmManager: TdmManager;

implementation

uses Forms, Windows, CommonInfo;

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
      logger.Info('DataModuleCreate');

      FWordList := TStringList.Create;

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

      logger.Info(conEnglish.ConnectionString);

      conEnglish.Connected := True;

      InitWordList;

      logger.Info(BoolToStr(conEnglish.Connected));
    except on err:Exception do
      begin
        logger.Error(err.Message);

        Application.MessageBox(PWideChar(err.Message), 'Error', MB_OK + MB_ICONSTOP);

        if LowerCase(ConfigInfo.ExitOnErr) = 'yes' then
          ExitProcess(0);//Application.Terminate;
      end;
    end;
  finally

  end;

end;

procedure TdmManager.DataModuleDestroy(Sender: TObject);
begin
  FWordList.Free;
end;

procedure TdmManager.InitWordList;
begin
  tblWord.Active := False;
  tblWord.Active := True;

  FWordList.Clear;
  while not tblWord.Eof do
  begin
    FWordList.Add(tblWord.FieldByName('Word').AsString);

    tblWord.Next;
  end;
end;

initialization

end.
