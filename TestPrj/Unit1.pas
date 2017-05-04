unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IdHTTP, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL,
  IdSSLOpenSSL;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    IdHTTP1: TIdHTTP;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
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

  //IdHttp: TIdHTTP;
  mStream: TMemoryStream;
  url, respstr, poststr: string;
  strList: TStringList;
begin

  //IdHttp := TIdHTTP.Create(nil);
  strList := TStringList.Create;
  strList.Add('<Content name="ldaaoew">' +
    '<Time>2017-01-03</Time>' +
    '<Item>data</Item>' +
    '<Task>Mission</Task>' +
    '</Content>');

  url := 'https://api.mch.weixin.qq.com/pay/unifiedorder';
  respstr := '';
  mStream := TMemoryStream.Create;
  try
    strList.SaveToStream(mStream);

    // poststr := AnsiString(poststr);
    // mStream.Write(poststr, length(poststr));

    IdHTTP1.Request.ContentType := 'application/x-www-form-urlencoded';
    respstr := IdHttp1.Post(url, mStream);

    Memo1.Lines.Add('respstr: ' + respstr);
  finally
    mStream.Free;
  end;

end;

end.

