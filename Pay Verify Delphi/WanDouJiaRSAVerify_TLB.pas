unit WanDouJiaRSAVerify_TLB;

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
// File generated on 2016/11/1 15:16:23 from Type Library described below.

// ************************************************************************  //
// Type Lib: D:\TynooProject\DephiProjects\Pay Verify Delphi\WanDouJiaRSAVerify.tlb (1)
// LIBID: {760FE270-823D-456E-A558-14E6EF9AD4F4}
// LCID: 0
// Helpfile: 
// HelpString: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
//   (2) v2.4 mscorlib, (C:\Windows\Microsoft.NET\Framework\v4.0.30319\mscorlib.tlb)
// Errors:
//   Error creating palette bitmap of (TBerDecodeException) : Server mscoree.dll contains no icons
//   Error creating palette bitmap of (TBigInteger) : Server mscoree.dll contains no icons
//   Error creating palette bitmap of (TWanDouRSAVerifyClass) : Server mscoree.dll contains no icons
//   Error creating palette bitmap of (TRSAUtils) : Server mscoree.dll contains no icons
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
  WanDouJiaRSAVerifyMajorVersion = 1;
  WanDouJiaRSAVerifyMinorVersion = 0;

  LIBID_WanDouJiaRSAVerify: TGUID = '{760FE270-823D-456E-A558-14E6EF9AD4F4}';

  IID__BerDecodeException: TGUID = '{3E3BC924-8713-3455-9782-FFEBF3268A73}';
  IID__BigInteger: TGUID = '{917A1D5D-BDA0-34CD-8C4F-48885418159E}';
  IID_WanDouRSAVerifyInterface: TGUID = '{4950AFB2-7EC8-3E34-9664-F9CE4757955A}';
  CLASS_WanDouRSAVerifyClass: TGUID = '{4B0CA498-5D0C-3734-9C7E-DCD89FFBD86C}';
  IID__RSAUtils: TGUID = '{5C697514-0D26-3A53-B442-E93A76FC9CBA}';
  CLASS_BerDecodeException: TGUID = '{28F8E1CD-D5E4-35DC-997F-55FA59B12660}';
  CLASS_BigInteger: TGUID = '{36ACAA7C-595B-3D13-B0DF-D0F83D57A739}';
  CLASS_RSAUtils: TGUID = '{F71DA503-32FE-3C52-B9C7-3812E530A738}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  _BerDecodeException = interface;
  _BerDecodeExceptionDisp = dispinterface;
  _BigInteger = interface;
  _BigIntegerDisp = dispinterface;
  WanDouRSAVerifyInterface = interface;
  WanDouRSAVerifyInterfaceDisp = dispinterface;
  _RSAUtils = interface;
  _RSAUtilsDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  WanDouRSAVerifyClass = WanDouRSAVerifyInterface;
  BerDecodeException = _BerDecodeException;
  BigInteger = _BigInteger;
  RSAUtils = _RSAUtils;


// *********************************************************************//
// Interface: _BerDecodeException
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {3E3BC924-8713-3455-9782-FFEBF3268A73}
// *********************************************************************//
  _BerDecodeException = interface(IDispatch)
    ['{3E3BC924-8713-3455-9782-FFEBF3268A73}']
  end;

// *********************************************************************//
// DispIntf:  _BerDecodeExceptionDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {3E3BC924-8713-3455-9782-FFEBF3268A73}
// *********************************************************************//
  _BerDecodeExceptionDisp = dispinterface
    ['{3E3BC924-8713-3455-9782-FFEBF3268A73}']
  end;

// *********************************************************************//
// Interface: _BigInteger
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {917A1D5D-BDA0-34CD-8C4F-48885418159E}
// *********************************************************************//
  _BigInteger = interface(IDispatch)
    ['{917A1D5D-BDA0-34CD-8C4F-48885418159E}']
  end;

// *********************************************************************//
// DispIntf:  _BigIntegerDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {917A1D5D-BDA0-34CD-8C4F-48885418159E}
// *********************************************************************//
  _BigIntegerDisp = dispinterface
    ['{917A1D5D-BDA0-34CD-8C4F-48885418159E}']
  end;

