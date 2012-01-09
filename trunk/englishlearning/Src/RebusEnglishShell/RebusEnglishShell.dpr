program RebusEnglishShell;



uses
  Forms,
  Main in 'Main.pas' {MainForm},
  MainMenu in 'MainMenu.pas' {MainMenuForm},
  RebusEnglishForms in 'RebusEnglishForms.pas';

var
  FLoginSuccessful:Boolean;
  FMainForm:integer;

////---这里导入DLL 文件及其函数---
//function  ConnectDb:Boolean; external 'EnglishForms.dll';
//procedure ShowForm(const FormName:string); external 'EnglishForms.dll';
//function  GetMainForm:integer; external 'EnglishForms.dll';

{$R *.res}
{$R UAC.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainMenuForm, MainMenuForm);
  Application.CreateForm(TMainForm, MainForm);
  FLoginSuccessful := ConnectDb;
  FMainForm := GetMainForm;

  if not FLoginSuccessful then
  begin
    Application.Terminate;
  end;

  if FMainForm = 1 then
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
