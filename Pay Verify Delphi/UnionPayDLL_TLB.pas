unit UnionPayDLL_TLB;

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
// File generated on 2017/3/28 11:28:42 from Type Library described below.

// ************************************************************************  //
// Type Lib: D:\Project\Delphi-Projects\Pay Verify Delphi\UnionPayDLL.tlb (1)
// LIBID: {C11A95B3-C9BA-4742-B577-D6833C46B3FF}
// LCID: 0
// Helpfile: 
// HelpString: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
//   (2) v2.4 mscorlib, (C:\Windows\Microsoft.NET\Framework\v4.0.30319\mscorlib.tlb)
// Errors:
//   Error creating palette bitmap of (TAcpService) : Server mscoree.dll contains no icons
//   Error creating palette bitmap of (TBigNum) : Server mscoree.dll contains no icons
//   Error creating palette bitmap of (TCert) : Server mscoree.dll contains no icons
//   Error creating palette bitmap of (TCertUtil) : Server mscoree.dll contains no icons
//   Error creating palette bitmap of (TSDKConfig) : Server mscoree.dll contains no icons
//   Error creating palette bitmap of (TSDKUtil) : Server mscoree.dll contains no icons
//   Error creating palette bitmap of (TUnionPayDLLClass) : Server mscoree.dll contains no icons
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
  UnionPayDLLMajorVersion = 1;
  UnionPayDLLMinorVersion = 0;

  LIBID_UnionPayDLL: TGUID = '{C11A95B3-C9BA-4742-B577-D6833C46B3FF}';

  IID__AcpService: TGUID = '{5CE14976-0FCA-3561-8DAA-6BDAC09D6804}';
  IID__BigNum: TGUID = '{A47E8EA4-16F1-3367-AF88-C33A92FE865C}';
  IID__Cert: TGUID = '{C8D17063-EE98-3DC2-8797-EFA3F06DF15F}';
  IID__CertUtil: TGUID = '{D0C9463E-6087-3384-9249-74C8829761E8}';
  IID__SDKConfig: TGUID = '{7849D185-4D83-3354-A97E-DEF5B0D1E21C}';
  IID__SDKUtil: TGUID = '{D8B0077B-E7D7-34C0-852B-72FAA7ECF95F}';
  IID__SecurityUtil: TGUID = '{9F46A714-4281-3103-9CEA-0839FC42D2E6}';
  IID_UnionPayDLLInterface: TGUID = '{65E9A1E1-79CF-3E05-8F6E-B6A0C55F3284}';
  CLASS_UnionPayDLLClass: TGUID = '{22E3D7F0-3C2B-3EAF-833F-69BD96E26498}';
  CLASS_AcpService: TGUID = '{7B19C837-B3AC-3696-B84F-35D18CC4D9A0}';
  CLASS_BigNum: TGUID = '{CFDF53A2-AB02-34FE-A08C-6323AEA916BD}';
  CLASS_Cert: TGUID = '{7E1396B8-BE33-3CE2-BFE6-EA2700B12C5C}';
  CLASS_CertUtil: TGUID = '{1C636D56-EC6C-366D-BBF9-288B558CF35C}';
  CLASS_SDKConfig: TGUID = '{F55CB7F2-5155-396F-B014-44C202D07F9C}';
  CLASS_SDKUtil: TGUID = '{9ABECB3D-EE89-303F-9DD4-1C124C630FC3}';
  CLASS_SecurityUtil: TGUID = '{EFC52AE1-93F2-373C-B5C9-A8172AC323D1}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  _AcpService = interface;
  _AcpServiceDisp = dispinterface;
  _BigNum = interface;
  _BigNumDisp = dispinterface;
  _Cert = interface;
  _CertDisp = dispinterface;
  _CertUtil = interface;
  _CertUtilDisp = dispinterface;
  _SDKConfig = interface;
  _SDKConfigDisp = dispinterface;
  _SDKUtil = interface;
  _SDKUtilDisp = dispinterface;
  _SecurityUtil = interface;
  _SecurityUtilDisp = dispinterface;
  UnionPayDLLInterface = interface;
  UnionPayDLLInterfaceDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  UnionPayDLLClass = UnionPayDLLInterface;
  AcpService = _AcpService;
  BigNum = _BigNum;
  Cert = _Cert;
  CertUtil = _CertUtil;
  SDKConfig = _SDKConfig;
  SDKUtil = _SDKUtil;
  SecurityUtil = _SecurityUtil;


