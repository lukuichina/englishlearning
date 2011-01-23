unit FullScreenDialog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BasicDialog, FullScreen, AdvOfficeImage, ADODB, Menus, AdvMenus,
  AdvMenuStylers, ActnList, AdvGlassButton, AdvPanel, ExtCtrls, RzPanel;

type
  TFullScreenDialogForm = class(TBasicDialogForm)
    imgPicture: TAdvOfficeImage;
    FullScreen1: TFullScreen;
    pmn1: TAdvPopupMenu;
    AdvMenuOfficeStyler2: TAdvMenuOfficeStyler;
    mnuNext: TMenuItem;
    mnuPrevious: TMenuItem;
    mnuExit: TMenuItem;
    N1: TMenuItem;
    actlst1: TActionList;
    actNext: TAction;
    actPrevious: TAction;
    actExit: TAction;
    actFirst: TAction;
    actLast: TAction;
    RzPanel1: TRzPanel;
    btnLast: TAdvGlassButton;
    btnNext: TAdvGlassButton;
    btnExit: TAdvGlassButton;
    btnPrevious: TAdvGlassButton;
    btnFirst: TAdvGlassButton;
    procedure actExitExecute(Sender: TObject);
    procedure actNextExecute(Sender: TObject);
    procedure actPreviousExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure imgPictureClick(Sender: TObject);
    procedure pmn1Popup(Sender: TObject);
    procedure actFirstExecute(Sender: TObject);
    procedure actLastExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FSpWord:TADOStoredProc;
    FCurrentIndex:Integer;
    FPopuped:Boolean;
  public
    { Public declarations }
    property SpWord :TADOStoredProc read FSpWord write FSpWord;
    property CurrentIndex :Integer read FCurrentIndex write FCurrentIndex;
  end;

var
  FullScreenDialogForm: TFullScreenDialogForm;

implementation

uses
  DataModule;

{$R *.dfm}

procedure TFullScreenDialogForm.actExitExecute(Sender: TObject);
begin
  inherited;

  FPopuped := False;

  Close;
end;

procedure TFullScreenDialogForm.actFirstExecute(Sender: TObject);
begin
  inherited;

  if FCurrentIndex = 0 then
  begin
    Exit;
  end;

  FCurrentIndex := 0;

  mnuPrevious.Enabled := FCurrentIndex > 0;

  SpWord.RecNo := FCurrentIndex + 1;

  imgPicture.Picture.LoadFromFile(ConfigInfo.PicPath +
      SpWord.FieldByName('PictureName').AsString);

  RzPanel1.Transparent := False;
  RzPanel1.Transparent := True;
end;

procedure TFullScreenDialogForm.actLastExecute(Sender: TObject);
begin
  inherited;

  if FCurrentIndex = SpWord.RecordCount - 1 then
  begin
    Exit;
  end;

  FCurrentIndex := SpWord.RecordCount - 1;

  mnuPrevious.Enabled := FCurrentIndex > 0;

  SpWord.RecNo := FCurrentIndex + 1;

  imgPicture.Picture.LoadFromFile(ConfigInfo.PicPath +
      SpWord.FieldByName('PictureName').AsString);

  RzPanel1.Transparent := False;
  RzPanel1.Transparent := True;
end;

procedure TFullScreenDialogForm.actNextExecute(Sender: TObject);
begin
  inherited;

  FPopuped := False;

  if FCurrentIndex = SpWord.RecordCount - 1 then
  begin
    Close;
  end
  else
  begin
    Inc(FCurrentIndex);

    mnuPrevious.Enabled := FCurrentIndex > 0;

    SpWord.RecNo := FCurrentIndex + 1;

    imgPicture.Picture.LoadFromFile(ConfigInfo.PicPath +
        SpWord.FieldByName('PictureName').AsString);

    RzPanel1.Transparent := False;
    RzPanel1.Transparent := True;
  end;
end;

procedure TFullScreenDialogForm.actPreviousExecute(Sender: TObject);
begin
  inherited;

  FPopuped := False;

  if FCurrentIndex = 0 then
  begin
    Exit;
  end
  else
  begin
    Dec(FCurrentIndex);

    mnuPrevious.Enabled := FCurrentIndex > 0;

    SpWord.RecNo := FCurrentIndex + 1;

    imgPicture.Picture.LoadFromFile(ConfigInfo.PicPath +
        SpWord.FieldByName('PictureName').AsString);

    RzPanel1.Transparent := False;
    RzPanel1.Transparent := True;
  end;
end;

procedure TFullScreenDialogForm.FormCreate(Sender: TObject);
begin
  inherited;

  btnFirst.Caption := '';
  btnPrevious.Caption := '';
  btnExit.Caption := '';
  btnNext.Caption := '';
  btnLast.Caption := '';
end;

procedure TFullScreenDialogForm.FormShow(Sender: TObject);
begin
  inherited;

  mnuPrevious.Enabled := FCurrentIndex > 0;

  SpWord.First;
  SpWord.RecNo := FCurrentIndex + 1;

  imgPicture.Picture.LoadFromFile(ConfigInfo.PicPath +
      SpWord.FieldByName('PictureName').AsString);

  FullScreen1.FormMain := self;
  FullScreen1.FullScreen := True;

  RzPanel1.Left := Round((Self.ClientWidth - RzPanel1.Width) * 0.5);

end;

procedure TFullScreenDialogForm.imgPictureClick(Sender: TObject);
begin
  inherited;

  if FPopuped then
  begin
    FPopuped := False;
    exit;
  end;

  actNextExecute(pmn1);
end;

procedure TFullScreenDialogForm.pmn1Popup(Sender: TObject);
begin
  inherited;

  FPopuped := True;
end;

end.
