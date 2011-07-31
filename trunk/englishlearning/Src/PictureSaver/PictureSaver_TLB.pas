unit PictureSaver_TLB;

// ************************************************************************ //
// WARNING
// -------
// The types declared in this file were generated from data read from a
// Type Library. If this type library is explicitly or indirectly (via
// another type library referring to this type library) re-imported, or the
// 'Refresh' command of the Type Library Editor activated while editing the
// Type Library, the contents of this file will be regenerated and all
// manual modifications will be lost.
// ************************************************************************ //

// $Rev: 34747 $
// File generated on 2011/7/31 18:31:39 from Type Library described below.

// ************************************************************************  //
// Type Lib: E:\Documents\OpenSource\englishlearning\trunk\englishlearning\Src\PictureSaver\PictureSaver (1)
// LIBID: {A8CD89CA-C065-4BA7-8298-63C9384B2949}
// LCID: 0
// Helpfile:
// HelpString:
// DepndLst:
//   (1) v2.0 stdole, (C:\Windows\system32\stdole2.tlb)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers.
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
{$ALIGN 4}
interface

uses Windows, ActiveX, Classes, Graphics, OleServer, StdVCL, Variants;


// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:
//   Type Libraries     : LIBID_xxxx
//   CoClasses          : CLASS_xxxx
//   DISPInterfaces     : DIID_xxxx
//   Non-DISP interfaces: IID_xxxx
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  PictureSaverMajorVersion = 1;
  PictureSaverMinorVersion = 0;

  LIBID_PictureSaver: TGUID = '{A8CD89CA-C065-4BA7-8298-63C9384B2949}';

  IID_IAutoSaver: TGUID = '{FCEB2303-CA27-4388-ADB9-95938EA68003}';
  CLASS_AutoSaver: TGUID = '{0DF91E3A-DDEB-4D44-9703-7E4D8F7A9334}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary
// *********************************************************************//
  IAutoSaver = interface;
  IAutoSaverDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library
// (NOTE: Here we map each CoClass to its Default Interface)
// *********************************************************************//
  AutoSaver = IAutoSaver;


// *********************************************************************//
// Interface: IAutoSaver
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {FCEB2303-CA27-4388-ADB9-95938EA68003}
// *********************************************************************//
  IAutoSaver = interface(IDispatch)
    ['{FCEB2303-CA27-4388-ADB9-95938EA68003}']
    procedure SaveImage(const Word: WideString; const URL: WideString; const Discription: WideString); safecall;
  end;

// *********************************************************************//
// DispIntf:  IAutoSaverDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {FCEB2303-CA27-4388-ADB9-95938EA68003}
// *********************************************************************//
  IAutoSaverDisp = dispinterface
    ['{FCEB2303-CA27-4388-ADB9-95938EA68003}']
    procedure SaveImage(const Word: WideString; const URL: WideString; const Discription: WideString); dispid 201;
  end;

// *********************************************************************//
// The Class CoAutoSaver provides a Create and CreateRemote method to
// create instances of the default interface IAutoSaver exposed by
// the CoClass AutoSaver. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAutoSaver = class
    class function Create: IAutoSaver;
    class function CreateRemote(const MachineName: string): IAutoSaver;
  end;

implementation

uses ComObj;

class function CoAutoSaver.Create: IAutoSaver;
begin
  Result := CreateComObject(CLASS_AutoSaver) as IAutoSaver;
end;

class function CoAutoSaver.CreateRemote(const MachineName: string): IAutoSaver;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AutoSaver) as IAutoSaver;
end;

end.

