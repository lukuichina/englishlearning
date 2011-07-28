unit WordExtensionView;

interface

uses
  DB, ADODB, MVC, ViewData, WordExtensionModel, Forms;

type
  IWordExtensionView = interface(IView)
    procedure ShowWord(value:TCustomADODataSet);
    procedure ShowTypeWordExtention(value:TCustomADODataSet);
//    procedure ShowCatalogWord(value:TCustomADODataSet);
//
//    function  GetCatalogRelationInfo:TCatalogRelation;
//    function  GetSrcCatalogRelationInfo:TCatalogRelation;
//    function  GetDesCatalogRelationInfo:TCatalogRelation;
//    function  GetCatalogInfo:TWordCatalog;
//    function  GetWordInfo:TWord;
//
////    procedure SetCatalogInfo(const value:TWordCatalog);
//
//    property CatalogRelationInfo:TCatalogRelation read GetCatalogRelationInfo;
//    property SrcCatalogRelationInfo:TCatalogRelation read GetSrcCatalogRelationInfo;
//    property DesCatalogRelationInfo:TCatalogRelation read GetDesCatalogRelationInfo;
//    property CatalogInfo:TWordCatalog read GetCatalogInfo;// write SetCatalogInfo;
//    property WordInfo:TWord read GetWordInfo;
  end;

//  IWordCatalogDialogView = interface(IView)
//    function  GetCatalogInfo:TWordCatalog;
//    procedure SetCatalogInfo(const value:TWordCatalog);
//
//    property CatalogInfo:TWordCatalog read GetCatalogInfo write SetCatalogInfo;
//  end;

implementation

end.
