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

//ʹ��Unit��ʽ
//1. ��implementation������Ҫ�õ�Unit��uses TencentUnit;
//2. TencentUnit���ļ���SDKUnits/ �£�����Ҫ��project1.dpr������uses TencentUnit in 'SDKUnits/TencentUnit.pas';
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
  Memo1.Lines.Add('[From Main Unit]�ֶ�����Unit���ò��ԣ�����TencentUnit�ĺ���'+SLineBreak);

  // 3. ֱ�ӵ�����Ҫ�ĺ������߹��̼���
  Memo1.Lines.Add(getTencentData('��Ѷ�ְ�Ϊʲô��ô�ӣ�')+SLineBreak);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  // 3. ֱ�ӵ�����Ҫ�ĺ������߹��̼���
  showTencentData('��Ѷ�ְֺÿӣ�');
end;

end.
