unit SRS_APO_UniversalLib_TLB;

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
// File generated on 2016/4/13 9:13:36 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Windows\system32\sl3apo64.dll (1)
// LIBID: {7FBEFE6C-4533-4E2C-9740-2A7BB520AC16}
// LCID: 0
// Helpfile: 
// HelpString: SRS_APO_Universal 1.0 Type Library
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
// Errors:
//   Error creating palette bitmap of (TSRS_LFX_APO_Universal) : No Server registered for this CoClass
//   Error creating palette bitmap of (TSRS_LFX_Capture_APO_Universal) : No Server registered for this CoClass
//   Error creating palette bitmap of (TDTS_SFX_APO) : No Server registered for this CoClass
//   Error creating palette bitmap of (TDTS_MFX_APO) : No Server registered for this CoClass
//   Error creating palette bitmap of (TDTS_EFX_APO) : No Server registered for this CoClass
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
  SRS_APO_UniversalLibMajorVersion = 1;
  SRS_APO_UniversalLibMinorVersion = 0;

  LIBID_SRS_APO_UniversalLib: TGUID = '{7FBEFE6C-4533-4E2C-9740-2A7BB520AC16}';

  IID_ISRS_LFX_APO_Universal: TGUID = '{F76E042F-08A3-4D93-90E8-D7470FAC37A3}';
  CLASS_SRS_LFX_APO_Universal: TGUID = '{0D490185-0EF5-4E25-9994-EF95218A851C}';
  IID_ISRS_LFX_Capture_APO_Universal: TGUID = '{2D2FDC3D-4E41-4134-817A-70E681354F75}';
  CLASS_SRS_LFX_Capture_APO_Universal: TGUID = '{3C8BA013-2AA8-4687-8913-4EA83E269AE8}';
  IID_IDTS_SFX_APO: TGUID = '{C5BFB901-0AC1-40F5-B738-078DF230590D}';
  CLASS_DTS_SFX_APO: TGUID = '{1B917FE2-47D1-425D-A26E-AFCDBDA7A2E8}';
  IID_IDTS_MFX_APO: TGUID = '{F25D9FEB-B36D-4E3B-BA9F-86DBD5BF4CEB}';
  CLASS_DTS_MFX_APO: TGUID = '{134DDB7A-41FC-40E6-8D6B-E284C51D160E}';
  IID_IDTS_EFX_APO: TGUID = '{F9A6B6D9-26EE-418A-B02C-7BA5060CEA8D}';
  CLASS_DTS_EFX_APO: TGUID = '{7B4BF64E-D05D-481D-97CC-C0829AC9280F}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  ISRS_LFX_APO_Universal = interface;
  ISRS_LFX_Capture_APO_Universal = interface;
  IDTS_SFX_APO = interface;
  IDTS_MFX_APO = interface;
  IDTS_EFX_APO = interface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  SRS_LFX_APO_Universal = ISRS_LFX_APO_Universal;
  SRS_LFX_Capture_APO_Universal = ISRS_LFX_Capture_APO_Universal;
  DTS_SFX_APO = IDTS_SFX_APO;
  DTS_MFX_APO = IDTS_MFX_APO;
  DTS_EFX_APO = IDTS_EFX_APO;


// *********************************************************************//
// Interface: ISRS_LFX_APO_Universal
// Flags:     (0)
// GUID:      {F76E042F-08A3-4D93-90E8-D7470FAC37A3}
// *********************************************************************//
  ISRS_LFX_APO_Universal = interface(IUnknown)
    ['{F76E042F-08A3-4D93-90E8-D7470FAC37A3}']
  end;

// *********************************************************************//
// Interface: ISRS_LFX_Capture_APO_Universal
// Flags:     (0)
// GUID:      {2D2FDC3D-4E41-4134-817A-70E681354F75}
// *********************************************************************//
  ISRS_LFX_Capture_APO_Universal = interface(IUnknown)
    ['{2D2FDC3D-4E41-4134-817A-70E681354F75}']
  end;

// *********************************************************************//
// Interface: IDTS_SFX_APO
// Flags:     (0)
// GUID:      {C5BFB901-0AC1-40F5-B738-078DF230590D}
// *********************************************************************//
  IDTS_SFX_APO = interface(IUnknown)
    ['{C5BFB901-0AC1-40F5-B738-078DF230590D}']
  end;

