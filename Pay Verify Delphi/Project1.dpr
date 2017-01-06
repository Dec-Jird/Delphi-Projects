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
  DES3Dll_TLB in 'DES3Dll_TLB.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

