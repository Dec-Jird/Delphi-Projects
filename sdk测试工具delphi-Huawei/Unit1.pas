unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, wininet, iduri, httpapp, IdGlobal, EncdDecd,
  ExtCtrls, DateUtils, ComCtrls, IdBaseComponent, IdComponent,
   IdCustomHTTPServer, IdHTTPServer,
  IdTCPConnection, IdTCPClient, IdHTTP, OleCtrls, SHDocVw, IdTCPServer,JpushSDK,
   IdHMACSHA1, IdCoderMIME, IdCustomTCPServer, HmacSha1_TLB, httpDll_TLB, SignAndVerify_TLB;

type

  TJPushData = Record
  Key: String;
  Value: String;
  end;

  TJPushDataArray = array of TJPushData;

  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button8: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    LabeledEdit7: TLabeledEdit;
    LabeledEdit6: TLabeledEdit;
    LabeledEdit5: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit1: TLabeledEdit;
    TabSheet2: TTabSheet;
    LabeledEdit8: TLabeledEdit;
    LabeledEdit9: TLabeledEdit;
    TabSheet3: TTabSheet;
    LabeledEdit10: TLabeledEdit;
    LabeledEdit11: TLabeledEdit;
    LabeledEdit12: TLabeledEdit;
    LabeledEdit13: TLabeledEdit;
    Memo6: TMemo;
    TabSheet4: TTabSheet;
    Memo2: TMemo;
    Memo3: TMemo;
    Button6: TButton;
    Button7: TButton;
    TabSheet5: TTabSheet;
    Memo4: TMemo;
    Memo5: TMemo;
    Button9: TButton;
    Button10: TButton;
    TabSheet6: TTabSheet;
    LabeledEdit14: TLabeledEdit;
    LabeledEdit15: TLabeledEdit;
    LabeledEdit16: TLabeledEdit;
    LabeledEdit17: TLabeledEdit;
    Button11: TButton;
    CheckBox1: TCheckBox;
    Button14: TButton;
    LabeledEdit18: TLabeledEdit;
    LabeledEdit19: TLabeledEdit;
    LabeledEdit20: TLabeledEdit;
    Button15: TButton;
    TabSheet7: TTabSheet;
    Memo7: TMemo;
    Memo8: TMemo;
    Button12: TButton;
    Button13: TButton;
    TabSheet8: TTabSheet;
    Memo9: TMemo;
    Button16: TButton;
    LabeledEdit26: TLabeledEdit;
    LabeledEdit27: TLabeledEdit;
    LabeledEdit28: TLabeledEdit;
    LabeledEdit29: TLabeledEdit;
    LabeledEdit30: TLabeledEdit;
    TabSheet9: TTabSheet;
    LabeledEdit21: TLabeledEdit;
    LabeledEdit22: TLabeledEdit;
    LabeledEdit23: TLabeledEdit;
    Button17: TButton;
    LabeledEdit24: TLabeledEdit;
    Button18: TButton;
    LabeledEdit25: TLabeledEdit;
    Button19: TButton;
    TabSheet10: TTabSheet;
    Edit1: TEdit;
    Button20: TButton;
    Edit2: TEdit;
    Edit3: TEdit;
    Button21: TButton;
    TabSheet11: TTabSheet;
    LabeledEdit31: TLabeledEdit;
    LabeledEdit32: TLabeledEdit;
    LabeledEdit33: TLabeledEdit;
    Button22: TButton;
    LabeledEdit34: TLabeledEdit;
    TabSheet12: TTabSheet;
    Button23: TButton;
    LabeledEdit35: TLabeledEdit;
    LabeledEdit36: TLabeledEdit;
    LabeledEdit37: TLabeledEdit;
    Button24: TButton;
    LabeledEdit38: TLabeledEdit;
    LabeledEdit39: TLabeledEdit;
    LabeledEdit40: TLabeledEdit;
    LabeledEdit41: TLabeledEdit;
    LabeledEdit42: TLabeledEdit;
    LabeledEdit43: TLabeledEdit;
    LabeledEdit44: TLabeledEdit;
    LabeledEdit45: TLabeledEdit;
    TabSheet13: TTabSheet;
    TabSheet14: TTabSheet;
    LabeledEdit46: TLabeledEdit;
    LabeledEdit47: TLabeledEdit;
    Button25: TButton;
    Button26: TButton;
    Button27: TButton;
    TabSheet15: TTabSheet;
    Button28: TButton;
    IdHTTPServer1: TIdHTTPServer;
    Button29: TButton;
    Button30: TButton;
    Button31: TButton;
    Button32: TButton;
    Button33: TButton;
    Button34: TButton;
    Button35: TButton;
    Button36: TButton;
    TabSheet16: TTabSheet;
    LabeledEdit48: TLabeledEdit;
    Button37: TButton;
    Button38: TButton;
    Button39: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);

    procedure Button18Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure Button21Click(Sender: TObject);

    procedure SendJPushMessage(MessageStr :String; DataArray : TJPushDataArray);
    procedure Button22Click(Sender: TObject);

   function Base64Encode(const Input: TIdBytes): string;

   function StrToAscii(str, typeStr:string):string;

   function byteToHexStr(str:TIdBytes):string;
   function strToHexStr(str:string):string;
   function MiVerifyPay(str:string):boolean;
   function URLencode(str:string):string;
   function URLDecode(const S: String):string;

    procedure Button23Click(Sender: TObject);
    procedure Button24Click(Sender: TObject);
    procedure Button25Click(Sender: TObject);
    procedure Button26Click(Sender: TObject);
    procedure Button27Click(Sender: TObject);
    procedure Button28Click(Sender: TObject);
    procedure Button29Click(Sender: TObject);
    procedure Button30Click(Sender: TObject);
    procedure Button31Click(Sender: TObject);

    procedure Button32Click(Sender: TObject);
    procedure Button33Click(Sender: TObject);
    procedure Button34Click(Sender: TObject);
    procedure Button35Click(Sender: TObject);
    procedure Button36Click(Sender: TObject);
    procedure Button37Click(Sender: TObject);
    procedure Button39Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  FStream: TStringStream;
  FBuffers: Array[0..65535] of Byte;
  Fbuffer: PChar;
  FBuff: string;
  url: string;
  params: string;
  sigurl: string;

 

implementation

uses uLkJSON, AsphyreMD5;

{$R *.dfm}


function MD5(const s: string): string;
var
  I: integer;
  MD5Bytes: array[1..16] of Byte;
begin
  Result := '';

  MD5Checksum(@S[1], Length(s), @MD5Bytes[1]);

  for i := 1 to 16 do
    Result := Result + Lowercase(IntToHex(MD5Bytes[i], 2));
end;

procedure FHttpsPost(url, data:string;res:TStream; header: string = '');
var
  hInt,hConn,hreq:HINTERNET;
  dwRead, dwFlags:cardinal;
  port: Word;
  uri: TIdURI;
  proto, host, path: string;