// *********************************************************************//
// Interface: IDTS_MFX_APO
// Flags:     (0)
// GUID:      {F25D9FEB-B36D-4E3B-BA9F-86DBD5BF4CEB}
// *********************************************************************//
  IDTS_MFX_APO = interface(IUnknown)
    ['{F25D9FEB-B36D-4E3B-BA9F-86DBD5BF4CEB}']
  end;

// *********************************************************************//
// Interface: IDTS_EFX_APO
// Flags:     (0)
// GUID:      {F9A6B6D9-26EE-418A-B02C-7BA5060CEA8D}
// *********************************************************************//
  IDTS_EFX_APO = interface(IUnknown)
    ['{F9A6B6D9-26EE-418A-B02C-7BA5060CEA8D}']
  end;

// *********************************************************************//
// The Class CoSRS_LFX_APO_Universal provides a Create and CreateRemote method to          
// create instances of the default interface ISRS_LFX_APO_Universal exposed by              
// the CoClass SRS_LFX_APO_Universal. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoSRS_LFX_APO_Universal = class
    class function Create: ISRS_LFX_APO_Universal;
    class function CreateRemote(const MachineName: string): ISRS_LFX_APO_Universal;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TSRS_LFX_APO_Universal
// Help String      : SRS_LFX_APO_Universal Class
// Default Interface: ISRS_LFX_APO_Universal
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TSRS_LFX_APO_UniversalProperties= class;
{$ENDIF}
  TSRS_LFX_APO_Universal = class(TOleServer)
  private
    FIntf:        ISRS_LFX_APO_Universal;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TSRS_LFX_APO_UniversalProperties;
    function      GetServerProperties: TSRS_LFX_APO_UniversalProperties;
{$ENDIF}
    function      GetDefaultInterface: ISRS_LFX_APO_Universal;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: ISRS_LFX_APO_Universal);
    procedure Disconnect; override;
    property DefaultInterface: ISRS_LFX_APO_Universal read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TSRS_LFX_APO_UniversalProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TSRS_LFX_APO_Universal
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TSRS_LFX_APO_UniversalProperties = class(TPersistent)
  private
    FServer:    TSRS_LFX_APO_Universal;
    function    GetDefaultInterface: ISRS_LFX_APO_Universal;
    constructor Create(AServer: TSRS_LFX_APO_Universal);
  protected
  public
    property DefaultInterface: ISRS_LFX_APO_Universal read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoSRS_LFX_Capture_APO_Universal provides a Create and CreateRemote method to          
// create instances of the default interface ISRS_LFX_Capture_APO_Universal exposed by              
// the CoClass SRS_LFX_Capture_APO_Universal. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoSRS_LFX_Capture_APO_Universal = class
    class function Create: ISRS_LFX_Capture_APO_Universal;
    class function CreateRemote(const MachineName: string): ISRS_LFX_Capture_APO_Universal;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TSRS_LFX_Capture_APO_Universal
// Help String      : SRS_LFX_Capture_APO_Universal Class
// Default Interface: ISRS_LFX_Capture_APO_Universal
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TSRS_LFX_Capture_APO_UniversalProperties= class;
{$ENDIF}
  TSRS_LFX_Capture_APO_Universal = class(TOleServer)
  private
    FIntf:        ISRS_LFX_Capture_APO_Universal;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TSRS_LFX_Capture_APO_UniversalProperties;
    function      GetServerProperties: TSRS_LFX_Capture_APO_UniversalProperties;
{$ENDIF}
    function      GetDefaultInterface: ISRS_LFX_Capture_APO_Universal;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: ISRS_LFX_Capture_APO_Universal);
    procedure Disconnect; override;
    property DefaultInterface: ISRS_LFX_Capture_APO_Universal read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TSRS_LFX_Capture_APO_UniversalProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TSRS_LFX_Capture_APO_Universal
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TSRS_LFX_Capture_APO_UniversalProperties = class(TPersistent)
  private
    FServer:    TSRS_LFX_Capture_APO_Universal;
    function    GetDefaultInterface: ISRS_LFX_Capture_APO_Universal;
    constructor Create(AServer: TSRS_LFX_Capture_APO_Universal);
  protected
  public
    property DefaultInterface: ISRS_LFX_Capture_APO_Universal read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoDTS_SFX_APO provides a Create and CreateRemote method to          
