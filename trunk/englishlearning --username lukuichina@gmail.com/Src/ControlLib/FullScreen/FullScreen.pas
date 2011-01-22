{*******************************************************}
{                                                       }
{       TFullScreen                                     }
{                                                       }
{       ∞Ê»®À˘”– (C) 2010 LK                            }
{                                                       }
{*******************************************************}

unit FullScreen;

interface

uses
  SysUtils, Classes,Forms,Windows;

type
  TFullScreen = class(TComponent)
  private
    { Private declarations }
    FFullScreenMode:Boolean;
    FForm:TCustomForm;
    OldState,OldHeight,OldWidth,OldX,OldY:Longint;
    FOldState:TWindowState;
    FAfterModeChanged:TNotifyEvent ;

    Procedure SetFullScreenMode(aVal:Boolean);
  protected
    { Protected declarations }
  public
    { Public declarations }
    property  FullScreen         : Boolean       read FFullScreenMode write SetFullScreenMode;
    property  FormMain           : TCustomForm   read FForm write FForm;
    procedure SaveOldWinState;
  published
    { Published declarations }
    property  AfterModeChanged   : TNotifyEvent  read FAfterModeChanged  write FAfterModeChanged;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('ControlLib', [TFullScreen]);
end;

procedure TFullScreen.SaveOldWinState ;
begin
  if FForm<>nil then
    FOldState:=FForm.WindowState;
end;

procedure TFullScreen.SetFullScreenMode(aVal:Boolean);
begin
  if aVal<>FFullScreenMode then
  begin
    FFullScreenMode:=aVal;

    if FFullScreenMode then
    begin
      OldState:=GetWindowLong(FForm.Handle, GWL_STYLE);
      OldHeight:=FForm.Height;
      OldWidth:=FForm.Width;
      OldX:=FForm.Left ;
      OldY:=FForm.Top;
      SaveOldWinState;
      SetWindowLong(FForm.Handle, GWL_STYLE,
                    GetWindowLong(FForm.Handle, GWL_STYLE) AND NOT WS_CAPTION);
      FForm.windowstate:=wsmaximized;
      FForm.clientHeight:=screen.Height;
      FForm.Refresh;
    end
    else
    begin
      SetWindowLong(FForm.Handle, GWL_STYLE, OldState);
      FForm.Height:=OldHeight;
      FForm.Width:=OldWidth;
      FForm.Left:=OldX;
      FForm.Top:=OldY;
      FForm.Windowstate:=FOldState;
      FForm.Refresh;
    end;
  end;

  if Assigned(FAfterModeChanged) then
    FAfterModeChanged(Self);
end;

end.
