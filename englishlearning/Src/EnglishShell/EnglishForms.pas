unit EnglishForms;

interface

//---这里导入DLL 文件及其函数---
function  ConnectDb:Boolean; external 'EnglishForms.dll';
procedure ShowForm(const FormName:string); external 'EnglishForms.dll';
function  GetMainForm:integer; external 'EnglishForms.dll';
procedure ReleaseModule; external 'EnglishForms.dll';

implementation

end.
