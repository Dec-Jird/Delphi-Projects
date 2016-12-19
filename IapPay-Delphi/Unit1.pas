unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, OleCtrls, SHDocVw;

procedure Get(url: string;res: TStream); overload;
procedure Post(url, data:string;res:TStream); overload;
function Get(url: string): string; overload;
function Post(url, data: string): string; overload;



type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Memo2: TMemo;
    Button2: TButton;
    Memo4: TMemo;
    Button3: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    //accountId 账号, gameRegion 区服, channel 渠道, currencyType 货币类型, platformType 平台类型(1 IOS;2 AND), currencyAmount 付费金额(), payTime 支付时间() 
    procedure DataEyeSendPayInf(accountId, gameRegion, channel, currencyType, platformType, currencyAmount, payTime : string);

    function DateTimeToUnixDate(Const ADate : TDateTime):string;
    function UnixDateToDateTime(Const USec:int64):TDateTime;
  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Base64: string;

implementation

{$R *.dfm}

uses WinINet,IDURI, uLkJSON, EncdDecd, HttpApp;

const
  //Url = 'https://graph.facebook.com/me?access_token='+'CAACEdEose0cBAIQhRskZBkhTI78On0SblylMTpkn5PmVhOEDbS9ZAuZCQ9MvS2fLvalBMugE99jmug8pCVw9xxbkUxd9duw1tADvW8OZBx3XnC1iUCgQZA5C0wAjIjTBQJLKSuxd3PiKOE3k3skF4hZCIQaPLykRdLsNe3zSpv4QnkvyeOkdHZBTsMsJxAOStdA22CbbFHhYaK57fMLVM202lQ7uot5BX8ZD';
  Url = 'https://sandbox.itunes.apple.com/verifyReceipt';
  //Url = 'http://graph.facebook.com/';

procedure TForm1.FormCreate(Sender: TObject);
begin
  Memo1.Text := Url; 
  Memo2.Text := Url;
end;

function Get(url: string): string;
var
  s: TStringStream;
begin
  s := TStringStream.Create('');
  try
    Get(url, s);
    result := s.DataString;
  finally
    s.Free;
  end;
end;

function Post(url, data: string): string;
var
  s: TStringStream;
begin
  s := TStringStream.Create('');
  try
    Post(url, data, s);
    result := s.DataString;
  finally
    s.Free;
  end;
end;

procedure Post(url, data:string;res:TStream);
var
  hInt,hConn,hreq:HINTERNET;
  buffer:PChar;
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
    dwFlags := INTERNET_FLAG_TRANSFER_BINARY ;
  end;
  uri.Free;
  hInt := InternetOpen('Delphi',INTERNET_OPEN_TYPE_PRECONFIG,nil,nil,0);
  hConn := InternetConnect(hInt,PChar(host),port,nil,nil,INTERNET_SERVICE_HTTP,0,0);
  hreq := HttpOpenRequest(hConn,'POST',PChar(Path),'HTTP/1.1',nil,nil,dwFlags,0);
  GetMem(buffer, 65536);
  if HttpSendRequest(hReq,nil,0,PChar(data),Length(data)) then
  begin
    dwRead:=0;
    repeat
      InternetReadFile(hreq,buffer,65536,dwRead);
      if dwRead<>0 then
        res.Write(buffer^, dwRead);
    until dwRead=0;
  end;
 InternetCloseHandle(hreq);
 InternetCloseHandle(hConn);
 InternetCloseHandle(hInt);
 FreeMem(buffer);
end;

procedure Get(url: string;res: TStream);
var
  hInt,hUrl:HINTERNET;
  buffer:PChar;
  dwRead:cardinal;
begin
  GetMem(buffer, 65536);
  hInt := InternetOpen('Delphi',INTERNET_OPEN_TYPE_PRECONFIG,nil,nil,0);
  dwRead:=0;
  hurl:=InternetOpenUrl(hInt,PChar(url),nil,0,INTERNET_FLAG_RELOAD,0);
  repeat
    InternetReadFile(hUrl,buffer,1000,dwRead);
    if dwRead<>0 then
      res.Write(buffer^, dwRead);
  until dwRead=0;
  InternetCloseHandle(hUrl);
  InternetCloseHandle(hInt);
  FreeMem(buffer);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Memo1.Text := Get('https://www.cibplus.com/mobile/register_token?game=dot&token=942b7f790e21bc8bf1a8d4154072511d');
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  Temstring: TStringList;
  js:TlkJSONobject;
  ss: string;
  num :integer;
  fnum:single;
