unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, wininet, iduri, httpapp, IdHMACSHA1, IdGlobal, EncdDecd,
  ExtCtrls, DateUtils, ComCtrls, IdBaseComponent, IdComponent,
  IdCustomTCPServer, IdCustomHTTPServer, IdHTTPServer, IdContext,
  IdTCPConnection, IdTCPClient, IdHTTP, OleCtrls, SHDocVw;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    LabeledEdit7: TLabeledEdit;
    LabeledEdit6: TLabeledEdit;
    LabeledEdit5: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit8: TLabeledEdit;
    LabeledEdit9: TLabeledEdit;
    TabSheet3: TTabSheet;
    LabeledEdit10: TLabeledEdit;
    LabeledEdit11: TLabeledEdit;
    LabeledEdit12: TLabeledEdit;
    LabeledEdit13: TLabeledEdit;
    Button4: TButton;
    Button5: TButton;
    TabSheet4: TTabSheet;
    Memo2: TMemo;
    Button6: TButton;
    Button7: TButton;
    Memo3: TMemo;
    Button8: TButton;
    TabSheet5: TTabSheet;
    Memo4: TMemo;
    Memo5: TMemo;
    Button9: TButton;
    Button10: TButton;
    Memo6: TMemo;
    TabSheet6: TTabSheet;
    LabeledEdit14: TLabeledEdit;
    LabeledEdit15: TLabeledEdit;
    LabeledEdit16: TLabeledEdit;
    LabeledEdit17: TLabeledEdit;
    Button11: TButton;
    CheckBox1: TCheckBox;
    TabSheet7: TTabSheet;
    Memo7: TMemo;
    Memo8: TMemo;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    LabeledEdit18: TLabeledEdit;
    LabeledEdit19: TLabeledEdit;
    LabeledEdit20: TLabeledEdit;
    Button15: TButton;
    TabSheet8: TTabSheet;
    Memo9: TMemo;
    Button16: TButton;
    TabSheet9: TTabSheet;
    LabeledEdit21: TLabeledEdit;
    LabeledEdit22: TLabeledEdit;
    LabeledEdit23: TLabeledEdit;
    IdHTTPServer1: TIdHTTPServer;
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
    IdHTTP1: TIdHTTP;
    Button22: TButton;
    LabeledEdit26: TLabeledEdit;
    LabeledEdit27: TLabeledEdit;
    LabeledEdit28: TLabeledEdit;
    Button23: TButton;
    TabSheet11: TTabSheet;
    Memo10: TMemo;
    Memo11: TMemo;
    Button24: TButton;
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
    procedure IdHTTPServer1CommandGet(AContext: TIdContext;
      ARequestInfo: TIdHTTPRequestInfo;
      AResponseInfo: TIdHTTPResponseInfo);
    procedure Button18Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure Button21Click(Sender: TObject);
    procedure Button22Click(Sender: TObject);
    procedure Button23Click(Sender: TObject);
    procedure Memo2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button24Click(Sender: TObject);
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

uses uLkJSON, AsphyreMD5, CIBGooglePlay_TLB,
  System_Net_Http_Primitives_TLB, IdHashMessageDigest, IdHash;

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

function WebPagePost(sURL,sPostData:string):Pointer;stdcall;
const
  RequestMethod = 'POST';
  HTTP_VERSION  = 'HTTP/1.1';  //HTTP版本 我抓包看过 HTTP/1.0 HTTP/1.1。尚未仔细了解其区别。按MSDN来写的。留空默认是1.0
var
  dwSize:DWORD;
  dwFileSize: Int64;
  dwBytesRead,dwReserved:DWORD;
  hInte,hConnection,hRequest:HInternet;
  ContentSize:array[1..1024] of Char;
  HostPort:Integer;
  HostName,FileName,sHeader:String;
  procedure ParseURL(URL: string;var HostName,FileName:string;var HostPort:Integer);
  var
    i,p,k: DWORD;
    function StrToIntDef(const S: string; Default: Integer): Integer;
    var
      E: Integer;
    begin
      Val(S, Result, E);
      if E <> 0 then Result := Default;
    end;
  begin
    if lstrcmpi('http://',PChar(Copy(URL,1,7))) = 0 then System.Delete(URL, 1, 7);
    HostName := URL;
    FileName := '/';
    HostPort := INTERNET_DEFAULT_HTTP_PORT;
    i := Pos('/', URL);
    if i <> 0 then
    begin
      HostName := Copy(URL, 1, i-1);
      FileName := Copy(URL, i, Length(URL) - i + 1);
    end;
    p:=pos(':',HostName);
    if p <> 0 then
    begin
      k:=Length(HostName)-p;
      HostPort:=StrToIntDef(Copy(HostName,p+1,k),INTERNET_DEFAULT_HTTP_PORT);
      Delete(HostName,p,k+1);
    end;
  end;