// *********************************************************************//
// Interface: _AcpService
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {5CE14976-0FCA-3561-8DAA-6BDAC09D6804}
// *********************************************************************//
  _AcpService = interface(IDispatch)
    ['{5CE14976-0FCA-3561-8DAA-6BDAC09D6804}']
  end;

// *********************************************************************//
// DispIntf:  _AcpServiceDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {5CE14976-0FCA-3561-8DAA-6BDAC09D6804}
// *********************************************************************//
  _AcpServiceDisp = dispinterface
    ['{5CE14976-0FCA-3561-8DAA-6BDAC09D6804}']
  end;

// *********************************************************************//
// Interface: _BigNum
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {A47E8EA4-16F1-3367-AF88-C33A92FE865C}
// *********************************************************************//
  _BigNum = interface(IDispatch)
    ['{A47E8EA4-16F1-3367-AF88-C33A92FE865C}']
  end;

// *********************************************************************//
// DispIntf:  _BigNumDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {A47E8EA4-16F1-3367-AF88-C33A92FE865C}
// *********************************************************************//
  _BigNumDisp = dispinterface
    ['{A47E8EA4-16F1-3367-AF88-C33A92FE865C}']
  end;

// *********************************************************************//
// Interface: _Cert
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {C8D17063-EE98-3DC2-8797-EFA3F06DF15F}
// *********************************************************************//
  _Cert = interface(IDispatch)
    ['{C8D17063-EE98-3DC2-8797-EFA3F06DF15F}']
  end;

// *********************************************************************//
// DispIntf:  _CertDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {C8D17063-EE98-3DC2-8797-EFA3F06DF15F}
// *********************************************************************//
  _CertDisp = dispinterface
    ['{C8D17063-EE98-3DC2-8797-EFA3F06DF15F}']
  end;

// *********************************************************************//
// Interface: _CertUtil
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {D0C9463E-6087-3384-9249-74C8829761E8}
// *********************************************************************//
  _CertUtil = interface(IDispatch)
    ['{D0C9463E-6087-3384-9249-74C8829761E8}']
  end;

// *********************************************************************//
// DispIntf:  _CertUtilDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {D0C9463E-6087-3384-9249-74C8829761E8}
// *********************************************************************//
  _CertUtilDisp = dispinterface
    ['{D0C9463E-6087-3384-9249-74C8829761E8}']
  end;

// *********************************************************************//
// Interface: _SDKConfig
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {7849D185-4D83-3354-A97E-DEF5B0D1E21C}
// *********************************************************************//
  _SDKConfig = interface(IDispatch)
    ['{7849D185-4D83-3354-A97E-DEF5B0D1E21C}']
  end;

// *********************************************************************//
// DispIntf:  _SDKConfigDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {7849D185-4D83-3354-A97E-DEF5B0D1E21C}
// *********************************************************************//
  _SDKConfigDisp = dispinterface
    ['{7849D185-4D83-3354-A97E-DEF5B0D1E21C}']
  end;

// *********************************************************************//
// Interface: _SDKUtil
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {D8B0077B-E7D7-34C0-852B-72FAA7ECF95F}
// *********************************************************************//
  _SDKUtil = interface(IDispatch)
    ['{D8B0077B-E7D7-34C0-852B-72FAA7ECF95F}']
  end;

