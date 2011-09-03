unit PictureLibraryView;

interface

uses
  DB, ADODB, MVC;

type
  IPictureLibraryView = interface(IView)
    procedure ShowPicture(value:TCustomADODataSet); overload;
    procedure ShowPicture(value:string); overload;
//    procedure ShowTypeWordExtention(value:TCustomADODataSet);
//    procedure ShowSynonymExtention(value:TCustomADODataSet);
//    procedure ShowAntonymExtention(value:TCustomADODataSet);
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
