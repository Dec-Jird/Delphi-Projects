unit UIAutomationCrossBitnessHookLib_TLB;

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
// File generated on 2017/3/23 14:38:41 from Type Library described below.

// ************************************************************************  //
// Type Lib: uiautomationcore.dll\2 (1)
// LIBID: {8ACC2016-04A3-4343-B8E1-1870E35D6A41}
// LCID: 0
// Helpfile: 
// HelpString: UIAutomation CrossBitnessHook 1.0 Type Library
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
// Errors:
//   Error creating palette bitmap of (TUIAutomationCrossBitnessHook64) : Server C:\Windows\SysWOW64\uiautomationcore.dll contains no icons
//   Error creating palette bitmap of (TUIAutomationCrossBitnessHook32) : Server C:\Windows\SysWOW64\uiautomationcore.dll contains no icons
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
  UIAutomationCrossBitnessHookLibMajorVersion = 1;
  UIAutomationCrossBitnessHookLibMinorVersion = 0;

  LIBID_UIAutomationCrossBitnessHookLib: TGUID = '{8ACC2016-04A3-4343-B8E1-1870E35D6A41}';

  IID_IUIAutomationCrossBitnessHook: TGUID = '{4ECE4541-81D4-44AC-9DF6-D199EF66F904}';
  CLASS_UIAutomationCrossBitnessHook64: TGUID = '{49F171DD-B51A-40D3-9A6C-52D674CC729D}';
  CLASS_UIAutomationCrossBitnessHook32: TGUID = '{60A90A2F-858D-42AF-8929-82BE9D99E8A1}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IUIAutomationCrossBitnessHook = interface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  UIAutomationCrossBitnessHook64 = IUIAutomationCrossBitnessHook;
  UIAutomationCrossBitnessHook32 = IUIAutomationCrossBitnessHook;


// *********************************************************************//
// Interface: IUIAutomationCrossBitnessHook
// Flags:     (256) OleAutomation
// GUID:      {4ECE4541-81D4-44AC-9DF6-D199EF66F904}
// *********************************************************************//
  IUIAutomationCrossBitnessHook = interface(IUnknown)
    ['{4ECE4541-81D4-44AC-9DF6-D199EF66F904}']
    function SetCrossBitnessCallWndProcHook(dwTargetThreadId: LongWord; out pdwHookId: LongWord): HResult; stdcall;
    function UnhookCrossBitnessCallWndProcHook(dwHookId: LongWord): HResult; stdcall;
  end;

// *********************************************************************//
// The Class CoUIAutomationCrossBitnessHook64 provides a Create and CreateRemote method to          
// create instances of the default interface IUIAutomationCrossBitnessHook exposed by              
// the CoClass UIAutomationCrossBitnessHook64. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoUIAutomationCrossBitnessHook64 = class
    class function Create: IUIAutomationCrossBitnessHook;
    class function CreateRemote(const MachineName: string): IUIAutomationCrossBitnessHook;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TUIAutomationCrossBitnessHook64
// Help String      : 
// Default Interface: IUIAutomationCrossBitnessHook
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TUIAutomationCrossBitnessHook64Properties= class;
{$ENDIF}
  TUIAutomationCrossBitnessHook64 = class(TOleServer)
  private
    FIntf:        IUIAutomationCrossBitnessHook;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TUIAutomationCrossBitnessHook64Properties;
    function      GetServerProperties: TUIAutomationCrossBitnessHook64Properties;
{$ENDIF}
    function      GetDefaultInterface: IUIAutomationCrossBitnessHook;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IUIAutomationCrossBitnessHook);
    procedure Disconnect; override;
    function SetCrossBitnessCallWndProcHook(dwTargetThreadId: LongWord; out pdwHookId: LongWord): HResult;
    function UnhookCrossBitnessCallWndProcHook(dwHookId: LongWord): HResult;
    property DefaultInterface: IUIAutomationCrossBitnessHook read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TUIAutomationCrossBitnessHook64Properties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TUIAutomationCrossBitnessHook64
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TUIAutomationCrossBitnessHook64Properties = class(TPersistent)
  private
    FServer:    TUIAutomationCrossBitnessHook64;
    function    GetDefaultInterface: IUIAutomationCrossBitnessHook;
    constructor Create(AServer: TUIAutomationCrossBitnessHook64);
  protected
  public
    property DefaultInterface: IUIAutomationCrossBitnessHook read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoUIAutomationCrossBitnessHook32 provides a Create and CreateRemote method to          
// create instances of the default interface IUIAutomationCrossBitnessHook exposed by              
// the CoClass UIAutomationCrossBitnessHook32. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoUIAutomationCrossBitnessHook32 = class
    class function Create: IUIAutomationCrossBitnessHook;
    class function CreateRemote(const MachineName: string): IUIAutomationCrossBitnessHook;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TUIAutomationCrossBitnessHook32
// Help String      : 
// Default Interface: IUIAutomationCrossBitnessHook
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TUIAutomationCrossBitnessHook32Properties= class;
{$ENDIF}
  TUIAutomationCrossBitnessHook32 = class(TOleServer)
  private
    FIntf:        IUIAutomationCrossBitnessHook;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TUIAutomationCrossBitnessHook32Properties;
    function      GetServerProperties: TUIAutomationCrossBitnessHook32Properties;
{$ENDIF}
    function      GetDefaultInterface: IUIAutomationCrossBitnessHook;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IUIAutomationCrossBitnessHook);
    procedure Disconnect; override;
    function SetCrossBitnessCallWndProcHook(dwTargetThreadId: LongWord; out pdwHookId: LongWord): HResult;
    function UnhookCrossBitnessCallWndProcHook(dwHookId: LongWord): HResult;
    property DefaultInterface: IUIAutomationCrossBitnessHook read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TUIAutomationCrossBitnessHook32Properties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TUIAutomationCrossBitnessHook32
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TUIAutomationCrossBitnessHook32Properties = class(TPersistent)
  private
    FServer:    TUIAutomationCrossBitnessHook32;
    function    GetDefaultInterface: IUIAutomationCrossBitnessHook;
    constructor Create(AServer: TUIAutomationCrossBitnessHook32);
  protected
  public
    property DefaultInterface: IUIAutomationCrossBitnessHook read GetDefaultInterface;
  published
  end;
{$ENDIF}


procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

  dtlOcxPage = 'ActiveX';

implementation

uses ComObj;

class function CoUIAutomationCrossBitnessHook64.Create: IUIAutomationCrossBitnessHook;
begin
  Result := CreateComObject(CLASS_UIAutomationCrossBitnessHook64) as IUIAutomationCrossBitnessHook;
end;

class function CoUIAutomationCrossBitnessHook64.CreateRemote(const MachineName: string): IUIAutomationCrossBitnessHook;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_UIAutomationCrossBitnessHook64) as IUIAutomationCrossBitnessHook;
end;

procedure TUIAutomationCrossBitnessHook64.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{49F171DD-B51A-40D3-9A6C-52D674CC729D}';
    IntfIID:   '{4ECE4541-81D4-44AC-9DF6-D199EF66F904}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TUIAutomationCrossBitnessHook64.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IUIAutomationCrossBitnessHook;
  end;
end;

procedure TUIAutomationCrossBitnessHook64.ConnectTo(svrIntf: IUIAutomationCrossBitnessHook);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TUIAutomationCrossBitnessHook64.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TUIAutomationCrossBitnessHook64.GetDefaultInterface: IUIAutomationCrossBitnessHook;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TUIAutomationCrossBitnessHook64.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TUIAutomationCrossBitnessHook64Properties.Create(Self);
{$ENDIF}
end;

destructor TUIAutomationCrossBitnessHook64.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TUIAutomationCrossBitnessHook64.GetServerProperties: TUIAutomationCrossBitnessHook64Properties;
begin
  Result := FProps;
end;
{$ENDIF}

function TUIAutomationCrossBitnessHook64.SetCrossBitnessCallWndProcHook(dwTargetThreadId: LongWord; 
                                                                        out pdwHookId: LongWord): HResult;
begin
  Result := DefaultInterface.SetCrossBitnessCallWndProcHook(dwTargetThreadId, pdwHookId);
end;

function TUIAutomationCrossBitnessHook64.UnhookCrossBitnessCallWndProcHook(dwHookId: LongWord): HResult;
begin
  Result := DefaultInterface.UnhookCrossBitnessCallWndProcHook(dwHookId);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TUIAutomationCrossBitnessHook64Properties.Create(AServer: TUIAutomationCrossBitnessHook64);
begin
  inherited Create;
  FServer := AServer;
end;

function TUIAutomationCrossBitnessHook64Properties.GetDefaultInterface: IUIAutomationCrossBitnessHook;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoUIAutomationCrossBitnessHook32.Create: IUIAutomationCrossBitnessHook;
begin
  Result := CreateComObject(CLASS_UIAutomationCrossBitnessHook32) as IUIAutomationCrossBitnessHook;
end;

class function CoUIAutomationCrossBitnessHook32.CreateRemote(const MachineName: string): IUIAutomationCrossBitnessHook;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_UIAutomationCrossBitnessHook32) as IUIAutomationCrossBitnessHook;
end;

procedure TUIAutomationCrossBitnessHook32.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{60A90A2F-858D-42AF-8929-82BE9D99E8A1}';
    IntfIID:   '{4ECE4541-81D4-44AC-9DF6-D199EF66F904}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TUIAutomationCrossBitnessHook32.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IUIAutomationCrossBitnessHook;
  end;
end;

procedure TUIAutomationCrossBitnessHook32.ConnectTo(svrIntf: IUIAutomationCrossBitnessHook);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TUIAutomationCrossBitnessHook32.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TUIAutomationCrossBitnessHook32.GetDefaultInterface: IUIAutomationCrossBitnessHook;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TUIAutomationCrossBitnessHook32.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TUIAutomationCrossBitnessHook32Properties.Create(Self);
{$ENDIF}
end;

destructor TUIAutomationCrossBitnessHook32.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TUIAutomationCrossBitnessHook32.GetServerProperties: TUIAutomationCrossBitnessHook32Properties;
begin
  Result := FProps;
end;
{$ENDIF}

function TUIAutomationCrossBitnessHook32.SetCrossBitnessCallWndProcHook(dwTargetThreadId: LongWord; 
                                                                        out pdwHookId: LongWord): HResult;
begin
  Result := DefaultInterface.SetCrossBitnessCallWndProcHook(dwTargetThreadId, pdwHookId);
end;

function TUIAutomationCrossBitnessHook32.UnhookCrossBitnessCallWndProcHook(dwHookId: LongWord): HResult;
begin
  Result := DefaultInterface.UnhookCrossBitnessCallWndProcHook(dwHookId);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TUIAutomationCrossBitnessHook32Properties.Create(AServer: TUIAutomationCrossBitnessHook32);
begin
  inherited Create;
  FServer := AServer;
end;

function TUIAutomationCrossBitnessHook32Properties.GetDefaultInterface: IUIAutomationCrossBitnessHook;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

procedure Register;
begin
  RegisterComponents(dtlServerPage, [TUIAutomationCrossBitnessHook64, TUIAutomationCrossBitnessHook32]);
end;

end.
