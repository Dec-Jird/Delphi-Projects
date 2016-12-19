unit Unit1;
(*
OAuth 2.0 for Web Server Applications.

使用http向谷歌服务器验证支付结果，主要有以下5步：
1、在Google Developer Console中创建一个 Web Application账户，得到
   client_id，client_secret 和 redirect_uri，这3个参数后边步骤常用到（此为前提）.
2、获取Authorization code .
3、利用code 获取access_token(一小时的有效期)，refresh_token(此应用存在就有效).
4、由于access_token有时间限制，可利用refresh_token获取新的access_token.
5、使用access_token 调用Google API 达到最终目的.

要用到的参数：client_id、client_secret 、redirect_uri/refresh_token、packageName(应用包名)
    productId(商品ID)、purchaseToken.

支付验证请求到正确的json ：
   {
                      "kind": "androidpublisher#productPurchase",
                      "purchaseTimeMillis": long,产品的购买时间.
                     *"purchaseState": integer,我们依靠这个判断购买信息（0 购买成功;1 取消购买）.
                      "consumptionState": integer,商品消耗状态（0 未消耗;1 消耗成功）.
                      "developerPayload": string 订单的补充信息.
   }

最后附上相关链接
   (1) 请求 access_token：(https://accounts.google.com/o/oauth2/token?grant_type=refresh_token
   &client_id={CLIENT_ID} &client_secret = {CLIENT_SECRET} &refresh_token = {REFRESH_TOKEN}).
(2)验证支付结果(https: //www.googleapis.com/androidpublisher/v2/applications/{packageName}
  / purchases / products / {productId} / tokens / {purchaseToken} ?access_token = {access_token}).
(3)参考网站ds：http: //blog.csdn.net/hjun01/article/details/42032841
*)

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DateUtils, StdCtrls, IDHttp, Mask, ExtCtrls, ComCtrls, IDURI, WinINet, uLkJSON, AsphyreMD5;

type
  TForm1 = class(TForm)
    Button2: TButton;
    Button3: TButton;
    RichEdit1: TRichEdit;
    Button1: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  {  procedure Button1Click(Sender: TObject);  }
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  js: TlkJSONobject;
  Jso: TlkJSONbase;
  valid_time: Integer; //有效时间.
  access_token: string;
  RichEdit1: TRichEdit;
procedure Get(url: string; res: TStream); overload;
procedure Post(url, data: string; res: TStream); overload;


implementation

{$R *.dfm}

//MD5加密

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

//Post请求

procedure Post(url, data: string; res: TStream);
var
  hInt, hConn, hreq: HINTERNET;
  buffer: PChar;
  dwRead, dwFlags: cardinal;
  port: Word;
  uri: TIdURI;
  proto, host, path: string;
  header: string;
begin
  uri := TIdURI.Create(url);
  host := uri.Host;
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
  hInt := InternetOpen('Delphi', INTERNET_OPEN_TYPE_PRECONFIG, nil, nil, 0);
  hConn := InternetConnect(hInt, PChar(host), port, nil, nil, INTERNET_SERVICE_HTTP, 0, 0);
  hreq := HttpOpenRequest(hConn, 'POST', PChar(Path), 'HTTP/1.1', nil, nil, dwFlags, 0);
  GetMem(buffer, 65536);
  header := 'Content-Type: application/x-www-form-urlencoded';
  if HttpSendRequest(hReq, PAnsiChar(header), Length(header), PChar(data), Length(data)) then
  begin
    dwRead := 0;
    repeat
      InternetReadFile(hreq, buffer, 65536, dwRead);
      if dwRead <> 0 then
        res.Write(buffer^, dwRead);
    until dwRead = 0;
  end;
  InternetCloseHandle(hreq);
  InternetCloseHandle(hConn);
  InternetCloseHandle(hInt);
  FreeMem(buffer);
end;

//格式化时间.

function DateTimeToUnixDateInt(const ADate: TDateTime): Int64;
const
  cUnixStarDate: TDateTime = 25569.0;
begin
  Result := Round((ADate - cUnixStarDate) * 86400);
end;

function DateTimeToUnixDate(const ADate: TDateTime): string;
const
  cUnixStarDate: TDateTime = 25569.0;
begin
  Result := IntToStr(Round((ADate - cUnixStarDate) * 86400));
end;

//Get请求.

