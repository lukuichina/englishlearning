unit SynonymWordExtentionView;

interface

uses
  DB, ADODB, MVC;

type
  ISynonymWordExtentionView = interface(IView)
    procedure ShowBaseWordExplanation(value:TCustomADODataSet);
    procedure ShowExtendWordExplanation(value:TCustomADODataSet);
  end;

implementation

end.
