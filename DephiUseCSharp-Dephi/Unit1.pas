unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DephiUseCSharp_TLB;
  //��tlb�ļ�import�Ժ���install�ͻ�����DephiUseCSharp_TLB.dcu������

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
  CSharpClass : TTestCSharpClass;//����C#���ʵ������ʽ 1��
//  coCSharpClass : TestCSharpClass;//����C#���ʵ������ʽ 2��

begin
  a :=  StrToInt(number1Edit.Text);
  b :=  StrToInt(number2Edit.Text);
{
  Dephiʵ�ּӷ����ԣ�
  sum := a+b;
  }

  {����C#��DLL�⣬��������ٷ��ؽ�� ����ʽ 1��}
   CSharpClass := TTestCSharpClass.Create(self); //����C#�����ʹ��TTestCSharpClassҪ����Create(self)����
   sum := CSharpClass.TestPlus(a, b);//����C#���м���

{����C#��DLL�⣬��������ٷ��ؽ�� ����ʽ 2��}
//   coCSharpClass := CoTestCSharpClass.Create;//����C#�����ʹ��CoTestCSharpClass����Create����
//   sum := coCSharpClass.TestProcedure('abc', a, b);//����C#���м���

   ResultLabel.Caption := IntToStr(sum);
end;

end.
