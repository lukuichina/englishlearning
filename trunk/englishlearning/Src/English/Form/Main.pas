unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AdvMenus,AdvSmoothExpanderGroup, AdvSmoothPanel, AdvSmoothButton,
  ActnList, GDIPPictureContainer,
  AdvShapeButton, GDIPImageTextButtonItem, GDIPDropDownItem, GDIPHeaderItem,
  GDIPSectionItem, GDIPImageSectionItem, GDIPGroupItem, GDIPRadioItem,
  GDIPCheckItem, GDIPTextItem, GDIPImageTextItem,
  GDIPButtonItem, GDIPCustomItem, GDIPButtonBarItem,
  AdvToolBar, AdvAppStyler;

type
  TMainForm = class(TForm)
    pnl1: TAdvSmoothPanel;
    AdvSmoothExpanderGroup1: TAdvSmoothExpanderGroup;
    btnManageWord: TAdvSmoothButton;
    actlst1: TActionList;
    actManageWord: TAction;
    actSearchWord: TAction;
    actManagePicture: TAction;
    actExplainWord: TAction;
    btnSearchWord: TAdvSmoothButton;
    btnExplainWord: TAdvSmoothButton;
    pcrWord: TGDIPPictureContainer;
    btnViewWord: TAdvSmoothButton;
    actViewWord: TAction;
    btnViewWord1: TAdvSmoothButton;
    actWordExtension: TAction;
    btnViewWord2: TAdvSmoothButton;
    actWordCatalog: TAction;
    actManagePictureLibrary: TAction;
    AdvSmoothPanel1: TAdvSmoothPanel;
    btnManagePictureLibrary: TAdvSmoothButton;
    btnManagePicture: TAdvSmoothButton;
    btnExit: TAdvSmoothButton;
    actExit: TAction;
    procedure actManageWordExecute(Sender: TObject);
    procedure actSearchWordExecute(Sender: TObject);
    procedure actManagePictureExecute(Sender: TObject);
    procedure actExplainWordExecute(Sender: TObject);
    procedure actViewWordExecute(Sender: TObject);
    procedure actWordExtensionExecute(Sender: TObject);
    procedure actWordCatalogExecute(Sender: TObject);
    procedure actManagePictureLibraryExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actExitExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses
  WordInput, WordExplain, WordSearch, WordPicture, WordView, WordExtension,
  WordCatalog, PictureLibrary;

{$R *.dfm}

procedure TMainForm.actExitExecute(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TMainForm.actExplainWordExecute(Sender: TObject);
begin
  try
    WordExplainForm := TWordExplainForm.Create(nil);
    WordExplainForm.ShowModal;
  finally
    WordExplainForm.Free;
  end;
end;

procedure TMainForm.actManagePictureExecute(Sender: TObject);
begin
  try
    WordPictureForm := TWordPictureForm.Create(self);
    WordPictureForm.ShowModal;
  finally
    WordPictureForm.Free;
  end;
end;

procedure TMainForm.actManagePictureLibraryExecute(Sender: TObject);
begin
  try
    PictureLibraryForm := TPictureLibraryForm.Create(nil);
    PictureLibraryForm.ShowModal;
  finally
    PictureLibraryForm.Free;
  end;
end;

procedure TMainForm.actManageWordExecute(Sender: TObject);
begin
  try
    WordInputForm := TWordInputForm.Create(nil);
    WordInputForm.ShowModal;
  finally
    WordInputForm.Free;
  end;
end;

procedure TMainForm.actSearchWordExecute(Sender: TObject);
begin
  try
    WordSearchForm := TWordSearchForm.Create(nil);
    WordSearchForm.ShowModal;
  finally
    WordSearchForm.Free;
  end;
end;

procedure TMainForm.actViewWordExecute(Sender: TObject);
begin
  try
    WordViewForm := TWordViewForm.Create(nil);
    WordViewForm.ShowModal;
  finally
    WordViewForm.Free;
  end;
end;

procedure TMainForm.actWordCatalogExecute(Sender: TObject);
begin
  try
    WordCatalogForm := TWordCatalogForm.Create(nil);
    WordCatalogForm.ShowModal;
  finally
    WordCatalogForm.Free;
  end;
end;

procedure TMainForm.actWordExtensionExecute(Sender: TObject);
begin
  try
    WordExtensionForm := TWordExtensionForm.Create(Self);
    WordExtensionForm.ShowModal;
  finally
    WordExtensionForm.Free;
  end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
//    SetWindowPos(Handle, HWND_TOP, 0, 0, 0, 0,
//      SWP_NOMOVE OR SWP_NOSIZE OR SWP_SHOWWINDOW);
//    SetWindowLong(Handle, GWL_STYLE,
//                  GetWindowLong(Handle, GWL_STYLE) AND WS_CAPTION);
end;

initialization
  RegisterClass(TMainForm);

end.