// create instances of the default interface IDTS_SFX_APO exposed by              
// the CoClass DTS_SFX_APO. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoDTS_SFX_APO = class
    class function Create: IDTS_SFX_APO;
    class function CreateRemote(const MachineName: string): IDTS_SFX_APO;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TDTS_SFX_APO
// Help String      : 
// Default Interface: IDTS_SFX_APO
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TDTS_SFX_APOProperties= class;
{$ENDIF}
  TDTS_SFX_APO = class(TOleServer)
  private
    FIntf:        IDTS_SFX_APO;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TDTS_SFX_APOProperties;
    function      GetServerProperties: TDTS_SFX_APOProperties;
{$ENDIF}
    function      GetDefaultInterface: IDTS_SFX_APO;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IDTS_SFX_APO);
    procedure Disconnect; override;
    property DefaultInterface: IDTS_SFX_APO read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TDTS_SFX_APOProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TDTS_SFX_APO
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TDTS_SFX_APOProperties = class(TPersistent)
  private
    FServer:    TDTS_SFX_APO;
    function    GetDefaultInterface: IDTS_SFX_APO;
    constructor Create(AServer: TDTS_SFX_APO);
  protected
  public
    property DefaultInterface: IDTS_SFX_APO read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoDTS_MFX_APO provides a Create and CreateRemote method to          
// create instances of the default interface IDTS_MFX_APO exposed by              
// the CoClass DTS_MFX_APO. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoDTS_MFX_APO = class
    class function Create: IDTS_MFX_APO;
    class function CreateRemote(const MachineName: string): IDTS_MFX_APO;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TDTS_MFX_APO
// Help String      : 
// Default Interface: IDTS_MFX_APO
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TDTS_MFX_APOProperties= class;
{$ENDIF}
  TDTS_MFX_APO = class(TOleServer)
  private
    FIntf:        IDTS_MFX_APO;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TDTS_MFX_APOProperties;
    function      GetServerProperties: TDTS_MFX_APOProperties;
{$ENDIF}
    function      GetDefaultInterface: IDTS_MFX_APO;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IDTS_MFX_APO);
    procedure Disconnect; override;
    property DefaultInterface: IDTS_MFX_APO read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TDTS_MFX_APOProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TDTS_MFX_APO
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TDTS_MFX_APOProperties = class(TPersistent)
  private
    FServer:    TDTS_MFX_APO;
    function    GetDefaultInterface: IDTS_MFX_APO;
    constructor Create(AServer: TDTS_MFX_APO);
  protected
  public
    property DefaultInterface: IDTS_MFX_APO read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoDTS_EFX_APO provides a Create and CreateRemote method to          
// create instances of the default interface IDTS_EFX_APO exposed by              
// the CoClass DTS_EFX_APO. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoDTS_EFX_APO = class
    class function Create: IDTS_EFX_APO;
    class function CreateRemote(const MachineName: string): IDTS_EFX_APO;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TDTS_EFX_APO
// Help String      : 
// Default Interface: IDTS_EFX_APO
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TDTS_EFX_APOProperties= class;
{$ENDIF}
  TDTS_EFX_APO = class(TOleServer)
  private
    FIntf:        IDTS_EFX_APO;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TDTS_EFX_APOProperties;
    function      GetServerProperties: TDTS_EFX_APOProperties;
{$ENDIF}
    function      GetDefaultInterface: IDTS_EFX_APO;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IDTS_EFX_APO);
    procedure Disconnect; override;
    property DefaultInterface: IDTS_EFX_APO read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TDTS_EFX_APOProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TDTS_EFX_APO
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TDTS_EFX_APOProperties = class(TPersistent)
  private
    FServer:    TDTS_EFX_APO;
    function    GetDefaultInterface: IDTS_EFX_APO;
    constructor Create(AServer: TDTS_EFX_APO);
  protected
  public
    property DefaultInterface: IDTS_EFX_APO read GetDefaultInterface;
  published
  end;
{$ENDIF}


procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

  dtlOcxPage = 'ActiveX';

implementation

uses ComObj;

class function CoSRS_LFX_APO_Universal.Create: ISRS_LFX_APO_Universal;
begin
  Result := CreateComObject(CLASS_SRS_LFX_APO_Universal) as ISRS_LFX_APO_Universal;
end;

class function CoSRS_LFX_APO_Universal.CreateRemote(const MachineName: string): ISRS_LFX_APO_Universal;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SRS_LFX_APO_Universal) as ISRS_LFX_APO_Universal;
end;

procedure TSRS_LFX_APO_Universal.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{0D490185-0EF5-4E25-9994-EF95218A851C}';
    IntfIID:   '{F76E042F-08A3-4D93-90E8-D7470FAC37A3}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TSRS_LFX_APO_Universal.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as ISRS_LFX_APO_Universal;
  end;
end;

procedure TSRS_LFX_APO_Universal.ConnectTo(svrIntf: ISRS_LFX_APO_Universal);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TSRS_LFX_APO_Universal.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TSRS_LFX_APO_Universal.GetDefaultInterface: ISRS_LFX_APO_Universal;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TSRS_LFX_APO_Universal.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TSRS_LFX_APO_UniversalProperties.Create(Self);
{$ENDIF}
end;

destructor TSRS_LFX_APO_Universal.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TSRS_LFX_APO_Universal.GetServerProperties: TSRS_LFX_APO_UniversalProperties;
begin
  Result := FProps;
end;
{$ENDIF}

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TSRS_LFX_APO_UniversalProperties.Create(AServer: TSRS_LFX_APO_Universal);
begin
  inherited Create;
  FServer := AServer;
end;

function TSRS_LFX_APO_UniversalProperties.GetDefaultInterface: ISRS_LFX_APO_Universal;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoSRS_LFX_Capture_APO_Universal.Create: ISRS_LFX_Capture_APO_Universal;
begin
  Result := CreateComObject(CLASS_SRS_LFX_Capture_APO_Universal) as ISRS_LFX_Capture_APO_Universal;
end;

class function CoSRS_LFX_Capture_APO_Universal.CreateRemote(const MachineName: string): ISRS_LFX_Capture_APO_Universal;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SRS_LFX_Capture_APO_Universal) as ISRS_LFX_Capture_APO_Universal;
end;

procedure TSRS_LFX_Capture_APO_Universal.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{3C8BA013-2AA8-4687-8913-4EA83E269AE8}';
    IntfIID:   '{2D2FDC3D-4E41-4134-817A-70E681354F75}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TSRS_LFX_Capture_APO_Universal.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as ISRS_LFX_Capture_APO_Universal;
  end;
end;

procedure TSRS_LFX_Capture_APO_Universal.ConnectTo(svrIntf: ISRS_LFX_Capture_APO_Universal);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TSRS_LFX_Capture_APO_Universal.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TSRS_LFX_Capture_APO_Universal.GetDefaultInterface: ISRS_LFX_Capture_APO_Universal;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TSRS_LFX_Capture_APO_Universal.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TSRS_LFX_Capture_APO_UniversalProperties.Create(Self);
{$ENDIF}
end;

destructor TSRS_LFX_Capture_APO_Universal.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TSRS_LFX_Capture_APO_Universal.GetServerProperties: TSRS_LFX_Capture_APO_UniversalProperties;
begin
  Result := FProps;
end;
{$ENDIF}

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TSRS_LFX_Capture_APO_UniversalProperties.Create(AServer: TSRS_LFX_Capture_APO_Universal);
begin
  inherited Create;
  FServer := AServer;
end;

function TSRS_LFX_Capture_APO_UniversalProperties.GetDefaultInterface: ISRS_LFX_Capture_APO_Universal;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoDTS_SFX_APO.Create: IDTS_SFX_APO;
begin
  Result := CreateComObject(CLASS_DTS_SFX_APO) as IDTS_SFX_APO;
end;

class function CoDTS_SFX_APO.CreateRemote(const MachineName: string): IDTS_SFX_APO;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DTS_SFX_APO) as IDTS_SFX_APO;
end;

