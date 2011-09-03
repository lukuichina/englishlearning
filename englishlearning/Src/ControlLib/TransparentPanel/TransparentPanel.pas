unit TransparentPanel;

Interface

Uses
  Windows, Messages, Controls, ExtCtrls, Graphics, Classes;

Type
  TTransparentPanel = Class(TPanel)
  Private
    FTransparentRate: Integer;          // ͸����
    FBkGnd: TBitmap;          // ����buffer
    Procedure SetTransparentRate(Value: Integer);
    Procedure WMEraseBkgnd(Var Msg: TMessage); Message WM_ERASEBKGND;
  Protected
    Procedure SetParent(AParent: TWinControl); Override;
    Procedure CreateParams(Var Params: TCreateParams); Override;
    Procedure Paint; Override;
  Public
    Constructor Create(AOwner: TComponent); Override;
    Destructor Destroy; Override;
    Procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); Override;
  Published
    Property TransparentRate: Integer Read FTransparentRate Write SetTransparentRate;
  End;

procedure   Register;

Implementation

Type
  T24Color = Record
    B, G, R: Byte;
  End;
  P24Color = ^T24Color;

procedure   Register;
begin
    RegisterComponents('ControlLib',   [TTransparentPanel]);
end;

Procedure TTransparentPanel.SetTransparentRate(Value: Integer);
Begin
  If (Value < 0) Or (Value > 100) Then Exit;
  If Value <> FTransparentRate Then
  Begin
    FTransparentRate := Value;
    FBkGnd.Assign(Nil);
    RecreateWnd;
  End;
End;

Procedure TTransparentPanel.WMEraseBkgnd(Var Msg: TMessage);
Begin
  Msg.Result := 1;
End;

Procedure TTransparentPanel.SetParent(AParent: TWinControl);
Begin
  Inherited SetParent(AParent);
  If (AParent <> Nil) And AParent.HandleAllocated And (GetWindowLong(AParent.Handle, GWL_STYLE) And WS_CLIPCHILDREN <> 0) Then
    SetWindowLong(AParent.Handle, GWL_STYLE,
      GetWindowLong(AParent.Handle, GWL_STYLE) And Not WS_CLIPCHILDREN);
End;

Procedure TTransparentPanel.CreateParams(Var Params: TCreateParams);
Begin
  Inherited CreateParams(Params);
  Params.ExStyle := Params.ExStyle Or WS_EX_TRANSPARENT;
End;

Procedure TTransparentPanel.Paint;
Var
  P, P1: P24Color;
  C: LongInt;
  I, J: Integer;
Begin
  If FBkGnd.Empty Then
  Begin
    FBkGnd.PixelFormat := pf24Bit;
    FBkGnd.Width := Width;
    FBkGnd.Height := Height;
    If FTransparentRate > 0 Then
    Begin
      BitBlt(FBkGnd.Canvas.Handle, 0, 0, Width, Height, Canvas.Handle, 0, 0, SRCCOPY);
      If FTransparentRate < 100 Then    // ����͸��
      Begin
        C := ColorToRGB(Color);
        // ע��: ColorToRGB�õ�����ɫr, bλ����
        // scanline����ɫ˳�������෴.
        P1 := @C;
        For I := 0 To FBkGnd.Height - 1 Do
        Begin
          P := FBkGnd.Scanline[I];
          For J := 0 To FBkGnd.Width - 1 Do
          Begin
          P^.R := (P^.R * FTransparentRate + P1^.B * (100 - FTransparentRate)) Div 100;
          P^.G := (P^.G * FTransparentRate + P1^.G * (100 - FTransparentRate)) Div 100;
          P^.B := (P^.B * FTransparentRate + P1^.R * (100 - FTransparentRate)) Div 100;
          P := Pointer(Integer(P) + 3);
          End;
        End;
      End;
    End;
  End;
  BitBlt(Canvas.Handle, 0, 0, Width, Height, FBkGnd.Canvas.Handle, 0, 0, SRCCOPY);
End;

Constructor TTransparentPanel.Create(AOwner: TComponent);
Begin
  Inherited Create(AOwner);
  FBkGnd := TBitmap.Create;
  FTransparentRate := 0;
  Controlstyle := Controlstyle + [csOpaque]; // ����û�б仯ʱ���ػ����������˸
End;

Destructor TTransparentPanel.Destroy;
Begin
  If Assigned(FBkGnd) Then
    FBkGnd.free;
  Inherited;
End;

Procedure TTransparentPanel.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
Begin
  If (FTransparentRate > 0) Or (FTransparentRate < 100) Then // �ƶ�ʱ�ܻ����ȷ�ı���
    RecreateWnd;
  Inherited;
End;

End.

