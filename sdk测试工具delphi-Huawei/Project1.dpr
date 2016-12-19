program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  uLkJSON in 'uLkJSON.pas',
  AsphyreMD5 in 'AsphyreMD5.pas',
  JpushSDK in 'JpushSDK.pas',
  SMSSDK in 'SMSSDK.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
