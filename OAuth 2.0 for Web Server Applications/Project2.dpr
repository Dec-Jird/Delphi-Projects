program Project2;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  googleBilling_TLB in '..\..\..\..\Program Files (x86)\Borland\Delphi7\Imports\googleBilling_TLB.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
