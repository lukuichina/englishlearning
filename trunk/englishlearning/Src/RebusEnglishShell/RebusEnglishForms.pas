unit RebusEnglishForms;

interface

uses Classes;

//---���ﵼ��DLL �ļ����亯��---
function  ConnectDb:Boolean; external 'RebusEnglishForms.dll';
procedure ShowForm(const FormName:string;const AHandle:THandle;const Owner:TComponent=nil); external 'RebusEnglishForms.dll';
function  GetMainForm:integer; external 'RebusEnglishForms.dll';
procedure ReleaseModule; external 'RebusEnglishForms.dll';

implementation

end.