procedure Get(url: string; res: TStream);
var
  hInt, hUrl: HINTERNET;
  buffer: PChar;
  dwRead: cardinal;
begin
  GetMem(buffer, 65536);
  hInt := InternetOpen('Delphi', INTERNET_OPEN_TYPE_PRECONFIG, nil, nil, 0);
  dwRead := 0;
  hurl := InternetOpenUrl(hInt, PChar(url), nil, 0, INTERNET_FLAG_RELOAD, 0);
  repeat
    InternetReadFile(hUrl, buffer, 1000, dwRead);
    if dwRead <> 0 then
      res.Write(buffer^, dwRead);
  until dwRead = 0;
  InternetCloseHandle(hUrl);
  InternetCloseHandle(hInt);
  FreeMem(buffer);
end;

//post请求 ，刷新access_token.

function GetAccessToken(refresh_token: string; client_id: string; client_secret: string): string;
var
  s: TStringStream;
begin
  //请求包头.
  s := TStringStream.Create('Content-Type:application/x-www-form-urlencoded');
  try
    //Post请求,依靠refresh_token:、client_id、 client_secret三个参数刷新 access_token.
    Post('https://accounts.google.com/o/oauth2/token', 'refresh_token=' + refresh_token + '&client_id=' + client_id + '&client_secret=' + client_secret + '&grant_type=refresh_token', s);
    Result := s.DataString;
  finally
    s.Free;
  end;
end;

 //魅族登录验证

function MEIZULoginVerify(app_id: string; uid: string; session_id: string; APP_SECRET: string): string;
var
  s: TStringStream;
  signstr: string;
  ts: string;
  SysTime: TSystemTime;
begin
  //请求包头.
  s := TStringStream.Create('Content-Type:application/x-www-form-urlencoded');
  GetSystemTime(SysTime);
  //得到十三位的时间戳
  ts := FormatFloat('#', CompToDouble(TimeStampToMSecs(DateTimeToTimeStamp(SystemTimeToDateTime(SysTime)))) - TimeStampToMSecs(DateTimeToTimeStamp(StrToDateTime('1970/1/1'))));
  try
    //签名字符串的顺序一定不能乱
    signstr := 'app_id=' + app_id + '' + '&session_id=' + session_id + '&ts=' + ts + '&uid=' + uid + ':' + APP_SECRET;
    signstr := MD5(AnsiToUtf8(signstr));
    //post
    Post('https://api.game.meizu.com/game/security/checksession', 'app_id=' + app_id + '&uid=' + uid + '&session_id=' + session_id + '&ts=' + ts + '&sign_type=md5' + '&sign=' + signstr, s);
    Result := s.DataString;
  finally
    s.Free;
  end;
end;

//订单签名,要用到的参数(app_id)

function MEIZUOrderSign(app_id: string; buy_amount: string; cp_order_id: string; pay_type: string; product_body: string; product_id: string; product_per_price: string; product_subject: string; product_unit: string; total_price: string; uid: string; user_info: string; APP_SECRET: string): string;
var
  signstr: string;
  ts: string;
  SysTime: TSystemTime;
begin

  GetSystemTime(SysTime);
  //得到十三位的时间戳
  ts := FormatFloat('#', CompToDouble(TimeStampToMSecs(DateTimeToTimeStamp(SystemTimeToDateTime(SysTime)))) - TimeStampToMSecs(DateTimeToTimeStamp(StrToDateTime('1970/1/1'))));
  try
    //签名字符串的顺序一定不能乱
    signstr := 'app_id=' + app_id + '&buy_amount=' + buy_amount + '&cp_order_id=' + cp_order_id + '&create_time=' + ts + '&pay_type=' + pay_type + '&product_body=' + product_body + '&product_id=' + product_id + '&product_per_price=' + product_per_price + '&product_subject=' + product_subject + '&product_unit=' + product_unit + '&total_price=' + total_price + '&uid=' + uid + '&user_info=' + user_info + ':' + APP_SECRET;
    signstr := MD5(AnsiToUtf8(signstr));
    Result := signstr;
  finally
  end;
end;
//魅族支付验证

function MEIZUPayVerify(app_id: string; cp_order_id: string; APP_SECRET: string): string;
var
  s: TStringStream;
  signstr: string;
  ts: string;
  SysTime: TSystemTime;
