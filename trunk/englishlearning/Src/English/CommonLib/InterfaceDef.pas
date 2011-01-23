unit InterfaceDef;

interface

uses
  MVC, ViewData;

type
  TActionType = (atNone, atInsert, atUpdate, atDelete, atRefresh);

type
  ICursorable = interface
    procedure CashCursor(const value:TActionType; data:TViewData=nil);
    procedure ResetCursor;
  end;

implementation

end.
