program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  TencentUnit in 'SDKUnits\TencentUnit.pas',
  THttpClient in 'THttpClient.pas';

//����Unit��·��������·�������ܳ���

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