begin
  //请求包头.
  s := TStringStream.Create('Content-Type:application/x-www-form-urlencoded');
  GetSystemTime(SysTime);
  //得到十三位的时间戳
  ts := FormatFloat('#', CompToDouble(TimeStampToMSecs(DateTimeToTimeStamp(SystemTimeToDateTime(SysTime)))) - TimeStampToMSecs(DateTimeToTimeStamp(StrToDateTime('1970/1/1'))));
  try
    //签名字符串的顺序一定不能乱
    signstr := 'app_id=' + app_id + '' + '&cp_order_id=' + cp_order_id + '&ts=' + ts + ':' + APP_SECRET;
    signstr := MD5(AnsiToUtf8(signstr));
    //post
    Post('https://api.game.meizu.com/game/order/query', 'app_id=' + app_id + '&cp_order_id=' + cp_order_id + '&sign=' + signstr + '&sign_type=md5' + '&ts=' + ts, s);
    Result := s.DataString;
  finally
    s.Free;
  end;
end;

//发货字符串签名
//app_id=2841864&buy_amount=1&cp_order_id=1479884932973&create_time=1479953353055&notify_id=1479953353046&notify_time=2016-11-24 10:09:12&order_id=16112321034124992&partner_id=10505431&pay_time=1479885776000&pay_type=0'+'&product_id=1&product_per_price=0.01&product_unit=个&total_price=0.01&trade_status=3&uid=128402267&user_info=tnyoo

function MEIZUDeliverSign(app_id: string; buy_amount: string; cp_order_id: string; create_time: string; notify_id: string; notify_time: string; order_id: string; partner_id: string; pay_time: string; pay_type: string; product_id: string; product_per_price: string; product_unit: string; total_price: string; trade_status: string; uid: string; user_info: string; APP_SECRET: string): string;
var
  signstr: string;
begin
  try
    //签名字符串的顺序一定不能乱
    signstr := 'app_id=' + app_id + '&buy_amount=' + buy_amount + '&cp_order_id=' + cp_order_id + '&create_time=' + create_time + '&notify_id=' + notify_id + '&notify_time=' + notify_time + '&order_id=' + order_id + '&partner_id=' + partner_id + '&pay_time=' + pay_time + '&pay_type=' + pay_type + '&product_id=' + product_id + '&product_per_price=' + product_per_price + '&product_unit=' + product_unit + '&total_price=' + total_price + 'trade_status' + trade_status + '&uid=' + uid + '&user_info=' + user_info + ':' + APP_SECRET;
    signstr := MD5(AnsiToUtf8(signstr));
    Result := signstr;
  finally
  end;
end;

//Get请求，请求验证支付的json.

function GetVerifiJson(PackageName: string; ProId: string; tokens: string): string;
var
  s: TStringStream;
begin
  s := TStringStream.Create('Content-Type:application/x-www-form-urlencoded');
  try
    //Get请求，请求谷歌支付验证结果json.
    Get('https://www.googleapis.com/androidpublisher/v2/applications/' + PackageName + '/purchases/products/' + ProId + '/tokens/' + tokens + '?access_token=' + access_token, s);
    //解析得到的json.
    Jso := TlkJSON.ParseText(UTF8Decode(s.DataString)) as TlkJSONobject;
    //判断json的key中是否purchaseState以及purchaseState的状态为购买成功.
    if (Jso.Field['purchaseState'] <> nil) and ((Jso.Field['purchaseState'] as TlkJSONnumber).Value = 0) then
    begin
      Result := 'true';
    end
    else
    begin
      Result := 'false';
    end;

  finally
    s.Free;
    Jso.Free;
  end;
end;

//用于谷歌支付验证的测试按钮.

procedure TForm1.Button2Click(Sender: TObject);
begin
  try
    RichEdit1.Text := RichEdit1.Text + #$D#$A + UTF8Decode(GetVerifiJson('com.playpark.dot', 'vip_30days', 'giokddnecnchggmjgpepligd.AO-J1OwRhc7oykQkgnV8Y19FXavgdUMewxwl2KMj2kFuC8AfrYpuqqU8GkKRikLaWJ3qClqGJdACCHPWqgc8s6w31KY3E69o-leRL91aL12r2cX6L5J40hc'));
  finally
  end;
end;

//用于刷新access_token的测试按钮.

procedure TForm1.Button3Click(Sender: TObject);
var
  str: string;
