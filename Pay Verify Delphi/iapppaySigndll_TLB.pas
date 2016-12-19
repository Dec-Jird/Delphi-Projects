unit iapppaySigndll_TLB;

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
// File generated on 2016/8/16 11:50:25 from Type Library described below.

// ************************************************************************  //
// Type Lib: D:\TynooProject\DephiProjects\Pay Verify Delphi\iapppaySigndll.tlb (1)
// LIBID: {EE98FBAD-4E08-4183-8DA2-BBDD833A1355}
// LCID: 0
// Helpfile: 
// HelpString: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
//   (2) v2.4 mscorlib, (C:\Windows\Microsoft.NET\Framework\v4.0.30319\mscorlib.tlb)
// Errors:
//   Error creating palette bitmap of (TTiapppaySign) : Server mscoree.dll contains no icons
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
  iapppaySigndllMajorVersion = 1;
  iapppaySigndllMinorVersion = 0;

  LIBID_iapppaySigndll: TGUID = '{EE98FBAD-4E08-4183-8DA2-BBDD833A1355}';

  IID_IiapppaySign: TGUID = '{AF3E2015-20C7-3936-AD21-A722934DD4DC}';
  CLASS_TiapppaySign: TGUID = '{EAB44EE1-7C29-37A1-8CF6-17CC838F8C24}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IiapppaySign = interface;
  IiapppaySignDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  TiapppaySign = IiapppaySign;


// *********************************************************************//
// Interface: IiapppaySign
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {AF3E2015-20C7-3936-AD21-A722934DD4DC}
// *********************************************************************//
  IiapppaySign = interface(IDispatch)
    ['{AF3E2015-20C7-3936-AD21-A722934DD4DC}']
    function verifyBill(const BillInfo: WideString; const PublicKey: WideString; 
                        const sign: WideString): WordBool; safecall;
    function SignBill(const BillInfo: WideString; const PrivateKey: WideString): WideString; safecall;
  end;

// *********************************************************************//
// DispIntf:  IiapppaySignDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {AF3E2015-20C7-3936-AD21-A722934DD4DC}
// *********************************************************************//
  IiapppaySignDisp = dispinterface
    ['{AF3E2015-20C7-3936-AD21-A722934DD4DC}']
    function verifyBill(const BillInfo: WideString; const PublicKey: WideString; 
                        const sign: WideString): WordBool; dispid 1610743808;
    function SignBill(const BillInfo: WideString; const PrivateKey: WideString): WideString; dispid 1610743809;
  end;

// *********************************************************************//
// The Class CoTiapppaySign provides a Create and CreateRemote method to          
// create instances of the default interface IiapppaySign exposed by              
// the CoClass TiapppaySign. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoTiapppaySign = class
    class function Create: IiapppaySign;
    class function CreateRemote(const MachineName: string): IiapppaySign;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TTiapppaySign
// Help String      : 
// Default Interface: IiapppaySign
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TTiapppaySignProperties= class;
{$ENDIF}
  TTiapppaySign = class(TOleServer)
  private
    FIntf:        IiapppaySign;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TTiapppaySignProperties;
    function      GetServerProperties: TTiapppaySignProperties;
{$ENDIF}
    function      GetDefaultInterface: IiapppaySign;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IiapppaySign);
    procedure Disconnect; override;
    function verifyBill(const BillInfo: WideString; const PublicKey: WideString; 
                        const sign: WideString): WordBool;
    function SignBill(const BillInfo: WideString; const PrivateKey: WideString): WideString;
    property DefaultInterface: IiapppaySign read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TTiapppaySignProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TTiapppaySign
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TTiapppaySignProperties = class(TPersistent)
  private
    FServer:    TTiapppaySign;
    function    GetDefaultInterface: IiapppaySign;
    constructor Create(AServer: TTiapppaySign);
  protected
  public
    property DefaultInterface: IiapppaySign read GetDefaultInterface;
  published
  end;
{$ENDIF}


procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

  dtlOcxPage = 'ActiveX';

implementation

uses ComObj;

class function CoTiapppaySign.Create: IiapppaySign;
begin
  Result := CreateComObject(CLASS_TiapppaySign) as IiapppaySign;
end;

class function CoTiapppaySign.CreateRemote(const MachineName: string): IiapppaySign;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_TiapppaySign) as IiapppaySign;
end;

procedure TTiapppaySign.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{EAB44EE1-7C29-37A1-8CF6-17CC838F8C24}';
    IntfIID:   '{AF3E2015-20C7-3936-AD21-A722934DD4DC}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TTiapppaySign.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IiapppaySign;
  end;
end;

procedure TTiapppaySign.ConnectTo(svrIntf: IiapppaySign);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TTiapppaySign.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TTiapppaySign.GetDefaultInterface: IiapppaySign;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TTiapppaySign.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TTiapppaySignProperties.Create(Self);
{$ENDIF}
end;

destructor TTiapppaySign.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TTiapppaySign.GetServerProperties: TTiapppaySignProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TTiapppaySign.verifyBill(const BillInfo: WideString; const PublicKey: WideString; 
                                  const sign: WideString): WordBool;
begin
  Result := DefaultInterface.verifyBill(BillInfo, PublicKey, sign);
end;

function TTiapppaySign.SignBill(const BillInfo: WideString; const PrivateKey: WideString): WideString;
begin
  Result := DefaultInterface.SignBill(BillInfo, PrivateKey);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TTiapppaySignProperties.Create(AServer: TTiapppaySign);
begin
  inherited Create;
  FServer := AServer;
end;

function TTiapppaySignProperties.GetDefaultInterface: IiapppaySign;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

procedure Register;
begin
  RegisterComponents(dtlServerPage, [TTiapppaySign]);
end;

end.
