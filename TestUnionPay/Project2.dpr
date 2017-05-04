program Project2;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  UnionPayDLL_TLB in 'UnionPayDLL_TLB.pas',
  UIAutomationCrossBitnessHookLib_TLB in 'UIAutomationCrossBitnessHookLib_TLB.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
