unit EnglishForms;

interface

//---���ﵼ��DLL �ļ����亯��---
function  ConnectDb:Boolean; external 'EnglishForms.dll';
procedure ShowForm(const FormName:string); external 'EnglishForms.dll';
function  GetMainForm:integer; external 'EnglishForms.dll';
procedure ReleaseModule; external 'EnglishForms.dll';

implementation

end.
