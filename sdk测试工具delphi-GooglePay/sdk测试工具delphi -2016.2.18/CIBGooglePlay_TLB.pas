unit CIBGooglePlay_TLB;

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
// File generated on 2016/2/26 14:14:38 from Type Library described below.

// ************************************************************************  //
// Type Lib: D:\server\Google Pay\Google Pay Verify Dll\sdk测试工具delphi\sdk测试工具delphi -2016.2.18\CIBGooglePlay.tlb (1)
// LIBID: {F0E9E64D-4FA0-3671-86C3-01993EBE997B}
// LCID: 0
// Helpfile: 
// HelpString: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
//   (2) v2.4 mscorlib, (C:\Windows\Microsoft.NET\Framework\v4.0.30319\mscorlib.tlb)
// Errors:
//   Error creating palette bitmap of (TTCibGooglePlay) : Server mscoree.dll contains no icons
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
  CIBGooglePlayMajorVersion = 1;
  CIBGooglePlayMinorVersion = 0;

  LIBID_CIBGooglePlay: TGUID = '{F0E9E64D-4FA0-3671-86C3-01993EBE997B}';

  IID_ICibGooglePlay: TGUID = '{03096044-9495-3A73-BF93-EEE748BD1970}';
  CLASS_TCibGooglePlay: TGUID = '{A656DD71-807B-3671-AA85-51D0CB929269}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  ICibGooglePlay = interface;
  ICibGooglePlayDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  TCibGooglePlay = ICibGooglePlay;


// *********************************************************************//
// Interface: ICibGooglePlay
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {03096044-9495-3A73-BF93-EEE748BD1970}
// *********************************************************************//
  ICibGooglePlay = interface(IDispatch)
    ['{03096044-9495-3A73-BF93-EEE748BD1970}']
    function VerifyBill(const p12Name: WideString; const account: WideString; 
                        const PackedName: WideString; const ItemID: WideString; 
                        const token: WideString): WideString; safecall;
  end;

// *********************************************************************//
// DispIntf:  ICibGooglePlayDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {03096044-9495-3A73-BF93-EEE748BD1970}
// *********************************************************************//
  ICibGooglePlayDisp = dispinterface
    ['{03096044-9495-3A73-BF93-EEE748BD1970}']
    function VerifyBill(const p12Name: WideString; const account: WideString; 
                        const PackedName: WideString; const ItemID: WideString; 
                        const token: WideString): WideString; dispid 1610743808;
  end;

// *********************************************************************//
// The Class CoTCibGooglePlay provides a Create and CreateRemote method to          
// create instances of the default interface ICibGooglePlay exposed by              
// the CoClass TCibGooglePlay. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoTCibGooglePlay = class
    class function Create: ICibGooglePlay;
    class function CreateRemote(const MachineName: string): ICibGooglePlay;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TTCibGooglePlay
// Help String      : 
// Default Interface: ICibGooglePlay
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TTCibGooglePlayProperties= class;
{$ENDIF}
  TTCibGooglePlay = class(TOleServer)
  private
    FIntf:        ICibGooglePlay;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TTCibGooglePlayProperties;
    function      GetServerProperties: TTCibGooglePlayProperties;
{$ENDIF}
    function      GetDefaultInterface: ICibGooglePlay;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: ICibGooglePlay);
    procedure Disconnect; override;
    function VerifyBill(const p12Name: WideString; const account: WideString; 
                        const PackedName: WideString; const ItemID: WideString; 
                        const token: WideString): WideString;
    property DefaultInterface: ICibGooglePlay read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TTCibGooglePlayProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TTCibGooglePlay
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TTCibGooglePlayProperties = class(TPersistent)
  private
    FServer:    TTCibGooglePlay;
    function    GetDefaultInterface: ICibGooglePlay;
    constructor Create(AServer: TTCibGooglePlay);
  protected
  public
    property DefaultInterface: ICibGooglePlay read GetDefaultInterface;
  published
  end;
{$ENDIF}


procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

  dtlOcxPage = 'ActiveX';

implementation

uses ComObj;

class function CoTCibGooglePlay.Create: ICibGooglePlay;
begin
  Result := CreateComObject(CLASS_TCibGooglePlay) as ICibGooglePlay;
end;

class function CoTCibGooglePlay.CreateRemote(const MachineName: string): ICibGooglePlay;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_TCibGooglePlay) as ICibGooglePlay;
end;

procedure TTCibGooglePlay.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{A656DD71-807B-3671-AA85-51D0CB929269}';
    IntfIID:   '{03096044-9495-3A73-BF93-EEE748BD1970}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TTCibGooglePlay.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as ICibGooglePlay;
  end;
end;

procedure TTCibGooglePlay.ConnectTo(svrIntf: ICibGooglePlay);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TTCibGooglePlay.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TTCibGooglePlay.GetDefaultInterface: ICibGooglePlay;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TTCibGooglePlay.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TTCibGooglePlayProperties.Create(Self);
{$ENDIF}
end;

destructor TTCibGooglePlay.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TTCibGooglePlay.GetServerProperties: TTCibGooglePlayProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TTCibGooglePlay.VerifyBill(const p12Name: WideString; const account: WideString; 
                                    const PackedName: WideString; const ItemID: WideString; 
                                    const token: WideString): WideString;
begin
  Result := DefaultInterface.VerifyBill(p12Name, account, PackedName, ItemID, token);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TTCibGooglePlayProperties.Create(AServer: TTCibGooglePlay);
begin
  inherited Create;
  FServer := AServer;
end;

function TTCibGooglePlayProperties.GetDefaultInterface: ICibGooglePlay;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

procedure Register;
begin
  RegisterComponents(dtlServerPage, [TTCibGooglePlay]);
end;

end.