begin
  Result := Pointer(-1);
  dwFileSize :=0;
  ParseURL(sURL,HostName,FileName,HostPort);
  // 函数原型见 http://technet.microsoft.com/zh-cn/subscriptions/aa385096(v=vs.85).aspx
  hInte := InternetOpen('', //UserAgent
                           INTERNET_OPEN_TYPE_PRECONFIG,nil,nil,0);
  if hInte<>nil then
  begin
    hConnection := InternetConnect(hInte,   // 函数原型见 http://technet.microsoft.com/zh-cn/query/ms909418
                                   PChar(HostName),
                                   HostPort,
                                   nil,
                                   nil,
                                   INTERNET_SERVICE_HTTP,
                                   0,
                                   0);
    if hConnection<>nil then
    begin
      hRequest := HttpOpenRequest(hConnection,  // 函数原型见 http://msdn.microsoft.com/zh-cn/library/aa917871
                                  PChar(RequestMethod),
                                  PChar(FileName),
                                  HTTP_VERSION,
                                  '', //Referrer 来路
                                  nil,//AcceptTypes 接受的文件类型 TEXT/HTML */*
                                  INTERNET_FLAG_NO_CACHE_WRITE or
                                  INTERNET_FLAG_RELOAD,
                                  0);
      if hRequest<>nil then
      begin
        sHeader := 'Content-Type: application/x-www-form-urlencoded' + #13#10;
    //    +'CLIENT-IP: 216.13.23.33'+#13#10
    //    'X-FORWARDED-FOR: 216.13.23.33' + #13#10+; 伪造代理IP

        // 函数原型见 http://msdn.microsoft.com/zh-cn/library/aa384227(v=VS.85)
        //HttpAddRequestHeaders(hRequest,PChar(sHeader),
          //                    Length(sHeader),
            //                  HTTP_ADDREQ_FLAG_ADD or HTTP_ADDREQ_FLAG_REPLACE);
        // 函数原型见 http://msdn.microsoft.com/zh-cn/library/windows/desktop/aa384247(v=vs.85).aspx
        if HttpSendRequest(hRequest,nil,0,PChar(sPostData),Length(sPostData)) then
        begin
          dwReserved:=0;
          dwSize:=SizeOf(ContentSize);
          // 函数原型 http://msdn.microsoft.com/zh-cn/subscriptions/downloads/aa384238.aspx
          if HttpQueryInfo(hRequest,HTTP_QUERY_CONTENT_LENGTH,@ContentSize,dwSize,dwReserved) then
          begin
            dwFileSize:=StrToInt(StrPas(@ContentSize));
            GetMem(Result, dwFileSize);
            InternetReadFile(hRequest,Result,dwFileSize,dwBytesRead);
          end;
        end;
      end;
      InternetCloseHandle(hRequest);
    end;
    InternetCloseHandle(hConnection);
  end;
  InternetCloseHandle(hInte);
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

function doHMACSHA1(akey, adata: string): string;
begin
  with TIdHMACSHA1.Create do
    try
      key := ToBytes(akey);
      Result := BytesToString(HashValue(ToBytes(adata)));
    finally
      Free;
    end;

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
  sig := doHMACSHA1(LabeledEdit7.Text + '&', sigurl);



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
  //url := 'http://sdk.g.uc.cn/cp/account.verifySession';
  url := 'http://115.159.89.253:9988/ucpay';

  gamejs := TlkJSONobject.Create();

  gamejs.Add('gameId', 537935);    //

  datajs := TlkJSONobject.Create();

  datajs.Add('sid', LabeledEdit8.Text);

  id := DateTimeToUnix(now()) - 8*60*60;

  //进行签名字符串拼接
  (*sig := 'gameId=' + IntToStr(537935) +
         'id=' + IntToStr(id) +
         'sid=' + LabeledEdit8.Text + 'f350c8a80c728eadc88fa36c3250e232';
  *)

  sig := 'sid=' + LabeledEdit8.Text + 'f350c8a80c728eadc88fa36c3250e232';

  memo1.Lines.Add('');
  memo1.Lines.Add(sig);
  memo1.Lines.Add('');

  sig := md5( AnsiToUtf8(sig) );

  memo1.Lines.Add('');
  memo1.Lines.Add(sig);
  memo1.Lines.Add('');

  js := TlkJSONobject.Create();

  js.Add('id', id);
  js.Add('data', datajs);
  js.Add('game', gamejs);
  js.Add('sign', sig);

  post := AnsiToUtf8(TlkJSON.GenerateText(js));

  memo1.Lines.Add('');
  memo1.Lines.Add(post);
  memo1.Lines.Add('');


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
begin
  Showmessage(md5(Memo6.Text));
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
  header: string;
