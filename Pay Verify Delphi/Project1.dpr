program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  uLkJSON in 'uLkJSON.pas',
  AsphyreMD5 in 'AsphyreMD5.pas',
  JpushSDK in 'JpushSDK.pas',
  SMSSDK in 'SMSSDK.pas',
  iapppaySigndll_TLB in 'iapppaySigndll_TLB.pas',
  HmacSha1_TLB in 'HmacSha1_TLB.pas',
  httpDll_TLB in 'httpDll_TLB.pas',
  SignAndVerify_TLB in 'SignAndVerify_TLB.pas',
  WanDouJiaRSAVerify_TLB in 'WanDouJiaRSAVerify_TLB.pas',
  DES3Dll_TLB in 'DES3Dll_TLB.pas',
  TUHttpHelper in 'Utils\TUHttpHelper.pas',
  TUTools in 'Utils\TUTools.pas',
  SDKConst in 'SDKUnits\SDKConst.pas',
  AliAppPayUnit in 'SDKUnits\AliAppPay\AliAppPayUnit.pas',
  WXAppPayUnit in 'SDKUnits\WXAppPay\WXAppPayUnit.pas',
  HttpPostXML_TLB in 'HttpPostXML_TLB.pas',
  UnionPayDLL_TLB in 'UnionPayDLL_TLB.pas',
  UnionAppPayUnit in 'SDKUnits\UnionAppPay\UnionAppPayUnit.pas',
  TencentLoginUnit in 'SDKUnits\TencentPaySDK\TencentLoginUnit.pas',
  TencentPayUnit in 'SDKUnits\TencentPaySDK\TencentPayUnit.pas',
  GoogleOAuth2Unit in 'SDKUnits\GoogleOAuth2SDK\GoogleOAuth2Unit.pas',
  xDex in 'Utils\xDex.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

