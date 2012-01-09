library RebusEnglishForms;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

{$R 'Ico.res' 'Ico.rc'}

uses
  SysUtils,
  Classes,
  Forms,
  IniFiles,
  Windows,
  AdvAPI in '..\RebusEnglish\CommonLib\AdvAPI.pas',
  CommonInfo in '..\RebusEnglish\CommonLib\CommonInfo.pas',
  DBGridToExcel in '..\RebusEnglish\CommonLib\DBGridToExcel.pas',
  EnglishConsts in '..\RebusEnglish\CommonLib\EnglishConsts.pas',
  Excel in '..\RebusEnglish\CommonLib\Excel.pas',
  InterfaceDef in '..\RebusEnglish\CommonLib\InterfaceDef.pas',
  MVC in '..\RebusEnglish\CommonLib\MVC.pas',
  TsycFunctionSet in '..\RebusEnglish\CommonLib\TsycFunctionSet.pas',
  uExportXls in '..\RebusEnglish\CommonLib\uExportXls.pas',
  ViewData in '..\RebusEnglish\CommonLib\ViewData.pas',
  XLSFile in '..\RebusEnglish\CommonLib\XLSFile.pas',
  CatalogRelationController in '..\RebusEnglish\Controller\CatalogRelationController.pas',
  SynonymWordExtentionController in '..\RebusEnglish\Controller\SynonymWordExtentionController.pas',
  WordCatalogController in '..\RebusEnglish\Controller\WordCatalogController.pas',
  WordExtensionController in '..\RebusEnglish\Controller\WordExtensionController.pas',
  WordViewController in '..\RebusEnglish\Controller\WordViewController.pas',
  DataModule in '..\RebusEnglish\DataModule.pas' {dmManager: TDataModule},
  Basic in '..\RebusEnglish\Dialog\Basic.pas' {BasicForm},
  BasicDialog in '..\RebusEnglish\Dialog\BasicDialog.pas' {BasicDialogForm},
  DerivativeWordExtentionDialog in '..\RebusEnglish\Dialog\DerivativeWordExtentionDialog.pas' {DerivativeWordExtentionDialogForm},
  ExplanationInput in '..\RebusEnglish\Dialog\ExplanationInput.pas' {ExplanationInputForm},
  ExplanationInputDialog in '..\RebusEnglish\Dialog\ExplanationInputDialog.pas' {ExplanationInputDialogForm},
  FullScreenDialog in '..\RebusEnglish\Dialog\FullScreenDialog.pas' {FullScreenDialogForm},
  PictureDispDialog in '..\RebusEnglish\Dialog\PictureDispDialog.pas' {PictureDispDialogForm},
  SynonymWordExtentionDialog in '..\RebusEnglish\Dialog\SynonymWordExtentionDialog.pas' {SynonymWordExtentionDialogForm},
  TypeWordExtentionDialog in '..\RebusEnglish\Dialog\TypeWordExtentionDialog.pas' {TypeWordExtentionDialogForm},
  WordCatalogDialog in '..\RebusEnglish\Dialog\WordCatalogDialog.pas' {WordCatalogDialogFrom},
  WordRange in '..\RebusEnglish\Dialog\WordRange.pas' {WordRangeForm},
  WordSearchDialog in '..\RebusEnglish\Dialog\WordSearchDialog.pas' {WordSearchDialogForm},
  PictureLibrary in '..\RebusEnglish\Form\PictureLibrary.pas' {PictureLibraryForm},
  WordCatalog in '..\RebusEnglish\Form\WordCatalog.pas' {WordCatalogForm},
  WordExplain in '..\RebusEnglish\Form\WordExplain.pas' {WordExplainForm},
  WordExtension in '..\RebusEnglish\Form\WordExtension.pas' {WordExtensionForm},
  WordInput in '..\RebusEnglish\Form\WordInput.pas' {WordInputForm},
  WordPicture in '..\RebusEnglish\Form\WordPicture.pas' {WordPictureForm},
  WordSearch in '..\RebusEnglish\Form\WordSearch.pas' {WordSearchForm},
  WordView in '..\RebusEnglish\Form\WordView.pas' {WordViewForm},
  AntonymModel in '..\RebusEnglish\Model\AntonymModel.pas',
  CatalogRelationModel in '..\RebusEnglish\Model\CatalogRelationModel.pas',
  CatalogWordModel in '..\RebusEnglish\Model\CatalogWordModel.pas',
  CongenerModel in '..\RebusEnglish\Model\CongenerModel.pas',
  DerivativeModel in '..\RebusEnglish\Model\DerivativeModel.pas',
  HomoionymModel in '..\RebusEnglish\Model\HomoionymModel.pas',
  ResemblanceModel in '..\RebusEnglish\Model\ResemblanceModel.pas',
  SynonymModel in '..\RebusEnglish\Model\SynonymModel.pas',
  WordCatalogModel in '..\RebusEnglish\Model\WordCatalogModel.pas',
  WordExplanationModel in '..\RebusEnglish\Model\WordExplanationModel.pas',
  WordExtensionModel in '..\RebusEnglish\Model\WordExtensionModel.pas',
  WordModel in '..\RebusEnglish\Model\WordModel.pas',
  WordViewModel in '..\RebusEnglish\Model\WordViewModel.pas',
  WordViewThread in '..\RebusEnglish\Thread\WordViewThread.pas',
  SynonymWordExtentionView in '..\RebusEnglish\View\SynonymWordExtentionView.pas',
  WordCatalogView in '..\RebusEnglish\View\WordCatalogView.pas',
  WordExtensionView in '..\RebusEnglish\View\WordExtensionView.pas',
  WordViewView in '..\RebusEnglish\View\WordViewView.pas';

{$R *.res}

function ConnectDb:Boolean;
begin
  try
    Result := False;

    dmManager := TdmManager.Create(nil);

    Result := dmManager.conEnglish.Connected;
  finally

  end;
end;

procedure ShowForm(const FormName:string;const AHandle:THandle;const Owner:TComponent=nil);
type
  TFormClass = Class of TForm;
var
  FormClass:TFormClass;
  FForm:TForm;
  Stream:TStream;
begin
  Application.Handle := AHandle;
  //Application.Icon.Handle := LoadIcon(HInstance, 'app');
  //Application.Icon.LoadFromFile('..\ico\app.ico');

  Stream := nil;
  FForm:=nil;

  try
    Stream := TResourceStream.Create(HInstance, 'app', RT_RCDATA);
    Application.Icon.LoadFromStream(Stream);

    FormClass := TFormClass(FindClass('T'+FormName));

    FForm := FormClass.Create(Owner);

    FForm.ShowModal;
  finally
    FForm.Free;
    Stream.Free;
  end;
end;

function GetMainForm:Integer;
begin
  Result := ConfigInfo.MainForm;
end;

procedure ReleaseModule;
begin
  dmManager.Free;
end;

exports
  ConnectDb,
  ShowForm,
  GetMainForm,
  ReleaseModule;

begin
  InitConfigInfo;
  InitCommonInfo;
end.
