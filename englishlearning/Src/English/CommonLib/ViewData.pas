unit ViewData;

interface

type
  TViewData = class

  end;

  TWordView = class(TViewData)
  private
    FSessionID:string;
    FViewID:string;
    FWord:string;
    FCreateTime:TDateTime;
    FUpdateTime:TDateTime;
  public
    property SessionID:string read FSessionID write FSessionID;
    property ViewID:string read FViewID write FViewID;
    property Word:string read FWord write FWord;
    property CreateTime:TDateTime read FCreateTime write FCreateTime;
    property UpdateTime:TDateTime read FUpdateTime write FUpdateTime;
  end;

  THomoionymExtention =  class(TViewData)
  private
    FWord:string;
    FWordType:integer;
    FExplanationID:integer;
    FHomoionymWord:string;
    FHomoionymWordType:integer;
    FHomoionymExplanationID:integer;
    FCreateTime:TDateTime;
    FUpdateTime:TDateTime;
  public
    property Word:string read FWord write FWord;
    property WordType:integer read FWordType write FWordType;
    property ExplanationID:integer read FExplanationID write FExplanationID;
    property HomoionymWord:string read FHomoionymWord write FHomoionymWord;
    property HomoionymWordType:integer read FHomoionymWordType write FHomoionymWordType;
    property HomoionymExplanationID:integer read FHomoionymExplanationID write FHomoionymExplanationID;
    property CreateTime:TDateTime read FCreateTime write FCreateTime;
    property UpdateTime:TDateTime read FUpdateTime write FUpdateTime;
  end;

  TAntonymExtention =  class(TViewData)
  private
    FWord:string;
    FWordType:integer;
    FExplanationID:integer;
    FAntonymWord:string;
    FAntonymWordType:integer;
    FAntonymExplanationID:integer;
    FCreateTime:TDateTime;
    FUpdateTime:TDateTime;
  public
    property Word:string read FWord write FWord;
    property WordType:integer read FWordType write FWordType;
    property ExplanationID:integer read FExplanationID write FExplanationID;
    property AntonymWord:string read FAntonymWord write FAntonymWord;
    property AntonymWordType:integer read FAntonymWordType write FAntonymWordType;
    property AntonymExplanationID:integer read FAntonymExplanationID write FAntonymExplanationID;
    property CreateTime:TDateTime read FCreateTime write FCreateTime;
    property UpdateTime:TDateTime read FUpdateTime write FUpdateTime;
  end;

  TSynonymExtention =  class(TViewData)
  private
    FWord:string;
    FWordType:integer;
    FExplanationID:integer;
    FSynonymWord:string;
    FSynonymWordType:integer;
    FSynonymExplanationID:integer;
    FCreateTime:TDateTime;
    FUpdateTime:TDateTime;
  public
    property Word:string read FWord write FWord;
    property WordType:integer read FWordType write FWordType;
    property ExplanationID:integer read FExplanationID write FExplanationID;
    property SynonymWord:string read FSynonymWord write FSynonymWord;
    property SynonymWordType:integer read FSynonymWordType write FSynonymWordType;
    property SynonymExplanationID:integer read FSynonymExplanationID write FSynonymExplanationID;
    property CreateTime:TDateTime read FCreateTime write FCreateTime;
    property UpdateTime:TDateTime read FUpdateTime write FUpdateTime;
  end;

  TDerivativeExtention =  class(TViewData)
  private
    FOriginalWord:string;
    FOriginalType:integer;
    FDerivedWord:string;
    FDerivedType:integer;
    FCreateTime:TDateTime;
    FUpdateTime:TDateTime;
  public
    property OriginalWord:string read FOriginalWord write FOriginalWord;
    property OriginalType:integer read FOriginalType write FOriginalType;
    property DerivedWord:string read FDerivedWord write FDerivedWord;
    property DerivedType:integer read FDerivedType write FDerivedType;
    property CreateTime:TDateTime read FCreateTime write FCreateTime;
    property UpdateTime:TDateTime read FUpdateTime write FUpdateTime;
  end;

  TTypeWordExtention =  class(TViewData)
  private
    FBaseWord:string;
    FBaseType:integer;
    FExtendWord:string;
    FExtendType:integer;
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
