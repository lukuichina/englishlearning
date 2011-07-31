library PictureDownloader;

uses
  CtlPanel,
  AppletModule in 'AppletModule.pas' {AutoDownloaderAppletModule: TAppletModule},
  AutoDownloader in 'AutoDownloader.pas' {AutoDownloderForm};

exports CPlApplet;

{$R *.RES}

{$E cpl}

begin
  Application.Initialize;
  Application.CreateForm(TAutoDownloaderAppletModule, AutoDownloaderAppletModule);
  Application.Run;
end.