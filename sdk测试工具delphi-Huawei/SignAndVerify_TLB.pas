unit SignAndVerify_TLB;

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

// $Rev: 17244 $
// File generated on 2016/4/12 17:20:00 from Type Library described below.

// ************************************************************************  //
// Type Lib: D:\TynooProject\DephiProjects\sdk测试工具delphi-Huawei\SignAndVerify.tlb (1)
// LIBID: {BB2DBDEB-86B2-48FC-8099-0E12CB0FA92A}
// LCID: 0
// Helpfile: 
// HelpString: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
//   (2) v2.4 mscorlib, (C:\Windows\Microsoft.NET\Framework\v4.0.30319\mscorlib.tlb)
// Errors:
//   Hint: Parameter 'type' of SignAndVerifyInterface.HmacSha1Sign changed to 'type_'
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
{$ALIGN 4}
interface

uses Windows, ActiveX, Classes, Graphics, mscorlib_TLB, OleServer, StdVCL, Variants;
  


// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  SignAndVerifyMajorVersion = 1;
  SignAndVerifyMinorVersion = 0;

  LIBID_SignAndVerify: TGUID = '{BB2DBDEB-86B2-48FC-8099-0E12CB0FA92A}';

  IID_SignAndVerifyInterface: TGUID = '{8DD41868-0645-30CE-93BF-61FAB4E0E1A6}';
  CLASS_SignAndVerifyClass: TGUID = '{2A40FEF5-E0B1-38AE-867C-C7F901328E9E}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  SignAndVerifyInterface = interface;
  SignAndVerifyInterfaceDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  SignAndVerifyClass = SignAndVerifyInterface;


// *********************************************************************//
// Interface: SignAndVerifyInterface
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {8DD41868-0645-30CE-93BF-61FAB4E0E1A6}
// *********************************************************************//
  SignAndVerifyInterface = interface(IDispatch)
    ['{8DD41868-0645-30CE-93BF-61FAB4E0E1A6}']
    function HmacSha1Sign(const text: WideString; const key: WideString; const type_: WideString): WideString; safecall;
    function RsaSha1Sign(const content: WideString; const privateKey: WideString): WideString; safecall;
    function RsaMd5Sign(const content: WideString; const privateKey: WideString): WideString; safecall;
    function RsaMd5Verify(const BillInfo: WideString; const PublicKey: WideString; 
                          const sign: WideString): WordBool; safecall;
    function RsaSha1Verify(const BillInfo: WideString; const PublicKey: WideString; 
                           const sign: WideString): WordBool; safecall;
  end;

// *********************************************************************//
// DispIntf:  SignAndVerifyInterfaceDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {8DD41868-0645-30CE-93BF-61FAB4E0E1A6}
// *********************************************************************//
  SignAndVerifyInterfaceDisp = dispinterface
    ['{8DD41868-0645-30CE-93BF-61FAB4E0E1A6}']
    function HmacSha1Sign(const text: WideString; const key: WideString; const type_: WideString): WideString; dispid 1610743808;
    function RsaSha1Sign(const content: WideString; const privateKey: WideString): WideString; dispid 1610743809;
    function RsaMd5Sign(const content: WideString; const privateKey: WideString): WideString; dispid 1610743810;
    function RsaMd5Verify(const BillInfo: WideString; const PublicKey: WideString; 
                          const sign: WideString): WordBool; dispid 1610743811;
    function RsaSha1Verify(const BillInfo: WideString; const PublicKey: WideString; 
                           const sign: WideString): WordBool; dispid 1610743812;
  end;

// *********************************************************************//
// The Class CoSignAndVerifyClass provides a Create and CreateRemote method to          
// create instances of the default interface SignAndVerifyInterface exposed by              
// the CoClass SignAndVerifyClass. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoSignAndVerifyClass = class
    class function Create: SignAndVerifyInterface;
    class function CreateRemote(const MachineName: string): SignAndVerifyInterface;
  end;

implementation

uses ComObj;

class function CoSignAndVerifyClass.Create: SignAndVerifyInterface;
begin
  Result := CreateComObject(CLASS_SignAndVerifyClass) as SignAndVerifyInterface;
end;

class function CoSignAndVerifyClass.CreateRemote(const MachineName: string): SignAndVerifyInterface;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SignAndVerifyClass) as SignAndVerifyInterface;
end;

end.
