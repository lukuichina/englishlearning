{ GMComponent: Public Functions and Procedures .-----------------------------
  ===========================================================================
  Compile by:James.Wonken 2003.10.22 Completed.------------------------------
  Modified by:James.Wonken 2003.10.22 Completed.-----------------------------
            Reference to CoolControls Components.----------------------------
    Copyright (C) 2003 GreatMaster Soft Workroom�, wonken@163.com------------
    http://www.gmsoft.com----------------------------------------------------
  ========================================================================= }
unit GMPub;

interface
uses  Windows, Messages, SysUtils, Classes, Forms, Graphics, Controls, Commctrl,
      ImgList, ComCtrls;

function DesignTime(Component: TComponent): Boolean;
function TransControl(SelfControl: TWinControl; TransLevel: Byte): TWinControl;
procedure PaintBgrnd(Control: TWinControl; DC: HDC; DoParent: Boolean);
procedure DrawBg(DC: HDC; Bitmap: TBitmap; Recty: TRect; IsStretch: Boolean; Mode: Integer);
procedure StretchDrawBg(DC: HDC; Bitmap: TBitmap; DCRecty, ImgRecty: TRect; Mode: Integer);
function PointsFakeEqual(APoint1, APoint2: TPoint; Offset: Integer): Boolean;

implementation
type
  TWinCtl = class(TWinControl);

function DesignTime(Component: TComponent): Boolean;
begin
  Result := csDesigning in Component.ComponentState;
end;

function TransControl(SelfControl: TWinControl;
  TransLevel: Byte): TWinControl;
var
  Index: Byte;
begin
  Result := SelfControl;
  if TransLevel > 0 then
    for Index := 0 to Pred(TransLevel) do
      if Result.Parent <> nil then
        Result := Result.Parent else
          Break;
end;

procedure PaintBgrnd(Control: TWinControl; DC: HDC;
  DoParent: Boolean);
var
  P: TPoint;
  SaveIndex: Integer;
begin
  if Assigned(Control) then
  begin
    SaveIndex := SaveDC(DC);
    try
      P := Control.ClientOrigin;
      Windows.ScreenToClient(Control.Parent.Handle, P);
      MoveWindowOrg(DC, -P.X, -P.Y);
      if Assigned(Control.Parent) and DoParent then
      begin
        SendMessage(Control.Parent.Handle, WM_ERASEBKGND, DC, 0);
        TWinCtl(Control.Parent).PaintControls(DC, nil);
      end else
      begin
        SendMessage(Control.Handle, WM_ERASEBKGND, DC, 0);
        TWinCtl(Control).PaintControls(DC, nil);
      end;
    finally
      RestoreDC(DC, SaveIndex);
    end;
  end;
end;

procedure DrawBg(DC: HDC; Bitmap: TBitmap; Recty: TRect;
  IsStretch: Boolean; Mode: Integer);
var
  X, Y: Integer;
begin
  with Recty, Bitmap do
    if IsStretch then
      StretchDrawBg(DC, Bitmap, Recty, Rect(0, 0, Width, Height), Mode)
    else
      begin
        X := Left;
        Y := Top;
        while Y < Bottom do
        begin
          while X < Right do
          begin
            BitBlt(DC, X, Y, Right-X, Bottom-Y, Canvas.Handle, 0, 0, Mode);
            Inc(X, Width);
          end;
          X := Left;
          Inc(Y, Height);
        end;
      end;
end;

procedure StretchDrawBg(DC: HDC; Bitmap: TBitmap; DCRecty,
  ImgRecty: TRect; Mode: Integer);
begin
  with Bitmap do
    StretchBlt(DC, DCRecty.Left, DCRecty.Top, DCRecty.Right - DCRecty.Left, DCRecty.Bottom - DCRecty.Top,
               Canvas.Handle,
               ImgRecty.Left, ImgRecty.Top, ImgRecty.Right - ImgRecty.Left, ImgRecty.Bottom - ImgRecty.Top,
               Mode);
end;

function PointsFakeEqual(APoint1, APoint2: TPoint;
  Offset: Integer): Boolean;
begin
  Result := PtInRect(Rect(APoint1.X-Offset, APoint1.Y-Offset, APoint1.X+Offset, APoint1.Y+Offset), APoint2);
end;


end.


