unit TransPanel; 
interface 
uses {WinTypes, WinProcs,}Windows, Messages, SysUtils, Classes, Controls, Forms, 
  Graphics, StdCtrls; 
type 
  TTransPanel = class(TCustomcontrol) 
  private 
    Fborder: Boolean; 
    FAlignment: TAlignment; 
    procedure Setborder(Value: Boolean); 
    procedure WMEraseBkgnd(var Message: TWmEraseBkgnd); message WM_ERASEBKGND; 
    procedure SetAlignment(const Value: TAlignment); 
  protected 
    procedure Paint; override; 
  public 
    procedure CreateParams(var Params: TCreateParams); override; 
    constructor Create(AOwner: TComponent); override; 
    destructor Destroy; override; 
  published 
    property Alignment: TAlignment read FAlignment write SetAlignment default 
      taCenter; 
    property Anchors; 
    property Border: Boolean read Fborder write Setborder; 
    property Caption; 
    property Font; 
    property Visible; 
    property Enabled; 
    property Align; 
    property OnClick; 
    property OnMouseDown; 
    property OnMouseMove; 
    property OnMouseUp; 
  end;

procedure Register;

implementation

procedure Register; 
begin 
  RegisterComponents('ControlLib', [TTransPanel]);
end;

{ TTransPanel } 
constructor TTransPanel.Create(AOwner: TComponent); 
begin 
  inherited Create(AOwner); 
  Width := 185; 
  Height := 41; 
  FAlignment := taCenter; 
end;

destructor TTransPanel.Destroy; 
begin 
  inherited Destroy; 
end;

procedure TTransPanel.CreateParams(var Params: TCreateParams); 
begin 
  inherited CreateParams(Params); 
  Params.ExStyle := Params.ExStyle + WS_EX_Transparent; 
  ControlStyle := ControlStyle - [csOpaque] + [csAcceptsControls]; 
end;

procedure TTransPanel.Paint; 
const 
  Alignments: array[TAlignment] of Longint = (DT_LEFT, DT_RIGHT, DT_CENTER); 
var 
  Rect: TRect; 
  FontHeight: Integer; 
  Flags: Longint; 
begin 
  inherited Paint; 
  Rect := GetClientRect; 
  with Canvas do 
  begin 
    if Fborder or (csDesigning in ComponentState) then 
    begin 
      Canvas.Brush.Color := clBtnShadow; 
      Canvas.FrameRect(Rect); 
    end; 
    Brush.Style := bsClear; 
    Font := Self.Font; 
    FontHeight := TextHeight('W'); 
    with Rect do 
    begin 
      Top := ((Bottom + Top) - FontHeight) div 2; 
      Bottom := Top + FontHeight; 
    end; 
    Flags := DT_EXPANDTABS or DT_VCENTER or Alignments[FAlignment]; 
    Flags := DrawTextBiDiModeFlags(Flags); 
    DrawText(Handle, PChar(Caption), -1, Rect, Flags); 
  end; 
end;

procedure TTransPanel.Setborder(Value: Boolean); 
begin 
  if Value <> Fborder then 
  begin 
    Fborder := Value; 
    Invalidate; 
  end; 
end;

procedure TTransPanel.WMEraseBkgnd(var Message: TWmEraseBkgnd);
begin 
  inherited; 
end;

procedure TTransPanel.SetAlignment(const Value: TAlignment); 
begin 
  FAlignment := Value; 
  Invalidate; 
end; 
end. 