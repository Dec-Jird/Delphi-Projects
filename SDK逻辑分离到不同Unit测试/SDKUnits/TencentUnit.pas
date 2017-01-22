//---手动创建Unit（单元）：File->new->Unit
unit TencentUnit;

interface
  function getTencentData(msg:String):String; //在interface声明需要用到的函数
  procedure showTencentData(msg:String); //在interface声明需要用到的函数

implementation

uses
  Unit1, THttpClient;

function getTencentData(msg:String):String;   //在implementation下实现函数体
begin
  Result := '[From TencentUnit getTencentData] '+msg;
end;

procedure showTencentData(msg:String); //在implementation下实现函数体
begin
  Form1.Memo1.Lines.Add('[From TencentUnit showTencentData] '+msg);
  Form1.Memo1.Lines.Add(HttpsPost('my line to add'));
  Form1.Memo1.Lines.Add(AddLine('my line to add'));
end;

end.
