unit SignAndVerify_TLB;

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
// File generated on 2016/10/7 16:59:48 from Type Library described below.

// ************************************************************************  //
// Type Lib: D:\TynooProject\DephiProjects\sdk≤‚ ‘π§æﬂdelphi-Huawei\SignAndVerify.tlb (1)
// LIBID: {BB2DBDEB-86B2-48FC-8099-0E12CB0FA92A}
// LCID: 0
// Helpfile:
// HelpString:
// DepndLst:
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
//   (2) v2.4 mscorlib, (C:\Windows\Microsoft.NET\Framework\v4.0.30319\mscorlib.tlb)
// Errors:
//   Hint: Parameter 'type' of SignAndVerifyInterface.HmacSha1Sign changed to 'type_'
//   Error creating palette bitmap of (TSignAndVerifyClass) : Server mscoree.dll contains no icons
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
  SignAndVerifyMajorVersion = 1;
  SignAndVerifyMinorVersion = 0;

  LIBID_SignAndVerify: TGUID = '{BB2DBDEB-86B2-48FC-8099-0E12CB0FA92A}';

  IID_SignAndVerifyInterface: TGUID = '{8DD41868-0645-30CE-93BF-61FAB4E0E1A6}';
  CLASS_SignAndVerifyClass: TGUID = '{2A40FEF5-E0B1-38AE-867C-C7F901328E9E}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary
// *********************************************************************//
  SignAndVerifyInterface = interface;
  SignAndVerifyInterfaceDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library
// (NOTE: Here we map each CoClass to its Default Interface)
// *********************************************************************//
  SignAndVerifyClass = SignAndVerifyInterface;


// *********************************************************************//
// Interface: SignAndVerifyInterface
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {8DD41868-0645-30CE-93BF-61FAB4E0E1A6}
// *********************************************************************//
  SignAndVerifyInterface = interface(IDispatch)
    ['{8DD41868-0645-30CE-93BF-61FAB4E0E1A6}']
    function HmacSha1Sign(const text: WideString; const key: WideString; const type_: WideString): WideString; safecall;
    function RsaSha1Sign(const content: WideString; const privateKey: WideString): WideString; safecall;
    function RsaMd5Sign(const content: WideString; const privateKey: WideString): WideString; safecall;
    function RsaMd5Verify(const BillInfo: WideString; const PublicKey: WideString;
      const sign: WideString): WordBool; safecall;
    function RsaSha1Verify(const BillInfo: WideString; const PublicKey: WideString;
      const sign: WideString): WordBool; safecall;
  end;

// *********************************************************************//
// DispIntf:  SignAndVerifyInterfaceDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {8DD41868-0645-30CE-93BF-61FAB4E0E1A6}
// *********************************************************************//
  SignAndVerifyInterfaceDisp = dispinterface
    ['{8DD41868-0645-30CE-93BF-61FAB4E0E1A6}']
    function HmacSha1Sign(const text: WideString; const key: WideString; const type_: WideString): WideString; dispid 1610743808;
    function RsaSha1Sign(const content: WideString; const privateKey: WideString): WideString; dispid 1610743809;
    function RsaMd5Sign(const content: WideString; const privateKey: WideString): WideString; dispid 1610743810;
    function RsaMd5Verify(const BillInfo: WideString; const PublicKey: WideString;
      const sign: WideString): WordBool; dispid 1610743811;
    function RsaSha1Verify(const BillInfo: WideString; const PublicKey: WideString;
      const sign: WideString): WordBool; dispid 1610743812;
  end;

// *********************************************************************//
// The Class CoSignAndVerifyClass provides a Create and CreateRemote method to
// create instances of the default interface SignAndVerifyInterface exposed by
// the CoClass SignAndVerifyClass. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoSignAndVerifyClass = class
    class function Create: SignAndVerifyInterface;
    class function CreateRemote(const MachineName: string): SignAndVerifyInterface;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TSignAndVerifyClass