begin
  try
    str := GetAccessToken('1/qnU8Dk6JDvrGewjdXtdUdvspeR1GdLSwjkiMComJ6QfJVHrhjV_4k1wh2GuxheOO', '747314688519-ee34q2qdgomlh35knesaue51trrn0d1u.apps.googleusercontent.com', '8K2eNCH08ov95QsrkOiibRyl');
    Jso := TlkJSON.ParseText(UTF8Decode(str)) as TlkJSONobject;
    if ((Jso.Field['access_token'] <> nil) and (Jso.Field['expires_in'] <> nil)) then
    begin
    //解析json.
      access_token := (Jso.Field['access_token'] as TlkJSONstring).Value;
    //生成有效时间(当前时间+有效期).
      valid_time := DateTimeToUnixDateInt(now) + (Jso.Field['expires_in'] as TlkJSONnumber).Value;
      RichEdit1.Text := 'access_token: ' + access_token;
      RichEdit1.Text := RichEdit1.Text + #$D#$A + 'valid_time: ' + Inttostr(valid_time);
    end
    else
    begin
      RichEdit1.Text := '请求参数有误' + #$D#$A + str;
    end;
  finally
    Jso.Free;
  end;
end;
 //登录状态查询测试
procedure TForm1.Button1Click(Sender: TObject);
var
  str: string;
begin
  try
    str := MEIZULoginVerify('2841864', '128402267', 'eyJ2IjozLCJnIjpmYWxzZSwidSI6IjEyODQwMjI2NyIsInQiOjE0Nzk5NTY0NTU2MjIsInMiOiJucyIsInIiOiJXY0pMcW1nUEpzdzFBcTdwY28zbCIsImEiOiJGNjhFQkZDQkE1NDczODlGMzg4MzBBMTM4NjVGNDE1NSIsImwiOiJBMEIyRjAxODU4RTEzMDM4OTg0Q0VENUI5RTY1Qjc5NSJ9', 'uWeTtqK66IudkSMVHl4qdnP568YQdrW8');
    RichEdit1.Text := UTF8Decode(str);
    Jso := TlkJSON.ParseText(UTF8Decode(str)) as TlkJSONobject;
    if (Jso.Field['code'] <> nil) then
    begin
      if (Jso.Field['code'].Value = 200) then
        RichEdit1.Text := RichEdit1.Text + #$D#$A + '登录成功！';
    end
    else
      RichEdit1.Text := RichEdit1.Text + #$D#$A + '登录失败！';


  finally
    Jso.Free;
  end;

end;

 //支付参数签名测试

procedure TForm1.Button4Click(Sender: TObject);
begin
  RichEdit1.Text := RichEdit1.Text + #$D#$A + '支付参数签名: ' + MEIZUOrderSign('2841864', '1', '123456', '0', '财神', '1', '0.01', '元宝', '个', '0.01', '128402267', 'tnyoo', 'uWeTtqK66IudkSMVHl4qdnP568YQdrW8');
end;

 //查询支付状态测试

procedure TForm1.Button5Click(Sender: TObject);
var
  str: string;
begin
  try
    str := MEIZUPayVerify('2841864', '1479884932973', 'uWeTtqK66IudkSMVHl4qdnP568YQdrW8');
    RichEdit1.Text := UTF8Decode(str);
    Jso := TlkJSON.ParseText(UTF8Decode(str)) as TlkJSONobject;
    if (Jso.Field['code'] <> nil) and (Jso.Field['value'] <> nil) and (Jso.Field['code'].Value = 200) then
    begin
      if (Jso.Field['value'].Field['tradeStatus'] <> nil) and (Jso.Field['value'].Field['tradeStatus'].Value = 3) then
        RichEdit1.Text := RichEdit1.Text + #$D#$A + '支付成功！';
    end
    else
      RichEdit1.Text := RichEdit1.Text + #$D#$A + '支付失败！';
  finally
    Jso.Free;
  end;

end;

 //发货字符串签名测试

procedure TForm1.Button6Click(Sender: TObject);
begin
  RichEdit1.Text := RichEdit1.Text + #$D#$A + '发货参数签名: ' + UTF8Decode(MEIZUDeliverSign('2841864', '1', '1479884932973', '1479953353055', '1479953353046', '2016-11-24 10:09:12', '16112321034124992', '10505431', '1479885776000', '0', '1', '0.01', '个', '0.01', '3', '128402267', 'tnyoo', 'uWeTtqK66IudkSMVHl4qdnP568YQdrW8'));

end;

end.

