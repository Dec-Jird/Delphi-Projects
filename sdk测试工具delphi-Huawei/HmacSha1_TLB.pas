unit HmacSha1_TLB;

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
// File generated on 2016/4/12 17:25:58 from Type Library described below.

// ************************************************************************  //
// Type Lib: D:\TynooProject\DephiProjects\sdk≤‚ ‘π§æﬂdelphi-Huawei\HmacSha1.tlb (1)
// LIBID: {77FE339B-5442-478A-808C-92579532F846}
// LCID: 0
// Helpfile: 
// HelpString: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
//   (2) v2.4 mscorlib, (C:\Windows\Microsoft.NET\Framework\v4.0.30319\mscorlib.tlb)
// Errors:
//   Hint: Parameter 'type' of HmacSha1Interface.HmacSha1Sign changed to 'type_'
//   Error creating palette bitmap of (THmacSha1Class) : Server mscoree.dll contains no icons
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
  HmacSha1MajorVersion = 1;
  HmacSha1MinorVersion = 0;

  LIBID_HmacSha1: TGUID = '{77FE339B-5442-478A-808C-92579532F846}';

  IID_HmacSha1Interface: TGUID = '{6047E2A1-0E1C-367D-9ACB-5B8093A4A53F}';
  CLASS_HmacSha1Class: TGUID = '{7ADCBE27-1CD2-354C-8821-858603785CD1}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  HmacSha1Interface = interface;
  HmacSha1InterfaceDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  HmacSha1Class = HmacSha1Interface;


// *********************************************************************//
// Interface: HmacSha1Interface
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {6047E2A1-0E1C-367D-9ACB-5B8093A4A53F}
// *********************************************************************//
  HmacSha1Interface = interface(IDispatch)
    ['{6047E2A1-0E1C-367D-9ACB-5B8093A4A53F}']
    function HmacSha1Sign(const text: WideString; const key: WideString; const type_: WideString): WideString; safecall;
  end;

// *********************************************************************//
// DispIntf:  HmacSha1InterfaceDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {6047E2A1-0E1C-367D-9ACB-5B8093A4A53F}
// *********************************************************************//
  HmacSha1InterfaceDisp = dispinterface
    ['{6047E2A1-0E1C-367D-9ACB-5B8093A4A53F}']
    function HmacSha1Sign(const text: WideString; const key: WideString; const type_: WideString): WideString; dispid 1610743808;
  end;

// *********************************************************************//
// The Class CoHmacSha1Class provides a Create and CreateRemote method to          
// create instances of the default interface HmacSha1Interface exposed by              
// the CoClass HmacSha1Class. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoHmacSha1Class = class
    class function Create: HmacSha1Interface;
    class function CreateRemote(const MachineName: string): HmacSha1Interface;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : THmacSha1Class
// Help String      : 
// Default Interface: HmacSha1Interface
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  THmacSha1ClassProperties= class;
{$ENDIF}
  THmacSha1Class = class(TOleServer)
  private
    FIntf:        HmacSha1Interface;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       THmacSha1ClassProperties;
    function      GetServerProperties: THmacSha1ClassProperties;
{$ENDIF}
    function      GetDefaultInterface: HmacSha1Interface;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: HmacSha1Interface);
    procedure Disconnect; override;
    function HmacSha1Sign(const text: WideString; const key: WideString; const type_: WideString): WideString;
    property DefaultInterface: HmacSha1Interface read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: THmacSha1ClassProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : THmacSha1Class
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 THmacSha1ClassProperties = class(TPersistent)
  private
    FServer:    THmacSha1Class;
    function    GetDefaultInterface: HmacSha1Interface;
    constructor Create(AServer: THmacSha1Class);
  protected
  public
    property DefaultInterface: HmacSha1Interface read GetDefaultInterface;
  published
  end;
{$ENDIF}


procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

  dtlOcxPage = 'ActiveX';

implementation

uses ComObj;

class function CoHmacSha1Class.Create: HmacSha1Interface;
begin
  Result := CreateComObject(CLASS_HmacSha1Class) as HmacSha1Interface;
end;

class function CoHmacSha1Class.CreateRemote(const MachineName: string): HmacSha1Interface;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_HmacSha1Class) as HmacSha1Interface;
end;

procedure THmacSha1Class.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{7ADCBE27-1CD2-354C-8821-858603785CD1}';
    IntfIID:   '{6047E2A1-0E1C-367D-9ACB-5B8093A4A53F}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure THmacSha1Class.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as HmacSha1Interface;
  end;
end;

procedure THmacSha1Class.ConnectTo(svrIntf: HmacSha1Interface);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure THmacSha1Class.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function THmacSha1Class.GetDefaultInterface: HmacSha1Interface;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor THmacSha1Class.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := THmacSha1ClassProperties.Create(Self);
{$ENDIF}
end;

destructor THmacSha1Class.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function THmacSha1Class.GetServerProperties: THmacSha1ClassProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function THmacSha1Class.HmacSha1Sign(const text: WideString; const key: WideString; 
                                     const type_: WideString): WideString;
begin
  Result := DefaultInterface.HmacSha1Sign(text, key, type_);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor THmacSha1ClassProperties.Create(AServer: THmacSha1Class);
begin
  inherited Create;
  FServer := AServer;
end;

function THmacSha1ClassProperties.GetDefaultInterface: HmacSha1Interface;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

procedure Register;
begin
  RegisterComponents(dtlServerPage, [THmacSha1Class]);
end;

end.