// *********************************************************************//
// Interface: WanDouRSAVerifyInterface
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {4950AFB2-7EC8-3E34-9664-F9CE4757955A}
// *********************************************************************//
  WanDouRSAVerifyInterface = interface(IDispatch)
    ['{4950AFB2-7EC8-3E34-9664-F9CE4757955A}']
    function RSAVerify(const data: WideString; const sign: WideString; const publickey: WideString): WordBool; safecall;
  end;

// *********************************************************************//
// DispIntf:  WanDouRSAVerifyInterfaceDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {4950AFB2-7EC8-3E34-9664-F9CE4757955A}
// *********************************************************************//
  WanDouRSAVerifyInterfaceDisp = dispinterface
    ['{4950AFB2-7EC8-3E34-9664-F9CE4757955A}']
    function RSAVerify(const data: WideString; const sign: WideString; const publickey: WideString): WordBool; dispid 1610743808;
  end;

// *********************************************************************//
// Interface: _RSAUtils
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {5C697514-0D26-3A53-B442-E93A76FC9CBA}
// *********************************************************************//
  _RSAUtils = interface(IDispatch)
    ['{5C697514-0D26-3A53-B442-E93A76FC9CBA}']
  end;

// *********************************************************************//
// DispIntf:  _RSAUtilsDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {5C697514-0D26-3A53-B442-E93A76FC9CBA}
// *********************************************************************//
  _RSAUtilsDisp = dispinterface
    ['{5C697514-0D26-3A53-B442-E93A76FC9CBA}']
  end;

// *********************************************************************//
// The Class CoWanDouRSAVerifyClass provides a Create and CreateRemote method to          
// create instances of the default interface WanDouRSAVerifyInterface exposed by              
// the CoClass WanDouRSAVerifyClass. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoWanDouRSAVerifyClass = class
    class function Create: WanDouRSAVerifyInterface;
    class function CreateRemote(const MachineName: string): WanDouRSAVerifyInterface;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TWanDouRSAVerifyClass
// Help String      : 
// Default Interface: WanDouRSAVerifyInterface
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TWanDouRSAVerifyClassProperties= class;
{$ENDIF}
  TWanDouRSAVerifyClass = class(TOleServer)
  private
    FIntf:        WanDouRSAVerifyInterface;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TWanDouRSAVerifyClassProperties;
    function      GetServerProperties: TWanDouRSAVerifyClassProperties;
{$ENDIF}
    function      GetDefaultInterface: WanDouRSAVerifyInterface;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: WanDouRSAVerifyInterface);
    procedure Disconnect; override;
    function RSAVerify(const data: WideString; const sign: WideString; const publickey: WideString): WordBool;
    property DefaultInterface: WanDouRSAVerifyInterface read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TWanDouRSAVerifyClassProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TWanDouRSAVerifyClass
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TWanDouRSAVerifyClassProperties = class(TPersistent)
  private
    FServer:    TWanDouRSAVerifyClass;
    function    GetDefaultInterface: WanDouRSAVerifyInterface;
    constructor Create(AServer: TWanDouRSAVerifyClass);
  protected
  public
    property DefaultInterface: WanDouRSAVerifyInterface read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoBerDecodeException provides a Create and CreateRemote method to          
// create instances of the default interface _BerDecodeException exposed by              
// the CoClass BerDecodeException. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoBerDecodeException = class
    class function Create: _BerDecodeException;
    class function CreateRemote(const MachineName: string): _BerDecodeException;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TBerDecodeException
// Help String      : 
// Default Interface: _BerDecodeException
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TBerDecodeExceptionProperties= class;
{$ENDIF}
  TBerDecodeException = class(TOleServer)
  private
    FIntf:        _BerDecodeException;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TBerDecodeExceptionProperties;
    function      GetServerProperties: TBerDecodeExceptionProperties;
{$ENDIF}
    function      GetDefaultInterface: _BerDecodeException;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _BerDecodeException);
    procedure Disconnect; override;
    property DefaultInterface: _BerDecodeException read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TBerDecodeExceptionProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TBerDecodeException
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TBerDecodeExceptionProperties = class(TPersistent)
  private
    FServer:    TBerDecodeException;
    function    GetDefaultInterface: _BerDecodeException;
    constructor Create(AServer: TBerDecodeException);
  protected
  public
    property DefaultInterface: _BerDecodeException read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoBigInteger provides a Create and CreateRemote method to          
