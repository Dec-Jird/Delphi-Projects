unit DES3Dll_TLB;

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
// File generated on 2016/11/8 11:09:32 from Type Library described below.

// ************************************************************************  //
// Type Lib: D:\TynooProject\DephiProjects\Pay Verify Delphi\DES3Dll.tlb (1)
// LIBID: {B5BA506A-9F0F-4488-A7CF-433FB154D5E9}
// LCID: 0
// Helpfile: 
// HelpString: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
//   (2) v2.4 mscorlib, (C:\Windows\Microsoft.NET\Framework\v4.0.30319\mscorlib.tlb)
// Errors:
//   Error creating palette bitmap of (TDES3DllClass) : Server mscoree.dll contains no icons
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
  DES3DllMajorVersion = 1;
  DES3DllMinorVersion = 0;

  LIBID_DES3Dll: TGUID = '{B5BA506A-9F0F-4488-A7CF-433FB154D5E9}';

  IID_DES3DllInterface: TGUID = '{B550593A-D436-3F41-AFF4-531107C829F0}';
  CLASS_DES3DllClass: TGUID = '{6641B701-4096-3E41-9B94-5A63DD154D5F}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  DES3DllInterface = interface;
  DES3DllInterfaceDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  DES3DllClass = DES3DllInterface;


// *********************************************************************//
// Interface: DES3DllInterface
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B550593A-D436-3F41-AFF4-531107C829F0}
// *********************************************************************//
  DES3DllInterface = interface(IDispatch)
    ['{B550593A-D436-3F41-AFF4-531107C829F0}']
    function Encrypt3DES(const a_strString: WideString; const a_strKey: WideString): WideString; safecall;
    function Decrypt3DES(const a_strString: WideString; const a_strKey: WideString): WideString; safecall;
  end;

// *********************************************************************//
// DispIntf:  DES3DllInterfaceDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B550593A-D436-3F41-AFF4-531107C829F0}
// *********************************************************************//
  DES3DllInterfaceDisp = dispinterface
    ['{B550593A-D436-3F41-AFF4-531107C829F0}']
    function Encrypt3DES(const a_strString: WideString; const a_strKey: WideString): WideString; dispid 1610743808;
    function Decrypt3DES(const a_strString: WideString; const a_strKey: WideString): WideString; dispid 1610743809;
  end;

// *********************************************************************//
// The Class CoDES3DllClass provides a Create and CreateRemote method to          
// create instances of the default interface DES3DllInterface exposed by              
// the CoClass DES3DllClass. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoDES3DllClass = class
    class function Create: DES3DllInterface;
    class function CreateRemote(const MachineName: string): DES3DllInterface;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TDES3DllClass
// Help String      : 
// Default Interface: DES3DllInterface
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TDES3DllClassProperties= class;
{$ENDIF}
  TDES3DllClass = class(TOleServer)
  private
    FIntf:        DES3DllInterface;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TDES3DllClassProperties;
    function      GetServerProperties: TDES3DllClassProperties;
{$ENDIF}
    function      GetDefaultInterface: DES3DllInterface;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: DES3DllInterface);
    procedure Disconnect; override;
    function Encrypt3DES(const a_strString: WideString; const a_strKey: WideString): WideString;
    function Decrypt3DES(const a_strString: WideString; const a_strKey: WideString): WideString;
    property DefaultInterface: DES3DllInterface read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TDES3DllClassProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TDES3DllClass
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TDES3DllClassProperties = class(TPersistent)
  private
    FServer:    TDES3DllClass;
    function    GetDefaultInterface: DES3DllInterface;
    constructor Create(AServer: TDES3DllClass);
  protected
  public
    property DefaultInterface: DES3DllInterface read GetDefaultInterface;
  published
  end;
{$ENDIF}


procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

  dtlOcxPage = 'ActiveX';

implementation

uses ComObj;

class function CoDES3DllClass.Create: DES3DllInterface;
begin
  Result := CreateComObject(CLASS_DES3DllClass) as DES3DllInterface;
end;

class function CoDES3DllClass.CreateRemote(const MachineName: string): DES3DllInterface;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DES3DllClass) as DES3DllInterface;
end;

procedure TDES3DllClass.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{6641B701-4096-3E41-9B94-5A63DD154D5F}';
    IntfIID:   '{B550593A-D436-3F41-AFF4-531107C829F0}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TDES3DllClass.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as DES3DllInterface;
  end;
end;

procedure TDES3DllClass.ConnectTo(svrIntf: DES3DllInterface);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TDES3DllClass.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TDES3DllClass.GetDefaultInterface: DES3DllInterface;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TDES3DllClass.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TDES3DllClassProperties.Create(Self);
{$ENDIF}
end;

destructor TDES3DllClass.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TDES3DllClass.GetServerProperties: TDES3DllClassProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TDES3DllClass.Encrypt3DES(const a_strString: WideString; const a_strKey: WideString): WideString;
begin
  Result := DefaultInterface.Encrypt3DES(a_strString, a_strKey);
end;

function TDES3DllClass.Decrypt3DES(const a_strString: WideString; const a_strKey: WideString): WideString;
begin
  Result := DefaultInterface.Decrypt3DES(a_strString, a_strKey);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TDES3DllClassProperties.Create(AServer: TDES3DllClass);
begin
  inherited Create;
  FServer := AServer;
end;

function TDES3DllClassProperties.GetDefaultInterface: DES3DllInterface;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

procedure Register;
begin
  RegisterComponents(dtlServerPage, [TDES3DllClass]);
end;

end.
