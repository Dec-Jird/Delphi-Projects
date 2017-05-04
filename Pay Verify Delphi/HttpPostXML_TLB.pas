unit HttpPostXML_TLB;

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
// File generated on 2017/3/21 12:00:47 from Type Library described below.

// ************************************************************************  //
// Type Lib: D:\Project\Delphi-Projects\Pay Verify Delphi\HttpPostXML.tlb (1)
// LIBID: {21B96BEA-11B0-478D-9B8D-3A8770D3D004}
// LCID: 0
// Helpfile: 
// HelpString: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
//   (2) v2.4 mscorlib, (C:\Windows\Microsoft.NET\Framework\v4.0.30319\mscorlib.tlb)
// Errors:
//   Error creating palette bitmap of (THttpPostXMLClass) : Server mscoree.dll contains no icons
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
  HttpPostXMLMajorVersion = 1;
  HttpPostXMLMinorVersion = 0;

  LIBID_HttpPostXML: TGUID = '{21B96BEA-11B0-478D-9B8D-3A8770D3D004}';

  IID_HttpPostXMLInterface: TGUID = '{7936C1F3-8BC2-3A16-90E7-A1AD111D82B6}';
  CLASS_HttpPostXMLClass: TGUID = '{16DB46EE-82A8-386D-A66C-CE3EF4930B6C}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  HttpPostXMLInterface = interface;
  HttpPostXMLInterfaceDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  HttpPostXMLClass = HttpPostXMLInterface;


// *********************************************************************//
// Interface: HttpPostXMLInterface
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {7936C1F3-8BC2-3A16-90E7-A1AD111D82B6}
// *********************************************************************//
  HttpPostXMLInterface = interface(IDispatch)
    ['{7936C1F3-8BC2-3A16-90E7-A1AD111D82B6}']
    function PostXML(const url: WideString; const data: WideString): WideString; safecall;
  end;

// *********************************************************************//
// DispIntf:  HttpPostXMLInterfaceDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {7936C1F3-8BC2-3A16-90E7-A1AD111D82B6}
// *********************************************************************//
  HttpPostXMLInterfaceDisp = dispinterface
    ['{7936C1F3-8BC2-3A16-90E7-A1AD111D82B6}']
    function PostXML(const url: WideString; const data: WideString): WideString; dispid 1610743808;
  end;

// *********************************************************************//
// The Class CoHttpPostXMLClass provides a Create and CreateRemote method to          
// create instances of the default interface HttpPostXMLInterface exposed by              
// the CoClass HttpPostXMLClass. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoHttpPostXMLClass = class
    class function Create: HttpPostXMLInterface;
    class function CreateRemote(const MachineName: string): HttpPostXMLInterface;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : THttpPostXMLClass
// Help String      : 
// Default Interface: HttpPostXMLInterface
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  THttpPostXMLClassProperties= class;
{$ENDIF}
  THttpPostXMLClass = class(TOleServer)
  private
    FIntf:        HttpPostXMLInterface;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       THttpPostXMLClassProperties;
    function      GetServerProperties: THttpPostXMLClassProperties;
{$ENDIF}
    function      GetDefaultInterface: HttpPostXMLInterface;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: HttpPostXMLInterface);
    procedure Disconnect; override;
    function PostXML(const url: WideString; const data: WideString): WideString;
    property DefaultInterface: HttpPostXMLInterface read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: THttpPostXMLClassProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : THttpPostXMLClass
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 THttpPostXMLClassProperties = class(TPersistent)
  private
    FServer:    THttpPostXMLClass;
    function    GetDefaultInterface: HttpPostXMLInterface;
    constructor Create(AServer: THttpPostXMLClass);
  protected
  public
    property DefaultInterface: HttpPostXMLInterface read GetDefaultInterface;
  published
  end;
{$ENDIF}


procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

  dtlOcxPage = 'ActiveX';

implementation

uses ComObj;

class function CoHttpPostXMLClass.Create: HttpPostXMLInterface;
begin
  Result := CreateComObject(CLASS_HttpPostXMLClass) as HttpPostXMLInterface;
end;

class function CoHttpPostXMLClass.CreateRemote(const MachineName: string): HttpPostXMLInterface;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_HttpPostXMLClass) as HttpPostXMLInterface;
end;

procedure THttpPostXMLClass.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{16DB46EE-82A8-386D-A66C-CE3EF4930B6C}';
    IntfIID:   '{7936C1F3-8BC2-3A16-90E7-A1AD111D82B6}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure THttpPostXMLClass.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as HttpPostXMLInterface;
  end;
end;

procedure THttpPostXMLClass.ConnectTo(svrIntf: HttpPostXMLInterface);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure THttpPostXMLClass.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function THttpPostXMLClass.GetDefaultInterface: HttpPostXMLInterface;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor THttpPostXMLClass.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := THttpPostXMLClassProperties.Create(Self);
{$ENDIF}
end;

destructor THttpPostXMLClass.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function THttpPostXMLClass.GetServerProperties: THttpPostXMLClassProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function THttpPostXMLClass.PostXML(const url: WideString; const data: WideString): WideString;
begin
  Result := DefaultInterface.PostXML(url, data);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor THttpPostXMLClassProperties.Create(AServer: THttpPostXMLClass);
begin
  inherited Create;
  FServer := AServer;
end;

function THttpPostXMLClassProperties.GetDefaultInterface: HttpPostXMLInterface;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

procedure Register;
begin
  RegisterComponents(dtlServerPage, [THttpPostXMLClass]);
end;

end.