// *********************************************************************//
// DispIntf:  _SDKUtilDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {D8B0077B-E7D7-34C0-852B-72FAA7ECF95F}
// *********************************************************************//
  _SDKUtilDisp = dispinterface
    ['{D8B0077B-E7D7-34C0-852B-72FAA7ECF95F}']
  end;

// *********************************************************************//
// Interface: _SecurityUtil
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {9F46A714-4281-3103-9CEA-0839FC42D2E6}
// *********************************************************************//
  _SecurityUtil = interface(IDispatch)
    ['{9F46A714-4281-3103-9CEA-0839FC42D2E6}']
  end;

// *********************************************************************//
// DispIntf:  _SecurityUtilDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {9F46A714-4281-3103-9CEA-0839FC42D2E6}
// *********************************************************************//
  _SecurityUtilDisp = dispinterface
    ['{9F46A714-4281-3103-9CEA-0839FC42D2E6}']
  end;

// *********************************************************************//
// Interface: UnionPayDLLInterface
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {65E9A1E1-79CF-3E05-8F6E-B6A0C55F3284}
// *********************************************************************//
  UnionPayDLLInterface = interface(IDispatch)
    ['{65E9A1E1-79CF-3E05-8F6E-B6A0C55F3284}']
    function GetUnionpayOrder(const merchant_id: WideString; const order_id: WideString; 
                              const order_time: WideString; const order_amount: WideString; 
                              const callbackInfo: WideString; const request_url: WideString; 
                              const notify_url: WideString): WideString; safecall;
    function UnionpayVerify(const pay_ret_data: WideString): WordBool; safecall;
  end;

// *********************************************************************//
// DispIntf:  UnionPayDLLInterfaceDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {65E9A1E1-79CF-3E05-8F6E-B6A0C55F3284}
// *********************************************************************//
  UnionPayDLLInterfaceDisp = dispinterface
    ['{65E9A1E1-79CF-3E05-8F6E-B6A0C55F3284}']
    function GetUnionpayOrder(const merchant_id: WideString; const order_id: WideString; 
                              const order_time: WideString; const order_amount: WideString; 
                              const callbackInfo: WideString; const request_url: WideString; 
                              const notify_url: WideString): WideString; dispid 1610743808;
    function UnionpayVerify(const pay_ret_data: WideString): WordBool; dispid 1610743809;
  end;

// *********************************************************************//
// The Class CoUnionPayDLLClass provides a Create and CreateRemote method to          
// create instances of the default interface UnionPayDLLInterface exposed by              
// the CoClass UnionPayDLLClass. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoUnionPayDLLClass = class
    class function Create: UnionPayDLLInterface;
    class function CreateRemote(const MachineName: string): UnionPayDLLInterface;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TUnionPayDLLClass
// Help String      : 
// Default Interface: UnionPayDLLInterface
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TUnionPayDLLClassProperties= class;
{$ENDIF}
  TUnionPayDLLClass = class(TOleServer)
  private
    FIntf:        UnionPayDLLInterface;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TUnionPayDLLClassProperties;
    function      GetServerProperties: TUnionPayDLLClassProperties;
{$ENDIF}
    function      GetDefaultInterface: UnionPayDLLInterface;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: UnionPayDLLInterface);
    procedure Disconnect; override;
    function GetUnionpayOrder(const merchant_id: WideString; const order_id: WideString; 
                              const order_time: WideString; const order_amount: WideString; 
                              const callbackInfo: WideString; const request_url: WideString; 
                              const notify_url: WideString): WideString;
    function UnionpayVerify(const pay_ret_data: WideString): WordBool;
    property DefaultInterface: UnionPayDLLInterface read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TUnionPayDLLClassProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TUnionPayDLLClass
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TUnionPayDLLClassProperties = class(TPersistent)
  private
    FServer:    TUnionPayDLLClass;
    function    GetDefaultInterface: UnionPayDLLInterface;
    constructor Create(AServer: TUnionPayDLLClass);
  protected
  public
    property DefaultInterface: UnionPayDLLInterface read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoAcpService provides a Create and CreateRemote method to          
