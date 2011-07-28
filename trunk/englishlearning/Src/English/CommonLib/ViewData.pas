unit ViewData;

interface

type
  TViewData = class

  end;

  TTypeWordExtension =  class(TViewData)
  private
    FBaseWord:string;
    FBaseType:integer;
    FExtendWord:string;
    FExtendType:integer;
    FCatalogDisp:string;
    FCreateTime:TDateTime;
    FUpdateTime:TDateTime;
  public
    property BaseWord:string read FBaseWord write FBaseWord;
    property BaseType:integer read FBaseType write FBaseType;
    property ExtendWord:string read FExtendWord write FExtendWord;
    property ExtendType:integer read FExtendType write FExtendType;
    property CreateTime:TDateTime read FCreateTime write FCreateTime;
    property UpdateTime:TDateTime read FUpdateTime write FUpdateTime;
  end;

  TCatalogRelation = class(TViewData)
  private
    FCatalogID:string;
    FChildCatalogID:string;
    FCreateTime:TDateTime;
    FUpdateTime:TDateTime;
  public
    property CatalogID:string read FCatalogID write FCatalogID;
    property ChildCatalogID:string read FChildCatalogID write FChildCatalogID;
    property CreateTime:TDateTime read FCreateTime write FCreateTime;
    property UpdateTime:TDateTime read FUpdateTime write FUpdateTime;
  end;

  TWordCatalog = class(TViewData)
  private
    FCatalogID:string;
    FCatalogName:string;
    FCatalogDisp:string;
    FCreateTime:TDateTime;
    FUpdateTime:TDateTime;
  public
    property CatalogID:string read FCatalogID write FCatalogID;
    property CatalogName:string read FCatalogName write FCatalogName;
    property CatalogDisp:string read FCatalogDisp write FCatalogDisp;
    property CreateTime:TDateTime read FCreateTime write FCreateTime;
    property UpdateTime:TDateTime read FUpdateTime write FUpdateTime;
  end;

  TWord = class(TViewData)
  private
    FWordID:string;
    FWord:string;
    //FCatalogDisp:string;
    FCreateTime:TDateTime;
    FUpdateTime:TDateTime;
  public
    property WordID:string read FWordID write FWordID;
    property Word:string read FWord write FWord;
   // property CatalogDisp:string read FCatalogDisp write FCatalogDisp;
    property CreateTime:TDateTime read FCreateTime write FCreateTime;
    property UpdateTime:TDateTime read FUpdateTime write FUpdateTime;
  end;

  type
    TWords = array of TWord;

implementation

end.