// create instances of the default interface _BigInteger exposed by              
// the CoClass BigInteger. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoBigInteger = class
    class function Create: _BigInteger;
    class function CreateRemote(const MachineName: string): _BigInteger;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TBigInteger
// Help String      : 
// Default Interface: _BigInteger
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TBigIntegerProperties= class;
{$ENDIF}
  TBigInteger = class(TOleServer)
  private
    FIntf:        _BigInteger;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TBigIntegerProperties;
    function      GetServerProperties: TBigIntegerProperties;
{$ENDIF}
    function      GetDefaultInterface: _BigInteger;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _BigInteger);
    procedure Disconnect; override;
    property DefaultInterface: _BigInteger read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TBigIntegerProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TBigInteger
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TBigIntegerProperties = class(TPersistent)
  private
    FServer:    TBigInteger;
    function    GetDefaultInterface: _BigInteger;
    constructor Create(AServer: TBigInteger);
  protected
  public
    property DefaultInterface: _BigInteger read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoRSAUtils provides a Create and CreateRemote method to          
// create instances of the default interface _RSAUtils exposed by              
// the CoClass RSAUtils. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoRSAUtils = class
    class function Create: _RSAUtils;
    class function CreateRemote(const MachineName: string): _RSAUtils;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TRSAUtils
// Help String      : 
// Default Interface: _RSAUtils
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TRSAUtilsProperties= class;
{$ENDIF}
  TRSAUtils = class(TOleServer)
  private
    FIntf:        _RSAUtils;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TRSAUtilsProperties;
    function      GetServerProperties: TRSAUtilsProperties;
{$ENDIF}
    function      GetDefaultInterface: _RSAUtils;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _RSAUtils);
    procedure Disconnect; override;
    property DefaultInterface: _RSAUtils read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TRSAUtilsProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TRSAUtils
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TRSAUtilsProperties = class(TPersistent)
  private
    FServer:    TRSAUtils;
    function    GetDefaultInterface: _RSAUtils;
    constructor Create(AServer: TRSAUtils);
  protected
  public
    property DefaultInterface: _RSAUtils read GetDefaultInterface;
  published
  end;
{$ENDIF}


procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

  dtlOcxPage = 'ActiveX';

implementation

uses ComObj;

class function CoWanDouRSAVerifyClass.Create: WanDouRSAVerifyInterface;
begin
  Result := CreateComObject(CLASS_WanDouRSAVerifyClass) as WanDouRSAVerifyInterface;
end;

class function CoWanDouRSAVerifyClass.CreateRemote(const MachineName: string): WanDouRSAVerifyInterface;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_WanDouRSAVerifyClass) as WanDouRSAVerifyInterface;
end;

procedure TWanDouRSAVerifyClass.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{4B0CA498-5D0C-3734-9C7E-DCD89FFBD86C}';
    IntfIID:   '{4950AFB2-7EC8-3E34-9664-F9CE4757955A}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TWanDouRSAVerifyClass.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as WanDouRSAVerifyInterface;
  end;
end;

procedure TWanDouRSAVerifyClass.ConnectTo(svrIntf: WanDouRSAVerifyInterface);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TWanDouRSAVerifyClass.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TWanDouRSAVerifyClass.GetDefaultInterface: WanDouRSAVerifyInterface;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TWanDouRSAVerifyClass.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TWanDouRSAVerifyClassProperties.Create(Self);
{$ENDIF}
end;

destructor TWanDouRSAVerifyClass.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TWanDouRSAVerifyClass.GetServerProperties: TWanDouRSAVerifyClassProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TWanDouRSAVerifyClass.RSAVerify(const data: WideString; const sign: WideString; 
                                         const publickey: WideString): WordBool;