// create instances of the default interface _AcpService exposed by              
// the CoClass AcpService. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoAcpService = class
    class function Create: _AcpService;
    class function CreateRemote(const MachineName: string): _AcpService;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TAcpService
// Help String      : 
// Default Interface: _AcpService
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TAcpServiceProperties= class;
{$ENDIF}
  TAcpService = class(TOleServer)
  private
    FIntf:        _AcpService;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TAcpServiceProperties;
    function      GetServerProperties: TAcpServiceProperties;
{$ENDIF}
    function      GetDefaultInterface: _AcpService;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _AcpService);
    procedure Disconnect; override;
    property DefaultInterface: _AcpService read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TAcpServiceProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TAcpService
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TAcpServiceProperties = class(TPersistent)
  private
    FServer:    TAcpService;
    function    GetDefaultInterface: _AcpService;
    constructor Create(AServer: TAcpService);
  protected
  public
    property DefaultInterface: _AcpService read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoBigNum provides a Create and CreateRemote method to          
// create instances of the default interface _BigNum exposed by              
// the CoClass BigNum. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoBigNum = class
    class function Create: _BigNum;
    class function CreateRemote(const MachineName: string): _BigNum;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TBigNum
// Help String      : 
// Default Interface: _BigNum
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TBigNumProperties= class;
{$ENDIF}
  TBigNum = class(TOleServer)
  private
    FIntf:        _BigNum;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TBigNumProperties;
    function      GetServerProperties: TBigNumProperties;
{$ENDIF}
    function      GetDefaultInterface: _BigNum;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _BigNum);
    procedure Disconnect; override;
    property DefaultInterface: _BigNum read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TBigNumProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TBigNum
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TBigNumProperties = class(TPersistent)
  private
    FServer:    TBigNum;
    function    GetDefaultInterface: _BigNum;
    constructor Create(AServer: TBigNum);
  protected
  public
    property DefaultInterface: _BigNum read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoCert provides a Create and CreateRemote method to          
// create instances of the default interface _Cert exposed by              
// the CoClass Cert. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoCert = class
    class function Create: _Cert;
    class function CreateRemote(const MachineName: string): _Cert;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TCert
// Help String      : 
// Default Interface: _Cert
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TCertProperties= class;
{$ENDIF}
  TCert = class(TOleServer)
  private
    FIntf:        _Cert;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TCertProperties;
    function      GetServerProperties: TCertProperties;
{$ENDIF}
    function      GetDefaultInterface: _Cert;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _Cert);
    procedure Disconnect; override;
    property DefaultInterface: _Cert read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TCertProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TCert
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TCertProperties = class(TPersistent)
  private
    FServer:    TCert;
    function    GetDefaultInterface: _Cert;
    constructor Create(AServer: TCert);
  protected
  public
    property DefaultInterface: _Cert read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoCertUtil provides a Create and CreateRemote method to          
// create instances of the default interface _CertUtil exposed by              
// the CoClass CertUtil. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoCertUtil = class
    class function Create: _CertUtil;
    class function CreateRemote(const MachineName: string): _CertUtil;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TCertUtil
// Help String      : 
// Default Interface: _CertUtil
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TCertUtilProperties= class;
{$ENDIF}
  TCertUtil = class(TOleServer)
  private
    FIntf:        _CertUtil;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TCertUtilProperties;
    function      GetServerProperties: TCertUtilProperties;
{$ENDIF}
    function      GetDefaultInterface: _CertUtil;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _CertUtil);
    procedure Disconnect; override;
    property DefaultInterface: _CertUtil read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TCertUtilProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TCertUtil
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TCertUtilProperties = class(TPersistent)
  private
    FServer:    TCertUtil;
    function    GetDefaultInterface: _CertUtil;
    constructor Create(AServer: TCertUtil);
  protected
  public
    property DefaultInterface: _CertUtil read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoSDKConfig provides a Create and CreateRemote method to          
