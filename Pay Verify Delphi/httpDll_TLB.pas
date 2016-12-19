unit httpDll_TLB;

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
// File generated on 2016/10/7 16:58:58 from Type Library described below.

// ************************************************************************  //
// Type Lib: D:\TynooProject\DephiProjects\sdk≤‚ ‘π§æﬂdelphi-Huawei\httpDll.tlb (1)
// LIBID: {37A9865D-0B4A-442C-A699-8B7A12329664}
// LCID: 0
// Helpfile: 
// HelpString: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
//   (2) v2.4 mscorlib, (C:\Windows\Microsoft.NET\Framework\v4.0.30319\mscorlib.tlb)
// Errors:
//   Error creating palette bitmap of (ThttpDllClass) : Server mscoree.dll contains no icons
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
  httpDllMajorVersion = 1;
  httpDllMinorVersion = 0;

  LIBID_httpDll: TGUID = '{37A9865D-0B4A-442C-A699-8B7A12329664}';

  IID_httpDllInterface: TGUID = '{CBB21C05-47D8-3A57-A9A9-3016EC822445}';
  CLASS_httpDllClass: TGUID = '{0D5778C2-0656-361D-8FA3-AD8BA06FF61A}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  httpDllInterface = interface;
  httpDllInterfaceDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  httpDllClass = httpDllInterface;


// *********************************************************************//
// Interface: httpDllInterface
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {CBB21C05-47D8-3A57-A9A9-3016EC822445}
// *********************************************************************//
  httpDllInterface = interface(IDispatch)
    ['{CBB21C05-47D8-3A57-A9A9-3016EC822445}']
    function HttpPost(const url: WideString; const data: WideString): WideString; safecall;
    function HttpGet(const url: WideString; const data: WideString): WideString; safecall;
  end;

// *********************************************************************//
// DispIntf:  httpDllInterfaceDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {CBB21C05-47D8-3A57-A9A9-3016EC822445}
// *********************************************************************//
  httpDllInterfaceDisp = dispinterface
    ['{CBB21C05-47D8-3A57-A9A9-3016EC822445}']
    function HttpPost(const url: WideString; const data: WideString): WideString; dispid 1610743808;
    function HttpGet(const url: WideString; const data: WideString): WideString; dispid 1610743809;
  end;

// *********************************************************************//
// The Class CohttpDllClass provides a Create and CreateRemote method to          
// create instances of the default interface httpDllInterface exposed by              
// the CoClass httpDllClass. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CohttpDllClass = class
    class function Create: httpDllInterface;
    class function CreateRemote(const MachineName: string): httpDllInterface;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : ThttpDllClass
// Help String      : 
// Default Interface: httpDllInterface
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  ThttpDllClassProperties= class;
{$ENDIF}
  ThttpDllClass = class(TOleServer)
  private
    FIntf:        httpDllInterface;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       ThttpDllClassProperties;
    function      GetServerProperties: ThttpDllClassProperties;
{$ENDIF}
    function      GetDefaultInterface: httpDllInterface;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: httpDllInterface);
    procedure Disconnect; override;
    function HttpPost(const url: WideString; const data: WideString): WideString;
    function HttpGet(const url: WideString; const data: WideString): WideString;
    property DefaultInterface: httpDllInterface read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: ThttpDllClassProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : ThttpDllClass
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 ThttpDllClassProperties = class(TPersistent)
  private
    FServer:    ThttpDllClass;
    function    GetDefaultInterface: httpDllInterface;
    constructor Create(AServer: ThttpDllClass);
  protected
  public
    property DefaultInterface: httpDllInterface read GetDefaultInterface;
  published
  end;
{$ENDIF}


procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

  dtlOcxPage = 'ActiveX';

implementation

uses ComObj;

class function CohttpDllClass.Create: httpDllInterface;
begin
  Result := CreateComObject(CLASS_httpDllClass) as httpDllInterface;
end;

class function CohttpDllClass.CreateRemote(const MachineName: string): httpDllInterface;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_httpDllClass) as httpDllInterface;
end;

procedure ThttpDllClass.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{0D5778C2-0656-361D-8FA3-AD8BA06FF61A}';
    IntfIID:   '{CBB21C05-47D8-3A57-A9A9-3016EC822445}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure ThttpDllClass.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as httpDllInterface;
  end;
end;

procedure ThttpDllClass.ConnectTo(svrIntf: httpDllInterface);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure ThttpDllClass.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function ThttpDllClass.GetDefaultInterface: httpDllInterface;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor ThttpDllClass.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := ThttpDllClassProperties.Create(Self);
{$ENDIF}
end;

destructor ThttpDllClass.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function ThttpDllClass.GetServerProperties: ThttpDllClassProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function ThttpDllClass.HttpPost(const url: WideString; const data: WideString): WideString;
begin
  Result := DefaultInterface.HttpPost(url, data);
end;

function ThttpDllClass.HttpGet(const url: WideString; const data: WideString): WideString;
begin
  Result := DefaultInterface.HttpGet(url, data);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor ThttpDllClassProperties.Create(AServer: ThttpDllClass);
begin
  inherited Create;
  FServer := AServer;
end;

function ThttpDllClassProperties.GetDefaultInterface: httpDllInterface;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

procedure Register;
begin
  RegisterComponents(dtlServerPage, [ThttpDllClass]);
end;

end.
