unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DephiUseCSharp_TLB;
  //将tlb文件import以后，再install就会生成DephiUseCSharp_TLB.dcu供调用

type
  TForm1 = class(TForm)
    number1Edit: TEdit;
    Label1: TLabel;
    number2Edit: TEdit;
    Label2: TLabel;
    ResultLabel: TLabel;
    Label4: TLabel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  
implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  a,b : Integer;
  sum : Integer;
  CSharpClass : TTestCSharpClass;//声明C#类的实例（方式 1）
//  coCSharpClass : TestCSharpClass;//声明C#类的实例（方式 2）

begin
  a :=  StrToInt(number1Edit.Text);
  b :=  StrToInt(number2Edit.Text);
{
  Dephi实现加法测试：
  sum := a+b;
  }

  {调用C#的DLL库，计算相加再返回结果 （方式 1）}
   CSharpClass := TTestCSharpClass.Create(self); //创建C#类对象，使用TTestCSharpClass要调用Create(self)才行
   sum := CSharpClass.TestPlus(a, b);//调用C#进行计算

{调用C#的DLL库，计算相加再返回结果 （方式 2）}
//   coCSharpClass := CoTestCSharpClass.Create;//创建C#类对象，使用CoTestCSharpClass调用Create就行
//   sum := coCSharpClass.TestProcedure('abc', a, b);//调用C#进行计算

   ResultLabel.Caption := IntToStr(sum);
end;

end.
