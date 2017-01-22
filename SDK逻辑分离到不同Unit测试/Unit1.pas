unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function AddLine(line: string):string;
  
var
  Form1: TForm1;
  
implementation

//使用Unit方式
//1. 在implementation下声明要用到Unit：uses TencentUnit;
//2. TencentUnit在文件夹SDKUnits/ 下，故需要在project1.dpr中设置uses TencentUnit in 'SDKUnits/TencentUnit.pas';
uses
  TencentUnit;

  
{$R *.dfm}

function AddLine(line: string):string;
begin
   Form1.Memo1.Lines.Add(line);
   Result:='AddLine: '+line;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Memo1.Lines.Add('[From Main Unit]手动创建Unit调用测试：调用TencentUnit的函数'+SLineBreak);

  // 3. 直接调用需要的函数或者过程即可
  Memo1.Lines.Add(getTencentData('腾讯爸爸为什么那么坑！')+SLineBreak);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  // 3. 直接调用需要的函数或者过程即可
  showTencentData('腾讯爸爸好坑！');
end;

end.