begin
  uri := TIdURI.Create(url);
  host := uri.Host;
  if  uri.Params <> '' then
    path := uri.Path + uri.Document + '?' + uri.Params
  else
    path := uri.Path + uri.Document;
  proto := uri.Protocol;
  if UpperCase(proto) = 'HTTPS' then
  begin
    port := INTERNET_DEFAULT_HTTPS_PORT;
    dwFlags := INTERNET_FLAG_SECURE;
  end
  else
  begin
    port := StrToIntDef(uri.Port, 80);
    dwFlags := INTERNET_FLAG_RELOAD;
  end;
  uri.Free;
  hInt := InternetOpen('Delphi',INTERNET_OPEN_TYPE_PRECONFIG,nil,nil,0);
  hConn := InternetConnect(hInt,PChar(host),port,nil,nil,INTERNET_SERVICE_HTTP,0,0);
  hreq := HttpOpenRequest(hConn,'POST',PChar(Path),'HTTP/1.1',nil,nil,dwFlags,0);
  if header <> '' then
    HttpAddRequestHeaders(hreq, PChar(header), length(header), HTTP_ADDREQ_FLAG_ADD and HTTP_ADDREQ_FLAG_REPLACE);
  if HttpSendRequest(hReq,nil,0,PChar(data),Length(data)) then
  begin
    dwRead:=0;
    repeat
      InternetReadFile(hreq,Fbuffer,65536,dwRead);
      if (dwRead <> 0) and (Fbuffer <> nil) then
        res.Write(Fbuffer^, dwRead);
    until dwRead=0;
  end;
 InternetCloseHandle(hreq);
 InternetCloseHandle(hConn);
 InternetCloseHandle(hInt);
end;

procedure FHttpsGet(url: string;res: TStream; header: string = '');
var
  hInt,hUrl:HINTERNET;
  dwRead:cardinal;
begin
  if res = nil then
    Exit;

  try
    hInt := InternetOpen('Delphi',INTERNET_OPEN_TYPE_PRECONFIG,nil,nil,0);
    dwRead:=0;
    if header <> '' then
      HttpAddRequestHeaders(hInt, PChar(header), length(header), HTTP_ADDREQ_FLAG_ADD and HTTP_ADDREQ_FLAG_REPLACE);
    hurl:=InternetOpenUrl(hInt,PChar(url),nil,0,INTERNET_FLAG_RELOAD,0);
    if hurl = nil then
    begin
      InternetCloseHandle(hInt);
      Exit;
    end;
    
    repeat
      if InternetReadFile(hUrl,Fbuffer,1000,dwRead) then
      begin
        if (dwRead > 0) and (Fbuffer <> nil) then
          res.Write(Fbuffer^, dwRead)
        else if (dwRead < 0) then
        begin
          form1.Memo1.Lines.Add('dwRead < 0 error:' + IntTostr(GetLastError()));
        end;
      end
      else
      begin
        form1.Memo1.Lines.Add('InternetReadFile failed:' + IntTostr(GetLastError()));
      end;
    until dwRead=0;
    InternetCloseHandle(hUrl);
    InternetCloseHandle(hInt);
  except
    on E: Exception do
    begin
      form1.Memo1.Lines.Add(E.Message);
    end; 
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FStream := TStringStream.Create('');
  FBuffer := @(FBuffers[0]);
end;


function HttpsGet(url: string; header: string = ''): string;
begin
  try
    FStream.Position := 0;
    FHttpsGet(url, FStream, header);
    result := FStream.DataString;
  finally
  end;
end;

function HttpsPost(url, data: string; header: string = ''): string;
begin
  try
    FStream.Position := 0;
    FHttpsPost(url, data, FStream, header);
    result := FStream.DataString;
  finally

  end;
end;

function Addurl(param, data: string): string;
begin
  params := params + param + '=' + data + '&';
  sigurl := sigurl + param + '=' + data + '&';
end;


