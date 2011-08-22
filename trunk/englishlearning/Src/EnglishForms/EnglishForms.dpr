library EnglishForms;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  SysUtils,
  Classes,
  Forms,
  IniFiles,
  AdvAPI in '..\English\CommonLib\AdvAPI.pas',
  CommonInfo in '..\English\CommonLib\CommonInfo.pas',
  DBGridToExcel in '..\English\CommonLib\DBGridToExcel.pas',
  EnglishConsts in '..\English\CommonLib\EnglishConsts.pas',
  Excel in '..\English\CommonLib\Excel.pas',
  InterfaceDef in '..\English\CommonLib\InterfaceDef.pas',
  MVC in '..\English\CommonLib\MVC.pas',
  TsycFunctionSet in '..\English\CommonLib\TsycFunctionSet.pas',
  uExportXls in '..\English\CommonLib\uExportXls.pas',
  ViewData in '..\English\CommonLib\ViewData.pas',
  XLSFile in '..\English\CommonLib\XLSFile.pas',
  CatalogRelationController in '..\English\Controller\CatalogRelationController.pas',
  SynonymWordExtentionController in '..\English\Controller\SynonymWordExtentionController.pas',
  WordCatalogController in '..\English\Controller\WordCatalogController.pas',
  WordExtensionController in '..\English\Controller\WordExtensionController.pas',
  WordViewController in '..\English\Controller\WordViewController.pas',
  DataModule in '..\English\DataModule.pas' {dmManager: TDataModule},
  Basic in '..\English\Dialog\Basic.pas' {BasicForm},
  BasicDialog in '..\English\Dialog\BasicDialog.pas' {BasicDialogForm},
  DerivativeWordExtentionDialog in '..\English\Dialog\DerivativeWordExtentionDialog.pas' {DerivativeWordExtentionDialogForm},
  ExplanationInput in '..\English\Dialog\ExplanationInput.pas' {ExplanationInputForm},
  ExplanationInputDialog in '..\English\Dialog\ExplanationInputDialog.pas' {ExplanationInputDialogForm},
  FullScreenDialog in '..\English\Dialog\FullScreenDialog.pas' {FullScreenDialogForm},
  PictureDispDialog in '..\English\Dialog\PictureDispDialog.pas' {PictureDispDialogForm},
  SynonymWordExtentionDialog in '..\English\Dialog\SynonymWordExtentionDialog.pas' {SynonymWordExtentionDialogForm},
  TypeWordExtentionDialog in '..\English\Dialog\TypeWordExtentionDialog.pas' {TypeWordExtentionDialogForm},
  WordCatalogDialog in '..\English\Dialog\WordCatalogDialog.pas' {WordCatalogDialogFrom},
  WordRange in '..\English\Dialog\WordRange.pas' {WordRangeForm},
  WordSearchDialog in '..\English\Dialog\WordSearchDialog.pas' {WordSearchDialogForm},
  PictureLibrary in '..\English\Form\PictureLibrary.pas' {PictureLibraryForm},
  WordCatalog in '..\English\Form\WordCatalog.pas' {WordCatalogForm},
  WordExplain in '..\English\Form\WordExplain.pas' {WordExplainForm},
  WordExtension in '..\English\Form\WordExtension.pas' {WordExtensionForm},
  WordInput in '..\English\Form\WordInput.pas' {WordInputForm},
  WordPicture in '..\English\Form\WordPicture.pas' {WordPictureForm},
  WordSearch in '..\English\Form\WordSearch.pas' {WordSearchForm},
  WordView in '..\English\Form\WordView.pas' {WordViewForm},
  AntonymModel in '..\English\Model\AntonymModel.pas',
  CatalogRelationModel in '..\English\Model\CatalogRelationModel.pas',
  CatalogWordModel in '..\English\Model\CatalogWordModel.pas',
  CongenerModel in '..\English\Model\CongenerModel.pas',
  DerivativeModel in '..\English\Model\DerivativeModel.pas',
  HomoionymModel in '..\English\Model\HomoionymModel.pas',
  ResemblanceModel in '..\English\Model\ResemblanceModel.pas',
  SynonymModel in '..\English\Model\SynonymModel.pas',
  WordCatalogModel in '..\English\Model\WordCatalogModel.pas',
  WordExplanationModel in '..\English\Model\WordExplanationModel.pas',
  WordExtensionModel in '..\English\Model\WordExtensionModel.pas',
  WordModel in '..\English\Model\WordModel.pas',
  WordViewModel in '..\English\Model\WordViewModel.pas',
  WordViewThread in '..\English\Thread\WordViewThread.pas',
  SynonymWordExtentionView in '..\English\View\SynonymWordExtentionView.pas',
  WordCatalogView in '..\English\View\WordCatalogView.pas',
  WordExtensionView in '..\English\View\WordExtensionView.pas',
  WordViewView in '..\English\View\WordViewView.pas';

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

procedure ShowForm(const FormName:string);
type
  TFormClass = Class of TForm;
var
  FormClass:TFormClass;
  FForm:TForm;
begin
  FForm:=nil;

  try
    FormClass := TFormClass(FindClass('T'+FormName));

    FForm := FormClass.Create(nil);

    FForm.ShowModal;
  finally
    FForm.Free;
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
end.
