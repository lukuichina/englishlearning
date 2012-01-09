unit FullScreenDialog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BasicDialog, FullScreen, AdvOfficeImage, ADODB, Menus, AdvMenus,
  AdvMenuStylers, ActnList, AdvGlassButton, RzPanel, ExtCtrls;

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
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FSpWord:TADOStoredProc;
    FCurrentIndex:Integer;
    FPopuped:Boolean;
    LeftID,RightID,UpID,DownID:Word;

  protected
    procedure WMHotKey(var Msg: TWMHotKey);message WM_HOTKEY;

  public
    { Public declarations }
    property SpWord :TADOStoredProc read FSpWord write FSpWord;
    property CurrentIndex :Integer read FCurrentIndex write FCurrentIndex;
  end;

var
  FullScreenDialogForm: TFullScreenDialogForm;

implementation

uses
  CommonInfo;

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
Var
  TmpID:Integer;
begin
  inherited;

  btnFirst.Caption := '';
  btnPrevious.Caption := '';
  btnExit.Caption := '';
  btnNext.Caption := '';
  btnLast.Caption := '';

  TmpID:=GlobalFindAtom('FullScreen_Left');
  if TmpID=0 then //查找全局原子.如果返回值不为0,则说明这个全局原子已经被注册;
    LeftID:=GlobalAddAtom('FullScreen_Left')
  else
    LeftID:=TmpID;

  TmpID:=GlobalFindAtom('FullScreen_RIGHT');
  if TmpID=0 then
    RightID:=GlobalAddAtom('FullScreen_RIGHT')
  else
    RightID:=TmpID;

  TmpID:=GlobalFindAtom('FullScreen_UP');
  if TmpID=0 then
    UpID:=GlobalAddAtom('FullScreen_UP')
  else
    UpID:=TmpID;

  TmpID:=GlobalFindAtom('FullScreen_DOWN');
  if TmpID=0 then
    DownID:=GlobalAddAtom('FullScreen_DOWN')
  else
    DownID:=TmpID;

  RegisterHotKey(Handle, LeftID, 0, VK_LEFT);//注册热键:LEFT
  RegisterHotKey(Handle, RightID, 0, VK_RIGHT);//注册热键:RIGHT
  RegisterHotKey(Handle, UpID, 0, VK_UP);//注册热键:UP
  RegisterHotKey(Handle, DownID, 0, VK_DOWN);//注册热键:DOWN
end;

procedure TFullScreenDialogForm.FormDestroy(Sender: TObject);
begin
  inherited;

  UnregisterHotKey(Handle,LeftID);//释放热键LEFT
  UnregisterHotKey(Handle,RightID);//释放热键RIGHT
  UnregisterHotKey(Handle,UpID);//释放热键UP
  UnregisterHotKey(Handle,DownID);//释放热键DOWN

  GlobalDeleteAtom(LeftID);//删除全局原子LeftID
  GlobalDeleteAtom(RightID);//删除全局原子RightID
  GlobalDeleteAtom(UpID);//删除全局原子UpID
  GlobalDeleteAtom(DownID);//删除全局原子DownID
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

procedure TFullScreenDialogForm.WMHotKey(var Msg: TWMHotKey);
begin
  if (Msg.HotKey = LeftID) or (Msg.HotKey = UpID) then //热键LEFT、UP的消息.
  begin
    actPreviousExecute(nil);
  end
  else if (Msg.HotKey = RightID) or (msg.HotKey = DownID) then //热键RIGHT、DOWN的消息.
  begin
    actNextExecute(nil);
  end;
end;

end.
