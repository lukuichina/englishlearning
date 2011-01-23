unit Basic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AdvSmoothExpanderGroup;

type
  TBasicForm = class(TForm)
    grpMain: TAdvSmoothExpanderGroup;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BasicForm: TBasicForm;

implementation

{$R *.dfm}

end.
