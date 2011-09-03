unit MainMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AdvSmoothExpanderGroup, AdvOfficePager,
  AdvOfficePagerStylers, ImgList, AdvSmoothButton, AdvSmoothPanel, ActnList,
  GDIPPictureContainer;

type
  TMainMenuForm = class(TForm)
    grpMain: TAdvSmoothExpanderGroup;
    AdvSmoothExpanderGroup1: TAdvSmoothExpanderGroup;
    AdvSmoothExpanderGroup2: TAdvSmoothExpanderGroup;
    aop1: TAdvOfficePager;
    advfcpgr: TAdvOfficePage;
    advfcpgr1: TAdvOfficePage;
    advfcpgr2: TAdvOfficePage;
    AdvOfficePagerOfficeStyler1: TAdvOfficePagerOfficeStyler;
    ImageList1: TImageList;
    pcrWord: TGDIPPictureContainer;
    actlst1: TActionList;
    actManageWord: TAction;
    actSearchWord: TAction;
    actExplainWord: TAction;
    actWordExtension: TAction;
    actWordCatalog: TAction;
    actViewWord: TAction;
    actManagePicture: TAction;
    actManagePictureLibrary: TAction;
    actExit: TAction;
    pnl1: TAdvSmoothPanel;
    btnManageWord: TAdvSmoothButton;
    btnSearchWord: TAdvSmoothButton;
    btnExplainWord: TAdvSmoothButton;
    btnViewWord: TAdvSmoothButton;
    btnViewWord1: TAdvSmoothButton;
    btnViewWord2: TAdvSmoothButton;
    AdvSmoothPanel1: TAdvSmoothPanel;
    btnManagePictureLibrary: TAdvSmoothButton;
    btnManagePicture: TAdvSmoothButton;
    btnExit: TAdvSmoothButton;
    procedure actManageWordExecute(Sender: TObject);
    procedure actSearchWordExecute(Sender: TObject);
    procedure actExplainWordExecute(Sender: TObject);
    procedure actWordExtensionExecute(Sender: TObject);
    procedure actWordCatalogExecute(Sender: TObject);
    procedure actViewWordExecute(Sender: TObject);
    procedure actManagePictureExecute(Sender: TObject);
    procedure actManagePictureLibraryExecute(Sender: TObject);
    procedure actExitExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }

  protected
    //procedure WMPowerBroadcast(var Msg: TWMHotKey);message WM_POWERBROADCAST;
    procedure WndProc(var Msg: TMessage); override;

  public
    { Public declarations }
  end;

var
  MainMenuForm: TMainMenuForm;

implementation

uses
  WordInput, WordExplain, WordSearch, WordPicture, WordView, WordExtension,
  WordCatalog, PictureLibrary, CommonInfo;

{$R *.dfm}

procedure TMainMenuForm.actExitExecute(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TMainMenuForm.actExplainWordExecute(Sender: TObject);
begin
  try
    WordExplainForm := TWordExplainForm.Create(nil);
    WordExplainForm.ShowModal;
  finally
    WordExplainForm.Free;
  end;
end;

procedure TMainMenuForm.actManagePictureExecute(Sender: TObject);
begin
  try
    WordPictureForm := TWordPictureForm.Create(self);
    WordPictureForm.ShowModal;
  finally
    WordPictureForm.Free;
  end;
end;

procedure TMainMenuForm.actManagePictureLibraryExecute(Sender: TObject);
begin
  try
    PictureLibraryForm := TPictureLibraryForm.Create(nil);
    PictureLibraryForm.ShowModal;
  finally
    PictureLibraryForm.Free;
  end;
end;

procedure TMainMenuForm.actManageWordExecute(Sender: TObject);
begin
  try
    WordInputForm := TWordInputForm.Create(nil);
    WordInputForm.ShowModal;
  finally
    WordInputForm.Free;
  end;
end;

procedure TMainMenuForm.actSearchWordExecute(Sender: TObject);
begin
  try
    WordSearchForm := TWordSearchForm.Create(nil);
    WordSearchForm.ShowModal;
  finally
    WordSearchForm.Free;
  end;
end;

procedure TMainMenuForm.actViewWordExecute(Sender: TObject);
begin
  try
    WordViewForm := TWordViewForm.Create(nil);
    WordViewForm.ShowModal;
  finally
    WordViewForm.Free;
  end;
end;

procedure TMainMenuForm.actWordCatalogExecute(Sender: TObject);
begin
  try
    WordCatalogForm := TWordCatalogForm.Create(nil);
    WordCatalogForm.ShowModal;
  finally
    WordCatalogForm.Free;
  end;
end;

procedure TMainMenuForm.actWordExtensionExecute(Sender: TObject);
begin
  try
    WordExtensionForm := TWordExtensionForm.Create(Self);
    WordExtensionForm.ShowModal;
  finally
    WordExtensionForm.Free;
  end;
end;

procedure TMainMenuForm.FormCreate(Sender: TObject);
begin
  aop1.ActivePageIndex := 0;

end;

//procedure TMainMenuForm.WMPowerBroadcast(var Msg: TWMHotKey);
//begin
//
//end;

procedure TMainMenuForm.WndProc(var Msg: TMessage);
begin
  if Msg.Msg = WM_POWERBROADCAST then
  begin
    Logger.Warn('WM_POWERBROADCAST');

    if Msg.WParam = PBT_APMQUERYSUSPEND then
    begin
        Logger.Warn('PBT_APMQUERYSUSPEND');
        Msg.Result := BROADCAST_QUERY_DENY;
        Dispatch(Msg);
        Logger.Warn('BROADCAST_QUERY_DENY:未经本程序许可，计算机不能休眠');
        //MessageBox(hwnd, '未经本程序许可，计算机不能休眠！ ', '禁止休眠 ',MB_OK);
        Exit;
    end;
  end;

  inherited;
end;

initialization
  RegisterClass(TMainMenuForm);

end.
