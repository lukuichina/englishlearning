unit SynonymWordExtentionView;

interface

uses
  DB, ADODB, MVC, ViewData, WordExtensionModel, Forms;

type
  ISynonymWordExtentionView = interface(IView)
    procedure ShowBaseWordExplanation(value:TCustomADODataSet);
    procedure ShowExtendWordExplanation(value:TCustomADODataSet);
  end;

implementation

end.
