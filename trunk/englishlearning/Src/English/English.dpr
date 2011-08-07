program English;

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
  TypeWordExtentionDialog in 'Dialog\TypeWordExtentionDialog.pas' {TypeWordExtentionDialogForm},
  SynonymModel in 'Model\SynonymModel.pas',
  SynonymWordExtentionDialog in 'Dialog\SynonymWordExtentionDialog.pas' {SynonymWordExtentionDialogForm},
  AntonymModel in 'Model\AntonymModel.pas',
  WordExplanationModel in 'Model\WordExplanationModel.pas',
  SynonymWordExtentionController in 'Controller\SynonymWordExtentionController.pas',
  SynonymWordExtentionView in 'View\SynonymWordExtentionView.pas',
  CommonInfo in 'CommonLib\CommonInfo.pas',
  WordViewModel in 'Model\WordViewModel.pas',
  WordViewController in 'Controller\WordViewController.pas',
  WordViewView in 'View\WordViewView.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmManager, dmManager);
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
