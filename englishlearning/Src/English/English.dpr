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
  ExplanationInputDialog in 'Dialog\ExplanationInputDialog.pas' {ExplanationInputDialogForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmManager, dmManager);
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TExplanationInputDialogForm, ExplanationInputDialogForm);
  Application.Run;
end.
