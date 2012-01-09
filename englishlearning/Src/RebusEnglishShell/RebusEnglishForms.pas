unit RebusEnglishForms;

interface

uses Classes;

//---这里导入DLL 文件及其函数---
function  ConnectDb:Boolean; external 'RebusEnglishForms.dll';
procedure ShowForm(const FormName:string;const AHandle:THandle;const Owner:TComponent=nil); external 'RebusEnglishForms.dll';
function  GetMainForm:integer; external 'RebusEnglishForms.dll';
procedure ReleaseModule; external 'RebusEnglishForms.dll';

implementation

end.
