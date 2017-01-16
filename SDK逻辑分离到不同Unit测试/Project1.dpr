program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  TencentUnit in 'SDKUnits/TencentUnit.pas'; //设置Unit的路径，绝对路径，不能出错

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