begin
  Result := DefaultInterface.RSAVerify(data, sign, publickey);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TWanDouRSAVerifyClassProperties.Create(AServer: TWanDouRSAVerifyClass);
begin
  inherited Create;
  FServer := AServer;
end;

function TWanDouRSAVerifyClassProperties.GetDefaultInterface: WanDouRSAVerifyInterface;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoBerDecodeException.Create: _BerDecodeException;
begin
  Result := CreateComObject(CLASS_BerDecodeException) as _BerDecodeException;
end;

class function CoBerDecodeException.CreateRemote(const MachineName: string): _BerDecodeException;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_BerDecodeException) as _BerDecodeException;
end;

procedure TBerDecodeException.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{28F8E1CD-D5E4-35DC-997F-55FA59B12660}';
    IntfIID:   '{3E3BC924-8713-3455-9782-FFEBF3268A73}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TBerDecodeException.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as _BerDecodeException;
  end;
end;

procedure TBerDecodeException.ConnectTo(svrIntf: _BerDecodeException);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TBerDecodeException.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TBerDecodeException.GetDefaultInterface: _BerDecodeException;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TBerDecodeException.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TBerDecodeExceptionProperties.Create(Self);
{$ENDIF}
end;

destructor TBerDecodeException.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TBerDecodeException.GetServerProperties: TBerDecodeExceptionProperties;
begin
  Result := FProps;
end;
{$ENDIF}

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TBerDecodeExceptionProperties.Create(AServer: TBerDecodeException);
begin
  inherited Create;
  FServer := AServer;
end;

function TBerDecodeExceptionProperties.GetDefaultInterface: _BerDecodeException;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoBigInteger.Create: _BigInteger;
begin
  Result := CreateComObject(CLASS_BigInteger) as _BigInteger;
end;

class function CoBigInteger.CreateRemote(const MachineName: string): _BigInteger;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_BigInteger) as _BigInteger;
end;

procedure TBigInteger.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{36ACAA7C-595B-3D13-B0DF-D0F83D57A739}';
    IntfIID:   '{917A1D5D-BDA0-34CD-8C4F-48885418159E}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TBigInteger.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as _BigInteger;
  end;
end;

procedure TBigInteger.ConnectTo(svrIntf: _BigInteger);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TBigInteger.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TBigInteger.GetDefaultInterface: _BigInteger;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TBigInteger.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TBigIntegerProperties.Create(Self);
{$ENDIF}
end;

destructor TBigInteger.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TBigInteger.GetServerProperties: TBigIntegerProperties;
begin
  Result := FProps;
end;
{$ENDIF}

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TBigIntegerProperties.Create(AServer: TBigInteger);
begin
  inherited Create;
  FServer := AServer;
end;

function TBigIntegerProperties.GetDefaultInterface: _BigInteger;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoRSAUtils.Create: _RSAUtils;
begin
  Result := CreateComObject(CLASS_RSAUtils) as _RSAUtils;
end;

class function CoRSAUtils.CreateRemote(const MachineName: string): _RSAUtils;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_RSAUtils) as _RSAUtils;
end;

procedure TRSAUtils.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{F71DA503-32FE-3C52-B9C7-3812E530A738}';
    IntfIID:   '{5C697514-0D26-3A53-B442-E93A76FC9CBA}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TRSAUtils.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as _RSAUtils;
  end;
end;

procedure TRSAUtils.ConnectTo(svrIntf: _RSAUtils);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TRSAUtils.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TRSAUtils.GetDefaultInterface: _RSAUtils;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TRSAUtils.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TRSAUtilsProperties.Create(Self);
{$ENDIF}
end;

destructor TRSAUtils.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TRSAUtils.GetServerProperties: TRSAUtilsProperties;
begin
  Result := FProps;
end;
{$ENDIF}

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TRSAUtilsProperties.Create(AServer: TRSAUtils);
begin
  inherited Create;
  FServer := AServer;
end;

function TRSAUtilsProperties.GetDefaultInterface: _RSAUtils;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

procedure Register;
begin
  RegisterComponents(dtlServerPage, [TWanDouRSAVerifyClass, TBerDecodeException, TBigInteger, TRSAUtils]);
end;

end.
