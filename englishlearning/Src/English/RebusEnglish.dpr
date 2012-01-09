program RebusEnglish;

uses
  Forms,
  DataModule in 'DataModule.pas' {dmManager: TDataModule},
  Excel in 'CommonLib\Excel.pas',
  ExplanationInput in 'Dialog\ExplanationInput.pas' {ExplanationInputForm},
  Basic in 'Dialog\Basic.pas' {BasicForm},
  BasicDialog in 'Dialog\BasicDialog.pas' {BasicDialogForm},
  WordRange in 'Dialog\WordRange.pas' {WordRangeForm},
  PictureDispDialog in 'Dialog\PictureDispDialog.pas' {PictureDispDialogForm},
  AdvAPI in 'CommonLib\AdvAPI.pas',
  FullScreenDialog in 'Dialog\FullScreenDialog.pas' {FullScreenDialogForm},
  EnglishConsts in 'CommonLib\EnglishConsts.pas',
  Main in 'Form\Main.pas' {MainForm},
  WordExplain in 'Form\WordExplain.pas' {WordExplainForm},
  WordInput in 'Form\WordInput.pas' {WordInputForm},
  WordPicture in 'Form\WordPicture.pas' {WordPictureForm},
  WordSearch in 'Form\WordSearch.pas' {WordSearchForm},
  WordView in 'Form\WordView.pas' {WordViewForm},
  WordExtension in 'Form\WordExtension.pas' {WordExtensionForm},
  WordCatalog in 'Form\WordCatalog.pas' {WordCatalogForm},
  MVC in 'CommonLib\MVC.pas',
  WordCatalogController in 'Controller\WordCatalogController.pas',
  WordCatalogView in 'View\WordCatalogView.pas',
  WordCatalogModel in 'Model\WordCatalogModel.pas',
  WordCatalogDialog in 'Dialog\WordCatalogDialog.pas' {WordCatalogDialogFrom},
  InterfaceDef in 'CommonLib\InterfaceDef.pas',
  ViewData in 'CommonLib\ViewData.pas',
  WordModel in 'Model\WordModel.pas',
  CatalogWordModel in 'Model\CatalogWordModel.pas',
  CatalogRelationModel in 'Model\CatalogRelationModel.pas',
  CatalogRelationController in 'Controller\CatalogRelationController.pas',
  ExplanationInputDialog in 'Dialog\ExplanationInputDialog.pas' {ExplanationInputDialogForm},
  WordSearchDialog in 'Dialog\WordSearchDialog.pas' {WordSearchDialogForm},
  WordExtensionController in 'Controller\WordExtensionController.pas',
  WordExtensionView in 'View\WordExtensionView.pas',
  WordExtensionModel in 'Model\WordExtensionModel.pas',
  DerivativeWordExtentionDialog in 'Dialog\DerivativeWordExtentionDialog.pas' {DerivativeWordExtentionDialogForm},
  SynonymModel in 'Model\SynonymModel.pas',
  SynonymWordExtentionDialog in 'Dialog\SynonymWordExtentionDialog.pas' {SynonymWordExtentionDialogForm},
  AntonymModel in 'Model\AntonymModel.pas',
  WordExplanationModel in 'Model\WordExplanationModel.pas',
  SynonymWordExtentionController in 'Controller\SynonymWordExtentionController.pas',
  SynonymWordExtentionView in 'View\SynonymWordExtentionView.pas',
  CommonInfo in 'CommonLib\CommonInfo.pas',
  WordViewModel in 'Model\WordViewModel.pas',
  WordViewController in 'Controller\WordViewController.pas',
  WordViewView in 'View\WordViewView.pas',
  WordViewThread in 'Thread\WordViewThread.pas',
  DerivativeModel in 'Model\DerivativeModel.pas',
  HomoionymModel in 'Model\HomoionymModel.pas',
  DBGridToExcel in 'CommonLib\DBGridToExcel.pas',
  XLSFile in 'CommonLib\XLSFile.pas',
  TsycFunctionSet in 'CommonLib\TsycFunctionSet.pas',
  uExportXls in 'CommonLib\uExportXls.pas',
  ResemblanceModel in 'Model\ResemblanceModel.pas',
  CongenerModel in 'Model\CongenerModel.pas',
  PictureLibrary in 'Form\PictureLibrary.pas' {PictureLibraryForm},
  MainMenu in 'Form\MainMenu.pas' {MainMenuForm},
  AutoComplete in 'CommonLib\AutoComplete.pas',
  PictureLibraryController in 'Controller\PictureLibraryController.pas',
  PictureLibraryModel in 'Model\PictureLibraryModel.pas',
  PictureLibraryView in 'View\PictureLibraryView.pas';

{$R *.res}
{$R UAC.res}

begin
  InitConfigInfo;
  InitCommonInfo;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmManager, dmManager);
  Application.CreateForm(TMainMenuForm, MainMenuForm);
  Application.CreateForm(TMainForm, MainForm);
  if ConfigInfo.MainForm = 1 then
  begin
    MainMenuForm.Hide;
    MainForm.Show;
  end
  else
  begin
    MainForm.Hide;
    MainMenuForm.Show;
  end;

  Application.Run;
end.
