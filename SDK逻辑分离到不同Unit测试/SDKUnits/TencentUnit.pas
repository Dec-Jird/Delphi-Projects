//---�ֶ�����Unit����Ԫ����File->new->Unit
unit TencentUnit;

interface
  function getTencentData(msg:String):String; //��interface������Ҫ�õ��ĺ���
  procedure showTencentData(msg:String); //��interface������Ҫ�õ��ĺ���

implementation

uses
  Unit1;

function getTencentData(msg:String):String;   //��implementation��ʵ�ֺ�����
begin
  Result := '[From TencentUnit getTencentData] '+msg;
end;

procedure showTencentData(msg:String); //��implementation��ʵ�ֺ�����
begin
  Form1.Memo1.Lines.Add('[From TencentUnit showTencentData] '+msg);
end;

end.