function URLEncode(const AStr: String): String;
// The NoConversion set contains characters as specificed in RFC 1738 and
// should not be modified unless the standard changes.
const
  NoConversion = ['A'..'Z','a'..'z','@','.','_','-',
                  '0'..'9','$','!','''','(',')'];
var
  Sp, Rp: PChar;
begin
  SetLength(Result, Length(AStr) * 3);
  Sp := PChar(AStr);
  Rp := PChar(Result);
  while Sp^ <> #0 do
  begin
    if Sp^ in NoConversion then
      Rp^ := Sp^
    else
      if Sp^ = ' ' then
        Rp^ := '+'
      else
      begin
        FormatBuf(Rp^, 3, '%%%.2x', 6, [Ord(Sp^)]);
        Inc(Rp,2);
      end;
    Inc(Rp);
    Inc(Sp);
  end;
  SetLength(Result, Rp - PChar(Result));
end;



function DateTimeToUnixDate(Const ADate: TDateTime): string;
const
  cUnixStarDate: TDateTime = 25569.0;
begin
  Result := IntToStr(Round((ADate - cUnixStarDate) * 86400));
end;

function DateTimeToUnixDateInt(Const ADate: TDateTime): Int64;
const
  cUnixStarDate: TDateTime = 25569.0;
begin
  Result := Round((ADate - cUnixStarDate) * 86400);
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  sig: string;
begin
  //设置cookie
  if not InternetSetCookie('http://msdktest.qq.com/mpay/buy_goods_m',
    'session_id', PAnsiChar(httpEncode('openid'))) then
  begin
    memo1.Lines.Add(SysErrorMessage(GetLastError));
  end;

  if not InternetSetCookie('http://msdktest.qq.com/mpay/buy_goods_m',
    'session_type', PAnsiChar(httpEncode('kp_actoken'))) then
  begin
    memo1.Lines.Add(SysErrorMessage(GetLastError));
  end;

  if not InternetSetCookie('http://msdktest.qq.com/mpay/buy_goods_m',
    'org_loc', PAnsiChar(httpEncode('/mpay/buy_goods_m'))) then
  begin
    memo1.Lines.Add(SysErrorMessage(GetLastError));
  end;

  if not InternetSetCookie('http://msdktest.qq.com/mpay/buy_goods_m',
    'appip', PAnsiChar(httpEncode('221.213.80.58'))) then
  begin
    memo1.Lines.Add(SysErrorMessage(GetLastError));
  end;

  url := 'http://msdktest.qq.com/mpay/buy_goods_m?';
  sigurl := '';
  params := '';
  addurl('appid', LabeledEdit6.Text);
  addurl('goodsmeta', '元宝*一个元宝');
  addurl('goodsurl', 'http://imgcache.qq.com/qzone/space_item/pre/0/66768.gif');
  addurl('openid', LabeledEdit3.Text);
  addurl('openkey', LabeledEdit4.Text);
  addurl('pay_token', LabeledEdit5.Text);
  addurl('payitem', '100*1*1');
  addurl('pf', LabeledEdit1.Text);
  addurl('pfkey', 'pfkey');
  addurl('ts', IntToStr(DateTimeToUnix(now()) - 8*60*60));
  addurl('zoneid', '1');

  sigurl := copy(sigurl, 1, length(sigurl)-1);
  memo1.Lines.Add('');
  memo1.Lines.Add(sigurl);
  memo1.Lines.Add('');

  sigurl := URLEncode('/mpay/buy_goods_m') + '&' + URLEncode(sigurl);
  sigurl := 'GET&' + sigurl;

  memo1.Lines.Add('');
  memo1.Lines.Add(sigurl);
  memo1.Lines.Add('');

  //先做sha1，再做base64
  //sig := doHMACSHA1(LabeledEdit7.Text + '&', sigurl);



  sig := EncodeString(sig);

  //addurl('sig', sig);
  params := params + 'sig=' + sig;
//
  url := url + params;
  memo1.Lines.Add(url);
  //memo1.Lines.Add(sigurl);

  memo1.Lines.Add(httpencode('/v3/user/get_info'));

  memo1.Lines.Add(Utf8ToAnsi(HttpsGet(url)));


  //memo1.Lines.Add(HttpsGet('http://www.baidu.com'));
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Showmessage(IntToStr(DateTimeToUnix(now()) - 8*60*60));
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  gamejs: TlkJSONobject;
  datajs: TlkJSONobject;
  js: TlkJSONobject;
  sig: string;
  id: Int64;
  post: string;
begin
  url := 'http://sdk.g.uc.cn/cp/account.verifySession';
  //url := 'http://115.159.89.253:9988/ucpay';

  gamejs := TlkJSONobject.Create();

  gamejs.Add('gameId', 537935);    //

  datajs := TlkJSONobject.Create();

  datajs.Add('sid', LabeledEdit8.Text);

  id := DateTimeToUnix(now()) - 8*60*60;

  //进行签名字符串拼接
  //(*
  sig :='sid=' + LabeledEdit8.Text + 'f350c8a80c728eadc88fa36c3250e232';
  //*)

  //sig := 'sid=' + LabeledEdit8.Text + 'f350c8a80c728eadc88fa36c3250e232';

  {memo1.Lines.Add('');
  memo1.Lines.Add(sig);
  memo1.Lines.Add('');
  }
  sig := md5( AnsiToUtf8(sig) );

  {memo1.Lines.Add('');
  memo1.Lines.Add(sig);
  memo1.Lines.Add('');
  }
  js := TlkJSONobject.Create();

  js.Add('id', id);
  js.Add('data', datajs);
  js.Add('game', gamejs);
  js.Add('sign', sig);

  post := AnsiToUtf8(TlkJSON.GenerateText(js));
  memo1.Lines.Add(post);
  {memo1.Lines.Add('');
  memo1.Lines.Add(post);
  memo1.Lines.Add('');

  sig:= 'accountId=12221222211123amount=100.00callbackInfo=custominfo=xxxxx#user=xxxxcpOrderId=1234567creator=JYfailedDesc=gameId=123orderId=abcf1330orderStatus=SpayWay=1202cb962234w4ers2aaa';
  sig:= MD5(sig);
  memo1.Lines.Add('sig: '+sig);
  }
  memo1.Lines.Add(Utf8ToAnsi(HttpsPost(url, post )));
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  url := 'http://gameproxy.xinmei365.com/game_agent/checkLogin?productCode=' +
         LabeledEdit13.Text + '&token=' +
         LabeledEdit12.Text + '&channel=' +
         LabeledEdit11.Text + '&userId=' +
         LabeledEdit10.Text;

  memo1.Lines.Add('');
  memo1.Lines.Add(url);
  memo1.Lines.Add('');


  memo1.Lines.Add(Utf8ToAnsi(HttpsGet(url)));
end;

procedure TForm1.Button5Click(Sender: TObject);
var
  s:TStringList;
  i:integer;
  price,callbackInfo, orderId, channelLabel : string;
  js: TlkJSONobject;
begin
{http://182.254.148.221:3358/ljpay?price=600&callbackInfo=eyJwcmljZSI6NjAwLCJub3RpZnl1cmwiOiJodHRwOlwvXC8xODIuMjU0LjE0OC4yMjE6MzM1OFwvbGpwYXkiLCJDYWxsQmFja0luZm8iOiJWWE5sY2tsRVBUVmZOVE15UURFeE5pWkpkR1Z0U1VROU1TWkNhV3hzU1VROU1UUTBPVGN6T0RjM05UQXdNREFtVTJWeWRtVnlTVVE5XHJcbk1RPT0iLCJpdGVtTmFtZSI6IuWFg%2BWunSIsIml0ZW1Db3VudCI6NjB9&orderId=70p10&channelCode=9d08f506c6074a21b0a42fa090890047&channelLabel=baidumobilegame&channelOrderId=64196b91799d6476_01014_2015121009_000000&sign=1913503d714c421e8524aeb1df6e2fbc}
  //Showmessage(md5(Memo6.Text));
  try
  s:=TStringList.Create;
  s.Delimiter := '&';
  s.DelimitedText := memo6.Text;
  s.Sort;

  {for i:=0 to s.Count - 1 do
  begin
    if pos
  end;
  }
  price := s.Values['price'];
  callbackInfo := s.Values['callbackInfo'];
  orderId  := s.Values['orderId'];
  channelLabel := s.Values['channelLabel'];

  //callbackInfo := 'VXNlcklEPTdfODcyM0AyMDImSXRlbUlEPTEmQmlsbElEPTE0NTQ5ODMzMDMwMDAwJlNlcnZlcklEPTE=';

  callbackInfo := DecodeString(HTTPDecode(callbackInfo));
  //memo1.Lines.Add('callbackInfo 0: '+callbackInfo);
  //callbackInfo := DecodeString((callbackInfo));
  //memo1.Lines.Add('callbackInfo 0: '+callbackInfo);
  {js:=nil;

  try
    js:= TlkJSON.ParseText(callbackInfo) as TlkJSONobject;
    if not assigned(js) then
    begin
      memo1.Lines.Add('[error] js is error');
      exit;
    end
    else
    begin
       if js.IndexOfName('CallBackInfo')>=0 then
       begin
         callbackInfo:= js.Field['CallBackInfo'].Value;
       end;

    end;

  except
    on E:Exception do
    begin

    end;
  end;
  }
  memo1.Lines.Add('price: '+price);
  memo1.Lines.Add('orderId: '+orderId);
  memo1.Lines.Add('channelLabel: '+channelLabel);
  memo1.Lines.Add('callbackInfo 1: '+callbackInfo);
  callbackInfo := DecodeString(HTTPDecode(callbackInfo));
  memo1.Lines.Add('callbackInfo: '+callbackInfo);

  //memo1.Lines.Add(DecodeString(HTTPDecode(memo6.Text)));
  except
    memo1.Lines.Add('except');
  end;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  memo3.Text := HttpEncode(memo2.Text);
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  memo3.Text := HTTPDecode(memo2.Text);
end;

procedure TForm1.Button8Click(Sender: TObject);
const
  ss = '012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678911111';
var
  s: string;
  i: integer;
begin
  s := 'abc' + ss;
  i := 0;
  showmessage(s[i]);

end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  memo5.Text := EncodeString(memo4.Text);
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
  memo5.Text := DecodeString(memo4.Text);
end;

procedure TForm1.Button11Click(Sender: TObject);
var
  PostInfo: string;
begin
  if CheckBox1.Checked then
    url := 'http://119.46.99.241:41180/'
  else
    url := 'https://sdk.playpark.net/Authen/';
  PostInfo := 'master_id=' + LabeledEdit14.Text + '&token=' +
    LabeledEdit15.Text + '&ip=' +
    LabeledEdit16.Text + '&ref=' + LabeledEdit17.Text;


  memo1.Lines.Add(Utf8ToAnsi(HttpsPost(url, PostInfo)));
end;

procedure TForm1.Button12Click(Sender: TObject);
begin
  memo8.Text := AnsiToUTF8(memo7.Text);
end;

procedure TForm1.Button13Click(Sender: TObject);
begin
  memo8.Text := Utf8ToAnsi(memo7.Text);
end;

procedure TForm1.Button14Click(Sender: TObject);
var
  PostInfo: string;
  s: TStrings;
begin
  if CheckBox1.Checked then
    url := 'http://119.46.99.241/ewallet_agent_mobile/api/'
  else
    url := 'https://sdk.playpark.net/Refill/Agent/api/';
  PostInfo := 'merchant_code=' + AnsiToUtf8(LabeledEdit20.Text) + '&merchant_key=' +
    LabeledEdit19.Text + '&command=CMD-2005' +
    '&merchant_transaction_id=' + LabeledEdit18.Text;


  //PostInfo := HttpEncode('merchant_code=DestinyOfThrones&merchant_key=5615a9eefab48aa6952d82068088c064&command=CMD-2005&merchant_transaction_id=TR201012310001');
  memo1.Lines.Add(PostInfo);

  memo1.Lines.Add('');

  //memo1.Lines.Add(Utf8ToAnsi(HttpsPost(url, PostInfo)));
  s := TStringlist.Create;
  s.Add(PostInfo);
  //memo1.Lines.Add(IdHTTP.(url, s));
end;

procedure TForm1.Button15Click(Sender: TObject);
var
  PostInfo: string;
begin
  if CheckBox1.Checked then
    url := 'http://119.46.99.241/ewallet_agent_mobile/api/'
  else
    url := 'https://sdk.playpark.net/Refill/Agent/api/';
  PostInfo := 'merchant_code=' + LabeledEdit20.Text + '&merchant_key=' +
    LabeledEdit19.Text + '&command=CMD-3005' +
    '&merchant_transaction_id=' + LabeledEdit18.Text;


  memo1.Lines.Add(Utf8ToAnsi(HttpsPost(url, PostInfo)));
end;

procedure TForm1.Button16Click(Sender: TObject);
var
  header: string;
   JPushDataArray:TJPushDataArray;
    AppKey, MasterSecret: String;
begin

   SetLength(JPushDataArray,2);
   JPushDataArray[0].Key := LabeledEdit26.Text;
   JPushDataArray[0].Value := LabeledEdit27.Text;
    JPushDataArray[1].Key := LabeledEdit28.Text;
   JPushDataArray[1].Value := LabeledEdit29.Text;
    url := 'https://api.jpush.cn/v3/push';
    AppKey := 'dd96aa1b76ae32bc27c29266';
 MasterSecret := '1f82a5a86e79d76572dfe7c8';
  // JpushSDK.SetJpushInfo(url, AppKey, MasterSecret);
     //memo1.Lines.Add(JpushSDK.SendJPushMessage(LabeledEdit30.Text, JPushDataArray));

    SendJPushMessage(LabeledEdit30.Text, JPushDataArray);
  //header := AnsiToUtf8('Authorization: Basic ' + EncodeString('dd96aa1b76ae32bc27c29266:1f82a5a86e79d76572dfe7c8'));
  //header := AnsiToUtf8('Authorization: Basic ' + EncodeString('15de08d9e81b67b7bb0e5404:78d35df2052d3213c787a4eb'));
 // memo1.Lines.Add(Utf8ToAnsi(HttpsPost(url, AnsiToUtf8(Memo9.Text), header)));

end;

 procedure TForm1.SendJPushMessage(MessageStr :String; DataArray : TJPushDataArray);
 var

   Header, AppKey, MasterSecret: String;
   PlatStr, Audience : String; //平台，设备别名指定.
   IOSFlag : String; //true IOS生产环境；false 测试环境.
   JSONStr : String;
   i : integer;
   ArrayJsonStr , TempStr: String;
 begin
 url := 'https://api.jpush.cn/v3/push';
 AppKey := 'dd96aa1b76ae32bc27c29266';
 MasterSecret := '1f82a5a86e79d76572dfe7c8';
 PlatStr := 'all';
 Audience := 'all';
 IOSFlag := 'false';

  for i := 0 to length(DataArray)-1 do
  begin
    TempStr := '"' + DataArray[i].Key + '":' +'"' + DataArray[i].Value + '"';
    if  ArrayJsonStr <> '' then
    begin
       ArrayJsonStr := ArrayJsonStr + ',' + TempStr;
    end
    else
       ArrayJsonStr := TempStr;
  end;

 JSONStr :='{"platform": "'+PlatStr+'","audience" : "'+Audience+'","notification" : {"alert" : "'+MessageStr+'","android" :{"extras" : {'+ArrayJsonStr+'}},"ios" : {"extras" : {'+ArrayJsonStr+'}}},"options" : {"apns_production":'+IOSFlag+'}} ';

 Header := AnsiToUtf8('Authorization: Basic ' + EncodeString(AppKey + ':' + MasterSecret));

   memo9.Lines.Add(JSONStr);
  memo1.Lines.Add(Utf8ToAnsi(HttpsPost(url, AnsiToUtf8(JSONStr), Header)));




 end;

procedure TForm1.Button17Click(Sender: TObject);
begin
  {IdHTTPServer1.DefaultPort := 23333;
  IdHTTPServer1.Bindings.Clear;
  IdHTTPServer1.Bindings.Add.IP := '0.0.0.0';

  IdHTTPServer1.Active := not IdHTTPServer1.Active;

  if IdHTTPServer1.Active then
    memo1.Lines.Add('http server is on!')
  else
    memo1.Lines.Add('http server is off!');
  }
end;



procedure TForm1.Button18Click(Sender: TObject);
var
  b1,
  b2,
  b3,
  info: string;
begin
  url := 'https://www.googleapis.com/oauth2/v3/token';

  info := '{"iss":"' + LabeledEdit22.Text +
    '","scope":"https://www.googleapis.com/auth/androidpublisher","aud":"https://www.googleapis.com/oauth2/v3/token","exp":' +
    IntToStr(DateTimeToUnixDateInt(now) + 3600) + ',"iat":' +
    DateTimeToUnixDate(now) + '}';

  memo1.Lines.Add(info);

  b1 := EncodeString('{"alg":"RS256","typ":"JWT"}');
  b2 := EncodeString(info);
  b3 := EncodeString('MIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBAMNkrkFJAY'
    + 'J45N2B\nbYvyiGiBV96hpuFhxMsz10diJ1xhoTvymemr8ts9clS/BWOku9T979PeSlrVGBf7\'
    + 'nrexR5O9FUd5Qfddp0cF5pTpi4gh4YtRBfAUD/EgogqhjhdaDqbVZq864YEdi/T75\nMH17iO'
    + '/JDpNqsS6DwNOrTGHUva9PAgMBAAECgYAHejbg8LZKE+5OO8HBdUqbFTgT\noQQN4/vv+s/mP'
    + '29aLbJJ5QLW2mm00ikp7RV7trYpdH5VEVCvITCG2m7ReGDWZh8K\nnSLQ1WpGB/ePc93cIMTS'
    + 'qL4GiNixm55iC8jFC7ERFnML4ieAii81Gy6Njapw9PFh\nSle14wBdtcCxxlQ9IQJBAO0ahpn'
    + 'RFhRauK4fO2xsiXLAB42z48DJz06h2K24dvLx\nh9cLSaQtx0VwBAAgKDWfm4umvHuPTRnflL'
    + '3bvEhvV70CQQDS9ypf+H8qr290zYGs\n1QmSzvQloDDkjUVfzKKToGBVtaYBl7UijN3ZzP8eQ'
    + 'NhQHow9KsahdFUXlTsJXenV\nL137AkEAtqA60tlQh2cFXuChlbbX+7HbX5MStxj6e5d/3Pb7'
    + 'b88IEWQZWcME/P/1\npN8f+YWxelR4UzeibG5hFAffM2/HhQJAazTfe9W0CeUNJrYoZ8P7EXf'
    + 'J6jT1o6+G\nyaAcHhkp22Rr7/NAQUaEluHt41ngkxZy/cJ3HiUX+NwFHEV1RrjDcQJBAKR5FF'
    + '0c\nHARCJv0A5w7yUwy3LyrOy0+CjzqNR04mq7uFX1psh3AwiOTqtCd+t9yyd42l8rOp\nHva'
    + 'TuD6Fgt4v8n0\u003d');

  b3 := EncodeString('MIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBAMXBcF+FaN7BsKfg1wgK2K4MZgUX'
+ 'oMlyQeBEUmgC9ALfJJT3bAq0x8LVrKAD5vzPMMmKyPa7jm66MJb+w/mruH/OXzfpyMt5XmaO0gil'
+ 'EZRE8bLTLQ2dDCbGZHw0WQXvXlP+9jP+ehMVHBA9hJwrmPyZeyZyOFfDIO4b+2RDpR+7AgMBAAEC'
+ 'gYEAprxvnApnHpJe+V0o0N4cTbukdRyz88XDZ20TsiDzTkyIkpV+4hQE7fCtKQnBQ10KPJQo12fS'
+ 'MugHufg6kpNH7fWEx1q3mPX60vKyp6jd+95mvTKkItiojSdk4tuugFobpctH1aeMAn1S2nj+cEBY'
+ '93b8Vpcrx7QHHk+8JD14lGECQQD3608Qim4jKja52Oxr+guFugMkkkxc+ZzU7wYhEZ9+VdOFizAF'
+ '890E3vtcxO15XTkcmw9whXcNcAwIgshc499rAkEAzDON+NcW7FyXNm2MFPdcI75zJ/dh/VacYePJ'
+ 'skv7YIkUQAlkMu2ZR677dmo33Qf5LI0UX283AyFycUREQg5k8QJBANuFYjb1PFyqzlZ1e7KIb5dz'
+ 'g8DoQfG5nGL3WugBIMbO3ELNYjKDIltjzhLw1I24PA/WRS+PHkGpyx3mH+AQbg0CQH4MHMjLzGSe'
+ 'SuDYAi42+nM97ktvUtdUjTeHqksax9KxCwT0RxuAuqsbAjH4Iv+XGmI7u6WlOun9zWzJXPEBfaEC'
+ 'QDCXz+cJt/1PTAx1C+j5kRAxnqAnl6Bigko166+WzamL8v/KQLgo+1z3m20xMeG8x1iReugUDLTD'
+ 'k2feUn+WmfQ=');
  info := ('grant_type=urn:ietf:params:oauth:grant-type:jwt-bearer&assertion=') +
    b1 + '.' +
    b2 + '.' +
    b3;

  memo1.Lines.Add(info);
  
  memo1.Lines.Add(Utf8ToAnsi(HttpsPost(url, info)));
end;

procedure TForm1.Button19Click(Sender: TObject);
begin
  url := 'https://accounts.google.com/o/oauth2/token';
end;

procedure TForm1.Button20Click(Sender: TObject);
begin
  memo1.Lines.Add(Utf8ToAnsi(HttpsGet(Edit1.Text, '')));
end;

procedure TForm1.Button21Click(Sender: TObject);
begin
  memo1.Lines.Add(Utf8ToAnsi(HttpsPost(Edit2.Text, Edit3.Text, '')));
end;







procedure TForm1.Button22Click(Sender: TObject);
var
   phone, code, zone, url, appkey, DataStr, KeyStyle: string;

   httpDll:httpDllClass;
begin
    httpDll:= CohttpDllClass.Create;

    phone := LabeledEdit31.Text;
    code := LabeledEdit32.Text;
    zone := LabeledEdit33.Text;
    KeyStyle := LabeledEdit34.Text;

    if KeyStyle = 'AND' then
    begin
      appkey := '72908d744174'; //android.
    end
    else
      appkey := '72929146d340'; //IOS.

    url := 'https://api.sms.mob.com/sms/verify';
    DataStr := 'appkey='+appkey+'&phone='+phone+'&zone='+zone+'&code='+code;



    memo1.Lines.Add(DataStr);
      //memo1.Lines.Add(Utf8ToAnsi(HttpsPost(url, AnsiToUtf8(DataStr))));
        memo1.Lines.Add(Utf8ToAnsi(httpDll.HttpPost(url, AnsiToUtf8(DataStr))));


end;

// Base64编码
function TForm1.Base64Encode(const Input:  TIdBytes): string;
begin
  Result := TIdEncoderMIME.EncodeBytes(Input);
  //Result := '';
end;

// HMACSha1算法
//function TForm1.EncryptHMACSha1(Input, AKey: string): string;
//var
//  Key: TIdBytes;

//begin
  //with TIdHMACSHA1.Create do
  //  try

  //    Key := ToBytes(AKey);

      //Result := HashValue(ToBytes(Input));
  //    Result := HashValue(ToBytes(Input));
      {31,-27,-16,119,-104,-43,-117,16,-23,-32,-60,-12,-45,-65,47,100,-30,106,45,14}
   // finally
    //  Free;
   // end;


//end;

function TForm1.strToHexStr(str:string):string;
var
   i,j : integer;
   s : string;
begin
   for i:=1 to length(str) do
   begin
       j :=  Integer(str[i]);
       s := s + InttoHex(j,2);
   end;
   Result:=s;

end;

function TForm1.byteToHexStr(str:TIdBytes):string;
var
   i,j : integer;
   s : string;
   strKey: TIdBytes;
begin

   strKey := str;
   for i:=0 to length(strKey)-1 do
   begin
       j :=  Integer(strKey[i]);
       
       s := s + InttoHex(j,2);
   end;
   Result:=s;

end;

procedure TForm1.Button23Click(Sender: TObject);
var
   appid, session, uid, sign, secret, DataStr, url: string;
  HmacSha1:HmacSha1Class;
begin
  HmacSha1:= CoHmacSha1Class.Create;

    url := 'http://mis.migc.xiaomi.com/api/biz/service/verifySession.do';

    appid := LabeledEdit35.Text;
    session := LabeledEdit36.Text;
    uid := LabeledEdit37.Text;
    secret := 'W//HWmE3MdFMgA6PgQGKNA==';

    DataStr := 'appId='+appid+'&session='+session+'&uid='+uid;

    sign := HmacSha1.HmacSha1Sign(DataStr, secret, 'hex');
    memo1.Lines.Add(sign);
    
    sign := LowerCase(sign);
    memo1.Lines.Add(sign);

    DataStr := '?appId='+appid+'&session='+session+'&uid='+uid+ '&signature='+sign;
    memo1.Lines.Add(DataStr);

    DataStr := url + DataStr;
    //memo1.Lines.Add(Utf8ToAnsi(HttpsGet(url, AnsiToUtf8(DataStr))));
    memo1.Lines.Add(Utf8ToAnsi(HttpsGet(DataStr)));
end;

function TForm1.URLencode(str:string):string;
var
  i:integer;
  temp:string;
begin
  for i:= 1 to length(str) do
  begin
    temp := temp +'%' + inttohex(integer(str[i]),0);
  end;
  result := temp;
end;

function TForm1.URLDecode(const S: String):string;
var
  I, ACode: integer;
  AHex: string;
begin
  Result := '';
  I:=1;

  while I<=Length(S) do
  begin
    case S[I] of
    '%':
    begin
      if I< Length(S)-2 then
      begin
        AHex := S[I+1] + S[I+2];
        ACode := StrToIntDef('$'+AHex, -1);
        Inc(I, 2);
      end
      else
        ACode := -1;

      if ACode = -1 then
        raise EConvertError.Create('Invalid Hex digit in URL');

      Result := Result + Chr(ACode);
    end;
    '+':
      Result := Result + '';
    else
      Result := Result + S[I];
    end;

    Inc(I);
  end;
end;

function TForm1.MiVerifyPay(str:string):boolean;
var
  Data:string;
  //js: TlkJSONobject;
  s:TStringList;
  i:integer;
  
  appId: string;  //游戏ID
  cpOrderId: string; // 开发商订单ID
  cpUserInfo: string; // 开发商透传信息(可选)
  orderConsumeType: string; //订单类型：10：普通订单11：直充直消订单(可选)
  orderId: string;   // 游戏平台订单ID
  orderStatus: string;// 订单状态，TRADE_SUCCESS 代表成功
  partnerGiftConsume: string;//使用游戏券金额 （如果订单使用游戏券则有,long型），如果有则参与签名
  payFee: string;   // 支付金额,单位为分,即0.01 米币。
  payTime: string;  //支付时间,格式 yyyy-MM-dd HH:mm:ss
  productCode: string;//商品代码
  productCount: string;//商品数量
  productName: string; //商品名称
  uid: string;      //用户ID
  signature: string;//签名

  signStr, sign, secret: string;
begin
  Data := 'appId=2882303761517239138&cpOrderId=9786bffc-996d-4553-aa33-f7e92c0b29d5'+
             '&orderConsumeType=10&orderId=21140990160359583390&orderStatus=TRADE_SUCCES'+
             'S&payFee=1&payTime=2014-09-05%2015:20:27&productCode=com.demo_1&productCount='+
             '1&productName=%E9%93%B6%E5%AD%901%E4%B8%A4&uid=100010&signature=1388720d978021c20aa885d9b3e1b70cec751496';

  Data := UTF8Decode(HTTPDecode(Data));

  s := TStringList.Create;
  s.Delimiter := '&';
  s.DelimitedText := Data;
  s.Sort;
  signStr := '';
  for i :=0 to s.Count - 1 do
  begin
    if pos('signature=',s[i])>0 then
    begin
      Continue;
    end;

    if s.ValueFromIndex[i] = '' then
    begin
      Continue;
    end;

    if signStr = '' then
      signStr := s[i]
    else
      signStr := signStr + '&' +s[i];

  end;

  memo1.Lines.Add(signStr);

  {js:nil;

  try
    js:= TlkJSON.ParseText(jsonStr) as TlkJSONobject;
    if not assigned(js) then
    begin
      //MainOutMessage('[error] js is error jsonStr:' + jsonStr);
      exit;
    end
    else
    begin
       if js.IndexOfName('cpUserInfo')>=0 then
       begin
       end;
       if js.IndexOfName('orderConsumeType')>=0 then
       begin
       end;
    end;

  except
    on E:Exception do
    begin

    end;
  end;
     }

end;

procedure TForm1.Button24Click(Sender: TObject);
var
  flag:boolean;
  str:string;
begin
   flag:= MiVerifyPay(str);
end;

procedure TForm1.Button25Click(Sender: TObject);
var
  url, DataStr, accessToken:string;
begin
  url := 'https://openapi.360.cn/user/me';

  accessToken := LabeledEdit46.Text;

  DataStr := url + '?access_token=' + accessToken;
  //memo1.Lines.Add(Utf8ToAnsi(HttpsGet(DataStr)));

  accessToken := '73082518aaa85073fcf0645c247be50c'+'#'+'65d9991329eb158854db43d4a76e4f43';
  accessToken := '1#VXNlcklEPTNfM0AxJkl0ZW1JRD00JkJpbGxJRD0xNDQ1MzcxMDMyMDAwMA==#65d9991329eb158854db43d4a76e4f43#14453710320000#3_3@1#success#1510207183983725791#4#md5#140907410'+'#'+'73082518aaa85073fcf0645c247be50c';
  memo1.Lines.Add(accessToken);
  memo1.Lines.Add(MD5(UTF8Encode(accessToken)));
end;

procedure TForm1.Button26Click(Sender: TObject);
var
  url, DataStr, accessToken:string;
begin

end;


procedure TForm1.Button27Click(Sender: TObject);
var
  url, appKey, secret, str ,content: string;
  appId, code : integer;
  token, signStr, DataStr : string;

  //Info :array[0..999]of char;
  x:double;
  y:integer;
begin
  //str:='123456';
  //StrCopy(Info, PAnsiChar(str));
  {I/Unity   ( 3175): BaiduCallBackFunc resultMsg 45b405eeee4f404e9829bdea115f86c6-
  e5c20f39de9dee046d88d29848fa8b6c-20150922184743-f8b51164e3e1af2d138ac4c0969148ff
  -e0b6a6c60476f45692465268c9d2e17a-c6ab250826ec8fbafafbcaffd2b3d604
  }
 // memo1.Lines.Add(Info);
  url := 'http://querysdkapi.91.com/CpLoginStateQuery.ashx';
  appId := 5424161;
  appKey := 'OYCIRzKcMNVIRkmuldrGW2nO';
  secret := 'necaGyPbkAVBomGFtxiSa5j42CUndlG8';
  token := '45b405eeee4f404e9829bdea115f86c6-e5c20f39de9dee046d88d29848fa8b6c-20150922184743-f8b51164e3e1af2d138ac4c0969148ff-e0b6a6c60476f45692465268c9d2e17a-c6ab250826ec8fbafafbcaffd2b3d604';


  signStr := inttostr(appId)+ token + secret;

  signStr := MD5(UTF8Encode(signStr));
  memo1.Lines.Add(signStr);

  DataStr := 'AppID='+inttostr(appId)+'&AccessToken='+token+'&Sign='+signStr;

  DataStr := 'AppID=5424161&AccessToken=76ad35426eba4e3989378da50b2a969e-e5c20f39de9dee046d88d29848fa8b6c-20150915191122-e0b1542231e510fd97a0bddb0147f075-390fa8b23d260ae67e53ed1b0ebb58fc-3db7733b3ff019a70bcdae0bf417eaf8&Sign=04d623b352ae2f634fe147747611c575';
  memo1.Lines.Add(DataStr);


  memo1.Lines.Add(Utf8ToAnsi(HttpsPost(url, DataStr, 'Content-Type:application/x-www-form-urlencoded')));

  {code :=1;
  content := 'eyJVSUQiOjEyNzcxNzQ0NzF9';
  signStr := inttostr(appId)+ inttostr(code) + content + secret;
  signStr := MD5(UTF8Encode(signStr));
  memo1.Lines.Add(signStr);

  memo1.Lines.Add(DecodeString(URLDecode(content)));

  x:=1.25;
  y:=Round(x*100);
   memo1.Lines.Add(inttostr(y));
   }
end;

procedure TForm1.Button28Click(Sender: TObject);
var
 token, openId, timeStr, key,securityKey, sign, signStr, url, DataStr: string;
 f:single;
begin


  key:= '3f54c5376541018bfbca446f57709c5a';
  securityKey:= 'RWkqTyh39K6tAQq0nkeXd53Nc7LObWzo';

  token:= '3fb3970c3e421dc7c3f20a1586b89118';
  openId:= '3e780212b222c06915a353201963c2f1';
  timeStr:= inttostr(DateTimeToUnixDateInt(now)-8*60*60);

  url:= 'http://kfz.cmge.com/foreign/oauth/verification2.php';
   //url:= 'http://127.0.0.1';
  signStr:= 'gamekey='+ key+ '&openid='+ openId + '&timestamp=' + timeStr +'&token='+ token;
  //memo1.Lines.Add(DateTimeToUnixDate(now));
  memo1.Lines.Add(signStr);
  sign:=MD5(signStr);
  memo1.Lines.Add(sign+securityKey);
  sign:=MD5(sign+securityKey);

  DataStr:= 'gamekey='+ key+ '&openid='+ openId + '&timestamp=' + timeStr +'&token='+ token + '&_sign='+sign;
  DataStr:= 'gamekey=3f54c5376541018bfbca446f57709c5a&openid=3e780212b222c06915a353201963c2f1&timestamp=1442912601&token=5727a493ace19867958050ad3423b063&_sign=bb6ab72e9784f6b43dd9b1caafdbb855';
  memo1.Lines.Add((DataStr));


  memo1.Lines.Add(Utf8ToAnsi(HttpsPost(url, (DataStr), 'Content-Type:application/x-www-form-urlencoded')));
end;


//{"msg":"ok","ret":0}.
procedure TForm1.Button29Click(Sender: TObject);
var
  pf, timeStr, pfkey, openid, openkey, paytoken, appkey, sig, url, urlData, postData,accessToken, wx_appid:string;
  gamejs: TlkJSONobject;
  appid:integer;
begin

  pf := LabeledEdit1.Text;
  pfkey := LabeledEdit2.Text;
  openid := LabeledEdit3.Text;
  openkey := LabeledEdit4.Text;

  paytoken := LabeledEdit5.Text;
  appid := strtoint(LabeledEdit6.Text);

  appkey := LabeledEdit7.Text;
  timeStr:= inttostr(DateTimeToUnixDateInt(now)-8*60*60);
  
  //WX.
  appkey:='5fcf4ce05523b14f8de298ce18e67880';

  sig := appkey + timeStr;

  //memo1.Lines.Add(sig);
  sig := md5(sig);
  memo1.Lines.Add(sig);


  urlData := 'timestamp='+timeStr+'&appid='+inttostr(appid)+'&sig='+sig+'&openid='+openid+'&encode=1';


  url := 'http://msdktest.qq.com/auth/verify_login?'+ urlData;

  //WX.
  wx_appid := 'wxadfcd25ddd70e265';
  openid:='oAUPrvri5ZxpoGGjHwe6pbfU5bRw';
  urlData := 'timestamp='+timeStr+'&appid='+wx_appid+'&sig='+sig+'&openid='+openid+'&encode=1';
  url := 'http://msdktest.qq.com/auth/check_token/?'+ urlData;
  accessToken := 'OezXcEiiBSKSxW0eoylIeFAWR89ZVlxc_zwYpooZuGc07vOCVdGUm9Ml-Wo7Zb8tjHcEM8rMgPVxtIt4vstbn5_ew6U5WaTNEDCIKYdfwCTAo4Qe9KZPDzna_PeQ8bVxR8eWOBVXDuVdsbAKa4Wk5w';

  gamejs := TlkJSONobject.Create();

  //gamejs.Add('appid', appid);
  //gamejs.Add('openid', openid);
  //gamejs.Add('openkey', openkey);
  //gamejs.Add('userip', '');

  //WX.
  gamejs.Add('accessToken', accessToken);
  gamejs.Add('openid', openid);





  postData:= TlkJSON.GenerateText(gamejs);

  memo1.Lines.Add(url);
  memo1.Lines.Add(postData);
  //AnsiToUtf8
  memo1.Lines.Add(Utf8ToAnsi(HttpsPost(url, AnsiToUtf8(postData), 'Content-Type:application/x-www-form-urlencoded')));

end;

procedure TForm1.Button30Click(Sender: TObject);
var
  info, key, SignStr, tempStr, methodStr, uriStr,sign :string;
  s: TStringList;
  i: integer;
  HmacSha1:HmacSha1Class;
begin
  HmacSha1:= CoHmacSha1Class.Create;
  
  info:= 'openid=test001&appid=33758&ts=1328855301&payitem=323003*8*1&token=53227955F80B805B50FFB511E5AD51E025360&billno=-APPDJT18700-20120210-1428215572&vers'+
  'ion=v3&zoneid=1&providetype=0&amt=80&payamt_coins=20&pubacct_payamt_coins=10&sig=VvKwcaMqUNpKhx0XfCvOqPRiAnU%3D';

  key:= '12345f9a47df4d1eaeb3bad9a7e54321&';

  try
    s:= TStringList.Create;
    s.Delimiter := '&';
    s.DelimitedText := info;
    s.Sort;

    for i:=0 to s.Count - 1 do
    begin
      if pos('sig=', s[i])>0 then
        Continue;

      if s.ValueFromIndex[i] = '' then
        Continue;

      tempStr := s[i];

      tempStr := s.Names[i]+'='+StrToAscii(s.ValueFromIndex[i],'QQ_Value');

      if SignStr = '' then
      begin
      
        SignStr := tempStr;
        
      end
      else
      begin
        SignStr := SignStr + '&' +tempStr;
      end;
    end;
    memo1.Lines.Add(SignStr);

   // memo1.Lines.Add(URLencode(SignStr));

    methodStr := 'GET';
    uriStr:= '/cgi-bin/temp.py';

    SignStr :=methodStr + '&'+ StrToAscii(uriStr,'QQ_URL')+'&'+ StrToAscii(SignStr,'QQ_URL');
    memo1.Lines.Add(SignStr);
  except

  end;

  //'hex'小米渠道使用，返回bytesToHexStr(hmac.Hash).ToLower(); 'base64'腾讯渠道使用，返回Convert.ToBase64String(hmac.Hash).
  sign:= HmacSha1.HmacSha1Sign(SignStr, key, 'base64');

  memo1.Lines.Add(sign);
end;

function TForm1.StrToAscii(str, typeStr:string):string;
var
  i:integer;
  s:string;
begin
   s:='';

   //str[0]为空.
   for i:=1 to Length(str) do
   begin
     if typeStr = 'QQ_Value' then
     begin
       //除了 0~9 a~z A~Z !*() 之外其他字符按其ASCII码的十六进制加%进行表示，例如“-”编码为“%2D”。
       //payitem中，单价如果有小数点“.”，请编码为“%2E”。
       
       if (str[i] in ['0'..'9', 'a'..'z', 'A'..'Z', '!', '(', ')', '*']) then
       begin
         s := s + str[i];
       end
       else
       begin
           s:= s +'%'+ InttoHex(Ord(str[i]),2);
       end;

     end
     else if typeStr = 'QQ_URL' then
     begin
       //要求对字符串中除了“-”、“_”、“.”之外的所有非字母数字字符都替换成百分号(%)后跟两位十六进制数。
       //十六进制数中字母必须为大写。
       
       if (str[i] in ['0'..'9', 'a'..'z', 'A'..'Z', '.', '-', '_']) then
       begin
         s := s + str[i];
       end
       else
       begin
           s:= s +'%'+ InttoHex(Ord(str[i]),2);
       end;
     end;
     
   end;
    result:=s;
end;

procedure TForm1.Button31Click(Sender: TObject);
begin
   Memo6.Clear;
end;

procedure TForm1.Button32Click(Sender: TObject);
begin
    Memo1.Clear;
end;

procedure TForm1.Button33Click(Sender: TObject);
begin
   Memo6.Clear;
   Memo1.Clear;
end;

procedure TForm1.Button34Click(Sender: TObject);
begin
   //memo3.Text := DecodeString(memo2.Text);
   memo3.Text := httpDecode(memo2.Text);
end;

procedure TForm1.Button35Click(Sender: TObject);
begin
   memo3.Text := EncodeString(memo2.Text);
end;

procedure TForm1.Button36Click(Sender: TObject);
begin
     memo5.Text := MD5(memo4.Text);
end;

procedure TForm1.Button37Click(Sender: TObject);
var
  tokenStr, url, data, returnStr, userID, signStr, sign, priKey, verifyStr:string;
  js:TlkJSONobject;
  verifyResult : bool;
  RsaSign:SignAndVerifyClass;
begin
  RsaSign:= CoSignAndVerifyClass.Create;
 //{
  url:= 'https://api.vmall.com/rest.php';
  tokenStr:= LabeledEdit48.Text;
  //URLEncode将字符串以URL编码（空格变+号），也称为百分号编码.
  tokenStr:=StringReplace (URLEncode(tokenStr), '+', '%2B', [rfReplaceAll]); //替换字符串中所有 +为%2B
  data:= url+'?nsp_svc=OpenUP.User.getInfo&nsp_ts='+IntToStr(DateTimeToUnixDateInt(now))+'&access_token='+tokenStr;
  memo1.Lines.Add('data: '+data);
  returnStr:= Utf8ToAnsi(HttpsGet(data));
  memo1.Lines.Add('returnStr: '+returnStr);

  try
    js:= TlkJSON.ParseText(returnStr) as TlkJSONobject;
    if not assigned(js) then
    begin
      memo1.Lines.Add('[error] js is error');
      exit;
    end
    else
    begin
       if js.IndexOfName('userID')>=0 then
       begin
         userID:= js.Field['userID'].Value;
       end;
        memo1.Lines.Add('userID: '+userID);
    end;

  except
    on E:Exception do
    begin

    end;
  end;
  //}
  
  signStr:= 'amount=0.01&applicationID=10383643&productDesc=元宝&productName=元宝&requestId=201605310930&userID=900086000022031102';
  priKey:= 'MIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQCwbioS4JYcC/yt2X9KG+6vXRQfBrRXqSDsZzyIw6Yik8ymWiPMUprsXMc6jFV2dNi6NNjs8QA5mvRMuD6qkPIuQrJ2hBdS9nwzbyWOCMj7kQ+xtl37WnpF1Q'+
'+Dn4sTSmT87Z4BDFK8oY4owa15JRYV7vGLizR4svddff8pB86uMaqziRq8Uj6Uv61iuQu2oBRXLqP8C2UgLcrp3GV1kP77VcL42/ky19AjtfSAMbUFf3FXgz/rn3F9q9srNqzYBRzWou+6lyfO2i7Eg3Psnmb'+
'+ENAAAiYeoFZ5VJmEGhBSrihPjAquxvUR/iODbWaPhPn6urr3UINox1Bfg7+F2JtlAgMBAAECggEBAI9SDo+jLY2/FxZK1qJnKm/+VrgVhC6pz3r7KiuXc8Am/FouY2I5wGw9ugIPueUualhpUca4yAwDmm0wRofckz'+
'+NItgv2ZqlbKODqKhG7q2dW3hrwtDK4QUVXTL5Scrz5jGo/W+wiQ1+17K4EqmUvOo4XrOS858REu05yyuTkgviJleBYBcbH9+YsykYtJ'+
'+FWRiND7hYN3R4Z4UEdmqea24mqdP/pXnuG0MfgmM9U8BrA9trycGm6TbahmwVIeVOlFjP2MtOYMc3Zxy2VVEXEPY/2hJaZGQxr5lx/E0N9pkIEY'+
'+M6kzHFy7dFcrrkh95VVrar6bveQIO0ejx7oth5AkCgYEA51hUi0WZLiVjxMWWieTgtLsPj2GTrPE3p8HNOr1PoNK89Ht9kq58ONHRQBRgRfjZdM1jdsXq7NnoBoXzAAtXwt3iJV3l73hha0Hparq7u7Ff8YpwONjplQ0yytKtgslOD2E'+
'/D/ayZMcjbqOuk4kM0bCBk4i66gxwq4oKF0DiVZsCgYEAwzufsqaXaLBAyNbvTAKS/Ld9vb5oS2GAH/Tsuv3cTO5zby4gKRgUb/hVmnN+diXrLkv6xespf1n0S48oFViMG0LLfw3OckEj0rbiJ7QP10Dgh710z'+
'+EeIbk3QURr6QKz4ScqNE7rVb4/7J/1KAu7ioJoHMI6spk0291VTojgYv8CgYEAvgXg09DkJHJTw8Hkh/l21Ry9iDFHAovUAjh+4Zu0N05CJLL2jzBBGs7FCNRzy6W'+
'+wGEgLOQetlO6cPk/gy7N9GMaqUS6ZHvF0Tr/hkpBf8cPHrBuw1Lwchy4Nr7cBIxjUOC40tz45SxpHyzVbZvp6qcHl'+
'+58UVjMhypIZZdHEbcCgYAucfXJA3bLsfqHjRJ6q7YaJvDj/fND05sufw7+YTxSlPujPH7sJ81c4eBDkSxJoTW02uB6yzohEN5cR19KzLjwF1DgFgHCDpseGuHsfhqyo72GrVynw69uaGirv0JIuZrfenjA3vF/gXYlrdw'+'dvcTM678m8F'+
'IUgPwhPiN4PnnbMwKBgQC1kV'+
'+RT7ik7BucgtOev0z4GBNe8j8QhGkZMrvSTW5zfg2SbLIvGW6fYWbOu/jUy8yfzUdpxsSQoZaxJ4xmaQ2lwVdpruxVDAz6iBp5f98ipUjtB0GL0GCZjxd9i5GXVkACECcRDimEw5UCtjWwlOvgVFZMboBC81F7l0ONaQ2qBw==';

  //订单signStr签名
  sign:=  RsaSign.RsaSha1Sign(signStr, priKey);
  memo1.Lines.Add('sign: '+sign);

  //对支付后返回的签名进行验签
  verifyStr :=  '';
  //接口：RsaSha1Verify(string BillInfo, string PublicKey, string sign)
  //verifyResult := RsaSign.RsaSha1Verify(BillInfo, PublicKey, verifyStr);
end;

procedure TForm1.Button39Click(Sender: TObject);
begin
  memo8.Text := UTF8Decode(HTTPDecode(memo7.Text));
end;

end.

