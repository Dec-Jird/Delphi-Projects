program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  IdHMACSHA1 in 'IdHMACSHA1.pas',
  uLkJSON in 'uLkJSON.pas',
  AsphyreMD5 in 'AsphyreMD5.pas',
  CIBGooglePlay_TLB in 'CIBGooglePlay_TLB.pas',
  System_Net_Http_Primitives_TLB in 'System_Net_Http_Primitives_TLB.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