procedure TDTS_SFX_APO.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{1B917FE2-47D1-425D-A26E-AFCDBDA7A2E8}';
    IntfIID:   '{C5BFB901-0AC1-40F5-B738-078DF230590D}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TDTS_SFX_APO.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IDTS_SFX_APO;
  end;
end;

procedure TDTS_SFX_APO.ConnectTo(svrIntf: IDTS_SFX_APO);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TDTS_SFX_APO.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TDTS_SFX_APO.GetDefaultInterface: IDTS_SFX_APO;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TDTS_SFX_APO.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TDTS_SFX_APOProperties.Create(Self);
{$ENDIF}
end;

destructor TDTS_SFX_APO.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TDTS_SFX_APO.GetServerProperties: TDTS_SFX_APOProperties;
begin
  Result := FProps;
end;
{$ENDIF}

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TDTS_SFX_APOProperties.Create(AServer: TDTS_SFX_APO);
begin
  inherited Create;
  FServer := AServer;
end;

function TDTS_SFX_APOProperties.GetDefaultInterface: IDTS_SFX_APO;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoDTS_MFX_APO.Create: IDTS_MFX_APO;
begin
  Result := CreateComObject(CLASS_DTS_MFX_APO) as IDTS_MFX_APO;
end;

class function CoDTS_MFX_APO.CreateRemote(const MachineName: string): IDTS_MFX_APO;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DTS_MFX_APO) as IDTS_MFX_APO;
end;

procedure TDTS_MFX_APO.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{134DDB7A-41FC-40E6-8D6B-E284C51D160E}';
    IntfIID:   '{F25D9FEB-B36D-4E3B-BA9F-86DBD5BF4CEB}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TDTS_MFX_APO.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IDTS_MFX_APO;
  end;
end;

procedure TDTS_MFX_APO.ConnectTo(svrIntf: IDTS_MFX_APO);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TDTS_MFX_APO.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TDTS_MFX_APO.GetDefaultInterface: IDTS_MFX_APO;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TDTS_MFX_APO.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TDTS_MFX_APOProperties.Create(Self);
{$ENDIF}
end;

destructor TDTS_MFX_APO.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TDTS_MFX_APO.GetServerProperties: TDTS_MFX_APOProperties;
begin
  Result := FProps;
end;
{$ENDIF}

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TDTS_MFX_APOProperties.Create(AServer: TDTS_MFX_APO);
begin
  inherited Create;
  FServer := AServer;
end;

function TDTS_MFX_APOProperties.GetDefaultInterface: IDTS_MFX_APO;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoDTS_EFX_APO.Create: IDTS_EFX_APO;
begin
  Result := CreateComObject(CLASS_DTS_EFX_APO) as IDTS_EFX_APO;
end;

class function CoDTS_EFX_APO.CreateRemote(const MachineName: string): IDTS_EFX_APO;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DTS_EFX_APO) as IDTS_EFX_APO;
end;

procedure TDTS_EFX_APO.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{7B4BF64E-D05D-481D-97CC-C0829AC9280F}';
    IntfIID:   '{F9A6B6D9-26EE-418A-B02C-7BA5060CEA8D}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TDTS_EFX_APO.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IDTS_EFX_APO;
  end;
end;

procedure TDTS_EFX_APO.ConnectTo(svrIntf: IDTS_EFX_APO);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TDTS_EFX_APO.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TDTS_EFX_APO.GetDefaultInterface: IDTS_EFX_APO;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TDTS_EFX_APO.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TDTS_EFX_APOProperties.Create(Self);
{$ENDIF}
end;

destructor TDTS_EFX_APO.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TDTS_EFX_APO.GetServerProperties: TDTS_EFX_APOProperties;
begin
  Result := FProps;
end;
{$ENDIF}

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TDTS_EFX_APOProperties.Create(AServer: TDTS_EFX_APO);
begin
  inherited Create;
  FServer := AServer;
end;

function TDTS_EFX_APOProperties.GetDefaultInterface: IDTS_EFX_APO;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

procedure Register;
begin
  RegisterComponents(dtlServerPage, [TSRS_LFX_APO_Universal, TSRS_LFX_Capture_APO_Universal, TDTS_SFX_APO, TDTS_MFX_APO, 
    TDTS_EFX_APO]);
end;

end.
