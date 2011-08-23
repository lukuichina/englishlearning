unit EnglishForms;

interface

uses Classes;

//---这里导入DLL 文件及其函数---
function  ConnectDb:Boolean; external 'EnglishForms.dll';
procedure ShowForm(const FormName:string;const AHandle:THandle;const Owner:TComponent=nil); external 'EnglishForms.dll';
function  GetMainForm:integer; external 'EnglishForms.dll';
procedure ReleaseModule; external 'EnglishForms.dll';

implementation

end.