// create instances of the default interface _SDKConfig exposed by              
// the CoClass SDKConfig. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoSDKConfig = class
    class function Create: _SDKConfig;
    class function CreateRemote(const MachineName: string): _SDKConfig;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TSDKConfig
// Help String      : 
// Default Interface: _SDKConfig
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TSDKConfigProperties= class;
{$ENDIF}
  TSDKConfig = class(TOleServer)
  private
    FIntf:        _SDKConfig;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TSDKConfigProperties;
    function      GetServerProperties: TSDKConfigProperties;
{$ENDIF}
    function      GetDefaultInterface: _SDKConfig;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _SDKConfig);
    procedure Disconnect; override;
    property DefaultInterface: _SDKConfig read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TSDKConfigProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TSDKConfig
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TSDKConfigProperties = class(TPersistent)
  private
    FServer:    TSDKConfig;
    function    GetDefaultInterface: _SDKConfig;
    constructor Create(AServer: TSDKConfig);
  protected
  public
    property DefaultInterface: _SDKConfig read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoSDKUtil provides a Create and CreateRemote method to          
// create instances of the default interface _SDKUtil exposed by              
// the CoClass SDKUtil. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoSDKUtil = class
    class function Create: _SDKUtil;
    class function CreateRemote(const MachineName: string): _SDKUtil;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TSDKUtil
// Help String      : 
// Default Interface: _SDKUtil
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TSDKUtilProperties= class;
{$ENDIF}
  TSDKUtil = class(TOleServer)
  private
    FIntf:        _SDKUtil;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TSDKUtilProperties;
    function      GetServerProperties: TSDKUtilProperties;
{$ENDIF}
    function      GetDefaultInterface: _SDKUtil;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _SDKUtil);
    procedure Disconnect; override;
    property DefaultInterface: _SDKUtil read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TSDKUtilProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TSDKUtil
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TSDKUtilProperties = class(TPersistent)
  private
    FServer:    TSDKUtil;
    function    GetDefaultInterface: _SDKUtil;
    constructor Create(AServer: TSDKUtil);
  protected
  public
    property DefaultInterface: _SDKUtil read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoSecurityUtil provides a Create and CreateRemote method to          
// create instances of the default interface _SecurityUtil exposed by              
// the CoClass SecurityUtil. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoSecurityUtil = class
    class function Create: _SecurityUtil;
    class function CreateRemote(const MachineName: string): _SecurityUtil;
  end;

procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

  dtlOcxPage = 'ActiveX';

implementation

uses ComObj;

class function CoUnionPayDLLClass.Create: UnionPayDLLInterface;
begin
  Result := CreateComObject(CLASS_UnionPayDLLClass) as UnionPayDLLInterface;
end;

class function CoUnionPayDLLClass.CreateRemote(const MachineName: string): UnionPayDLLInterface;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_UnionPayDLLClass) as UnionPayDLLInterface;
end;

procedure TUnionPayDLLClass.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{22E3D7F0-3C2B-3EAF-833F-69BD96E26498}';
    IntfIID:   '{65E9A1E1-79CF-3E05-8F6E-B6A0C55F3284}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TUnionPayDLLClass.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as UnionPayDLLInterface;
  end;
end;

procedure TUnionPayDLLClass.ConnectTo(svrIntf: UnionPayDLLInterface);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TUnionPayDLLClass.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TUnionPayDLLClass.GetDefaultInterface: UnionPayDLLInterface;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TUnionPayDLLClass.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TUnionPayDLLClassProperties.Create(Self);
{$ENDIF}
end;

destructor TUnionPayDLLClass.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TUnionPayDLLClass.GetServerProperties: TUnionPayDLLClassProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TUnionPayDLLClass.GetUnionpayOrder(const merchant_id: WideString; 
                                            const order_id: WideString; 
                                            const order_time: WideString; 
                                            const order_amount: WideString; 
                                            const callbackInfo: WideString; 
                                            const request_url: WideString; 
                                            const notify_url: WideString): WideString;
