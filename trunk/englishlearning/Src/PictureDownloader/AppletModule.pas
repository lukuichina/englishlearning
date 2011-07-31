unit AppletModule;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, CtlPanel;

type
  TAutoDownloaderAppletModule = class(TAppletModule)
    procedure AppletModuleActivate(Sender: TObject; Data: Integer);
  private
  { private declarations }
  protected
  { protected declarations }
  public
  { public declarations }
  end;

var
  AutoDownloaderAppletModule: TAutoDownloaderAppletModule;

implementation

uses Dialogs, AutoDownloader, Controls;

{$R *.DFM}

procedure TAutoDownloaderAppletModule.AppletModuleActivate(Sender: TObject;
  Data: Integer);
begin
//  with AutoDownloderForm.Create(Application) do
//  begin
//    if ShowModal = mrOK then
//      Free;
//  end;
  try
    AutoDownloderForm := TAutoDownloderForm.Create(Application);
    AutoDownloderForm.ShowModal;
  finally
    AutoDownloderForm.Free;
  end;

end;

end.