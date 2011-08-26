unit WordCatalogView;

interface

uses
  DB, ADODB, MVC, ViewData, Forms;

type
  TEditMode = (emNone, emInsert, emUpdate);

type
  IWordCatalogView = interface(IView)
    procedure ShowWordCatalog(value:TCustomADODataSet);
    procedure ShowWordCatalogTree(value:TCustomADODataSet);
    procedure ShowCatalogWord(value:TCustomADODataSet);

    function  GetCatalogRelationInfo:TCatalogRelation;
    function  GetSrcCatalogRelationInfo:TCatalogRelation;
    function  GetDesCatalogRelationInfo:TCatalogRelation;
    function  GetCatalogInfo:TWordCatalog;
    function  GetWordInfo:TWord;

//    procedure SetCatalogInfo(const value:TWordCatalog);

    property CatalogRelationInfo:TCatalogRelation read GetCatalogRelationInfo;
    property SrcCatalogRelationInfo:TCatalogRelation read GetSrcCatalogRelationInfo;
    property DesCatalogRelationInfo:TCatalogRelation read GetDesCatalogRelationInfo;
    property CatalogInfo:TWordCatalog read GetCatalogInfo;// write SetCatalogInfo;
    property WordInfo:TWord read GetWordInfo;
  end;

  IWordCatalogDialogView = interface(IView)
    function  GetCatalogInfo:TWordCatalog;
    procedure SetCatalogInfo(const value:TWordCatalog);
    procedure SetEditMode(const value:TEditMode);

    property CatalogInfo:TWordCatalog read GetCatalogInfo write SetCatalogInfo;
    property EditMode:TEditMode write SetEditMode;
  end;

implementation

end.