begin
  Result := DefaultInterface.GetUnionpayOrder(merchant_id, order_id, order_time, order_amount, 
                                              callbackInfo, request_url, notify_url);
end;

function TUnionPayDLLClass.UnionpayVerify(const pay_ret_data: WideString): WordBool;
begin
  Result := DefaultInterface.UnionpayVerify(pay_ret_data);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TUnionPayDLLClassProperties.Create(AServer: TUnionPayDLLClass);
begin
  inherited Create;
  FServer := AServer;
end;

function TUnionPayDLLClassProperties.GetDefaultInterface: UnionPayDLLInterface;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoAcpService.Create: _AcpService;
begin
  Result := CreateComObject(CLASS_AcpService) as _AcpService;
end;

class function CoAcpService.CreateRemote(const MachineName: string): _AcpService;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcpService) as _AcpService;
end;

procedure TAcpService.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{7B19C837-B3AC-3696-B84F-35D18CC4D9A0}';
    IntfIID:   '{5CE14976-0FCA-3561-8DAA-6BDAC09D6804}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TAcpService.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as _AcpService;
  end;
end;

procedure TAcpService.ConnectTo(svrIntf: _AcpService);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TAcpService.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TAcpService.GetDefaultInterface: _AcpService;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TAcpService.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TAcpServiceProperties.Create(Self);
{$ENDIF}
end;

destructor TAcpService.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TAcpService.GetServerProperties: TAcpServiceProperties;
begin
  Result := FProps;
end;
{$ENDIF}

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TAcpServiceProperties.Create(AServer: TAcpService);
begin
  inherited Create;
  FServer := AServer;
end;

function TAcpServiceProperties.GetDefaultInterface: _AcpService;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoBigNum.Create: _BigNum;
begin
  Result := CreateComObject(CLASS_BigNum) as _BigNum;
end;

class function CoBigNum.CreateRemote(const MachineName: string): _BigNum;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_BigNum) as _BigNum;
end;

procedure TBigNum.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{CFDF53A2-AB02-34FE-A08C-6323AEA916BD}';
    IntfIID:   '{A47E8EA4-16F1-3367-AF88-C33A92FE865C}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TBigNum.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as _BigNum;
  end;
end;

procedure TBigNum.ConnectTo(svrIntf: _BigNum);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TBigNum.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TBigNum.GetDefaultInterface: _BigNum;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TBigNum.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TBigNumProperties.Create(Self);
{$ENDIF}
end;

destructor TBigNum.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TBigNum.GetServerProperties: TBigNumProperties;
begin
  Result := FProps;
end;
{$ENDIF}

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TBigNumProperties.Create(AServer: TBigNum);
begin
  inherited Create;
  FServer := AServer;
end;

function TBigNumProperties.GetDefaultInterface: _BigNum;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoCert.Create: _Cert;
begin
  Result := CreateComObject(CLASS_Cert) as _Cert;
end;

class function CoCert.CreateRemote(const MachineName: string): _Cert;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Cert) as _Cert;
end;

procedure TCert.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{7E1396B8-BE33-3CE2-BFE6-EA2700B12C5C}';
    IntfIID:   '{C8D17063-EE98-3DC2-8797-EFA3F06DF15F}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TCert.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as _Cert;
  end;
end;

procedure TCert.ConnectTo(svrIntf: _Cert);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TCert.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TCert.GetDefaultInterface: _Cert;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TCert.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TCertProperties.Create(Self);
{$ENDIF}
end;

destructor TCert.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TCert.GetServerProperties: TCertProperties;
begin
  Result := FProps;
end;
{$ENDIF}

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TCertProperties.Create(AServer: TCert);
begin
  inherited Create;
  FServer := AServer;
end;

function TCertProperties.GetDefaultInterface: _Cert;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoCertUtil.Create: _CertUtil;
begin
  Result := CreateComObject(CLASS_CertUtil) as _CertUtil;
