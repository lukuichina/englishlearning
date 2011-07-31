library PictureSaver;

uses
  ComServ,
  PictureSaver_TLB in 'PictureSaver_TLB.pas',
  AutoSaver in 'AutoSaver.pas' {AutoSaver: CoClass},
  PictureSaverFactory in 'PictureSaverFactory.pas';

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer,
  DllInstall;

{$R *.TLB}

{$R *.RES}

begin
end.