begin
  if CheckBox1.Checked then
    url := 'http://119.46.99.241/ewallet_agent_mobile/api/'
  else
    url := 'https://sdk.playpark.net/Refill/Agent/api/';
  PostInfo := 'merchant_code=' + AnsiToUtf8(LabeledEdit20.Text) + '&merchant_key=' +
    LabeledEdit19.Text + '&command=CMD-2005' +
    '&merchant_transaction_id=' + LabeledEdit18.Text;


  //PostInfo := 'merchant_code=DestinyOfThrones&merchant_key=5615a9eefab48aa6952d82068088c064&command=CMD-2005&merchant_transaction_id=TR201012310001';
  memo1.Lines.Add(PostInfo);

  memo1.Lines.Add('');

  //header := 'Content-Type: application/x-www-form-urlencoded' + #13#10;
  memo1.Lines.Add(Utf8ToAnsi(HttpsPost(url, PostInfo, header)));
  s := TStringlist.Create;
  s.Add('merchant_code=DestinyOfThrones');
  s.Add('command=CMD-2005');
  s.Add('merchant_key=5615a9eefab48aa6952d82068088c064');
  s.Add('merchant_transaction_id=TR201012310001');
  //memo1.Lines.Add(IdHTTP1.Post(url, s));
  //WebPagePost(url, PostInfo);
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
begin
  url := 'https://api.jpush.cn/v3/push';

  header := AnsiToUtf8('Authorization: Basic ' + EncodeString('15de08d9e81b67b7bb0e5404:78d35df2052d3213c787a4eb'));
  memo1.Lines.Add(Utf8ToAnsi(HttpsPost(url, AnsiToUtf8(Memo9.Text), header)));
end;

procedure TForm1.Button17Click(Sender: TObject);
begin
  IdHTTPServer1.DefaultPort := 23333;
  IdHTTPServer1.Bindings.Clear;
  IdHTTPServer1.Bindings.Add.IP := '0.0.0.0';

  IdHTTPServer1.Active := not IdHTTPServer1.Active;

  if IdHTTPServer1.Active then
    memo1.Lines.Add('http server is on!')
  else
    memo1.Lines.Add('http server is off!');
end;

procedure TForm1.IdHTTPServer1CommandGet(AContext: TIdContext;
  ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
begin
  memo1.Lines.Add('http server doc:' + ARequestInfo.Document);
  memo1.Lines.Add('http server post:' + ARequestInfo.FormParams);
end;

procedure TForm1.Button18Click(Sender: TObject);
var
  b1,
  b2,
  b3,
  info: string;
  i: integer;
  sin, sout: TStream;
begin
  // url 用来获取获取access_token。
  url := 'https://www.googleapis.com/oauth2/v3/token';

  info := '{"iss":"' + LabeledEdit22.Text +
    '","scope":"https://www.googleapis.com/auth/androidpublisher","aud":"https://www.googleapis.com/oauth2/v3/token","exp":' +
    IntToStr(DateTimeToUnixDateInt(now) + 3600) + ',"iat":' +
    DateTimeToUnixDate(now) + '}';

  memo1.Lines.Add('a:' + info);

  b1 := EncodeString('{"alg":"RS256","typ":"JWT"}');
  b2 := EncodeString(info);
  b3 := 'MIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBAMNkrkFJAY'
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
    + 'TuD6Fgt4v8n0\u003d';

  sin := TStream.Create;
  sout := TStream.Create;

  sin.WriteBuffer(b3, length(b3));
  info := ('grant_type=urn:ietf:params:oauth:grant-type:jwt-bearer&assertion=') +
    b1 + '.' +
    b2 + '.' +
    b3;

  memo1.Lines.Add('b:' + info);
  
  memo1.Lines.Add(Utf8ToAnsi(HttpsPost(url, info, 'Content-Type: application/x-www-form-urlencoded')));
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
  memo1.Lines.Add(Utf8ToAnsi(HttpsPost(Edit2.Text, AnsiToUTF8(Edit3.Text), '')));
end;

procedure TForm1.Button22Click(Sender: TObject);
var
  cib: ICibGooglePlay;
begin
  LoadLibrary('System.Net.Http.Primitives.dll');
  cib := CoTCibGooglePlay.Create;
  memo1.Lines.Add(cib.verifyBill('Google Play Android Developer-7960cc81208d.p12',
  'dot-inapp@api-project-747314688519.iam.gserviceaccount.com',LabeledEdit26.Text,
  LabeledEdit27.Text, LabeledEdit28.Text));
end;

procedure TForm1.Button23Click(Sender: TObject);
begin
  memo1.Lines.Add(IdHTTP1.Get('http://www.cibplus.com/'));
end;

procedure TForm1.Memo2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (Shift =[ssCtrl]) and (Key=65) then  TMemo(Sender).SelectAll;
end;


procedure TForm1.Button24Click(Sender: TObject);
begin
  memo11.Text := md5(AnsiToUtf8(memo10.Text));
end;

end.
