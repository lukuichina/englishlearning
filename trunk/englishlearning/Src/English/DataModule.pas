unit DataModule;

interface

uses
  SysUtils, Classes, DB, ADODB, AdvAppStyler;

type
  TConfigInfo = record
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
begin
  ConfigInfo.PicPath := 'E:\Pictures\English\pic\';
  ConfigInfo.RtfPath := 'E:\Pictures\English\rtf\';
  ConfigInfo.TmpPath := 'E:\Pictures\English\tmp\';
end;

end.
