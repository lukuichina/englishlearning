{ GMComponent: Transparent Panel With BorderWidth Difine .-------------------
  ===========================================================================
  Compile by:James.Wonken 2003.10.22 Completed.------------------------------
  Modified by:James.Wonken 2003.10.22 Completed.-----------------------------
            Reference to KingRon Help Documents .----------------------------
    Copyright (C) 2003 GreatMaster Soft Workroom�, wonken@163.com------------
    http://www.gmsoft.com----------------------------------------------------
  ========================================================================= }
unit TransPanel;
interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls;
type
  TTransPnlStyle = (gsBlackness, gsDstInvert, gsMergeCopy, gsMergePaint, gsNotSrcCopy,
                 gsNotSrcErase, gsPatCopy, gsPatInvert, gsPatPaint, gsSrcAnd,
                 gsSrcCopy, gsSrcErase, gsSrcInvert, gsSrcPaint, gsWhiteness);
  TTransPanel = class(TCustomControl)
  private
    FColor: TColor;
    FStyle: TTransPnlStyle;
    FOnPaint: TNotifyEvent;
    procedure SetColor(Value: TColor);
    procedure SetStyle(Value: TTransPnlStyle);
    procedure CMCtl3DChanged(var Message: TMessage); message CM_CTL3DCHANGED;
    procedure WMEraseBkgnd(var Message: TMessage); message WM_ERASEBKGND;
    procedure WMNCPaint (var Message: TMessage); message WM_NCPAINT;
    procedure WMWindowPosChanging(var Message: TWMWindowPosChanging); message WM_WINDOWPOSCHANGING;
  protected
    Buffer: TBitmap;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure Paint; override;
    procedure Resize; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Canvas;
  published
    property Align;
    property Anchors;
    property AutoSize;
    property BiDiMode;
    property BorderWidth;
    property Color: TColor read FColor write SetColor;
    property Ctl3D;
    property Enabled;
    property Style: TTransPnlStyle read FStyle write SetStyle default gsSrcAnd;
    property Visible;
    property OnClick;
    property OnDblClick;
    property OnEnter;
    property OnExit;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnResize;
    property OnPaint: TNotifyEvent read FOnPaint write FOnPaint;
end;

procedure Register;

implementation

uses GMPub;

procedure Register;
begin
  RegisterComponents('ControlLib', [TTransPanel]);
end;

function GlassStyleToInt(gs: TTransPnlStyle): LongInt;
begin
  Result := 0 ;
  case gs of
    gsBlackness : Result := cmBlackness;
    gsDstInvert : Result := cmDstInvert;
    gsMergeCopy : Result := cmMergeCopy;
    gsMergePaint : Result := cmMergePaint;
    gsNotSrcCopy : Result := cmNotSrcCopy;
    gsNotSrcErase: Result := cmNotSrcErase;
    gsPatCopy : Result := cmPatCopy;
    gsPatInvert : Result := cmPatInvert;
    gsPatPaint : Result := cmPatPaint;
    gsSrcAnd : Result := cmSrcAnd;
    gsSrcCopy : Result := cmSrcCopy;
    gsSrcErase : Result := cmSrcErase;
    gsSrcInvert : Result := cmSrcInvert;
    gsSrcPaint : Result := cmSrcPaint;
    gsWhiteness : Result := cmWhiteness;
    else Assert(True, 'Error parameter in function GlassStyleToInt');
  end;
end;

constructor TTransPanel.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Buffer := TBitmap.Create;
  ControlStyle := [csAcceptsControls, csCaptureMouse, csClickEvents,
  csDoubleClicks, csReplicatable];
  Width := 100;
  Height := 100;
  FStyle := gsSrcAnd;
  ParentCtl3d := False;
  Ctl3D := False;
  ParentColor := False;
  FColor := clWhite;
end;

destructor TTransPanel.Destroy;
begin
  Buffer.Free;
  inherited Destroy;
end;

procedure TTransPanel.Paint;
var
  R: TRect;
  rop: LongInt;
begin
  if DesignTime(Self) then  inherited else
  begin
    R := Rect(0, 0, Width, Height);
    Buffer.Width := Width;
    Buffer.Height := Height;
    Buffer.Canvas.Brush.Style := bsSolid;
    Buffer.Canvas.Brush.Color := FColor;
    Buffer.Canvas.FillRect(Rect(0, 0, Width, Height));
    rop := GlassStyleToInt(FStyle);
    StretchBlt(Buffer.Canvas.Handle, 0, 0, Width, Height,
    Canvas.Handle, 0, 0, Width, Height, rop);
    if Ctl3D then DrawEdge(Buffer.Canvas.Handle, R, BDR_RAISEDINNER, BF_RECT);
    Buffer.Canvas.Pen.Mode := pmCopy;
    Buffer.Canvas.Pen.Style := psSolid;
    Canvas.Draw(0, 0, Buffer);
    if Assigned(FOnPaint) then FOnPaint(Self);
  end;
end;

procedure TTransPanel.SetColor(Value: TColor);
begin
  if Value <> FColor then
  begin
    FColor := Value;
    RecreateWnd;
  end;
end;

procedure TTransPanel.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  Params.ExStyle := Params.ExStyle + WS_EX_TRANSPARENT;
end;

procedure TTransPanel.WMWindowPosChanging(var Message: TWMWindowPosChanging);
begin
  Invalidate;
  inherited;
end;

procedure TTransPanel.WMEraseBkgnd(var Message: TMessage);
begin
  Message.Result := 0;
end;

procedure TTransPanel.Resize;
begin
  Invalidate;
  inherited;
end;

procedure TTransPanel.CMCtl3DChanged(var Message: TMessage);
begin
  inherited;
  RecreateWnd;
end;

procedure TTransPanel.SetStyle(Value: TTransPnlStyle);
begin
  if Value <> FStyle then
  begin
    FStyle := Value;
    RecreateWnd;
  end;
end;
procedure TTransPanel.WMNCPaint(var Message: TMessage);
var
  DC: HDC;
  RC, RW: TRect;
begin
    DC := GetWindowDC(Handle);
    SetBkMode(DC,TRANSPARENT);
    if (BorderWidth > 0) then
     begin
       try
         Windows.GetClientRect(Handle, RC);
         GetWindowRect(Handle, RW);
         MapWindowPoints(0, Handle, RW, 2);
         OffsetRect(RC, -RW.Left, -RW.Top);
         InflateRect(RC, BorderWidth, BorderWidth);
         if not DesignTime(self) then  PaintBgrnd(Self, DC, False) ;
       finally
         ReleaseDC(Handle, DC);
       end;
     end;
end;

end.