end;

class function CoCertUtil.CreateRemote(const MachineName: string): _CertUtil;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_CertUtil) as _CertUtil;
end;

procedure TCertUtil.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{1C636D56-EC6C-366D-BBF9-288B558CF35C}';
    IntfIID:   '{D0C9463E-6087-3384-9249-74C8829761E8}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TCertUtil.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as _CertUtil;
  end;
end;

procedure TCertUtil.ConnectTo(svrIntf: _CertUtil);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TCertUtil.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TCertUtil.GetDefaultInterface: _CertUtil;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TCertUtil.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TCertUtilProperties.Create(Self);
{$ENDIF}
end;

destructor TCertUtil.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TCertUtil.GetServerProperties: TCertUtilProperties;
begin
  Result := FProps;
end;
{$ENDIF}

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TCertUtilProperties.Create(AServer: TCertUtil);
begin
  inherited Create;
  FServer := AServer;
end;

function TCertUtilProperties.GetDefaultInterface: _CertUtil;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoSDKConfig.Create: _SDKConfig;
begin
  Result := CreateComObject(CLASS_SDKConfig) as _SDKConfig;
end;

class function CoSDKConfig.CreateRemote(const MachineName: string): _SDKConfig;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SDKConfig) as _SDKConfig;
end;

procedure TSDKConfig.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{F55CB7F2-5155-396F-B014-44C202D07F9C}';
    IntfIID:   '{7849D185-4D83-3354-A97E-DEF5B0D1E21C}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TSDKConfig.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as _SDKConfig;
  end;
end;

procedure TSDKConfig.ConnectTo(svrIntf: _SDKConfig);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TSDKConfig.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TSDKConfig.GetDefaultInterface: _SDKConfig;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TSDKConfig.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TSDKConfigProperties.Create(Self);
{$ENDIF}
end;

destructor TSDKConfig.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TSDKConfig.GetServerProperties: TSDKConfigProperties;
begin
  Result := FProps;
end;
{$ENDIF}

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TSDKConfigProperties.Create(AServer: TSDKConfig);
begin
  inherited Create;
  FServer := AServer;
end;

function TSDKConfigProperties.GetDefaultInterface: _SDKConfig;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoSDKUtil.Create: _SDKUtil;
begin
  Result := CreateComObject(CLASS_SDKUtil) as _SDKUtil;
end;

class function CoSDKUtil.CreateRemote(const MachineName: string): _SDKUtil;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SDKUtil) as _SDKUtil;
end;

procedure TSDKUtil.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{9ABECB3D-EE89-303F-9DD4-1C124C630FC3}';
    IntfIID:   '{D8B0077B-E7D7-34C0-852B-72FAA7ECF95F}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TSDKUtil.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as _SDKUtil;
  end;
end;

procedure TSDKUtil.ConnectTo(svrIntf: _SDKUtil);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TSDKUtil.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TSDKUtil.GetDefaultInterface: _SDKUtil;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TSDKUtil.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TSDKUtilProperties.Create(Self);
{$ENDIF}
end;

destructor TSDKUtil.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TSDKUtil.GetServerProperties: TSDKUtilProperties;
begin
  Result := FProps;
end;
{$ENDIF}

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TSDKUtilProperties.Create(AServer: TSDKUtil);
begin
  inherited Create;
  FServer := AServer;
end;

function TSDKUtilProperties.GetDefaultInterface: _SDKUtil;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoSecurityUtil.Create: _SecurityUtil;
begin
  Result := CreateComObject(CLASS_SecurityUtil) as _SecurityUtil;
end;

class function CoSecurityUtil.CreateRemote(const MachineName: string): _SecurityUtil;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SecurityUtil) as _SecurityUtil;
end;

procedure Register;
begin
  RegisterComponents(dtlServerPage, [TUnionPayDLLClass, TAcpService, TBigNum, TCert, 
    TCertUtil, TSDKConfig, TSDKUtil]);
end;

end.
