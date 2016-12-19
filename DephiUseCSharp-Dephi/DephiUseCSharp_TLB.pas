unit DephiUseCSharp_TLB;

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

// PASTLWTR : 1.2
// File generated on 2016/2/27 17:26:22 from Type Library described below.

// ************************************************************************  //
// Type Lib: D:\TNYOO\DephiProjects\DephiUseCSharp-Dephi\DephiUseCSharp.tlb (1)
// LIBID: {642348CD-242E-47F4-9A0A-FC349DEF9C5A}
// LCID: 0
// Helpfile: 
// HelpString: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
//   (2) v2.4 mscorlib, (C:\Windows\Microsoft.NET\Framework\v4.0.30319\mscorlib.tlb)
// Errors:
//   Error creating palette bitmap of (TTestCSharpClass) : Server mscoree.dll contains no icons
// ************************************************************************ //
// *************************************************************************//
// NOTE:                                                                      
// Items guarded by $IFDEF_LIVE_SERVER_AT_DESIGN_TIME are used by properties  
// which return objects that may need to be explicitly created via a function 
// call prior to any access via the property. These items have been disabled  
// in order to prevent accidental use from within the object inspector. You   
// may enable them by defining LIVE_SERVER_AT_DESIGN_TIME or by selectively   
// removing them from the $IFDEF blocks. However, such items must still be    
// programmatically created via a method of the appropriate CoClass before    
// they can be used.                                                          
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
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
  DephiUseCSharpMajorVersion = 1;
  DephiUseCSharpMinorVersion = 0;

  LIBID_DephiUseCSharp: TGUID = '{642348CD-242E-47F4-9A0A-FC349DEF9C5A}';

  IID_TestCSharpInterface: TGUID = '{D1239F92-343B-3C49-ABCA-96E7A7D3FB4E}';
  CLASS_TestCSharpClass: TGUID = '{D0A01FB8-2A33-3D9A-8805-AC2071B95FE3}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  TestCSharpInterface = interface;
  TestCSharpInterfaceDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  TestCSharpClass = TestCSharpInterface;


// *********************************************************************//
// Interface: TestCSharpInterface
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D1239F92-343B-3C49-ABCA-96E7A7D3FB4E}
// *********************************************************************//
  TestCSharpInterface = interface(IDispatch)
    ['{D1239F92-343B-3C49-ABCA-96E7A7D3FB4E}']
    function TestPlus(a: Int64; b: Int64): Int64; safecall;
    function TestMultiply(a: Int64; b: Int64): Int64; safecall;
  end;

// *********************************************************************//
// DispIntf:  TestCSharpInterfaceDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D1239F92-343B-3C49-ABCA-96E7A7D3FB4E}
// *********************************************************************//
  TestCSharpInterfaceDisp = dispinterface
    ['{D1239F92-343B-3C49-ABCA-96E7A7D3FB4E}']
    function TestPlus(a: {??Int64}OleVariant; b: {??Int64}OleVariant): {??Int64}OleVariant; dispid 1610743808;
    function TestMultiply(a: {??Int64}OleVariant; b: {??Int64}OleVariant): {??Int64}OleVariant; dispid 1610743809;
  end;

// *********************************************************************//
// The Class CoTestCSharpClass provides a Create and CreateRemote method to          
// create instances of the default interface TestCSharpInterface exposed by              
// the CoClass TestCSharpClass. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoTestCSharpClass = class
    class function Create: TestCSharpInterface;
    class function CreateRemote(const MachineName: string): TestCSharpInterface;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TTestCSharpClass
// Help String      : 
// Default Interface: TestCSharpInterface
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TTestCSharpClassProperties= class;
{$ENDIF}
  TTestCSharpClass = class(TOleServer)
  private
    FIntf:        TestCSharpInterface;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TTestCSharpClassProperties;
    function      GetServerProperties: TTestCSharpClassProperties;
{$ENDIF}
    function      GetDefaultInterface: TestCSharpInterface;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: TestCSharpInterface);
    procedure Disconnect; override;
    function TestPlus(a: Int64; b: Int64): Int64;
    function TestMultiply(a: Int64; b: Int64): Int64;
    property DefaultInterface: TestCSharpInterface read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TTestCSharpClassProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TTestCSharpClass
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TTestCSharpClassProperties = class(TPersistent)
  private
    FServer:    TTestCSharpClass;
    function    GetDefaultInterface: TestCSharpInterface;
    constructor Create(AServer: TTestCSharpClass);
  protected
  public
    property DefaultInterface: TestCSharpInterface read GetDefaultInterface;
  published
  end;
{$ENDIF}


procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

  dtlOcxPage = 'ActiveX';

implementation

uses ComObj;

class function CoTestCSharpClass.Create: TestCSharpInterface;
begin
  Result := CreateComObject(CLASS_TestCSharpClass) as TestCSharpInterface;
end;

class function CoTestCSharpClass.CreateRemote(const MachineName: string): TestCSharpInterface;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_TestCSharpClass) as TestCSharpInterface;
end;

procedure TTestCSharpClass.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{D0A01FB8-2A33-3D9A-8805-AC2071B95FE3}';
    IntfIID:   '{D1239F92-343B-3C49-ABCA-96E7A7D3FB4E}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TTestCSharpClass.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as TestCSharpInterface;
  end;
end;

procedure TTestCSharpClass.ConnectTo(svrIntf: TestCSharpInterface);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TTestCSharpClass.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TTestCSharpClass.GetDefaultInterface: TestCSharpInterface;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TTestCSharpClass.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TTestCSharpClassProperties.Create(Self);
{$ENDIF}
end;

destructor TTestCSharpClass.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TTestCSharpClass.GetServerProperties: TTestCSharpClassProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TTestCSharpClass.TestPlus(a: Int64; b: Int64): Int64;
begin
  Result := DefaultInterface.TestPlus(a, b);
end;

function TTestCSharpClass.TestMultiply(a: Int64; b: Int64): Int64;
begin
  Result := DefaultInterface.TestMultiply(a, b);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TTestCSharpClassProperties.Create(AServer: TTestCSharpClass);
begin
  inherited Create;
  FServer := AServer;
end;

function TTestCSharpClassProperties.GetDefaultInterface: TestCSharpInterface;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

procedure Register;
begin
  RegisterComponents(dtlServerPage, [TTestCSharpClass]);
end;

end.
