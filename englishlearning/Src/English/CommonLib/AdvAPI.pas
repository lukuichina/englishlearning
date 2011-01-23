unit AdvAPI;

interface

uses
  Types, Windows, Controls, AdvGlowButton, AdvStickyPopupMenu;

  function InDropDownRect(button:TAdvGlowButton; X,Y:Integer):Boolean;overload;
  function InDropDownRect(button:TAdvGlowButton):Boolean;overload;
  procedure SetPopUpMenuCheck(menu:TAdvStickyPopupMenu; const index:Integer);

implementation

function InDropDownRect(button:TAdvGlowButton; X,Y:Integer):Boolean;
var
  InSepBtn: Boolean;
  InRightDrop: Boolean;
  InBottomDrop: Boolean;
begin
  InBottomDrop := (button.DropDownPosition = dpRight) and (X > (button.Width - DropDownSectWidth));
  InRightDrop := (button.DropDownPosition = dpBottom) and (Y > (button.Height - DropDownSectWidth));

  InSepBtn := (InBottomDrop or InRightDrop);

  Result := (button.DropDownButton and InSepBtn and button.DropDownSplit);
end;

function InDropDownRect(button:TAdvGlowButton):Boolean;
var
  p:TPoint;
begin
  GetCursorPos(p);
  p := button.ScreenToClient(p);

  Result := InDropDownRect(button, p.X, p.Y);
end;

procedure SetPopUpMenuCheck(menu:TAdvStickyPopupMenu; const index:Integer);
var
  i:Integer;
begin
  for i := 0 to menu.MenuItems.Count - 1 do
  begin
    menu.MenuItems[i].Checked := False;
  end;

  if index > -1 then
    menu.MenuItems[index].Checked := True;
end;

end.