// Help String      :
// Default Interface: SignAndVerifyInterface
// Def. Intf. DISP? : No
// Event   Interface:
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TSignAndVerifyClassProperties = class;
{$ENDIF}
  TSignAndVerifyClass = class(TOleServer)
  private
    FIntf: SignAndVerifyInterface;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TSignAndVerifyClassProperties;
    function GetServerProperties: TSignAndVerifyClassProperties;
{$ENDIF}
    function GetDefaultInterface: SignAndVerifyInterface;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: SignAndVerifyInterface);
    procedure Disconnect; override;
    function HmacSha1Sign(const text: WideString; const key: WideString; const type_: WideString): WideString;
    function RsaSha1Sign(const content: WideString; const privateKey: WideString): WideString;
    function RsaMd5Sign(const content: WideString; const privateKey: WideString): WideString;
    function RsaMd5Verify(const BillInfo: WideString; const PublicKey: WideString;
      const sign: WideString): WordBool;
    function RsaSha1Verify(const BillInfo: WideString; const PublicKey: WideString;
      const sign: WideString): WordBool;
    property DefaultInterface: SignAndVerifyInterface read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TSignAndVerifyClassProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TSignAndVerifyClass
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
  TSignAndVerifyClassProperties = class(TPersistent)
  private
    FServer: TSignAndVerifyClass;
    function GetDefaultInterface: SignAndVerifyInterface;
    constructor Create(AServer: TSignAndVerifyClass);
  protected
  public
    property DefaultInterface: SignAndVerifyInterface read GetDefaultInterface;
  published
  end;
{$ENDIF}


procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

  dtlOcxPage = 'ActiveX';

implementation

uses ComObj;

class function CoSignAndVerifyClass.Create: SignAndVerifyInterface;
begin
  Result := CreateComObject(CLASS_SignAndVerifyClass) as SignAndVerifyInterface;
end;

class function CoSignAndVerifyClass.CreateRemote(const MachineName: string): SignAndVerifyInterface;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SignAndVerifyClass) as SignAndVerifyInterface;
end;

procedure TSignAndVerifyClass.InitServerData;
const
  CServerData: TServerData = (
    ClassID: '{2A40FEF5-E0B1-38AE-867C-C7F901328E9E}';
    IntfIID: '{8DD41868-0645-30CE-93BF-61FAB4E0E1A6}';
    EventIID: '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TSignAndVerifyClass.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf := punk as SignAndVerifyInterface;
  end;
end;

procedure TSignAndVerifyClass.ConnectTo(svrIntf: SignAndVerifyInterface);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TSignAndVerifyClass.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TSignAndVerifyClass.GetDefaultInterface: SignAndVerifyInterface;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TSignAndVerifyClass.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TSignAndVerifyClassProperties.Create(Self);
{$ENDIF}
end;

destructor TSignAndVerifyClass.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}

function TSignAndVerifyClass.GetServerProperties: TSignAndVerifyClassProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TSignAndVerifyClass.HmacSha1Sign(const text: WideString; const key: WideString;
  const type_: WideString): WideString;
begin
  Result := DefaultInterface.HmacSha1Sign(text, key, type_);
end;

function TSignAndVerifyClass.RsaSha1Sign(const content: WideString; const privateKey: WideString): WideString;
begin
  Result := DefaultInterface.RsaSha1Sign(content, privateKey);
end;

function TSignAndVerifyClass.RsaMd5Sign(const content: WideString; const privateKey: WideString): WideString;
begin
  Result := DefaultInterface.RsaMd5Sign(content, privateKey);
end;

function TSignAndVerifyClass.RsaMd5Verify(const BillInfo: WideString; const PublicKey: WideString;
  const sign: WideString): WordBool;
begin
  Result := DefaultInterface.RsaMd5Verify(BillInfo, PublicKey, sign);
end;

function TSignAndVerifyClass.RsaSha1Verify(const BillInfo: WideString; const PublicKey: WideString;
  const sign: WideString): WordBool;
begin
  Result := DefaultInterface.RsaSha1Verify(BillInfo, PublicKey, sign);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}

constructor TSignAndVerifyClassProperties.Create(AServer: TSignAndVerifyClass);
begin
  inherited Create;
  FServer := AServer;
end;

function TSignAndVerifyClassProperties.GetDefaultInterface: SignAndVerifyInterface;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

procedure Register;
begin
  RegisterComponents(dtlServerPage, [TSignAndVerifyClass]);
end;

end.