begin
{  Temstring := TStringList.Create;
  Temstring.LoadFromFile('base64.txt');
  Base64 := Temstring.Text;
  Base64 := StringReplace(StringReplace(Base64, #13, '', [rfReplaceAll]), #10, '', [rfReplaceAll]);
  js := TlkJSONobject.Create;
  js.Add('receipt-data',Base64);
  //js.Add('password', '745ae00a89d8476cb54d836bcc1ef6e1');
  ss := TlkJSON.GenerateText(js);
  Form1.Memo4.Text := ss;

  Memo2.Text := Post(Url, ss);
  //Memo2.Text := Post('http://ipay.iapppay.com:9999/payapi/order', ss);
  }
  ss := DateTimeToUnixDate(Now());
  Memo2.Text := DateTimeToStr(Now());
  Memo2.Text := Memo2.Text + ss;
  Memo2.Text := Memo2.Text + DateTimeToStr(UnixDateToDateTime(strtoint(ss)));
  num:=98;

  fnum:=98/100;
  Memo2.Text := Memo2.Text +' '+ formatfloat('0.00',num/100);
  DataEyeSendPayInf('xf1111', '一区', 'TNYOO', 'cny', '2', '9.23', inttostr(strtoint(ss)-8*60*60));
end;

procedure TForm1.Button3Click(Sender: TObject);
const
 pay_URL = 'http://ipay.iapppay.com:9999/payapi/order';
 //pay_URL = 'http://182.254.148.221:3358/iapppay';
var
  UID: string;
  ss: string;
  Data: string;
  u: string;
  key: string;
begin

  UID := IntToStr(GetTickCount());
  UID:='8787546214';//8787546214
  //构建爱贝支付服务器端下单请求
  Data := 'transdata={"appid":"3001819184","waresid":1,"cporderid":"' + UID + '","price":0.01,"currency":"RMB", "appuserid":"dota148423658"}';
  ShowMessage(Data);


  key := 'cjtPmNHWoh259n1dt+mXrxzYAhB3pBrV9Nk62WQVHYNkYx6uOt9+c2ZArWztjaeqiuL3BI+/gr3aRaOKLsDDurRxv5axCnBLFW4lhV9DP3YVwVXVsqEjVCkv0fWEoE08T7P/azF2uXm6mdsFsdeVXhy/ZhOA96t+5QSW6xi9Nqw=';

  //key := HttpApp.HTTPEncode(key);


  ss := '&sign=' + key + '&signtype=RSA';
  //Data := HttpApp.HTTPEncode(Data);
  u := Data + ss;
  u := Utf8Encode(u);
  Memo1.Text := u;  //显示请求参数
  Memo4.Text := UTF8Decode(HTTPDecode(Post(pay_URL, u)));  //显示请求iab服务器后返回的结果
end;

procedure TForm1.DataEyeSendPayInf(accountId, gameRegion, channel, currencyType, platformType, currencyAmount, payTime : string);
var
  SendInf, strEmp : string;
  DataEyeUrl : string;
  DataEyeAppId : string;
begin
  strEmp := '';
  DataEyeUrl := 'http://ext.gdatacube.net/dc/rest/pay';
  DataEyeAppId := 'BD1A6316039ED19F5E266C4A698A68EB';

  SendInf := 'appId='+DataEyeAppId+'&accountId='+accountId+'&platform='+platformType+'&channel='+channel+'&gameRegion='+gameRegion+'&osVersion='+strEmp+'&imei='+strEmp+'&mac='+strEmp+'&resolution='+strEmp+'&country='+strEmp+'&ip='+strEmp+'&netType=1&age=15&province='+strEmp+'&accountType=1&brand='+strEmp+'&gender=1&operators='+strEmp+'&language=cn&currencyAmount='+currencyAmount+'&currencyType='+currencyType+'&payType=alipay&iapid=buycoin&payTime='+payTime;
  Memo1.Text := SendInf;
  Memo2.Text := Memo2.Text+DataEyeUrl;
  Memo4.Text := UTF8Decode(HTTPDecode(Post(DataEyeUrl, AnsiToUtf8(SendInf))));

end;

function TForm1.DateTimeToUnixDate(Const ADate : TDateTime):string;
const
  cUnixStarDate: TDateTime = 25569.0;
begin
  Result := IntToStr(Round((ADate - cUnixStarDate)*86400));
end;

function TForm1.UnixDateToDateTime(Const USec:int64):TDateTime;
const
  cUnixStarDate: TDateTime = 25569.0;
begin
  Result := (USec / 86400) + cUnixStarDate;
end;

end.
