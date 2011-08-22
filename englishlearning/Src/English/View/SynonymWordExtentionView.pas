unit SynonymWordExtentionView;

interface

uses
  DB, ADODB, MVC, ViewData, WordExtensionModel;

type
  ISynonymWordExtentionView = interface(IView)
    procedure ShowBaseWordExplanation(value:TCustomADODataSet);
    procedure ShowExtendWordExplanation(value:TCustomADODataSet);
  end;

implementation

end.
