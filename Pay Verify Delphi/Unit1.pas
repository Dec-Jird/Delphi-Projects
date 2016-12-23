unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, wininet, iduri, httpapp, IdGlobal, EncdDecd,
  ExtCtrls, DateUtils, ComCtrls, IdBaseComponent, IdComponent,
   IdCustomHTTPServer, IdHTTPServer, XMLIntf, XMLDoc,
   IdTCPConnection, IdTCPClient, IdHTTP, OleCtrls, SHDocVw, IdTCPServer,JpushSDK,
   {IdHMACSHA1, }IdCoderMIME,HmacSha1_TLB, httpDll_TLB, SignAndVerify_TLB,
   WanDouJiaRSAVerify_TLB,iapppaySigndll_TLB,DES3Dll_TLB,IdCustomTCPServer,activex;

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
    TabSheet17: TTabSheet;
    token: TEdit;
    VivoLoginVerifyBtn: TButton;
    Label1: TLabel;
    VivoPayOrder: TButton;
    VivoPayVerify: TButton;
    TabSheet18: TTabSheet;
    Label2: TLabel;
    CCToken: TEdit;
    CCLoginVerifyBtn: TButton;
    TabSheet19: TTabSheet;
    Label3: TLabel;
    SessionId: TEdit;
    QMYXLoginBtn: TButton;
    QMYXPayBtn: TButton;
    TabSheet20: TTabSheet;
    Button40: TButton;
    Button41: TButton;
    vivoEdit: TEdit;
    Button42: TButton;
    vivoNumEdit: TEdit;
    vivoTimeEdit: TEdit;
    vivoCallbackEdit: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    ccpayEdit4: TEdit;
    Button43: TButton;
    TabSheet21: TTabSheet;
    QQLoginVerify: TButton;
    QQComboBox: TComboBox;
    Button44: TButton;
    Button45: TButton;
    Button46: TButton;
    Button47: TButton;
    TencentTimer: TTimer;
    QQOrderNoEdit: TEdit;
    Label7: TLabel;
    TabSheet22: TTabSheet;
    Button48: TButton;
    TabSheet1: TTabSheet;
    Button49: TButton;
    Label8: TLabel;
    BaiduTokenEdit: TEdit;
    Button27: TButton;
    TabSheet23: TTabSheet;
    OppoLoginVerify: TButton;
    oppoLoginData: TLabeledEdit;
    TabSheet24: TTabSheet;
    M4399LoginEdit: TLabeledEdit;
    M4399Login: TButton;
    TabSheet25: TTabSheet;
    SougouLoginEdit: TLabeledEdit;
    Button50: TButton;
    SougouAuthEdit: TLabeledEdit;
    SougouAuthBtn: TButton;
    TabSheet26: TTabSheet;
    JinLiLoginEdit: TLabeledEdit;
    JinLiLoginBtn: TButton;
    TabSheet27: TTabSheet;
    GOSdkEdit: TLabeledEdit;
    GoSdkLogin: TButton;
    GoSdkSend1Btn: TButton;
    GoSdkPayVerifyBtn: TButton;
    GoSdkSend2Btn: TButton;
    GoSdkSend1Edit: TLabeledEdit;
    GoSdkSend2Edit: TLabeledEdit;
    GoSdkPayCallbackEdit: TLabeledEdit;
    JinLiGetOrdBtn: TButton;
    JinLiOrderEdit: TLabeledEdit;
    JinLiPlayerIDEdit: TLabeledEdit;
    LenovoLoginEdit: TLabeledEdit;
    LenovoLoginBtn: TButton;
    Button51: TButton;
    LenovoPayVerifyBtn: TButton;
    LenovoPayEdit: TLabeledEdit;
    TabSheet28: TTabSheet;
    TabSheet29: TTabSheet;
    WDJLoginEdit: TLabeledEdit;
    WDJLoginBtn: TButton;
    KFLoginEdit: TLabeledEdit;
    WDJPayVerifyBtn: TButton;
    KFLoginVerifyBtn: TButton;
    TabSheet30: TTabSheet;
    LetvLoginEdit: TLabeledEdit;
    LetvLoginBtn: TButton;
    LetvPayVerifyBtn: TButton;
    TabSheet31: TTabSheet;
    DangLeLoginEdit: TLabeledEdit;
    DangLeLoginBtn: TButton;
    DangLePayBtn: TButton;
    DangLePayEdit: TLabeledEdit;
    TabSheet32: TTabSheet;
    AnZhiLoginEdit: TLabeledEdit;
    AnZhiLoginBtn: TButton;
    AnZhiPayBtn: TButton;
    AnZhiPayEdit: TLabeledEdit;
    TabSheet33: TTabSheet;
    CoolPadLoginEdit: TLabeledEdit;
    CoolPadLoginBtn: TButton;
    CoolPadOrderBtn: TButton;
    CoolPadCpOrderEdit: TLabeledEdit;
    CoolPadPayEdit: TLabeledEdit;
    CoolPadPayVerifyBtn: TButton;
    TabSheet34: TTabSheet;
    YYHLoginEdit: TLabeledEdit;
    YYHLoginVerifyBtn: TButton;
    YYHPayEdit: TLabeledEdit;
    YYHPayVerifyBtn: TButton;
    MEIZU: TTabSheet;
    TabSheet35: TTabSheet;
    MEIZULoginEdit: TLabeledEdit;
    AIYOUXILoginEdit: TLabeledEdit;
    AIYouXiLoginBtn: TButton;
    AIYOUXIPayIF2Btn: TButton;
    Button52: TButton;
    QQLoginEdit: TLabeledEdit;
    WXLoginEdit: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
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

    procedure MainOutMessage(const Msg: string);//输出Log
    //Xml解析（从字符串形式xml中读取信息），读取到的信息放到List中。
    procedure ReadXml(Node: IXMLNode; var List: TStringList);

    //生成随机字符串
    function GetRandStr(len : Integer; lowercase : Boolean = True; num : Boolean = True; uppercase : Boolean = True) : string;

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
    procedure Button30Click(Sender: TObject);
    procedure Button31Click(Sender: TObject);

    procedure Button32Click(Sender: TObject);
    procedure Button33Click(Sender: TObject);
    procedure Button34Click(Sender: TObject);
    procedure Button35Click(Sender: TObject);
    procedure Button36Click(Sender: TObject);
    procedure Button37Click(Sender: TObject);
    procedure Button39Click(Sender: TObject);
    procedure VivoLoginVerifyBtnClick(Sender: TObject);
    procedure VivoPayOrderClick(Sender: TObject);
    procedure CCLoginVerifyBtnClick(Sender: TObject);
    procedure QMYXLoginBtnClick(Sender: TObject);
    procedure QMYXPayBtnClick(Sender: TObject);
    procedure Button40Click(Sender: TObject);
    procedure Button41Click(Sender: TObject);
    procedure VivoPayVerifyClick(Sender: TObject);
    procedure Button42Click(Sender: TObject);
    procedure Button43Click(Sender: TObject);
    procedure QQLoginVerifyClick(Sender: TObject);
    procedure Button44Click(Sender: TObject);
 {   procedure TencentTimerTimer(Sender: TObject);            }
    procedure Button45Click(Sender: TObject);
    procedure Button46Click(Sender: TObject);
    procedure Button47Click(Sender: TObject);
    procedure Button48Click(Sender: TObject);
    procedure Button49Click(Sender: TObject);
    procedure OppoLoginVerifyClick(Sender: TObject);
    procedure M4399LoginClick(Sender: TObject);
    procedure Button50Click(Sender: TObject);
    procedure SougouAuthBtnClick(Sender: TObject);
    procedure JinLiLoginBtnClick(Sender: TObject);
    procedure GoSdkLoginClick(Sender: TObject);
    procedure GoSdkSend1BtnClick(Sender: TObject);
    procedure GoSdkPayVerifyBtnClick(Sender: TObject);
    procedure GoSdkSend2BtnClick(Sender: TObject);
    procedure JinLiGetOrdBtnClick(Sender: TObject);
    procedure LenovoLoginBtnClick(Sender: TObject);
    procedure Button51Click(Sender: TObject);
    procedure LenovoPayVerifyBtnClick(Sender: TObject);
    procedure WDJLoginBtnClick(Sender: TObject);
    procedure KFLoginVerifyBtnClick(Sender: TObject);
    procedure WDJPayVerifyBtnClick(Sender: TObject);
    procedure LetvLoginBtnClick(Sender: TObject);
    procedure LetvPayVerifyBtnClick(Sender: TObject);
    procedure DangLeLoginBtnClick(Sender: TObject);
    procedure DangLePayBtnClick(Sender: TObject);
    procedure AnZhiLoginBtnClick(Sender: TObject);
    procedure AnZhiPayBtnClick(Sender: TObject);
    procedure CoolPadLoginBtnClick(Sender: TObject);
    procedure CoolPadOrderBtnClick(Sender: TObject);
    procedure CoolPadPayVerifyBtnClick(Sender: TObject);
    procedure YYHLoginVerifyBtnClick(Sender: TObject);
    procedure YYHPayVerifyBtnClick(Sender: TObject);
    procedure AIYouXiLoginBtnClick(Sender: TObject);
    procedure AIYOUXIPayIF2BtnClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TTencentBalance = record
    Request:string;  //获取用户游戏币余额请求
    RequestTimes:Integer;  //请求次数
    Balance:Integer; //腾讯 最新游戏币余额
    SaveAmt:Integer;  //腾讯 累计充值的游戏币数量
    IsSuccess:boolean;  //是否到帐
//  Response:string;  //获取用户游戏币余额响应
  end;

  TTencentCoin = record
    CoinAmount:Integer;
    ZoneId:string;
	  BillNo:string;
	  Data:string;
	  OpenAPI:string;
    Balance:Integer; //腾讯 最新游戏币余额
    IsSuccess:boolean;  //是否处理成功（扣除游戏币成功/赠送游戏币成功）
    Request:string;  //游戏币操作请求
//  Response:string;  //游戏币操作响应
  end;

  {腾讯支付服务器，新建了类}
  TTencentPayServer = class
  private
    FTencentBalanceThread:THandle; //请求余额线程句柄，用于关闭线程。
    FTencentCoinThread:THandle; //请求余额线程句柄，用于关闭线程。
    TencentBalance:TTencentBalance;
    TencentCoin:TTencentCoin;

    procedure SetCookies(payPlatform: Integer; requestURL, orgLoc, serverIp: string);//设置cookie

    function TencentGetBalanceRequest (zoneid, Data: string):string; //查询余额请求构造
    function processTencentGetBalance (request: string):Boolean; //执行查询余额请求

    //使用游戏币支付、取消游戏币支付、赠送游戏币的请求构造
    function TencentGameCoinRequest (CoinAmount:Integer; ZoneId,BillNo,Data,OpenAPI: string):string;
    function processTencentCoinAction(ReqInfo:TTencentCoin; OpenAPI:string):Boolean;   //执行游戏币请求
 //  function TencentGetBalanceThread(Param:Pointer):Integer;stdcall;   //请求余额线程  ; times:Integer
    
  public
    //同步腾讯游戏币余额和玩家的元宝余额
    procedure TencentSynchroBalance (zoneid, Data: string; reqTimes:Integer); //同步余额
    //使用游戏币支付、取消游戏币支付、赠送游戏币的请求构造
    procedure TencentGameCoinAction (CoinAmount:Integer; ZoneId,BillNo,Data,OpenAPI: string);
    procedure MainOutMessage(const Msg: string);//输出Log
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
  TencentPayServer: TTencentPayServer;

implementation

uses uLkJSON, AsphyreMD5, IniFiles;

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
const
  HTTP_VERSION  = 'HTTP/1.1';
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
    begin
      HttpAddRequestHeaders(hInt, PChar(header), length(header), HTTP_ADDREQ_FLAG_ADD and HTTP_ADDREQ_FLAG_REPLACE);
      hurl:=InternetOpenUrl(hInt,PChar(url),PChar(header), length(header),INTERNET_FLAG_RELOAD,0);
    end
    else
    begin
      hurl:=InternetOpenUrl(hInt,PChar(url),nil,0,INTERNET_FLAG_RELOAD,0);
    end;
    
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

procedure TForm1.MainOutMessage(const Msg: string);//输出Log
var
  s:string;
begin
  s:='['+FormatDateTime('mmdd hh:nn:ss',Now)+'] '+Msg;
  form1.Memo1.Lines.Add(s);
end;

procedure TTencentPayServer.MainOutMessage(const Msg: string);//输出Log
var
  s:string;
begin
  s:='['+FormatDateTime('mmdd hh:nn:ss',Now)+'] '+Msg;
  form1.Memo1.Lines.Add(s);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FStream := TStringStream.Create('');
  FBuffer := @(FBuffers[0]);
  TencentPayServer := TTencentPayServer.Create;//创建server
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

  MainOutMessage('');
  MainOutMessage(url);
  MainOutMessage('');


  MainOutMessage(Utf8ToAnsi(HttpsGet(url)));
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
  //MainOutMessage('callbackInfo 0: '+callbackInfo);
  //callbackInfo := DecodeString((callbackInfo));
  //MainOutMessage('callbackInfo 0: '+callbackInfo);
  {js:=nil;

  try
    js:= TlkJSON.ParseText(callbackInfo) as TlkJSONobject;
    if not assigned(js) then
    begin
      MainOutMessage('[error] js is error');
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
  MainOutMessage('price: '+price);
  MainOutMessage('orderId: '+orderId);
  MainOutMessage('channelLabel: '+channelLabel);
  MainOutMessage('callbackInfo 1: '+callbackInfo);
  callbackInfo := DecodeString(HTTPDecode(callbackInfo));
  MainOutMessage('callbackInfo: '+callbackInfo);

  //MainOutMessage(DecodeString(HTTPDecode(memo6.Text)));
  except
    MainOutMessage('except');
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
  js: TlkJSONobject;
  
begin
  s := 'abc' + ss;                                        
  i := 0;
  showmessage(s[i]);

  js := TlkJSONobject.Create();
  js.Add('aaa', 'aajs');
  js.Add('bbb', 'bbjs');
  MainOutMessage('js aaa value: ' + js.getString('aaa'));
  js.Field['aaa'].Value := 'ksldfajdflasdf';
  MainOutMessage('js aaa value: ' + js.getString('aaa'));
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


  MainOutMessage(Utf8ToAnsi(HttpsPost(url, PostInfo)));
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
  MainOutMessage(PostInfo);

  MainOutMessage('');

  //MainOutMessage(Utf8ToAnsi(HttpsPost(url, PostInfo)));
  s := TStringlist.Create;
  s.Add(PostInfo);
  //MainOutMessage(IdHTTP.(url, s));
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


  MainOutMessage(Utf8ToAnsi(HttpsPost(url, PostInfo)));
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
     //MainOutMessage(JpushSDK.SendJPushMessage(LabeledEdit30.Text, JPushDataArray));

    SendJPushMessage(LabeledEdit30.Text, JPushDataArray);
  //header := AnsiToUtf8('Authorization: Basic ' + EncodeString('dd96aa1b76ae32bc27c29266:1f82a5a86e79d76572dfe7c8'));
  //header := AnsiToUtf8('Authorization: Basic ' + EncodeString('15de08d9e81b67b7bb0e5404:78d35df2052d3213c787a4eb'));
 // MainOutMessage(Utf8ToAnsi(HttpsPost(url, AnsiToUtf8(Memo9.Text), header)));

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
  MainOutMessage(Utf8ToAnsi(HttpsPost(url, AnsiToUtf8(JSONStr), Header)));




 end;

procedure TForm1.Button17Click(Sender: TObject);
begin
  {IdHTTPServer1.DefaultPort := 23333;
  IdHTTPServer1.Bindings.Clear;
  IdHTTPServer1.Bindings.Add.IP := '0.0.0.0';

  IdHTTPServer1.Active := not IdHTTPServer1.Active;

  if IdHTTPServer1.Active then
    MainOutMessage('http server is on!')
  else
    MainOutMessage('http server is off!');
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

  MainOutMessage(info);

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

  MainOutMessage(info);
  
  MainOutMessage(Utf8ToAnsi(HttpsPost(url, info)));
end;

procedure TForm1.Button19Click(Sender: TObject);
begin
  url := 'https://accounts.google.com/o/oauth2/token';
end;

procedure TForm1.Button20Click(Sender: TObject);
begin
  MainOutMessage(Utf8ToAnsi(HttpsGet(Edit1.Text, '')));
end;

procedure TForm1.Button21Click(Sender: TObject);
begin
  MainOutMessage(Utf8ToAnsi(HttpsPost(Edit2.Text, Edit3.Text, '')));
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



    MainOutMessage(DataStr);
      //MainOutMessage(Utf8ToAnsi(HttpsPost(url, AnsiToUtf8(DataStr))));
        MainOutMessage(Utf8ToAnsi(httpDll.HttpPost(url, AnsiToUtf8(DataStr))));


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
    MainOutMessage(sign);

    sign := LowerCase(sign);
    MainOutMessage(sign);

    DataStr := '?appId='+appid+'&session='+session+'&uid='+uid+ '&signature='+sign;
    MainOutMessage(DataStr);

    DataStr := url + DataStr;
    //MainOutMessage(Utf8ToAnsi(HttpsGet(url, AnsiToUtf8(DataStr))));
    MainOutMessage(Utf8ToAnsi(HttpsGet(DataStr)));
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

  MainOutMessage(signStr);

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
  url, DataStr, accessToken, resultMsg, userID:string;
  js:TlkJSONobject;
begin
  js := nil;
  url := 'https://openapi.360.cn/user/me';
  accessToken := LabeledEdit46.Text;

  DataStr := url + '?access_token=' + accessToken;
  MainOutMessage('获取用户信息请求：' + DataStr);
  resultMsg := Utf8ToAnsi(HttpsGet(DataStr));
  MainOutMessage('返回用户信息：' + resultMsg);

  //resultMsg := '{"id":"1355380850","name":"什么鬼切切切","avatar":"http://p1.qhmsg.com/dm/48_48_100/t00df551a583a87f4e9.jpg?f=65d9991329eb158854db43d4a76e4f43"}';
  try
    js:= TlkJSON.ParseText(resultMsg) as TlkJSONobject;
    if not assigned(js) then
    begin
      MainOutMessage('[error] js is error');
      exit;
    end
    else
    begin
       if js.IndexOfName('id')>=0 then
       begin
         userID:= js.Field['id'].Value;
         MainOutMessage('360 Login Verify Success! userID: '+userID);
       end
       else
         MainOutMessage('360 Login Verify Failed! Data Error Data: '+resultMsg);
    end;

  except
    on E:Exception do
    begin

    end;
  end;
  
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
  e5c20f39de9dee046d88d29848fa8b6c-20150922184743-f8b51164e3e1af2d138a  c4c0969148ff
  -e0b6a6c60476f45692465268c9d2e17a-c6ab250826ec8fbafafbcaffd2b3d604
  }
 // MainOutMessage(Info);
  url := 'http://querysdkapi.baidu.com/query/cploginstatequery?';
  appId := 5424161;
  appKey := 'OYCIRzKcMNVIRkmuldrGW2nO';
  secret := 'necaGyPbkAVBomGFtxiSa5j42CUndlG8';
  token := '45b405eeee4f404e9829bdea115f86c6-e5c20f39de9dee046d88d29848fa8b6c-20150922184743-f8b51164e3e1af2d138ac4c0969148ff-e0b6a6c60476f45692465268c9d2e17a-c6ab250826ec8fbafafbcaffd2b3d604';


  signStr := inttostr(appId)+ token + secret;

  signStr := MD5(UTF8Encode(signStr));
  MainOutMessage(signStr);

  DataStr := 'AppID='+inttostr(appId)+'&AccessToken='+token+'&Sign='+signStr;

  DataStr := 'AppID=5424161&AccessToken=76ad35426eba4e3989378da50b2a969e-e5c20f39de9dee046d88d29848fa8b6c-20150915191122-e0b1542231e510fd97a0bddb0147f075-390fa8b23d260ae67e53ed1b0ebb58fc-3db7733b3ff019a70bcdae0bf417eaf8&Sign=04d623b352ae2f634fe147747611c575';
  MainOutMessage(DataStr);


  MainOutMessage(Utf8ToAnsi(HttpsPost(url, DataStr, 'Content-Type:application/x-www-form-urlencoded')));

  {code :=1;
  content := 'eyJVSUQiOjEyNzcxNzQ0NzF9';
  signStr := inttostr(appId)+ inttostr(code) + content + secret;
  signStr := MD5(UTF8Encode(signStr));
  MainOutMessage(signStr);

  MainOutMessage(DecodeString(URLDecode(content)));

  x:=1.25;
  y:=Round(x*100);
   MainOutMessage(inttostr(y));
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
  //MainOutMessage(DateTimeToUnixDate(now));
  MainOutMessage(signStr);
  sign:=MD5(signStr);
  MainOutMessage(sign+securityKey);
  sign:=MD5(sign+securityKey);

  DataStr:= 'gamekey='+ key+ '&openid='+ openId + '&timestamp=' + timeStr +'&token='+ token + '&_sign='+sign;
  DataStr:= 'gamekey=3f54c5376541018bfbca446f57709c5a&openid=3e780212b222c06915a353201963c2f1&timestamp=1442912601&token=5727a493ace19867958050ad3423b063&_sign=bb6ab72e9784f6b43dd9b1caafdbb855';
  MainOutMessage((DataStr));


  MainOutMessage(Utf8ToAnsi(HttpsPost(url, (DataStr), 'Content-Type:application/x-www-form-urlencoded')));
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
    MainOutMessage(SignStr);

   // MainOutMessage(URLencode(SignStr));

    methodStr := 'GET';
    uriStr:= '/cgi-bin/temp.py';

    SignStr :=methodStr + '&'+ StrToAscii(uriStr,'QQ_URL')+'&'+ StrToAscii(SignStr,'QQ_URL');
    MainOutMessage(SignStr);
  except

  end;

  //'hex'小米渠道使用，返回bytesToHexStr(hmac.Hash).ToLower(); 'base64'腾讯渠道使用，返回Convert.ToBase64String(hmac.Hash).
  //采取HmacSHA1方式进行base64签名
  sign:= HmacSha1.HmacSha1Sign(SignStr, key, 'base64');

  MainOutMessage(sign);
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
     memo5.Text := MD5(UTF8Encode(memo4.Text));
end;

procedure TForm1.Button37Click(Sender: TObject);
const
  PAY_RSA_PUBLIC = 'MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBAI3XiRc0OXxWQ6SCsn+Z+FKYlfmqJpmdwdOkgF19FPj8LEOvPlp2aRZe2DztWMyaBROUriGDjOlMdSHdL1Wdt88CAwEAAQ==';
var
  tokenStr, url, data, returnStr, userID, signStr, sign, priKey, verifySign:string;
  js:TlkJSONobject;
  RsaSign:SignAndVerifyClass;
  verifyResult:Boolean;
  
begin
  js := nil;
  RsaSign:= CoSignAndVerifyClass.Create;
 //{
  url:= 'https://api.vmall.com/rest.php';
  tokenStr:= LabeledEdit48.Text;
  //URLEncode将字符串以URL编码（空格变+号），也称为百分号编码.
  tokenStr:=StringReplace (URLEncode(tokenStr), '+', '%2B', [rfReplaceAll]); //替换字符串中所有 +为%2B
  data:= url+'?nsp_svc=OpenUP.User.getInfo&nsp_ts='+IntToStr(DateTimeToUnixDateInt(now))+'&access_token='+tokenStr;
  MainOutMessage('data: '+data);
  returnStr:= Utf8ToAnsi(HttpsGet(data));
  MainOutMessage('returnStr: '+returnStr);

  try
    js:= TlkJSON.ParseText(returnStr) as TlkJSONobject;
    if not assigned(js) then
    begin
      MainOutMessage('[error] js is error');
      exit;
    end
    else
    begin
       if js.IndexOfName('userID')>=0 then
       begin
         userID:= js.Field['userID'].Value;
       end;
        MainOutMessage('userID: '+userID);
    end;

  except
    on E:Exception do
    begin

    end;
  end;
  //}
  
  signStr:= 'amount=0.01&applicationID=10383643&productDesc=元宝&productName=元宝&requestId=201606211410&userID=900086000022031102';
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
  MainOutMessage('sign: '+sign);

  //对支付后返回的签名进行验签
  verifySign :=  '';
  //接口：RsaSha1Verify(string BillInfo, string PublicKey, string sign)
  //verifyResult := RsaSign.RsaSha1Verify(BillInfo, PAY_RSA_PUBLIC, verifySign);
end;

procedure TForm1.Button39Click(Sender: TObject);
begin
  memo7.Text := AnsiToUtf8('\u6210\u529f');
  memo8.Text := UTF8Decode(HTTPDecode(memo7.Text));
end;

procedure TForm1.VivoLoginVerifyBtnClick(Sender: TObject);
var
  url, postData ,header, returnStr, userId:string;
  js, datajs:TlkJSONobject;
begin
   //url := 'https://usrsys.inner.bbk.com/auth/user/info';
  url := 'https://usrsys.vivo.com.cn/sdk/user/auth.do';
  header := 'Content-Type:application/x-www-form-urlencoded';
  //postData := 'access_token='+token.Text;
  postData := 'authtoken='+token.Text;
  MainOutMessage('postData: '+postData);
  returnStr:= Utf8ToAnsi(HttpsPost(url,postData,header));//发送验证登录的请求.
  MainOutMessage('登录请求响应: '+returnStr);
  //{"email":"","isOverDue":"0","name":"","nickname":"","phonenum":"","uid":"a7eea091665fdce9"}
  //{"retcode":0,"data":{"success":true,"openid":"a7eea091665fdce9"}}
  try
    js:= TlkJSON.ParseText(returnStr) as TlkJSONobject;
    if not assigned(js) then
    begin
      MainOutMessage('[error] returnStr is error');
      exit;
    end
    else
    begin
      if (js.Field['retcode'].Value = 0) and (js.IndexOfName('data')>=0) then
      begin
        datajs:= js.Field['data'] as TlkJSONobject;
        if (datajs.IndexOfName('success')>=0)and(datajs.IndexOfName('openid')>=0) then
        begin
          userID := datajs.Field['openid'].Value;

          MainOutMessage('登录成功!    openid: ' + userID + ',  success: ' + BoolToStr(datajs.Field['success'].Value));
        end;
       { //先判断http状态码为200且json消息中包含uid和email则说明该账号校验是有效的
       if (js.IndexOfName('uid')>=0) AND (js.IndexOfName('email')>=0) then
       begin
         userID:= js.Field['uid'].Value;
         MainOutMessage('登录成功！   userID: ' + userID);
       end;
       }
      end
      else
        MainOutMessage('[error] 帐号登录校验无效！ retcode: ' + js.Field['retcode'].Value);
    end;
  except on E:Exception do
    begin
         ;
    end;
  end;
end;

//订单推送接口（这一步从客户端收到支付请求，在向Vivo服务器请求订单号）
procedure TForm1.VivoPayOrderClick(Sender: TObject);
var
  version,signature,signMethod,cpId,cpKey,appId,notifyUrl:string;
  cpOrderNumber,orderTime,orderAmount,orderTitle,orderDesc:string;
  extInfo,requestUrl,signStr,postData,header,returnStr:string;
  respOrderNumber,respAccessKey,respOrderAmount,respSign:string;
  js:TlkJSONobject;
begin
  js := nil;
  cpKey := 'fa4a5c348e37d2eaf56a0001e30243de';
  requestUrl := 'https://pay.vivo.com.cn/vcoin/trade';
  version := '1.0.0';
  signMethod := 'MD5';
  cpId := '20150506165431733076';
  appId := '4f00a8c18074b6ca58eae73f3f30f5b3';
  cpOrderNumber := vivoNumEdit.Text;//IntToStr(DateTimeToUnixDateInt(now));
  notifyUrl := 'http://182.254.244.236:3358/vivopay';
  orderTime := vivoTimeEdit.Text;//FormatdateTime('yyyymmddhhmmss', Now);
  orderAmount := '1';
  orderTitle := '元宝';
  orderDesc := '元宝';
  extInfo := vivoCallbackEdit.Text;

  signStr := 'appId='+appId+'&cpId='+cpId+'&cpOrderNumber='+cpOrderNumber+'&extInfo='+extInfo+
  '&notifyUrl='+notifyUrl+'&orderAmount='+orderAmount+'&orderDesc='+orderDesc+
  '&orderTime='+orderTime+'&orderTitle='+orderTitle+'&version='+version;

  //MainOutMessage('待签名串: ' + signStr);
  signStr := AnsiToUtf8(signStr);
  MainOutMessage('待签名串: ' + signStr);
  //md5签名
  signature := LowerCase(Md5(signStr+'&'+LowerCase(Md5(cpKey))));
  MainOutMessage('签名: ' + signature+#13#10);

  postData := signStr+'&signMethod='+signMethod+'&signature='+signature;
  header := 'Content-Type:application/x-www-form-urlencoded';
  MainOutMessage('postData: '+postData+#13#10);
  returnStr:= Utf8ToAnsi(HttpsPost(requestUrl, postData, header));//向Vivo请求订单流水号.
  MainOutMessage('订单推送结果: '+returnStr+#13#10);

  try
    js:= TlkJSON.ParseText(returnStr) as TlkJSONobject;
    if (not assigned(js)) or (js.IndexOfName('respCode')<0) then
    begin
      MainOutMessage('[error] get vivo pay order number error');
      exit;
    end
    else
    begin
       //先判断http状态码为200且json消息中包含accessKey和orderNumber则说明该账号校验是有效的
       if (js.Field['respCode'].Value = 200) then
       begin
          if (js.IndexOfName('accessKey')>=0) AND (js.IndexOfName('orderNumber')>=0) AND (js.IndexOfName('signature')>=0) AND (js.IndexOfName('orderAmount')>=0)then
          begin
            //解析返回的交易流水号和accesskey
            respAccessKey := js.Field['accessKey'].Value;
            respOrderNumber := js.Field['orderNumber'].Value;
            respOrderAmount := js.Field['orderAmount'].Value;
            respSign := js.Field['signature'].Value;

            //验证返回的签名signature（确保是vivo返回的数据）
            signStr := 'accessKey='+respAccessKey+'&orderAmount='+respOrderAmount
                    +'&orderNumber='+respOrderNumber//;
                    +'&respCode='+'200'
                    +'&respMsg='+js.Field['respMsg'].Value;
            signStr := AnsiToUtf8(signStr);
            MainOutMessage('待签名串: ' + signStr+#13#10);

            signature := LowerCase(Md5(signStr+'&'+LowerCase(Md5(cpKey)))); //md5签名]
            MainOutMessage('Vivo签名: ' +respSign+#13#10 +'本地签名: '+ signature);
            if signature = respSign then
               MainOutMessage('验证签名成功！'+#13#10);
          end;
       end
       else
       begin
          MainOutMessage('[error] wrong respCode: '+IntToStr(js.Field['respCode'].Value)+', respMsg: '+js.Field['respMsg'].Value);
          js.Free;
          exit;
       end;
    end;
  except on E:Exception do
    begin
         ;
    end;
  end;
  js.Free;
end;

procedure TForm1.CCLoginVerifyBtnClick(Sender: TObject);
var
  url, postData ,header, returnStr:string;
begin
  url := 'http://android-api.ccplay.com.cn/api/v2/payment/checkUser/';
  header := 'Content-Type:application/x-www-form-urlencoded';
  postData := 'token='+CCToken.Text;
  MainOutMessage('postData: '+postData);
  returnStr:= Utf8ToAnsi(HttpsPost(url,postData,header));//发送验证登录的请求.
  MainOutMessage('登录请求响应: '+returnStr);

  if returnStr = 'success' then
  begin
    MainOutMessage('登录验证成功！');
  end;
end;


procedure TForm1.QMYXLoginBtnClick(Sender: TObject);
var
  url, data , returnStr, gameId, secretKey, sign:string;
  userKey,nickName:string;
  js,retdata:TlkJSONobject;
begin
  url := 'http://api.17168.com/api/hbsdk/validateLogin/';//dev.
  gameId := '100023';
  secretKey := 'sifyxjabhqucw2x9';


//http://dev.api.17168.com/api/hbsdk/validat eLogin?session_id=f4c88051518049b6b50a8445870889ed
//&game_id=100023&sign=85125fa9d7112acf5833a82d5cdc20a5

  sign := LowerCase(Md5(AnsiToUtf8(SessionId.Text+gameId+secretKey)));
  data := url+'?session_id='+SessionId.Text+'&game_id='+gameId+'&sign='+sign;
  MainOutMessage('登录请求: '+data);
  //data := 'http://api.17168.com/api/hbsdk/validateLogin/?session_id=dbb8e7161671414a903fb91513dd494f&game_id=100023&sign=0fb86de9ba0cb1adfd2c8cecc487dc05';

  returnStr:= Utf8ToAnsi(HttpsGet(data));//发送验证登录的请求.
  MainOutMessage('登录请求响应: '+returnStr);
  try
    js:= TlkJSON.ParseText(returnStr) as TlkJSONobject;
    if not assigned(js) then
    begin
      MainOutMessage('[error] returnStr is error');
      exit;
    end;

    if (js.IndexOfName('ret')>=0) AND (js.IndexOfName('data')>=0) then
    begin
      retdata := js.Field['data'] as TlkJSONobject;

      //响应转态ret为1时表示响应成功，2表示失败.
      if (js.Field['ret'].Value <> 1) OR (not assigned(retdata)) then
      begin
        MainOutMessage('[error] response data error');
        //exit;
      end;
      
      MainOutMessage('[error] Login error: ' + retdata.Field['message'].Value);
      
      //响应码js.data.code为1表示验证成功，其他为失败.
      if retdata.Field['code'].Value =1 then
      begin
        nickName := retdata.Field['nick_name'].Value;
        userKey := retdata.Field['user_key'].Value;
        MainOutMessage('登录成功: '+#13#10+'nick_name: '+nickName+', user_key: '+userKey);
      end;

    end; 

  except on E:Exception do
    begin
         ;
    end;
  end;
end;

//校验“SDK 服务器”发起的某笔充值订单是否扣费成功
procedure TForm1.QMYXPayBtnClick(Sender: TObject);
var
  url, data, returnStr,user_key, game_id, secret_key, order_id, sign:string;
  time:Integer;
  js:TlkJSONobject;
begin
  url := 'http://dev.api.17168.com/api/hbsdk/exchange/';
  secret_key := '123456';
  user_key := 'BHGRXCR';
  game_id := '100023';
  order_id := '20160608142227513459';
 time := DateTimeToUnix(now()) - 8*60*60;
  // time := DateTimeToUnix(now());
  MainOutMessage('time: '+IntToStr(time));

  sign := LowerCase(Md5(UTF8Encode(user_key+game_id+order_id+IntToStr(time)+secret_key)));
  data := url+'?user_key='+user_key+'&game_id='+game_id+'&order_id='+order_id
  +'&time='+IntToStr(time)+'&sign='+sign;
  MainOutMessage('请求: '+data);

  returnStr:= Utf8ToAnsi(HttpsGet(data));//发送支付查询的请求.
  MainOutMessage('响应: '+returnStr);

  try
    js:= TlkJSON.ParseText(returnStr) as TlkJSONobject;
    if not assigned(js) then
    begin
      MainOutMessage('[error] returnStr is error');
      exit;
    end;

    //先判断http状态码为200且json消息中包含uid和email则说明该账号校验是有效的
    if js.IndexOfName('error_code')>=0 then
    begin
      //响应码error_code为1时表示支付成功，其他为失败.
      if js.Field['error_code'].Value = 1 then
      begin
        MainOutMessage('支付成功！ msg: ' + js.Field['error_message'].Value);
        exit;
      end;
    end;

    except on E:Exception do
    begin
         ;
    end;
   end;
end;

procedure TForm1.Button40Click(Sender: TObject);
var
  List: TStringList;
  signStr,mySign,receiveStr: string;
  appid,data,sign: string;
  js:TlkJSONobject;

begin
  receiveStr := '------------------------------1f9ede9f49bb'+
'Content-Disposition: form-data; name="appid"' +
#13#10+
'1000001'+
'------------------------------1f9ede9f49bb'+
'Content-Disposition: form-data; name="data"'+
#13#10+
'{"orderId":"k20160604112112439920302","gameId":"1000001","serverId":"0","uid":"0","money":"30.00","gold":"300","callbackInfo":"VXNlcklEPTVfNDdAMTAxJkl0ZW1JRD0yJkJpbGxJRD0xNDY1MDM5MjY2MDAwMCZTZXJ2ZXJJRD0x\r\n"}'+
'------------------------------1f9ede9f49bb'+
'Content-Disposition: form-data; name="sign"'+
#13#10+
'1bae75accb8b38d019f1864f2eed3afa'+
'------------------------------1f9ede9f49bb--';

receiveStr :=
'------------------------------8b10cf36d830'+SLineBreak+
'Content-Disposition: form-data; name="appid"'+SLineBreak+
'1000001'+SLineBreak+
'------------------------------8b10cf36d830'+SLineBreak+
'Content-Disposition: form-data; name="data"'+SLineBreak+
'{"orderId":"k20160912163821254830148","gameId":"1000001","serverId":"2","uid":"169431","money":"6.00","gold":"60","callbackInfo":"VXNlcklEPTEzXzUyQDEwMSZJdGVtSUQ9MSZCaWxsSUQ9MTQ3MzY5ODMwMzAwMDAmU2VydmVySUQ9%0D%0AMg=="}'+SLineBreak+
'------------------------------8b10cf36d830'+SLineBreak+
'Content-Disposition: form-data; name="sign"'+SLineBreak+
'2015fccaecc4e0e53191a67e975641c2'+SLineBreak+
'------------------------------8b10cf36d830--'+SLineBreak;

  MainOutMessage(receiveStr);
  MainOutMessage('');
  List := TStringList.Create;
  //第一个参数是分隔符; 第二个参数是开头被忽略的字符  
  ExtractStrings(['=','-'],['-',' '],PChar(receiveStr),List);
  //ExtractStrings(['=','-'],['-',' '],PChar(receiveStr),List);

  memo1.Lines.AddStrings(List);

  appid := List[List.IndexOf('"appid"')+1];{第一次出现的位置}
  data := List[List.IndexOf('"data"')+1];
  sign := List[List.IndexOf('"sign"')+1];
  MainOutMessage('');
  MainOutMessage('appid: ' + appid);
  MainOutMessage('data: ' + data);
  MainOutMessage('sign: ' + sign);

  MainOutMessage('[Log] Data: ' + receiveStr);

  js:= TlkJSON.ParseText(data) as TlkJSONobject;
    if not assigned(js) then
    begin
      MainOutMessage('[error] returnStr is error');
      exit;
    end
    else
    begin
        MainOutMessage(#13#10+'orderId: ' + js.Field['orderId'].Value);
        MainOutMessage('gameId: ' + js.Field['gameId'].Value);
        MainOutMessage('money: ' + js.Field['money'].Value);
    end;
    
  List.Free;

  //签名验证
  {"orderId":"k20160603160249250719868","gameId":"1000001","serverId":"0","uid":"0","money":"30.00","gold":"300","callb
                         ackInfo":"VXNlcklEPTVfNDdAMTAxJkl0ZW1JRD0yJkJpbGxJRD0xNDY0OTY5NzY0MDAwMCZTZXJ2ZXJJRD0x\r\n"}
  signStr := appid + 'callbackInfo=VXNlcklEPTEzXzUyQDEwMSZJdGVtSUQ9MSZCaWxsSUQ9MTQ3MzY5ODMwMzAwMDAmU2VydmVySUQ9%0D%0AMg==' //%0D%0A
              +'&gameId=1000001&gold=60&money=6.00&orderId=k20160912163821254830148&serverId=2&uid=169431'+ 'ca5762fa9d9b6f966b795cae4a8c96d2';
  //signStr := '1000000callbackInfo=exam-test&gameId=1000000&gold=60&money=6&orderId=k20160101111122334455678&serverId=1&uid=255248f7ef36b5fba1751a07db133a2aecbb3b';
  {
  signStr:=StringReplace (signStr, '\r',  '%0D', [rfReplaceAll]);
  signStr:=StringReplace (signStr, '\n', '%0A', [rfReplaceAll]);      }
  //signStr:=StringReplace (signStr, '%0D', '\r', [rfReplaceAll]);
  //signStr:=StringReplace (signStr, '%0A', '\n', [rfReplaceAll]);
  MainOutMessage('signStr: ' + signStr); //a2df3f978a6e21a6f7442d2e3e033b7c

  mySign := MD5(UTF8Encode(signStr));            //8201943c66a126664789d12a945267a3
  MainOutMessage('mySign: ' + mySign);//cf33b68655d40a8955908e98951a87f1
  MainOutMessage('sign: ' + sign);

end;

procedure TForm1.Button41Click(Sender: TObject);
var
   callbackInfo: string;
   UserID, ItemID, BillID: string;
   ServerID: Integer;
   js: TlkJSONobject;
   jsonInfo: string;
begin
   UserID := '29302';
   ItemID := '1';
   BillID := '20160615092209320';
   ServerID := 1;
   callbackInfo := EncodeString('UserID='+UserID+'&ItemID='+ItemID+'&BillID='+BillID+'&ServerID='+IntToStr(ServerID));
   MainOutMessage('callbackInfo: ' + callbackInfo);

   js:= TlkJSONobject.Create;
   js.Add('callbackInfo', callbackInfo);
   jsonInfo := TlkJSON.GenerateText(js);

   MainOutMessage('原jsonInfo: ' + jsonInfo);

   jsonInfo:=StringReplace (jsonInfo, '\r',  '', [rfReplaceAll]);
   jsonInfo:=StringReplace (jsonInfo, '\n', '', [rfReplaceAll]);
   MainOutMessage('替换后jsonInfo: ' + jsonInfo);


end;

procedure TForm1.VivoPayVerifyClick(Sender: TObject);
var
  retList: TStringList;
  i: Integer;
  appId,cpId,cpOrderNumber,extInfo,orderAmount,orderNumber,payTime:string;
  respCode,respMsg,tradeStatus,tradeType,uid, signStr, sign, cpKey:string;
begin
  cpKey := 'fa4a5c348e37d2eaf56a0001e30243de';
  retList := TStringList.Create;
  retList.Delimiter := '&';
  retList.DelimitedText := HTTPDecode(vivoEdit.Text);//UTF8Decode

  for i:=0 to retList.Count-1 do
  begin
    MainOutMessage(retList.Names[i] + '  -->  ' + retList.Values[retList.Names[i]]);
  end;

  appId:=retList.Values['appId'];
  cpId:= retList.Values['cpId'];
  cpOrderNumber:= retList.Values['cpOrderNumber'];
  extInfo:= retList.Values['extInfo'];
  orderAmount:= retList.Values['orderAmount'];
  orderNumber:= retList.Values['orderNumber'];
  payTime:= retList.Values['payTime'];
  respCode:= retList.Values['respCode'];
  respMsg:= retList.Values['respMsg'];
  tradeStatus:= retList.Values['tradeStatus'];
  tradeType:= retList.Values['tradeType'];
  uid:= retList.Values['uid'];

  signStr:='appId='+appId+'&cpId='+ cpId+'&cpOrderNumber='+ cpOrderNumber+'&extInfo='+ extInfo+'&orderAmount='+ orderAmount+'&orderNumber='+ orderNumber
  +'&payTime='+ payTime+'&respCode='+ respCode+'&respMsg='+ respMsg+'&tradeStatus='+ tradeStatus+'&tradeType='+ tradeType+'&uid='+ uid;

  MainOutMessage('待签名串: ' + signStr+#13#10);

  //md5签名
  sign := LowerCase(Md5(UTF8Encode(signStr+'&'+LowerCase(Md5(cpKey)))));
  MainOutMessage('签名: ' + sign+#13#10);

  if sign = retList.Values['signature'] then
  begin
    MainOutMessage('支付成功！');
  end;
end;

procedure TForm1.Button42Click(Sender: TObject);
var
  callbackInfo,s:string;
  codeStr:string;
begin
  s:='VXNlcklEPTE1XzYyQDE2NCZJdGVtSUQ9MSZCaWxsSUQ9MTQ2ODUwNjU0MjAwMDAmU2VydmVySUQ9MQ==';
  MainOutMessage('callbackInfo长度:'+IntToStr(length(s)));
  
  callbackInfo:='UserID=15_62@164&ItemID=10&BillID=14685065420000&ServerID=10';

  callbackInfo:='U=15_62@164&I=10&B=14685065420000&S=10';
  callbackInfo:='15_62@164&10&14685065420000&10';
  codeStr := EncodeString(callbackInfo);

  MainOutMessage('加密后:'+codeStr);
  MainOutMessage('长度:'+IntToStr(length(codeStr)));

end;

procedure TForm1.Button43Click(Sender: TObject);
var
  src,targ: string;
begin
{Copy(源字符串: string，起始位置: Integer，目标长度: Integer);
Pos(子串:string，源字符串:string）; //获得子串在源字符串的位置 }
  src := ccpayEdit4.Text;
  MainOutMessage('position: '+IntToStr(Pos('=', src)));
  targ := Copy(src, Pos('=', src)+1, Length(src)-Pos('=', src));
  MainOutMessage('token 解析: '+targ);
end;

procedure TForm1.QQLoginVerifyClick(Sender: TObject);
const
  TENCENT_QQ_APPID = '1104936787';
  TENCENT_QQ_APPKEY = 'BZMsqGV02ZxTZBLu';
  TENCENT_WX_APPID = 'wx352b03a01f2253c1';
  TENCENT_WX_APPKEY = 'f206cef86c174b72d887f23094e9ce88';
  
  TENCENT_LOGIN_URL = 'http://ysdktest.qq.com/auth';

 { QQLoginURL = 'http://ysdk.qq.com/auth/qq_check_token';//测试URL http://ysdktest.qq.com/auth/qq_check_token
  WXLoginURL = 'http://ysdk.qq.com/auth/wx_check_token';//测试URL http://ysdktest.qq.com/auth/wx_check_token    }

var
  openid,openkey,sign, Data: string;
  timestamp, loginPlatform: Integer;
  requestStr, returnStr: string;
  js, jsdata: TlkJSONobject;

begin
  jsdata := nil;
  js := nil;

  //微信登录成功返回Msg
  {"platform":2,"pf":"desktop_m_wx-2002-android-00000000-867822025692483","flag":0,"token":"o1fEfHM2shPCMQhJrhDQgc-EjL3id5bYNLW3oThJOFPlIpAAMJvI5jF83rFSg0KGHnoiDnMEJVM6PBRTaIBQAruEl3q70DNCo8zP8EAGkXA","open_id":"oYlgWt1F62jNdx7ic-yMlmrawYgg","pf_key":"7607e9d5b541684f2236a0b863afeabb","RefreshToken":"o1fEfHM2shPCMQhJrhDQgXyNzcSB2oHHfakJRyVv6C1gl-k64csOgLWAM-41g-5MVjOqEJbZk26JpZYLvzOYD5HD6_SzeRQG0_NVtoiu7Go"}
  //QQ登录成功返回Msg New
  {"platform":1,"pf":"desktop_m_qq-73213123-android-00000000-867822025692483","flag":0,"token":"8D0EF628394ACC58CD7A9E4A6C3F7D21","open_id":"E5D970D29D94EA518CB86E9D21D12A47","pf_key":"60384f4740684502559b80e466fde646","PayToken":"25B2E67A47C578BA7F490F1F853ECE50"}
  
  if QQComboBox.ItemIndex = 0 then
    Data := QQLoginEdit.Text
  else
    Data := WXLoginEdit.Text;
  
  timestamp := DateTimeToUnix(Now)-8*60*60;
  jsdata := TlkJSON.ParseText(Data) as TlkJSONobject;
  if not assigned(jsdata) then
  begin
      MainOutMessage('[Error] Tencent Login Request Failed. Client Data error. Data: ' + Data);
      exit;
  end;

  if (jsdata.IndexOfName('platform')>=0) AND (jsdata.IndexOfName('token')>=0) AND (jsdata.IndexOfName('open_id')>=0)then
  begin
    loginPlatform := jsdata.Field['platform'].Value;
    openkey := jsdata.Field['token'].Value;
    openid := jsdata.Field['open_id'].Value;
  end
  else
  begin
    MainOutMessage('[Error] Tencent Login Request Failed. Parameter not exist! Data: ' + Data);
    jsdata.Free;
    exit;
  end;

  //针对不同平台进行签名.
  if loginPlatform = 1 then//QQ 请求时使用QQ的App_Id和App_Key
  begin
    sign := LowerCase(Md5(TENCENT_QQ_APPKEY + IntToStr(timestamp)));
    requestStr := TENCENT_LOGIN_URL+'/qq_check_token?'+'timestamp='+IntToStr(timestamp)+'&appid='+TENCENT_QQ_APPID+
          '&sig='+sign+'&openid='+openid+'&openkey='+openkey
  end
  else    //微信 请求时使用微信的App_Id和App_Key
  begin
    sign := LowerCase(Md5(TENCENT_WX_APPKEY + IntToStr(timestamp)));
    requestStr := TENCENT_LOGIN_URL+'/wx_check_token?'+'timestamp='+IntToStr(timestamp)+'&appid='+TENCENT_WX_APPID+
            '&sig='+sign+'&openid='+openid+'&openkey='+openkey;
  end;

  MainOutMessage('请求: '+requestStr+#13#10);

  returnStr:= Utf8ToAnsi(HttpsGet(requestStr));//发送验证登录的请求.
  MainOutMessage('登录请求响应: '+returnStr+#13#10);
  try
    js:= TlkJSON.ParseText(returnStr) as TlkJSONobject;
    if not assigned(js) then
    begin
      MainOutMessage('[Error] Tencent Login Verify Failed. Response Data error. Data: ' + returnStr);
      jsdata.Free;
      exit;
    end;

    if (js.IndexOfName('ret')>=0) AND (js.IndexOfName('msg')>=0) then
    begin
       if js.Field['ret'].Value = 0 then
       begin

         MainOutMessage('[Log] 登录验证成功！UID: ' + openid);
       end
       else
       begin
         MainOutMessage('[Error] Tencent Login Verify Failed. 登录失败. Data: ' + returnStr);
       end;

    end
    else
    begin
      MainOutMessage('[Error] Tencent Login Verify Failed. Parameter not exist! Data: ' + returnStr);
    end;
      
  except on E:Exception do
    begin
      MainOutMessage('[Error] Tencent Login Verify Failed. unknown exception! Data: ' + returnStr);
    end;
  end;
  jsdata.Free;
  js.Free;
  
end;

procedure TForm1.Button44Click(Sender: TObject);
var
  zoneid, Data, logMsg: string;

begin
  if QQComboBox.ItemIndex = 0 then
    Data := QQLoginEdit.Text
  else
    Data := WXLoginEdit.Text;
  zoneid := '1';   //账户分区ID

  TencentPayServer.TencentSynchroBalance(zoneid, Data, 8);   //最多请求8次
end;

function TencentGetBalanceThread(Param:Pointer):Integer; stdcall;   //请求余额线程 ; times:Integer
var
  Server:TTencentPayServer;
  reqResult: boolean;
  
  times:Integer;
  CurrentTick, StartTick:Cardinal;

begin
  Server:=TTencentPayServer(Param);
  Server.TencentBalance.IsSuccess := False;
  
  while Server.TencentBalance.RequestTimes > 0 do
  begin

    CurrentTick := GetTickCount;//获取当前时间
    if (CurrentTick-StartTick) > 1500 then //每15s请求一次(15000)，计算距离上次请求的时间间隔。
    begin
      StartTick := CurrentTick;   //记录当前请求时间

      Server.TencentBalance.IsSuccess := Server.processTencentGetBalance(Server.TencentBalance.Request);
      if Server.TencentBalance.IsSuccess then   //IsSuccess表示腾讯游戏币充值是否到帐
      begin
         Server.MainOutMessage('[Log] 支付已到帐！用户余额：'+IntToStr(Server.TencentBalance.Balance));
         Break;
      end;

      Dec(Server.TencentBalance.RequestTimes); //请求次数减一
    end

  end;
  Server.MainOutMessage('[Log] 查询余额完成！用户余额：'+IntToStr(Server.TencentBalance.Balance));

  //通过Server.TencentBalance中数据，对比同步元宝余额 TencentBalance.Balance

end;

//查询余额需要返回元宝最新余额
{查询余额接口-客户端支付成功回调到服务器，服务器查询余额，如果余额增加，则发放相应数目元宝。}
function TTencentPayServer.TencentGetBalanceRequest (zoneid, Data: string):string;
const
  { 注意:微信登录态和手Q登录态使用的支付接口相同，支付ID相同；服务端使用的appid和appkey都
  使用支付的offerid和appkey。offerid对应QQ的APPID，appkey对应支付的appkey(区分沙箱和现网)}
  TENCENT_MIDAS_OFFERID = '1104936787'; //米大师appid(QQ_APP_ID)
{  TENCENT_MIDAS_APPKEY = 'P4d26OxLKq45pk2ATTbZ5C7ESNCy2aFT';//米大师现网appKey:P4d26OxLKq45pk2ATTbZ5C7ESNCy2aFT 沙箱BZMsqGV02ZxTZBLu
  TENCENT_GET_BALANCE_URL = 'https://ysdk.qq.com/mpay/get_balance_m';        }

  TENCENT_MIDAS_APPKEY = 'BZMsqGV02ZxTZBLu';//米大师现网appKey:P4d26OxLKq45pk2ATTbZ5C7ESNCy2aFT 沙箱BZMsqGV02ZxTZBLu
  TENCENT_GET_BALANCE_URL = 'https://ysdktest.qq.com/mpay/get_balance_m';
  SERVER_IP = '192.168.21.116';

var
  openid,openkey,pf,pf_key,signStr0,signStr,sign:string;
  timestamp,payPlatform: Integer;

  OpenAPI,requestStr: string;
  jsdata: TlkJSONobject;
  HmacSha1:HmacSha1Class;
begin
  jsdata := nil;
  CoInitialize(nil);
  HmacSha1:= CoHmacSha1Class.Create;
  timestamp := DateTimeToUnix(Now)-8*60*60;

  try
    if Trim(zoneid) = '' then
    begin
      MainOutMessage('[error] Tencent Pay Get Balance Failed. 账户分区id有误! zoneid: '+zoneid+', Data: ' + Data);
      exit;
    end;

    jsdata := TlkJSON.ParseText(Data) as TlkJSONobject;
    if not assigned(jsdata) then
    begin
      MainOutMessage('[error] Tencent Pay Get Balance Failed. 登录回调参数有误! Data: ' + Data);
      exit;
    end;

    if (jsdata.IndexOfName('platform')>=0) AND (jsdata.IndexOfName('open_id')>=0)
        AND (jsdata.IndexOfName('pf')>=0) AND (jsdata.IndexOfName('pf_key')>=0) then
    begin
      payPlatform := jsdata.Field['platform'].Value;
      openid := jsdata.Field['open_id'].Value;
      pf := jsdata.Field['pf'].Value;
      pf_key := jsdata.Field['pf_key'].Value;

      //openkey：手Q登陆时传手Q登陆回调里获取的paytoken值，微信登陆时传微信登陆回调里获取的传access_token值。
      if (payPlatform = 1) and (jsdata.IndexOfName('PayToken')>=0) then//QQ
      begin
        openkey := jsdata.Field['PayToken'].Value;
      end
      else if (payPlatform = 2) and (jsdata.IndexOfName('token')>=0) then    //微信
      begin
        openkey := jsdata.Field['token'].Value;
      end
      else
      begin
        MainOutMessage('[error] Tencent Pay Get Balance Failed. Parameter not exist(1)! Data: ' + Data);
        jsdata.Free;
        exit;
      end;

    end
    else
    begin
      MainOutMessage('[error] Tencent Pay Get Balance Failed. Parameter not exist(2)! Data: ' + Data);
      jsdata.Free;
      exit;
    end;
    
  except on E:Exception do
    begin
      MainOutMessage('[error] Tencent Pay Get Balance Failed. unknown exception! Data: ' + Data);
      jsdata.Free;
      Exit;
    end;
  end;
  jsdata.Free;
  
  //构造请求数据
  OpenAPI := '/v3/r/mpay/get_balance_m';
  signStr0 := 'appid='+TENCENT_MIDAS_OFFERID+'&openid='+openid+'&openkey='+openkey+
      '&pf='+pf+'&pfkey='+pf_key+'&ts='+IntToStr(timestamp)+'&zoneid='+zoneid;
 { signStr0:=StringReplace (signStr0, '@', '%40', [rfReplaceAll]);//如果参数里包含@，那@需要手动编码为%40   }
  //MainOutMessage('signStr0: '+signStr0+#13#10);

  //如果参数里面包含@，那@也会被编码为%N格式，需要改回@，否则签名错误。
  signStr := 'GET&'+HttpEncode(OpenAPI) + '&'+HttpEncode(signStr0);
  //MainOutMessage('signStr: '+signStr+#13#10);

  //'hex'小米渠道使用，返回bytesToHexStr(hmac.Hash).ToLower(); 'base64'腾讯渠道使用，返回Convert.ToBase64String(hmac.Hash).
  sign:= HmacSha1.HmacSha1Sign(signStr, TENCENT_MIDAS_APPKEY+'&', 'base64');//注意这里的appkey指的是米大师的appkey, 测试环境用沙箱appkey, 正式环境用正式环境的appkey
  sign:= HttpEncode(sign);

  requestStr := TENCENT_GET_BALANCE_URL +'?'+ signStr0+'&sig='+sign;
  Result := requestStr;
  MainOutMessage('[Log] 查询余额请求: '+requestStr);

  SetCookies(payPlatform, TENCENT_GET_BALANCE_URL, '/mpay/get_balance_m', SERVER_IP);
  CounInitialize;
  //使用计时器进行多次请求
 { TencentTimer.Enabled := True;
  TencentTimer.Interval := 15000;//每隔15秒请求一次
  TencentRequestTimes := 0;               }
end;

procedure TTencentPayServer.TencentSynchroBalance (zoneid, Data: string; reqTimes:Integer); //同步余额
var
   ThreadID: DWORD;
begin
  //初始化
  //TencentBalance := TTencentBalance.Create;
  TencentBalance.RequestTimes := reqTimes;
  TencentBalance.Balance := -1;
  TencentBalance.SaveAmt := -1;
  TencentBalance.Request := TencentGetBalanceRequest(zoneid, Data); //构造请求

  if Trim(TencentBalance.Request) = '' then
  begin
    MainOutMessage('[error] TencentSynchroBalance Failed. Request can not be null! Request: '+TencentBalance.Request);
    Exit;
  end;

  //开一个线程，请求余额，逻辑判断只请求一次，还是请求多次。
  FTencentBalanceThread := CreateThread(nil,0,@TencentGetBalanceThread,Pointer(Self),0,ThreadID);
  if FTencentBalanceThread = 0 then
  begin
     MainOutMessage(Format('[Error]Create TencentGetBalanceThread Failed: %d',[GetLastError]));
  end;
  
end;

function TTencentPayServer.processTencentGetBalance (request: string):Boolean; //发送查询余额请求
var
  returnJs: string;
  jsdata: TlkJSONobject;
  save_amt: Integer;
  //StartTick:Cardinal;
  
begin
  jsdata := nil;
  Result := False;
  
  try
      //然后 发起查询用元宝余额的请求.
      returnJs := Utf8ToAnsi(HttpsGet(TencentBalance.Request));
      MainOutMessage('[Log] 查询余额请求响应 ('+IntToStr(TencentBalance.RequestTimes)+') '+returnJs);

      {"ret" : 0,"balance" : 167,"gen_balance" : 57,"first_save" : 0,"save_amt" : 110,
      "gen_expire" : 0,"tss_list" : [],"save_sum" : 237,"cost_sum" : 70,"present_sum" : 127}
      jsdata := TlkJSON.ParseText(returnJs) as TlkJSONobject;
      if not assigned(jsdata) then
      begin
        MainOutMessage('[Error] Tencent Timer Get Balance Failed. returnData error(1). returnJs: ' + returnJs);
        exit;
      end;

      if (jsdata.IndexOfName('ret')>=0) AND (jsdata.Field['ret'].Value = 0) then
      begin
        if (jsdata.IndexOfName('save_amt')>=0) and (jsdata.IndexOfName('balance')>=0) then    //save_amt: 累计充值金额的游戏币数量
        begin
          save_amt := jsdata.Field['save_amt'].Value;
          TencentBalance.Balance := jsdata.Field['balance'].Value;

          if TencentBalance.SaveAmt = -1 then     //第一次请求的时候
          begin
             TencentBalance.SaveAmt := save_amt;
          end
          else if save_amt > TencentBalance.SaveAmt then
          begin
            TencentBalance.SaveAmt := save_amt;
            Result := True;
          end;
          
        end
        else
          MainOutMessage('[Error] Tencent Timer Get Balance Failed. Return Data Error！returnJs：'+returnJs);

      end
      else
      begin
        MainOutMessage('[Error] Tencent Timer Get Balance Failed. 返回码错误！returnJs：'+returnJs);
        jsdata.Free;
        Exit;
      end;

  except on E:Exception do
  begin
      MainOutMessage('[Error] Tencent Timer Get Balance Failed. unknown exception!. returnJs: ' + returnJs);
      jsdata.Free;
      Exit;
  end;
  end;
  
end;

{使用计时器在2分钟之内间隔15秒多次调用，查询余额是否有变化
procedure TForm1.TencentTimerTimer(Sender: TObject);
var
  returnJs: string;
  jsdata: TlkJSONobject;
  balance, save_amt:Integer;
begin
  jsdata := nil;
  if TencentBlanceRequest <> '' then
  begin
    if TencentRequestTimes > 7 then
        TencentTimer.Enabled := False;
    Inc(TencentRequestTimes);

    //然后 发起查询用元宝余额的请求.
    returnJs := Utf8ToAnsi(HttpsGet(TencentBlanceRequest));
    MainOutMessage('[Log] 查询余额请求响应 ('+IntToStr(TencentRequestTimes)+') '+returnJs);

    try
      jsdata := TlkJSON.ParseText(returnJs) as TlkJSONobject;
      if not assigned(jsdata) then
      begin
        MainOutMessage('[error] Tencent Timer Get Balance Failed. returnData error(1). returnJs: ' + returnJs);
        exit;
      end;

      if (jsdata.IndexOfName('ret')>=0) AND (jsdata.Field['ret'].Value = 0) then
      begin
        if jsdata.IndexOfName('save_amt')>=0 then    //save_amt: 累计充值金额的游戏币数量
        begin
          balance := jsdata.Field['balance'].Value;
          save_amt := jsdata.Field['save_amt'].Value;
          MainOutMessage('[Log] 解析返回数据成功！元宝数：'+IntToStr(coinAmount)+#13#10);

        end
        else
          MainOutMessage('[Log] Tencent Timer Get Balance Failed. 解析save_amt失败！returnJs：'+returnJs);

      end
      else
      begin
        MainOutMessage('[Error] Tencent Timer Get Balance Failed. 返回码错误！returnJs：'+returnJs);
        jsdata.Free;
        Exit;
      end;

    except on E:Exception do
      begin
        MainOutMessage('[error] Tencent Timer Get Balance Failed. unknown exception!. returnJs: ' + returnJs);
        jsdata.Free;
        Exit;
      end;
   end;

  end;

end;      }

{根据平台类型设置cookie}
procedure TTencentPayServer.SetCookies(payPlatform: Integer; requestURL, orgLoc, serverIp: string);
begin
  if payPlatform = 1 then //设置QQ cookie
  begin
    if not InternetSetCookie(PAnsiChar(requestURL),'session_id', PAnsiChar(httpEncode('openid'))) then
    begin
      MainOutMessage('[ERROR] Tencent SetCookies qq session_id: ' + SysErrorMessage(GetLastError));
    end;

    if not InternetSetCookie(PAnsiChar(requestURL),'session_type', PAnsiChar(httpEncode('kp_actoken'))) then
    begin
      MainOutMessage('[ERROR] Tencent SetCookies qq session_type: ' + SysErrorMessage(GetLastError));
    end
  end
  else  //设置微信cookie
  begin
    if not InternetSetCookie(PAnsiChar(requestURL),'session_id', PAnsiChar(httpEncode('hy_gameid'))) then
    begin
      MainOutMessage('[ERROR] Tencent SetCookies wx session_id: ' + SysErrorMessage(GetLastError));
    end;

    if not InternetSetCookie(PAnsiChar(requestURL),'session_type', PAnsiChar(httpEncode('wc_actoken'))) then
    begin
      MainOutMessage('[ERROR] Tencent SetCookies wx session_id: ' + SysErrorMessage(GetLastError));
    end;
  end;
  //设置剩下的cookie
  if not InternetSetCookie(PAnsiChar(requestURL),'org_loc', PAnsiChar(httpEncode(orgLoc))) then
  begin
    MainOutMessage('[ERROR] Tencent SetCookies org_loc: ' + SysErrorMessage(GetLastError));
  end;

  if not InternetSetCookie(PAnsiChar(requestURL),'appip', PAnsiChar(httpEncode(serverIp))) then
  begin
    MainOutMessage('[ERROR] Tencent SetCookies appip: ' + SysErrorMessage(GetLastError));
  end;
end;

function TTencentPayServer.TencentGameCoinRequest (coinAmount:Integer; zoneId,billNo,data,openAPI: string):string;
const
{  TENCENT_MIDAS_OFFERID = '1104936787'; //米大师appid(QQ_APP_ID)
  TENCENT_MIDAS_APPKEY = 'P4d26OxLKq45pk2ATTbZ5C7ESNCy2aFT';//米大师现网appKey:P4d26OxLKq45pk2ATTbZ5C7ESNCy2aFT
  TENCENT_SDK_URL = 'https://ysdk.qq.com';       }
  TENCENT_MIDAS_OFFERID = '1104936787'; //米大师appid(QQ_APP_ID)
  TENCENT_MIDAS_APPKEY = 'BZMsqGV02ZxTZBLu';//米大师现网appKey:P4d26OxLKq45pk2ATTbZ5C7ESNCy2aFT 沙箱BZMsqGV02ZxTZBLu
  TENCENT_SDK_URL = 'https://ysdktest.qq.com';
  SERVER_IP = '192.168.21.116';
  
var
  openid,openkey,pf,pf_key,signStr0,signStr,sign:string;
  timestamp,payPlatform: Integer;

  ConsumeCoinURL,EncodeURL, requestStr, returnStr: string;
  jsdata: TlkJSONobject;

  HmacSha1:HmacSha1Class;
begin
  CoInitialize(nil);   //初始化COM对象，在主方法加入该句子有时候不能解决问题，因为默认是初始化主线程的，只有在子线程或方法加入才行。
  jsdata := nil;
  HmacSha1:= CoHmacSha1Class.Create;

  { 注意:微信登录态和手Q登录态使用的支付接口相同，支付ID相同；服务端使用的appid和appkey都
  使用支付的offerid和appkey。offerid对应QQ的APPID，appkey对应支付的appkey(区分沙箱和现网)}

  ConsumeCoinURL := TENCENT_SDK_URL+OpenAPI;
  timestamp := DateTimeToUnix(Now)-8*60*60;

  if Trim(zoneId) = '' then
  begin
    MainOutMessage('[error] Tencent Pay Get Balance Failed. 账户分区id有误! zoneId: '+zoneId+', Data: ' + data);
    exit;
  end;

  if coinAmount <= 0 then
  begin
    MainOutMessage('[error] Tencent GameCoinAction Data error(3): coinAmount必须大于0. coinAmount: ' + IntToStr(coinAmount) +
          ', Data: ' + data);
    jsdata.Free;
    exit;
  end;

  try
    jsdata := TlkJSON.ParseText(data) as TlkJSONobject;
    if not assigned(jsdata) then
    begin
      MainOutMessage('[error] Tencent GameCoinAction Data error(0). Data: ' + data);
      exit;
    end;

    if (jsdata.IndexOfName('platform')>=0) AND (jsdata.IndexOfName('open_id')>=0)
        AND (jsdata.IndexOfName('pf')>=0) AND (jsdata.IndexOfName('pf_key')>=0) then
    begin
      payPlatform := jsdata.Field['platform'].Value;
      openid := jsdata.Field['open_id'].Value;
      pf := jsdata.Field['pf'].Value;
      pf_key := jsdata.Field['pf_key'].Value;

      //openkey：手Q登陆时传手Q登陆回调里获取的paytoken值，微信登陆时传微信登陆回调里获取的传access_token值。
      if (payPlatform = 1) and (jsdata.IndexOfName('PayToken')>=0) then//QQ
      begin
        openkey := jsdata.Field['PayToken'].Value;
      end
      else if (payPlatform = 2) and (jsdata.IndexOfName('token')>=0) then    //微信
      begin
        openkey := jsdata.Field['token'].Value;
      end
      else
      begin
        MainOutMessage('[error] Tencent Pay Get Balance Failed. Parameter not exist(1)! Data: ' + data);
        jsdata.Free;
        exit;
      end;
      
    end
    else
    begin
      MainOutMessage('[error] Tencent GameCoinAction Data error(1). Data: ' + data);
      jsdata.Free;
      exit;
    end;

  except on E:Exception do
    begin
      MainOutMessage('[error] Tencent GameCoinAction Data error(2). returnStr: ' + returnStr);
      jsdata.Free;
      Exit;
    end;
  end;

  //构造请求数据
  EncodeURL := '/v3/r' + OpenAPI;
  if OpenAPI = '/mpay/present_m' then   //赠送游戏币
    signStr0 :='appid='+TENCENT_MIDAS_OFFERID+'&billno='+billno+'&openid='+openid+'&openkey='+openkey+'&pf='+pf+
      '&pfkey='+pf_key+'&presenttimes='+IntToStr(coinAmount)+'&ts='+IntToStr(timestamp)+'&zoneid='+zoneId

  else        //游戏币支付或取消支付
    signStr0 :='amt='+IntToStr(coinAmount)+'&appid='+TENCENT_MIDAS_OFFERID+'&billno='+billno+'&openid='+openid+'&openkey='+openkey+
      '&pf='+pf+'&pfkey='+pf_key+'&ts='+IntToStr(timestamp)+'&zoneid='+zoneId;
  //MainOutMessage('[Log] signStr0: '+signStr0+#13#10);

  signStr := 'GET&'+HttpEncode(EncodeURL) + '&'+HttpEncode(signStr0);
  //MainOutMessage('[Log] signStr: '+signStr+#13#10);
  
  //'hex'小米渠道使用，返回bytesToHexStr(hmac.Hash).ToLower(); 'base64'腾讯渠道使用，返回Convert.ToBase64String(hmac.Hash).
  sign:= HmacSha1.HmacSha1Sign(signStr, TENCENT_MIDAS_APPKEY+'&', 'base64');//注意这里的appkey指的是米大师的appkey, 测试环境用沙箱appkey, 正式环境用正式环境的appkey
  sign:= HttpEncode(sign);
  //MainOutMessage('[Log] sign: '+sign+#13#10);

  requestStr := ConsumeCoinURL +'?'+ signStr0+'&sig='+sign;
  SetCookies(payPlatform, ConsumeCoinURL, OpenAPI, SERVER_IP);
  Result := requestStr;
  //然后 发起查询用元宝余额的请求.
  //Result := Utf8ToAnsi(HttpsGet(requestStr));
  CoUninitialize();   //解除初始化COM对象
end;

function TencentCoinActionThread(Param:Pointer):Integer; stdcall;   //请求游戏币操作线程 ; times:Integer
var
  Server:TTencentPayServer;
  //ReqInfo:TTencentCoin;
  times:Integer;
  executeTimeTick, StartTick:Cardinal;
begin
  Server:=TTencentPayServer(Param);
  //ReqInfo:= Server.TencentCoin;
  times := 3;

  //操作失败要再试几遍，否则腾讯和我们游戏的游戏币数量会不统一，最好在腾讯这边操作成功后再同步
  while times > 0 do
  begin

    StartTick := GetTickCount;//获取当前时间
    if (StartTick-executeTimeTick) > 1500 then //每15s请求一次(15000)，计算距离上次请求的时间间隔。
    begin
      executeTimeTick := StartTick;   //记录当前请求时间

      Server.TencentCoin.isSuccess := Server.processTencentCoinAction(Server.TencentCoin, Server.TencentCoin.OpenAPI);
      if Server.TencentCoin.isSuccess then
        break;

      Dec(times); //请求次数减一
    end;

  end;
  Server.MainOutMessage('[Log] 游戏币操作完成！用户余额：'+IntToStr(Server.TencentCoin.Balance));
  //Server.TencentCoin.isSuccess := Server.TencentCoinActionExecute(Server.TencentCoin, Server.TencentCoin.OpenAPI);

end;

function TTencentPayServer.processTencentCoinAction(ReqInfo:TTencentCoin; OpenAPI:string):Boolean;   //执行请求
var
  request, returnJs: string;
  jsdata: TlkJSONobject;
  success: Boolean; //是否发货成功
  
  ret:Integer;//返回码。0：成功；1001：参数错误；1018：登陆校验失败。
  balance:Integer;//操作之后的游戏币余额（包含了赠送游戏币）
  billno:string; //操作流水号
begin
  ret := -1;
  Result := False;

  //构造请求
  request := TencentGameCoinRequest(ReqInfo.CoinAmount,ReqInfo.ZoneId,ReqInfo.BillNo,ReqInfo.Data,OpenAPI);
  if Trim(request) = '' then
  begin
    MainOutMessage('[error] Tencent CoinActionThread Failed. Request can not be null! Request: '+request);
    Exit;
  end;
  MainOutMessage('[Log] 游戏币操作请求: '+request);

  //发起元宝操作的请求.
  returnJs := Utf8ToAnsi(HttpsGet(request));
  MainOutMessage('[Log] 游戏币操作请求响应: '+returnJs);
  
  //扣除游戏币
  {"ret":0,"balance":142,"gen_balance":32,"billno":"86756","used_gen_amt":10}
  //取消支付
  {"ret":0,"balance":152,"gen_balance":42,"billno":"86756"}
  //直接赠送游戏币
  {"ret":0,"balance":157,"gen_balance":47,"billno":"86756"}
  //解析返回json，保存参数
  try
    jsdata := TlkJSON.ParseText(returnJs) as TlkJSONobject;
    if not assigned(jsdata) then
    begin
        MainOutMessage('[Error] Tencent CoinActionThread Request Failed. Data: ' + returnJs);
        exit;
    end;

    if (jsdata.IndexOfName('ret')>=0) then
      ret:=jsdata.Field['ret'].Value;
      
    if (jsdata.IndexOfName('balance')>=0) then
      TencentCoin.Balance:=jsdata.Field['balance'].Value;

    if (jsdata.IndexOfName('billno')>=0) then
      billno:=jsdata.Field['billno'].Value;

  except on E:Exception do
  begin
    MainOutMessage('[Error] Tencent CoinActionThread Return Data error: unknown exception. Data: ' + returnJs);
    jsdata.Free;
    Exit;
  end;
  end;
  jsdata.Free;

  {判断操作是否成功}
  if OpenAPI = '/mpay/present_m' then   //赠送游戏币
  begin
  
    if ret=0 then  //赠送成功，同步客户端游戏币余额 （发元宝）
    begin
      MainOutMessage('[Log] Tencent CoinActionThread 赠送游戏币成功，余额：'+IntToStr(balance));
      Result := True;
    end
    else  //赠送游戏币失败，不发元宝
    begin
      MainOutMessage('[Log] Tencent CoinActionThread 赠送游戏币失败. Data: ' + returnJs);

    end;

  end
  else if OpenAPI = '/mpay/pay_m' then        //游戏币支付
  begin

    if ret=0 then //扣除游戏币成功，发道具   1018
    begin
      MainOutMessage('[Log] Tencent CoinActionThread 扣除元宝成功，进行发货. Data: ' + returnJs);

      //发货
      success := False;
      
      //发货成功，同步元宝余额
      if success then
      begin
        Result := True;
      end
      else
      begin
        //发货失败，调用取消支付接口，退还已扣除游戏币
        processTencentCoinAction(ReqInfo, '/mpay/cancel_pay_m');
      end;
      
    end
    {扣除游戏币失败（失败要再试几遍，否则腾讯和我们游戏的游戏币数量会不统一【出现把已经买了道具的元宝返还玩家情况】，
    最好在腾讯这边操作成功后再同步） }
    else //游戏币支付失败，不发放道具
    begin
      MainOutMessage('[Log] Tencent CoinActionThread 扣除游戏币失败. Data: ' + returnJs);
    end;

  end
  else if OpenAPI = '/mpay/cancel_pay_m' then //取消支付
  begin

    if ret=0 then //退款成功
    begin
      MainOutMessage('[Log] Tencent CoinActionThread 退还已扣除游戏币成功. Data: ' + returnJs);
      //发货失败，调用取消支付接口，退还已扣除游戏币
      Result := True;
    end
    else //退款失败
    begin
      MainOutMessage('[Log] Tencent CoinActionThread 退还已扣除游戏币失败. Data: ' + returnJs);

    end;

  end
  else
  begin
     MainOutMessage('[Error] Tencent CoinActionThread Request error: 未知请求类型: '+OpenAPI+'. Data: ' + returnJs);
  end;

end;

procedure TTencentPayServer.TencentGameCoinAction (CoinAmount:Integer; ZoneId,BillNo,Data,OpenAPI: string); //同步余额
var
   ThreadID: DWORD;
begin
  //初始化
  TencentCoin.Balance := -1;
  TencentCoin.CoinAmount := CoinAmount;
  TencentCoin.ZoneId := ZoneId;
  TencentCoin.BillNo := BillNo;
  TencentCoin.Data := Data; //请求数据
  TencentCoin.OpenAPI := OpenAPI; //请求类型
  TencentCoin.IsSuccess := False;

  //开一个线程，请求余额，逻辑判断只请求一次，还是请求多次。
  FTencentCoinThread := CreateThread(nil,0,@TencentCoinActionThread,Pointer(Self),0,ThreadID);
  if FTencentCoinThread = 0 then
  begin
     MainOutMessage(Format('[Error]Create TencentCoinActionThread Failed: %d',[GetLastError]));
  end;

end;

procedure TForm1.Button45Click(Sender: TObject);
var
  Data, returnData,billno,zoneid: string;
  coinAmount:Integer;
  
begin
  if QQComboBox.ItemIndex = 0 then
    Data := QQLoginEdit.Text
  else
    Data := WXLoginEdit.Text;

  billno := QQOrderNoEdit.Text;
  zoneid := '1';   //账户分区ID
  coinAmount := 10;

  TencentPayServer.TencentGameCoinAction(coinAmount,zoneid,billno, Data, '/mpay/pay_m');  //支付游戏币购买道具
end;

procedure TForm1.Button46Click(Sender: TObject);
var
  Data, returnData,billno,zoneid:string;
  coinAmount:Integer;
  
begin
  if QQComboBox.ItemIndex = 0 then
    Data := QQLoginEdit.Text
  else
    Data := WXLoginEdit.Text;

  billno := QQOrderNoEdit.Text;
  zoneid := '1';   //账户分区ID
  coinAmount := 10;

  TencentPayServer.TencentGameCoinAction(coinAmount,zoneid,billno, Data, '/mpay/cancel_pay_m');//取消支付游戏币
end;

procedure TForm1.Button47Click(Sender: TObject);
var
  Data, returnData,billno,zoneid:string;
  coinAmount:Integer;
begin
  if QQComboBox.ItemIndex = 0 then
    Data := QQLoginEdit.Text
  else
    Data := WXLoginEdit.Text;

  billno := QQOrderNoEdit.Text;
  zoneid := '1';   //账户分区ID
  coinAmount := 5;

  TencentPayServer.TencentGameCoinAction(coinAmount,zoneid,billno, Data, '/mpay/present_m');//直接赠送游戏币
end;

procedure TForm1.Button48Click(Sender: TObject);
const
 pay_URL = 'http://pay.coolyun.com:6988/payapi/order';//'http://ipay.iapppay.com:9999/payapi/order';
 //pay_URL = 'http://182.254.148.221:3358/iapppay';
 pubKey = 'MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCrRfnQicAAq9gpBiCGsSi43rHop4h+/KvPYZnDif2WuuZpqR/YlGy'+
 'Ls9iG2RKhG5c3uvneCezThKy6MoDlofFYndbLu/5TpLPKSVFy7uFrB6O2HOG9VAXqCRnwRV6q0aJM+lHT9xnMftXtDwTDNV/dy8Q8oTEf1mHVueis82KpXQIDAQAB';
 priKey = 'MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAIvxEcxf1IFHz20LEtYoOwcFOr0+cFycWM0NaZbSi8Z'+
  'XrIM6HPYVEEUo9iSaAV38D/yNK4IgnTqJa3GgpEtwF/bfInO2CJm+QypeskVRrHha4sBtrkqwvlYwE6C0OijHgMpUsRK/BV+hpjp7j'+
  'O+nGcq/EklJQVZqc4tedV78JclXAgMBAAECgYEAil2manwKInV9O2TqkAMhMfTSulDlSjxwdPahAzZUa50+flXUUuBKwQcaMOBxH5t'+
  'dtylh7n0O2NUM/kGGkOxZVAG6zjCDbLnGpWGvswKYKVEPk6HczXyzccV3XdPZckY21X5r9mm+Dvt4KmQSaq0QSE6EkjzYV51kbs+n/'+
  'cDF1XECQQD9cTmbILPIGrInoXHckn12V3N7VI99EJfjMbq8UZXoM01kyyD+/NG+2FqMOd+e0SOWjnhRlShZ24TQluuv6pBPAkEAjVqc'+
  '1M98cS1B1zG9hKWP0xUjEltwxebGAyyPnxumzADRgRqFRwvFbCkp4vy8wxNzoFv1d1Ue+GdWLgOxGmYseQJAPIB0DQlQgbuFvho3UT2T'+
  'P9X+lnmIS4XTjIQJnP0o+SaOGjq3pMd71sBVVVZXgNVSVpWqOWePG2xhF15/4x3u1wJAMlWm7RzpWj/cZy2+J8Lw4SBwubO4B7CyqCSxC'+
  '95D2fcco1V3SiJF7csGsF6BNRHzJZI5aYH1Ik1h4cbMxPLHOQJAFAHXXl59ZMPg/bXHsesu3hxRivy7neE9DHt0acJSNWfjn3kabEO0W2'+
  'MNu5ib2MfwrIGIVv6JIKCDfcdqavCyKQ==';
var
  UID: string;
  BillData, postData, returnStr, header: string;
  sign, respSign, signStr: string; //priKey, pubKey,
  verify : bool;
  IappaySign:TiapppaySign;//爱贝支付签名与验签（使用Dll库文件）
begin
  IappaySign:= CoTiapppaySign.Create;
  UID := IntToStr(GetTickCount());
  //UID:='8787546214';//8787546214
  header := 'Content-Type:application/x-www-form-urlencoded';
  //构建爱贝支付服务器端下单请求
  BillData := '{"appid":"3001819184","waresid":1,"cporderid":"' + UID + '","price":0.01,"currency":"RMB", "appuserid":"dota148423658"}';
  //签名
  sign := IappaySign.SignBill(BillData, priKey);
  MainOutMessage('[UserID]: '+UID + #13#10 + '[Sign]: '+sign + #13#10);

  //key := 'cjtPmNHWoh259n1dt+mXrxzYAhB3pBrV9Nk62WQVHYNkYx6uOt9+c2ZArWztjaeqiuL3BI+/gr3aRaOKLsDDurRxv5axCnBLFW4lhV9DP3YVwVXVsqEjVCkv0fWEoE08T7P/azF2uXm6mdsFsdeVXhy/ZhOA96t+5QSW6xi9Nqw=';
  
  postData := 'transdata='+BillData + '&sign=' + sign + '&signtype=RSA';
  postData := Utf8Encode(postData);

  MainOutMessage('[下单请求]: '+postData + #13#10);
  returnStr:= Utf8ToAnsi(HttpsPost(pay_URL,postData,header));//发送验证登录的请求.
  MainOutMessage('[返回数据]: '+returnStr + #13#10);

  if (Pos('transdata=', returnStr) = 0) or (Pos('&sign=', returnStr) = 0) or (Pos('&signtype=', returnStr) = 0) then
  begin
     MainOutMessage('[返回数据解析出错！ exit...]');
     exit;
  end;

  //验证签名
  signStr := Copy(returnStr, Pos('transdata=', returnStr)+Length('transdata='), Pos('&sign=', returnStr)-Pos('transdata=', returnStr)-Length('transdata='));
  respSign := Copy(returnStr, Pos('&sign=', returnStr)+Length('&sign='), Pos('&signtype=', returnStr)-Pos('&sign=', returnStr)-Length('&sign='));
  MainOutMessage('[解析数据]：' + #13#10 + 'transdata='+signStr + #13#10 + 'sign='+ respSign+ #13#10);

  //签名
  verify := IappaySign.verifyBill(signStr, pubKey, respSign);
  if (verify) then
    MainOutMessage('验证签名成功！ 订单号：'+Copy(signStr, Pos('":"', signStr)+Length('":"'), Pos('"}', signStr)-Pos('":"', signStr)-Length('":"')))
  else
    MainOutMessage('验证签名失败！');
end;

procedure TForm1.Button49Click(Sender: TObject);
var
  APP_ID, ResultCode:Integer;
  LOGIN_URL, SecretKey: string;
  accessToken, signStr, sign, DataStr, returnStr: string;
  respSign, locSign, Content, UID: string;
  jsdata, js: TlkJSONobject;
  
begin

  jsdata := nil;
  APP_ID := 5424161;
  LOGIN_URL := 'http://querysdkapi.baidu.com/query/cploginstatequery?';
  SecretKey := 'necaGyPbkAVBomGFtxiSa5j42CUndlG8';

  accessToken := BaiduTokenEdit.Text;
  signStr := inttostr(APP_ID) + accessToken + SecretKey;
  sign := Md5(UTF8Encode(signStr));
  MainOutMessage('待签名串：'+signStr+#13#10+'签名：'+sign);

  DataStr := 'AppID='+inttostr(APP_ID)+'&AccessToken='+accessToken+'&Sign='+sign;

  //DataStr := 'AppID=5424161&AccessToken=76ad35426eba4e3989378da50b2a969e-e5c20f39de9dee046d88d29848fa8b6c-20150915191122-e0b1542231e510fd97a0bddb0147f075-390fa8b23d260ae67e53ed1b0ebb58fc-3db7733b3ff019a70bcdae0bf417eaf8&Sign=04d623b352ae2f634fe147747611c575';
  MainOutMessage('登录验证请求：' + DataStr);

  returnStr := Utf8ToAnsi(HttpsPost(LOGIN_URL, DataStr, 'Content-Type:application/x-www-form-urlencoded'));
  MainOutMessage('返回结果：' + returnStr);
  returnStr := '{"ResultCode":1,"ResultMsg":"AccessToken鍚堟硶鏈夋晥","AppID":"6925292","Sign":"af05762bea7454cad70b55c559fbd6e4","Content":"eyJVSUQiOjEyNzcxNzQ0NzF9"}';
  try
    jsdata := TlkJSON.ParseText(returnStr) as TlkJSONobject;
    if not assigned(jsdata) then
    begin
        MainOutMessage('[error] Baidu Login Verify 返回数据有误(0). Data: ' + returnStr);
        exit;
    end;
                                                                   
    if (jsdata.IndexOfName('AppID')>=0) AND (jsdata.IndexOfName('ResultCode')>=0) AND (jsdata.IndexOfName('Sign')>=0)
        AND (jsdata.IndexOfName('Content')>=0)then
    begin
      ResultCode := jsdata.Field['ResultCode'].Value;
      respSign := jsdata.Field['Sign'].Value;
      Content := jsdata.Field['Content'].Value;

      locSign := MD5(UTF8Encode(inttostr(APP_ID)+inttostr(ResultCode)+Content+SecretKey));
      if locSign = respSign then
      begin
        //解析Content,解析出UID，应先UrlDecode，再Base64解码（DecodeString即为Base64解码）.
        UID := UrlDecode(DecodeString(Content));
        MainOutMessage('[Log] Baidu Login Verify. 解码后Content: ' + UID);

        js := TlkJSON.ParseText(UID) as TlkJSONobject;
        if not assigned(js) then
        begin
          MainOutMessage('[error] Baidu Login Verify Content有误. Content: ' + UID);
          exit;
        end;
        if (js.IndexOfName('UID')>=0)then
        begin
          UID := js.Field['UID'].Value;
          //登录成功.
          MainOutMessage('[Log] Baidu Login Verify Success! UID: ' + UID);
        end
        else
           MainOutMessage('[error] Baidu Login Verify Content有误. Content: ' + UID);

      end
      else
        MainOutMessage('[Error] Baidu Login Verify Failed! LocalSign: ' + locSign + ', respSign: '+respSign);

    end
    else
    begin
      MainOutMessage('[error] Baidu Login Verify 返回数据有误(1). Data: ' + returnStr);
      jsdata.Free;
      exit;
    end;

  except on E:Exception do
    begin
      MainOutMessage('[error] Baidu Login Verify 返回数据有误(2). Data: ' + returnStr);
      jsdata.Free;
      Exit;
    end;
  end;
end;

procedure TForm1.OppoLoginVerifyClick(Sender: TObject);
var
  LOGIN_URL, baseStr, sign, Data, resultStr, UID: string;
  token, ssoid, APP_KEY, APP_SECRET: string;
  jsdata, retjs: TlkJSONobject;
  Header:TStringStream;
  HmacSha1:HmacSha1Class;                  

begin
  HmacSha1:= CoHmacSha1Class.Create;
  jsdata := nil;
  retjs := nil;
  Data := oppoLoginData.Text;
  APP_KEY := '3npidydSlw2S8gowk4WS8O4kW';
  APP_SECRET := 'A248b1FbaedD858e2DB0f74c184C87Fa';
  LOGIN_URL := 'http://i.open.game.oppomobile.com/gameopen/user/fileIdInfo?';

  {"token":"TOKEN_iQEPGoxIedeL7K6EOSzcn\/9vJMzHHjJY4IIsERciPI4Fk7e5lUNZ9A==","ssoid":"200029745","flag":0}
  try
    jsdata := TlkJSON.ParseText(Data) as TlkJSONobject;
    if not assigned(jsdata) then
    begin
        MainOutMessage('[error] Oppo Login Verify 客户端请求数据有误(0). Data: ' + Data);
        exit;
    end;

    if (jsdata.IndexOfName('token')>=0) AND (jsdata.IndexOfName('ssoid')>=0) then
    begin
      token := jsdata.Field['token'].Value;
      token := StringReplace (HttpEncode(token), '+', '%2B', [rfReplaceAll]);
      ssoid := jsdata.Field['ssoid'].Value;
      ssoid := StringReplace (HttpEncode(ssoid), '+', '%2B', [rfReplaceAll]);

      LOGIN_URL := LOGIN_URL+'fileId='+ssoid+'&token='+token;
      MainOutMessage('请求：' + LOGIN_URL);

      baseStr := 'oauthConsumerKey='+APP_KEY+'&oauthToken='+token+'&oauthSignatureMethod=HMAC-SHA1&oauthTimestamp='
              +IntToStr(DateTimeToUnix(now()) - 8*60*60)+'&oauthNonce=930229349&oauthVersion=1.0&';
      sign := HmacSha1.HmacSha1Sign(baseStr, APP_SECRET+'&', 'base64');//加密后进行base64编码
      sign := HttpEncode(sign);// 相当于url编码，百分比编码（只编码特定字符）
      MainOutMessage('签名：'+sign);

      Header := TStringStream.Create('');
      with Header do
      begin
        WriteString('Content-Type: application/json'+ SlineBreak);
        WriteString('Param: ' + baseStr+ SLineBreak);
        WriteString('OauthSignature: '+sign+SLineBreak+SLineBreak);
      end;

      MainOutMessage(#13#10+'Header: ' + #13#10+ Header.DataString);
      resultStr := Utf8ToAnsi(HttpsGet(LOGIN_URL, Header.DataString));
      MainOutMessage('返回结果：' + resultStr);
      
    end
    else
    begin
      MainOutMessage('[error] Oppo Login Verify 客户端请求数据有误(1). Data: ' + Data);
      jsdata.Free;
      exit;
    end;

  except on E:Exception do
    begin
      MainOutMessage('[error] Oppo Login Verify 客户端请求数据有误(2). Data: ' + Data);
      jsdata.Free;
      Exit;
    end;
  end;

  {
    "resultCode": "200",
    "resultMsg": "正常",
    "loginToken": "TOKEN_nTPYwuyXxjWhvHq1Kua07LrhIerx1IwGhkRLwFWVbhdQ+wWpf8W/vg==",
    "ssoid": "58733948",
    "appKey": null,
    "userName": "tnyoodev",
    "email": "28***@qq.com",
    "mobileNumber": "",
    "createTime": "2014-11-12 10:16:44",
    "userStatus": "NORMAL"
    }

    //resultCode=200, ssoid为目标ssoid，则登录成功，ssoid为用户唯一标识
    try
      retjs := TlkJSON.ParseText(resultStr) as TlkJSONobject;
      if not assigned(retjs) then
      begin
        MainOutMessage('[error] OPPO Login ReturnData error(0). Data: ' + resultStr);
        jsdata.Free;
        exit;
      end;

      if (retjs.IndexOfName('resultCode')>=0) AND (retjs.IndexOfName('ssoid')>=0) then
      begin
        if (retjs.Field['resultCode'].Value = 200) AND (retjs.Field['ssoid'].Value = ssoid) then
        begin
          UID := ssoid;
          MainOutMessage('[log] OPPO Login Success ! UID: ' + UID);
        end
        else
          MainOutMessage('[log] OPPO Login Failed resultCode error! Data: ' + Data);
      end
      else
          MainOutMessage('[log] OPPO Login Failed Parameter is not Exists! Data: ' + Data);
          
    except on E:Exception do
      begin
        MainOutMessage('[error] OPPO Login ReturnData error(1). Data: ' + resultStr);
        retjs.Free;
        jsdata.Free;
        Exit;
      end;
    end;

    retjs.Free;
    jsdata.Free;

end;

procedure TForm1.M4399LoginClick(Sender: TObject);
const
  LOGIN_URL = 'http://m.4399api.com/openapi/oauth-check.html';
var
  state, uid, Data, respData: string;
  jsdata, retjs: TlkJSONobject;
begin
  Data := M4399LoginEdit.Text;
  retjs := nil;
  jsdata := nil;

  //登录请求
  //{"State":"2141362029|9a64bde691e2f9e7fb247d094b6b623b|40651|867822025692483|a0edfe624be55e88cb6a8a8e7e00abeb|2fa5476ed3ce89ed6b4323e4c178e651|1473905543|4399","Uid":"2141362029","flag":0}
  try
    jsdata := TlkJSON.ParseText(Data) as TlkJSONobject;
    if not assigned(jsdata) then
    begin
        MainOutMessage('[error] 4399 Login Verify Client Data error. Data: ' + Data);
        exit;
    end;

    if (jsdata.IndexOfName('State')>=0) AND (jsdata.IndexOfName('Uid')>=0) then
    begin
      state := jsdata.Field['State'].Value;
      uid := jsdata.Field['Uid'].Value;

      MainOutMessage('请求: '+ SLineBreak + LOGIN_URL +'?state='+state+'&uid='+uid + SLineBreak);
      respData := Utf8ToAnsi(HttpsGet(LOGIN_URL +'?state='+state+'&uid='+uid));
      MainOutMessage('返回结果：' + respData + SLineBreak);
    end
    else
      MainOutMessage('[log] 4399 Login Verify Client Data error: Parameter is not Exists! Data: ' + Data);

  except on E:Exception do
  begin
    MainOutMessage('[error] 4399 Login Verify Client Data error: unknown exception. Data: ' + Data);
    jsdata.Free;
    Exit;
  end;
  end;
  jsdata.Free;


  //登录验证{"code":"100","result":{"uid":"2141362029"},"message":"验证成功"}
  try
      retjs := TlkJSON.ParseText(respData) as TlkJSONobject;
      if not assigned(retjs) then
      begin
        MainOutMessage('[error] 4399 Login Verify Response Data error. respData: ' + respData);
        exit;
      end;

      if (retjs.IndexOfName('code')>=0) AND (retjs.IndexOfName('result')>=0) then
      begin
        
        if (retjs.Field['code'].Value = 100) AND ((retjs.Field['result'] as TlkJSONObject).IndexOfName('uid')>=0) then
        begin
          uid := retjs.Field['result'].Field['uid'].Value;
          MainOutMessage('[log] 4399 Login Verify Success ! UID: ' + uid);
        end
        else
          MainOutMessage('[log] 4399 Login Verify Failed: resultCode error! respData: ' + respData);
      end
      else
          MainOutMessage('[log] 4399 Login Verify Failed: Parameter is not Exists! respData: ' + respData);

  except on E:Exception do
  begin
    MainOutMessage('[error] 4399 Login Verify Failed: unexpect exception! error(1). respData: ' + respData);
    retjs.Free;
    Exit;
  end;
  end;
  retjs.Free;

end;

procedure TForm1.Button50Click(Sender: TObject); 
const
  LOGIN_URL = 'http://dev.app.wan.sogou.com/api/v1/login/verify';
  GAME_ID = 839;
  SECREAT_KEY = '0b206768c67ecdb7926f30458572df0b999872043acf33ea5f6137df2dcf4629';
var
  Data, user_id, session_key, auth_sign, postData, respData, header: string;
  jsdata, retjs: TlkJSONobject;
begin
  retjs := nil;
  jsdata := nil;
  Data := SougouLoginEdit.Text;
  header := 'Content-Type:application/x-www-form-urlencoded';

  {"UserId":8450537,"flag":0,"SessionKey":"37133d2a2aa2307e8dce1bb5adc3ff849c0db657e30f3475501d9c66b6080e6a"}
  try
    jsdata := TlkJSON.ParseText(Data) as TlkJSONobject;
    if not assigned(jsdata) then
    begin
        MainOutMessage('[error] SOUGOU Login Verify Client Data error. Data: ' + Data);
        exit;
    end;

    if (jsdata.IndexOfName('UserId')>=0) AND (jsdata.IndexOfName('SessionKey')>=0) then
    begin
      user_id := jsdata.Field['UserId'].Value;
      session_key := jsdata.Field['SessionKey'].Value;

      auth_sign := 'gid='+IntToStr(GAME_ID)+'&sessi on_key='+session_key+'&user_id='+user_id+'&'+ SECREAT_KEY;
      MainOutMessage('待签名串: ' + auth_sign + SLineBreak);
      auth_sign := MD5(UTF8Encode(auth_sign));
      MainOutMessage('签名: ' + auth_sign + SLineBreak);

      postData := 'gid='+IntToStr(GAME_ID)+'&session_key='+session_key+'&user_id='+user_id+'&auth='+ auth_sign;
      MainOutMessage('POST数据: ' + postData + SLineBreak);

      respData := Utf8ToAnsi(HttpsPost(LOGIN_URL, postData, header));
      MainOutMessage('返回结果：' + respData + SLineBreak);
    end
    else
      MainOutMessage('[log] SOUGOU Login Verify Client Data error: Parameter is not Exists! Data: ' + Data);

  except on E:Exception do
  begin
    MainOutMessage('[error] SOUGOU Login Verify Client Data error: unknown exception. Data: ' + Data);
    jsdata.Free;
    Exit;
  end;
  end;
  jsdata.Free;


  //登录验证{"code":"100","result":{"uid":"2141362029"},"message":"验证成功"}
  try
      retjs := TlkJSON.ParseText(respData) as TlkJSONobject;
      if not assigned(retjs) then
      begin
        MainOutMessage('[error] SOGOU Verify Response Data error. respData: ' + respData);
        exit;
      end;

      if retjs.IndexOfName('result')>=0 then
      begin

        if retjs.Field['result'].Value = true then
        begin
          MainOutMessage('[log] SOUGOU Login Verify Success! UID: ' + user_id + SLineBreak);
        end
        else
          MainOutMessage('[log] SOUGOU Login Verify Failed: invalid session key! respData: ' + respData);
          
      end
      else //{error: {code: -1,msg: "Internal server error"}}
          MainOutMessage('[log] SOUGOU Login Verify Failed: ! respData: ' + respData);

  except on E:Exception do
  begin
    MainOutMessage('[error] SOUGOU Login Verify Failed: unexpect exception! error(1). respData: ' + respData);
    retjs.Free;
    Exit;
  end;
  end;
  retjs.Free;
end;

procedure TForm1.SougouAuthBtnClick(Sender: TObject);
var
  signStr,auth_sign:string;
begin
   signStr := SougouAuthEdit.Text;
   MainOutMessage('[Log] SOUGOU Pay Verify signStr: ' + signStr + SLineBreak);
   auth_sign := MD5(UTF8Encode(signStr));
   MainOutMessage('[Log] SOUGOU Pay Verify sign: ' + auth_sign);

end;

procedure TForm1.JinLiLoginBtnClick(Sender: TObject);  //未完成
const
  LOGIN_URL = 'https://id.gionee.com/account/verify.do';
  APIKey ='7E801F947F5745DE934C3AEADC8DBB7D';
  SecretKey = '9FF5F4CAA92A41499574055DE3B980B8';
  host = 'id.gionee.com';
	port = '443';
	uri = '/account/verify.do';
	method = 'POST';

var
  Data, signStr, auth, respData:string;
  timestamp, nonce, mac :string;//时间戳, 随机字符串, 采取HmacSHA1方式进行mac签名。
  HmacSha1:HmacSha1Class;
  Header: TStringStream;
  retjs: TlkJSONobject;
  UID: string;
  verifyState: bool;
  
begin
  {"h":"4BB0270330C9427DB7A7CDB9B1D55440","n":"6057D6F4","t":"1475892724","v":"5397DF5A996F6F45BF1A2477F02A55D0995D8C74"}
  HmacSha1:= CoHmacSha1Class.Create;
  verifyState := false;
  Data := JinLiLoginEdit.Text;
  timestamp := IntToStr(DateTimeToUnix(Now)-8*60*60);
  //timestamp := '1475832296';
  nonce := 'RandomStr2546573';

  //C#中\n = Delphi中#10, #13 - 回车, #10 - 换行
  signStr :=  timestamp + #10 + nonce + #10 + method + #10 + uri + #10 + host + #10 + port + #10 + #10;

  //金立采取HmacSHA1方式进行mac签名.
  mac := HmacSha1.HmacSha1Sign(signStr, SecretKey, 'mac');//这里要用MAC签名，但是我们的DLL中没有，要重新加进去
  MainOutMessage('[Log] JinLi Login Verify'+SlineBreak+'signStr: ' + signStr + SLineBreak + 'sign: '+ mac);

	auth := 'MAC id="' + apiKey + '",ts="' + timestamp + '",nonce="' + nonce + '",mac="' + mac + '"';
  Header := TStringStream.Create('');
  with Header do
  begin
    WriteString('Host: '+host+ SlineBreak);
    WriteString('Authorization: ' + auth+ SLineBreak);
    WriteString('Content-Type: application/json'+ SlineBreak);
  end;

  MainOutMessage(#13#10+'Header: ' + #13#10+ Header.DataString);
  respData := Utf8ToAnsi(HttpsPost(LOGIN_URL,Data, Header.DataString));
  MainOutMessage('返回结果：' + respData + SLineBreak);

  //验证成功返回：
  //respData := '{"tn":"75CF48BD8EE848DD9E85D128B5FD0E40","u":"CF65275170B749598C61851EDBE1538A",'+
  //'"ul":30,"na":"","e":"1523436559@qq.com","gid":"19620208","ply":'+
  //'[{"na":"Amigo_97864","a":"7E801F947F5745DE934C3AEADC8DBB7D","pid":"0F615FCE07E24A41B2A92AA4BD466236"}],'+
  //'"sty":0,"ptr":""}';

  //验证失败返回
  //respData := '{"wid":"14a35bf9-c95d-4f83-af99-da9d65ca445c","r":"1011","err":"验证令牌的次数大于最大限制，一般为一次有效"}';

  //登陆验证
  try
      retjs := TlkJSON.ParseText(respData) as TlkJSONobject;
      if not assigned(retjs) then
      begin
        MainOutMessage('[error] JinLi Verify Response Data error. respData: ' + respData);
        exit;
      end;

      //不包含"r"参数 或 "r"值为0，则认为验证成功，否则验证失败。
      if retjs.IndexOfName('r')>=0 then //验证失败
      begin
        if retjs.Field['r'].Value = '0' then
          verifyState := true
        else
          verifyState := false;
      end
      else
      begin
        verifyState := true;
      end;

      //集中处理
      if verifyState = true then
      begin

        if retjs.IndexOfName('u')>=0 then
        begin
          UID := retjs.Field['u'].Value;  //”u”:”user-id”
          MainOutMessage('[log] JinLi Login Verify Success! UID: ' + UID + SLineBreak);
        end
        else
          MainOutMessage('[Error] JinLi Login Verify Failed: Data errror! respData: ' + respData);

      end
      else
        MainOutMessage('[Error] JinLi Login Verify Failed: Data errror! respData: ' + respData);

  except on E:Exception do
  begin
    MainOutMessage('[Error] JinLi Login Verify Failed: unexpect exception! error(1). respData: ' + respData);
    retjs.Free;
    Exit;
  end;
  end;
  retjs.Free;
end;

procedure TForm1.JinLiGetOrdBtnClick(Sender: TObject);
const
  PAYORDER_URL = 'https://pay.gionee.com/amigo/create/order';//'https://pay.gionee.com/order/create';
  APIKey ='7E801F947F5745DE934C3AEADC8DBB7D';
  SecretKey = '9FF5F4CAA92A41499574055DE3B980B8';
	method = 'POST';
  HEADER = 'Content-Type:application/json';
  
var
  out_order_no, subject, submit_time, total_fee: string;
  signStr, sign, deal_price, deliver_type, player_id: string;
  priKey, Data, respData, order_no:string;
  RsaSign:SignAndVerifyClass;
  dataJs, retJs: TlkJSONobject;

begin
  RsaSign := CoSignAndVerifyClass.Create;
  datajs := TlkJSONobject.Create;

  priKey:='MIICdQIBADANBgkqhkiG9w0BAQEFAASCAl8wggJbAgEAAoGBAJkQGbUCecNAqSpprntg+z1p9zNJYbet7AKgPdqY9rhUmzsAQHprU6HaLX4lNqSD76JuHmlEDFFK0S+YXTE59CWwgmn1X/IxopuAmB2YZd2W0AH3ZxdlHLGUCgaMC22vxIi'+
    'vYobjCDTynyhKcX1Jk+ibwVDdtLdC7CCIOHlU0VS7AgMBAAECgYA//HgSsH9AfZZ6cYWMdGVzLgo2OXYNODrSejSBXrK9Kjled+N8icODhNbBxkLKkZErAQfbj6Pqk/FRCUvkGUsTksiD0gxyG/i+oglw4xoQy6EB+ARUP+U9to+Dwaq68EJ13x/r9T'+
    'tED4aSPkx1xkwjh1iGTDcmDMDqEftnahNAIQJBAOiDrErp1tkIyVCOxdAypq2ErvdJp486Jumet   DNo8rYZHmc2lFm4VIfIC0YiTNXiFhh5JCXzqD+hZxHFO8cjvpECQQCohftI7N5kBUzqOeLauHGHlb6KlQ6xNtHVBrE0qiybQzVqvMVKdip9aRH2y'+
    'Cg7PQqg/uIK0aRVElpsyLA9ARyLAkAwfP0aJkfCvP1Wil+gOl/eAbSHJ1oFGWhyAcGsku9CoFxhw9UOHM2r/0CyoIaLd/mJowGx1G06z8rxvsLnlYGxAkBluRIYT9phl4146N4VVjY5OFtefWDz+XopUzPN7Vallaj9t9qC+tblAnI0e1dFgrASxCef'+
    'jjHapAxvE6jF+hDHAkBC6l67P9uivJnk9pxYs/yN0WoC0azO7EvQV4I84GrAFSHZKlKvDC5ITtM95O1p7RI7x0C/UzT8cfjgXn7Dmw2H';
  deliver_type:='1';
  total_fee:='0  .01';
  subject:='元宝';//HttpEncode('元宝');//元宝
  out_order_no:= JinLiOrderEdit.Text;
  player_id:=JinLiPlayerIDEdit.Text;//和登录的id一致
  submit_time:=FormatDateTime('yyyymmddhhnnss',now());//格式化时间
  deal_price:='0.01';

  signStr := APIKey + deal_price + deliver_type + out_order_no + subject + submit_time + total_fee + player_id;
  MainOutMessage('[Log] JinLi Get Order Number. signStr: ' + signStr + SLineBreak);
  //订单signStr签名
  sign := RsaSign.RsaSha1Sign(signStr, priKey);
  MainOutMessage('[Log] JinLi Get Order Number. sign: ' + sign + SLineBreak);

  datajs.Add('user_id', player_id);  //user_id参与签名
  datajs.Add('out_order_no', out_order_no);
  datajs.Add('subject', subject);
  datajs.Add('submit_time', submit_time);
  datajs.Add('total_fee', total_fee);
  datajs.Add('sign', sign);
  datajs.Add('api_key', APIKey);
  datajs.Add('deal_price', deal_price);
  datajs.Add('deliver_type', deliver_type);

  Data := TlkJSON.GenerateText(datajs);
  datajs.Free;

  MainOutMessage('[Log] JinLi Get Order Number. postData：' + Data + SLineBreak);
  respData := Utf8ToAnsi(HttpsPost(PAYORDER_URL, Data, Header));
  MainOutMessage('[Log] JinLi Get Order Number. 返回结果：' + respData + SLineBreak);

  try
      retjs := TlkJSON.ParseText(respData) as TlkJSONobject;
      if not assigned(retjs) then
      begin
        MainOutMessage('[Error] JinLi Get Order Number. Response Data error. respData: ' + respData);
        exit;
      end;

      if retjs.IndexOfName('order_no')>=0 then
      begin
        order_no := retjs['order_no'].value;
        MainOutMessage('[Log] JinLi Get Order Number. 获取到定单号：' + order_no + SLineBreak);
        //将order_no, submit_time, product_id发给客户端
      end
      else
        MainOutMessage('[Error] JinLi Get Order Number Failed: ! respData: ' + respData);

  except on E:Exception do
  begin
    MainOutMessage('[Error] JinLi Get Order Number Failed: unexpect exception! error(1). respData: ' + respData);
    retjs.Free;
    Exit;
  end;
  end;
  retjs.Free;

end;

procedure TForm1.GoSdkLoginClick(Sender: TObject);   //未完成
const
  //sdk.goone.tw       sdk.gameone.com
  LOGIN_URL = 'https://sdk.gameone.com/service/game/V2/server.php';
  HEADER = 'Content-Type:application/x-www-form-urlencoded';
  INTERFACE_TYPE = 'verifyToken';
  GAME_ID = 'dtsy';
  TOKEN_KEY = 'pOx!cKHc&xzVCzaAxd32e#XF3hoPJak!a2';//'Lzm89cm(z!mzlp,^zLpvasnj76z&lzn2';
  PLATFORM_TYPE = 2;
var
  token, timestamp, userFrom, extra, validate: string;
  PostData, respData : string;
  retjs: TlkJSONobject;
begin
  {"token":"7804b60fc089f8ca15251fa41be4094c","MgoUid":"1781"}
  token := GOSdkEdit.Text;
  timestamp := IntToStr(DateTimeToUnix(Now)-8*60*60);
  if PLATFORM_TYPE=1 then
    userFrom := 'ios'
  else
    userFrom := 'android';
  extra := '{"gameId":"' + GAME_ID + '"}';

  MainOutMessage('signStr：' + INTERFACE_TYPE + token +timestamp + userFrom + extra+ TOKEN_KEY);

  validate := md5(AnsiToUtf8(INTERFACE_TYPE + token +timestamp + userFrom + extra+ TOKEN_KEY));
  MainOutMessage('validate：' + validate);
  validate := Copy(LowerCase(validate), 11, 16);  //从字符串第11位开始，截取16个字符.
{sign = substring(md5(interface + token +appDate + userFrom + extra+ Key), 10, 16)
1. 所有值都是utf8 编码
2. MD5加密结果为小写
3. 只取MD5加密值的第11-26位}

  PostData := 'interface='+INTERFACE_TYPE+'&token='+token+'&appDate='+timestamp+'&userFrom='+
      userFrom+'&extra='+extra+'&validate='+validate;

  MainOutMessage('PostData: ' + PostData);
  respData := Utf8ToAnsi(HttpsPost(LOGIN_URL,PostData,HEADER));
  MainOutMessage('返回结果：' + respData);

  //success example ：{"status":1,”msg”:”success”,”uid”:123}
  try
      retjs := TlkJSON.ParseText(respData) as TlkJSONobject;
      if not assigned(retjs) then
      begin
        MainOutMessage('[error] GameOne Verify Response Data error. respData: ' + respData);
        exit;
      end;

      if retjs.IndexOfName('status')>=0 then
      begin

        if (retjs.Field['status'].Value = 1) AND (retjs.IndexOfName('uid')>=0) then
        begin
          MainOutMessage('[log] GameOne Login Verify Success! 用户唯一标识: ' + retjs.Field['uid'].Value);
        end
        else
          MainOutMessage('[Error] GameOne Login Verify Failed: invalid status code! respData: ' + respData);

      end
      else
          MainOutMessage('[Error] GameOne Login Verify Failed: ! respData: ' + respData);

  except on E:Exception do
  begin
    MainOutMessage('[Error] GameOne Login Verify Failed: unexpect exception! error(1). respData: ' + respData);
    retjs.Free;
    Exit;
  end;
  end;
  retjs.Free;
end;

procedure TForm1.GoSdkSend1BtnClick(Sender: TObject);
const
  SERVER_API_KEY = 'Lzm89cm(z!mzlp,^zLpvasnj76z&lzn2';
var
  Data:string;
  retList: TStringList;
  i: Integer;
  interfaceType,gameacc,billno,serverid,coupon_code,ext,channelId:string;
  signStr,sign,locSign:string;

begin
  //interface=3&gameacc=testuser&billno=823258283512&serverid=0&conpon_code=183716351251&ext=areaId=3;roleId=38;goodId=3;&sign=5e3a5fdb7cce510a'
  Data := GoSdkSend1Edit.Text;

  retList := TStringList.Create;
  retList.Delimiter := '&';
  retList.DelimitedText := HTTPDecode(Data);//UTF8Decode
  try

    for i:=0 to retList.Count-1 do
    begin
      MainOutMessage(retList.Names[i] + '  -->  ' + retList.Values[retList.Names[i]]);
    end;

    interfaceType:=retList.Values['interface'];
    gameacc:= retList.Values['gameacc'];
    billno:= retList.Values['billno'];
    serverid:= retList.Values['serverid'];
    coupon_code:= retList.Values['coupon_code'];
    ext:= retList.Values['ext'];
    channelId:= retList.Values['channelId'];
    sign:= retList.Values['sign'];

    //EncodeString即为base64编码
    signStr:=interfaceType + gameacc + billno +serverid + coupon_code +ext;
    //MD5
    locSign:=MD5(AnsiToUtf8(signStr + SERVER_API_KEY));
    locSign := Copy(LowerCase(locSign), 11, 16);
    MainOutMessage(SLineBreak+'待签名串: ' + signStr+#13#10 + '签名: ' + sign+#13#10);
    
    if locSign = sign then
    begin
      MainOutMessage('验证签名成功！');
      //获取用户id，根据道具序号coupon_code发放元宝，不需要验证价格。
    end
    else
    begin
       MainOutMessage('验证签名失败！'+SLineBreak+'sign: ' + sign + SLineBreak + 'locSign: '+ locSign+SLineBreak);
    end;

  except on E:Exception do
  begin
    MainOutMessage('[error] GameOne Pay Verify Failed: unexpect exception! error(1). respData: ' + Data);
    retList.Free;
    Exit;
  end;
  end;
  retList.Free;
end;

procedure TForm1.GoSdkPayVerifyBtnClick(Sender: TObject);
const
  SERVER_API_KEY = 'Lzm89cm(z!mzlp,^zLpvasnj76z&lzn2';
var
  Data:string;
  retList: TStringList;
  i: Integer;
  gameuid,billno,referenceId,productId,currency,amount,channelId,serverid,timestamp:string;
  ext,signStr,sign,locSign:string;
  pointjs: TlkJSONobject;
  gamepoint:Integer;

begin
  pointjs := nil;
  //手机:Data:='gameuid=123&billno=82325828da23&referenceId=13f4123123&productId=com.gameone.war.gold128&currency=HK&amount=38&channelId=1&serverid=0&ext=&timestamp=1237183&sign=5e3a5fdb7cce510a';
  //Web:Data:='gameuid=123&billno=823258283512&referenceId=823258283512&productId=com.gameone.war.web&currency=HK&amount=38&channelId=3&serverid=0&ext=dkjbqk2j131j1823&timestamp=1237183&sign=5e3a5fdb7cce510a';

  Data := GoSdkPayCallbackEdit.Text;

  retList := TStringList.Create;
  retList.Delimiter := '&';
  retList.DelimitedText := HTTPDecode(Data);//UTF8Decode
  try

    for i:=0 to retList.Count-1 do
    begin
      MainOutMessage(retList.Names[i] + '  -->  ' + retList.Values[retList.Names[i]]);
    end;

    gameuid:=retList.Values['gameuid'];
    billno:= retList.Values['billno'];
    referenceId:= retList.Values['referenceId'];
    productId:= retList.Values['productId'];
    currency:= retList.Values['currency'];
    amount:= retList.Values['amount'];
    channelId:= retList.Values['channelId'];
    serverid:= retList.Values['serverid'];
    timestamp:= retList.Values['timestamp'];
    ext:= retList.Values['ext'];
    sign:= retList.Values['sign'];

    //EncodeString即为base64编码,这里解析出的ext是已经base64编码的，直接使用
    signStr:=gameuid+billno+referenceId+productId+currency+amount+channelId+serverid+ext+timestamp;
    //MD5
    locSign := MD5(AnsiToUtf8(signStr + SERVER_API_KEY));
    locSign := Copy(LowerCase(locSign), 11, 16);
    MainOutMessage(SLineBreak+'待签名串: ' + signStr+#13#10 + '签名: ' + locSign+#13#10);

    if locSign = sign then
    begin
      MainOutMessage('验证签名成功！');

      //区分是手机充值还是web充值，验证支付无CallbackInfo。
      if channelId = '1' then   //android 根据productId发放道具
      begin

      end
      else if channelId = '2' then //ios 根据productId发放道具
      begin

      end
      else //web 从ext获取游戏点数，发放元宝
      begin
        MainOutMessage('ext: ' + ext);
        //ext传来的是base64_encode({"gamepoint":200,"gopoint":800})
        ext := DecodeString(ext);  //base64解码获取gamepoint
        MainOutMessage('ext: ' + ext);
        MainOutMessage('ext: ' + Utf8ToAnsi(ext));

        pointjs := TlkJSON.ParseText(ext) as TlkJSONobject;
        if not assigned(pointjs) then
        begin
          MainOutMessage('[error] 解析json串出错！json: ' + ext +',  Data: ' + Data);
          exit;
        end;

        if pointjs.IndexOfName('gamepoint')>=0 then
        begin
          gamepoint := pointjs.Field['gamepoint'].Value;
          MainOutMessage('充值的游戏点数: ' + IntToStr(gamepoint));

        end;

      end;


    end
    else
    begin
       MainOutMessage('验证签名失败！'+SLineBreak+'sign: ' + sign + SLineBreak + 'locSign: '+ locSign+SLineBreak);
    end;

  except on E:Exception do
  begin
    MainOutMessage('[error] GameOne Pay Verify Failed: unexpect exception! error(1). respData: ' + Data);
    retList.Free;
    Exit;
  end;
  end;
  retList.Free;

end;

procedure TForm1.GoSdkSend2BtnClick(Sender: TObject);
const
  SERVER_API_KEY = 'Lzm89cm(z!mzlp,^zLpvasnj76z&lzn2';
var
  Data:string;
  retList: TStringList;
  i: Integer;
  interfaceType,gameacc,billno,serverid,itemid,quantity,ext:string;
  areaId, roleId, goodId, signStr,sign,locSign:string;

begin
  //interface=4&gameacc=testuser&billno=823258283512&serverid=0&itemid=14234&quantity=1&ext=areaId=3;roleId=38;goodId=3;&sign=5e3a5fdb7cce510a
  Data := GoSdkSend2Edit.Text;

  retList := TStringList.Create;
  retList.Delimiter := '&';
  retList.DelimitedText := HTTPDecode(Data);//UTF8Decode
  try

    for i:=0 to retList.Count-1 do
    begin
      MainOutMessage(retList.Names[i] + '  -->  ' + retList.Values[retList.Names[i]]);
    end;

    interfaceType:=retList.Values['interface'];
    gameacc:= retList.Values['gameacc'];
    billno:= retList.Values['billno'];
    serverid:= retList.Values['serverid'];
    itemid:= retList.Values['itemid'];
    quantity:= retList.Values['quantity'];
    ext:= retList.Values['ext'];
    sign:= retList.Values['sign'];

    //EncodeString即为base64编码
    signStr:=interfaceType + gameacc + billno +serverid + itemid + quantity+ ext;
    //MD5
    locSign:=MD5(AnsiToUtf8(signStr + SERVER_API_KEY));
    locSign := Copy(LowerCase(locSign), 11, 16);
    MainOutMessage(SLineBreak+'待签名串: ' + signStr+#13#10 + '签名: ' + sign+#13#10);

    if locSign = sign then
    begin
      MainOutMessage('验证签名成功！');
      //获取用户id，根据道具序号itemid发放元宝，不需要验证价格。
    end
    else
    begin
       MainOutMessage('验证签名失败！'+SLineBreak+'sign: ' + sign + SLineBreak + 'locSign: '+ locSign+SLineBreak);
    end;

  except on E:Exception do
  begin
    MainOutMessage('[error] GameOne Pay Verify Failed: unexpect exception! error(1). respData: ' + Data);
    retList.Free;
    Exit;
  end;
  end;
  retList.Free;

end;

procedure TForm1.ReadXml(Node: IXMLNode; var List: TStringList);
var
  NodeList: IXMLNodeList;
  strName: string;
  i: Integer;

begin
  if not Node.HasChildNodes then
    Exit;
  nodeList := node.ChildNodes;

  for i := 0 to nodeList.Count - 1 do
  begin
    strName := nodeList[i].NodeName;
    if nodeList[i].IsTextElement then //如果是元素
    begin
      List.Add(strName + '=' + NodeList[i].NodeValue); //解析出来的数据放入List
    end
    else if nodeList[i].HasChildNodes then //如果有子节点
    begin
      ReadXml(NodeList[i], List);
    end;
  end;
end;

procedure TForm1.LenovoLoginBtnClick(Sender: TObject);
const
  LOGIN_URL='http://passport.lenovo.com/interserver/authen/1.2/getaccountid';
  OPEN_APP_ID='1511110735467.app.ln';
  HEADER='Content-Type:application/x-www-form-urlencoded';

var
  Data, respData, url:string;
  jsdata: TlkJSONobject;
  retList: TStringList;

  //读取xml参数
  xmlDocument: IXMLDocument;
  mainNode: IXMLNode;
  
begin
  jsdata := nil;
  Data:=LenovoLoginEdit.Text;
  {"flag":0,"data":"ZAgAAAAAAAGE9MTAwMzM4ODk4ODAmYj0yJmM9MSZkPTE2MDI4JmU9MkVDODBGODM0NzQ5N0I1OEIzRjg2N0VCQzYyMUUwQzExJmg9MTQ3NzEwMzA4MjAxMSZpPTQzMjAwJmo9MCZvPTAwMDAwMDAwMDAwMDAwMCZwPWltZWkmcT0wJnVzZXJuYW1lPTI4NjIwOTAyNDIlNDBxcS5jb20maWw9Y26658zTvWOBpiENCmYsvTi8"}
  
  try
    jsdata := TlkJSON.ParseText(Data) as TlkJSONobject;
    if not assigned(jsdata) then
    begin
        MainOutMessage('[Error] Lenovo Login Verify Client Data error. Data: ' + Data);
        exit;
    end;

    if jsdata.IndexOfName('data')>=0 then
    begin
      url:=LOGIN_URL+'?lpsust='+jsdata.Field['data'].Value+'&realm='+OPEN_APP_ID;
      MainOutMessage('请求：' + url + SLineBreak);
      
      respData := Utf8ToAnsi(HttpsGet(url, HEADER));
      MainOutMessage('返回结果：' + respData + SLineBreak);
    end
    else
      MainOutMessage('[Error] Lenovo Login Verify Client Data error: Parameter is not Exists! Data: ' + Data);

  except on E:Exception do
  begin
    MainOutMessage('[Error] Lenovo Login Verify Client Data error: unknown exception. Data: ' + Data);
    jsdata.Free;
    Exit;
  end;
  end;
  jsdata.Free;

  //从返回的Xml中获取帐号标识：AccountID
  retList := TStringList.Create;
  respData:= StringReplace(respData,'UTF-8','gbk',[]); //只替换<?xml version="1.0" encoding="UTF-8"?>里面的字符编码方式，因为往往这个是在最前面出现的，所以StringReplace的第四个参数是[]
   try  //异常处理，保证程序的稳定性，能够正常处理异常而不至于在发生异常的时候导致程序崩溃
     xmlDocument:= LoadXMLData(respData);
     mainNode:= xmlDocument.DocumentElement;
     readXML(mainNode, retList);

     if retList.values['AccountID'] <> '' then
     begin
        MainOutMessage('[Log] Login Verify Success. 用户唯一标识AccountID；'+retList.values['AccountID']);
     end
     else
        MainOutMessage('[Error] Lenovo Login Verify Failed. Data: ' + Data);

   except
     on E: Exception do
     begin
        MainOutMessage('[Error] Lenovo Login Verify Failed. Response Data error: unknown exception: '+E.Message+' Data: ' + Data);
     end;
   end;
end;

procedure TForm1.Button51Click(Sender: TObject);
var
    SourceStr,str:string;
    i:integer;
begin
    SourceStr:='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    randomize;
    for i:=1 to 16 do
      str:=str+sourcestr[Random(62)+1];

    MainOutMessage('生成16位, 范围为"A-Z" "a-z" "0-9"的随机数: ' + SLineBreak + str);

    MainOutMessage('生成16位随机数: ' + SLineBreak + GetRandStr(16));
end;

function TForm1.GetRandStr(len : Integer; lowercase : Boolean = True; num : Boolean = True; uppercase : Boolean = True) : string;
const
  upperStr = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  lowerStr = 'abcdefghijklmnopqrstuvwxyz';
  numStr = '0123456789';
var
  sourceStr : string;
  i : Integer;
begin
  sourceStr := '';
  Result := '';
  if uppercase = True then
    sourceStr := sourceStr + upperStr;
  if lowercase = True then
    sourceStr := sourceStr + lowerStr;
  if num = True then
    sourceStr := sourceStr + numStr;
  if (sourceStr = '') or (len<1) then
    exit;
 
  Randomize;
  for i:=1 to len do
  begin
    Result := Result + sourceStr[Random(Length(sourceStr)-1)+1];
  end;
end;

procedure TForm1.LenovoPayVerifyBtnClick(Sender: TObject);
const
  PUBLIC_KEY='';
var
  transdata,sign,Data:string;
  retList:TStringList;
  i:Integer;
  verifyResult:Boolean;
  RsaSign:SignAndVerifyClass;
begin
  Data := LenovoPayEdit.Text;
  
  RsaSign:= CoSignAndVerifyClass.Create;
  retList := TStringList.Create;
  retList.Delimiter := '&';
  retList.DelimitedText := HTTPDecode(Data);//UTF8Decode
  try

    for i:=0 to retList.Count-1 do
    begin
      MainOutMessage(retList.Names[i] + '  -->  ' + retList.Values[retList.Names[i]]);
    end;

    transdata:=retList.Values['transdata'];
    sign:=retList.Values['sign'];
    if (transdata<>'') and (sign<>'') then   //获取不到数据时.
    begin
      verifyResult := RsaSign.RsaSha1Verify(transdata, 'LenovoPublicKey', sign);
      if verifyResult then
         MainOutMessage('[Log] Lenovo Pay Verify Success: 验证支付成功 ');

    end
    else
      MainOutMessage('[Error] Lenovo Pay Verify Failed: return data error. retData: ' + Data);
    
  except on E:Exception do
  begin
    MainOutMessage('[Error] Lenovo Pay Verify Failed: unexpect exception! error(1). retData: ' + Data);
    retList.Free;
    Exit;
  end;
  end;
  retList.Free;
  
end;

procedure TForm1.WDJLoginBtnClick(Sender: TObject);
const
  WANDOUJIA_LOGIN_URL='https://pay.wandoujia.com/api/uid/check';
  WANDOUJIA_APP_KEY_ID = '100034575L';
  
var
  Data,uid,token:string;
  jsdata:TlkJSONobject;

  respData:string;
begin

  Data:=WDJLoginEdit.Text;
  {"flag":0,"token":"4NHKC5BvW3xvOZCh33VhDSq9I54-uJd1I5bdF2hmrWQ","uid":"108612495"}
  try
    jsdata := TlkJSON.ParseText(Data) as TlkJSONobject;
    if not assigned(jsdata) then
    begin
        MainOutMessage('[Error] WanDouJia Login Verify Failed. Client Data error. Data: ' + Data);
        exit;
    end;

    if (jsdata.IndexOfName('uid')>=0) and (jsdata.IndexOfName('token')>=0) then
    begin
      uid:= jsdata.Field['uid'].Value;
      url:=AnsiToUtf8(WANDOUJIA_LOGIN_URL+'?uid='+jsdata.Field['uid'].Value+'&token='+jsdata.Field['token'].Value+
          '&appkey_id='+WANDOUJIA_APP_KEY_ID);
      MainOutMessage('请求：' + url + SLineBreak);
      
      respData := Utf8ToAnsi(HttpsGet(url));
      MainOutMessage('返回结果：' + respData + SLineBreak);
    end
    else
      MainOutMessage('[Error] WanDouJia Login Verify Failed. Client Data error: Parameter is not Exists! Data: ' + Data);

  except on E:Exception do
  begin
    MainOutMessage('[Error] WanDouJia Login Verify Failed. Client Data error: unknown exception. Data: ' + Data);
    jsdata.Free;
    Exit;
  end;
  end;
  jsdata.Free;

  if respData = 'true' then
  begin
    MainOutMessage('[Log] WanDouJia Login Verify Success. 用户唯一标识uid：'+uid);
  end
  else
  begin
    MainOutMessage('[Error] WanDouJia Login Verify Failed. Data: ' + Data);
  end;

end;

procedure TForm1.WDJPayVerifyBtnClick(Sender: TObject);
const
  WANDOU_PUBLIC_KEY = 'MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCd95FnJFhPinpNiE/h4VA6bU1rzRa5+a25BxsnFX8TzquWxqDCoe4xG6QKXMXuKvV57tTRpzRo2jeto40eHKClzEgjx9lTYVb2RFHHFWio/YGTfnqIPTVpi7d7uHY+0FZ0lYL5LlW4E2+CQMxFOPRwfqGzMjs1SDlH7lVrLEVy6QIDAQAB';

var
  Data:string;
  content,signType,sign:string;
  buyerId,money,wdjOrderId,tyOrderId:string;
  verifyResult:Boolean;

  retList:TStringList;
  jsdata:TlkJSONobject;
  WanDouRsa:WanDouRSAVerifyClass;

begin
  Data:='content={"timeStamp":1363848203377,"orderId":100001472,"money":4000,"chargeType":"BALANCEPAY","appKeyId":100000000,"buyerId":1,"cardNo":null}'+
        '&signType=RSA&sign=VwnhaP9gAbDD2Msl3bFnvsJfgz3NOAqM/JVexl1myHfsrHX3cRrFXz86cNO+oNYWBBM7m/5ZdtHRpSArZWFuZHysKfirO3BynUaIYSAiD2J1Xio5q9+Yr83cI/ESyemVAt7lK4lMW3ReSwmAcOs0kDZLAxVIb++EPy0y2NpH4kI=';
  MainOutMessage('[Log] WanDouJia Pay Verify. Data：'+Data+SLineBreak);

  WanDouRsa:= CoWanDouRSAVerifyClass.Create;
  retList := TStringList.Create;
  retList.Delimiter := '&';
  retList.DelimitedText := Data;//不需要HTTPDecode

  try
    content:=retList.Values['content'];
    signType:= retList.Values['signType'];
    sign:= retList.Values['sign'];
    retList.Free;

    //MainOutMessage('[Log]content：'+content);
    //MainOutMessage('[Log]sign：'+sign);

    //验证签名
    verifyResult := WanDouRsa.RSAVerify(content, sign, WANDOU_PUBLIC_KEY);
    MainOutMessage('[Log] WanDouJia verifyResult：'+BoolToStr(verifyResult));
    if verifyResult then
    begin

      //在原始content中添加天游订单号（模拟支付时没有，为保证数据完整，在验证签名后添加啊）
      content := '{"timeStamp":1363848203377,"orderId":100001472,"money":4000,"chargeType":"BALANCEPAY","appKeyId":100000000,"buyerId":1,"out_trade_no":"@ty-29js092","cardNo":null}';
      jsdata := TlkJSON.ParseText(content) as TlkJSONobject;
      if not assigned(jsdata) then
      begin
        MainOutMessage('[Error] WanDouJia Pay Verify Failed. Return Data error. Data: ' + Data);
        exit;
      end;

      if (jsdata.IndexOfName('buyerId')>=0) and (jsdata.IndexOfName('money')>=0)
          and (jsdata.IndexOfName('orderId')>=0) and (jsdata.IndexOfName('out_trade_no')>=0) then
      begin
        buyerId:= jsdata.Field['buyerId'].Value;
        money:= jsdata.Field['money'].Value;
        wdjOrderId:= jsdata.Field['orderId'].Value;//豌豆荚订单号
        tyOrderId:= jsdata.Field['out_trade_no'].Value; //天游订单号.

        //验证订单信息，无callbackInfo
        //[重要]在接收到服务器返回通知的时候，必须同时校验buyerid、money 字段。
        MainOutMessage('[Log] WanDouJia Pay Verify Success. buyerId:' + buyerId + ',money:' + money);

      end
      else
        MainOutMessage('[Error] WanDouJia Pay Verify Failed. Return Data error: Parameter is not Exists! Data: ' + Data);
      end

    else
    begin
      MainOutMessage('[Error] WanDouJia Pay Verify Failed. 签名验证失败! Data: ' + Data);
    end;
    jsdata.Free;
    
  except on E:Exception do
  begin
    MainOutMessage('[Error] WanDouJia Pay Verify Failed. unexpect exception! error. respData: ' + Data);
    retList.Free;
    jsdata.Free;
    Exit;
  end;
  end;

end;


procedure TForm1.KFLoginVerifyBtnClick(Sender: TObject);
const
  KF_LOGIN_URL='http://z.kuaifazs.com/foreign/oauth/verification2.php';
  KF_GAME_KEY = '3f54c5376541018bfbca446f57709c5a';
  KF_SECURITY_KEY = 'RWkqTyh39K6tAQq0nkeXd53Nc7LObWzo';
  header = 'Content-Type:application/x-www-form-urlencoded';

var
  Data,postData:string;
  token,openid,timestamp,sign:string;
  jsdata:TlkJSONobject;
  respData,TempUID:string;

  retjs:TlkJSONobject;
begin

  Data:=KFLoginEdit.Text;
  
   //发送登录请求
  try
    jsdata := TlkJSON.ParseText(Data) as TlkJSONobject;
    if not assigned(jsdata) then
    begin
        MainOutMessage('[Error] KF Login Verify Failed. Client Data error. Data: ' + Data);
        exit;
    end;
    
   {"loginUserId":"32475607@MINIGAME","loginAuthToken":"9a2df88e9b408f7292e5b08a1ae7ddb5","loginUserName":"KFmaster",
   "loginOpenId":"4baccb88a3e14b40ebb5b32fcad7a8f6","switchUserFlag":false,"cp":"matrix","message":"账号一","status":1}

    if (jsdata.IndexOfName('loginOpenId')>=0) and (jsdata.IndexOfName('loginAuthToken')>=0) then
    begin
      token:= jsdata.Field['loginAuthToken'].Value;
      openid:= jsdata.Field['loginOpenId'].Value;  //用户唯一标识.
      timestamp := IntToStr(DateTimeToUnix(Now)-8*60*60);
      TempUID:=openid;

      //HttpEncode相当于url编码，百分比编码（只编码特定字符） URLEncode
      sign := 'gamekey='+HttpEncode(KF_GAME_KEY)+'&openid='+HttpEncode(openid)+
        '& ='+HttpEncode(timestamp)+'&token='+HttpEncode(token);
      sign := UTF8Encode(sign);
      MainOutMessage('signStr：' + sign + SLineBreak);

      sign := MD5(MD5(sign)+KF_SECURITY_KEY);
      MainOutMessage('sign：' + sign + SLineBreak);

      postData := 'token='+token+'&openid='+openid+'&timestamp='+timestamp+'&gamekey='+KF_GAME_KEY+'&_sign='+sign;
      MainOutMessage('Post Data：' + postData + SLineBreak);
    
      respData := HttpsPOST(KF_LOGIN_URL,postData,header);
      MainOutMessage('返回结果：' + respData + SLineBreak);
    end
    else
      MainOutMessage('[Error] KF Login Verify Failed. Client Data error: Parameter is not Exists! Data: ' + Data);
    jsdata.Free;

  except on E:Exception do
  begin
    MainOutMessage('[Error] KF Login Verify Failed. Client Data error: unknown exception. Data: ' + Data);
    jsdata.Free;
    Exit;
  end;
  end;


  //验证：{"result":"0","result_desc":"ok"} {"result":"1005","result_desc":"失败原因"}
  //登陆验证
  try
      retjs := TlkJSON.ParseText(respData) as TlkJSONobject;
      if not assigned(retjs) then
      begin
        MainOutMessage('[Error] KF Login Verify Failed. Response Data error. respData: ' + respData);
        exit;
      end;                                                                                        

      //当result=0时验证成功，否则验证失败。
      if retjs.IndexOfName('result')>=0 then
      begin
        if retjs.Field['result'].Value = '0' then
        begin
          MainOutMessage('[log] KF Login Verify Success! 用户唯一标识: ' + TempUID + SLineBreak);
        end
        else
        begin
          MainOutMessage(format('[Error] KF Login Verify Failed: %s, respData: %s',[retjs.Field['result_desc'].Value,respData]));
        end;
        
      end
      else
      begin
        MainOutMessage('[Error] KF Login Verify Failed: Parameter is not Exists! respData: ' + respData);
      end;
      retjs.Free;
      
  except on E:Exception do
  begin
    MainOutMessage('[Error] KF Login Verify Failed. unexpect exception! error. respData: ' + respData);
    retjs.Free;
    Exit;
  end;
  end;

end;

procedure TForm1.LetvLoginBtnClick(Sender: TObject);
const
  LETV_LOGIN_URL = 'https://sso.letv.com/oauthopen/userbasic';
  LETV_APP_ID = '229700';

var
  Data,uid,token:string;
  jsdata:TlkJSONobject;

  respData:string;
  retjs:TlkJSONobject;

begin
  Data:=LetvLoginEdit.Text;
  {"flag":"succeed","uid":"201367226","token":"6523fb9m3l0zuRwMpQU0m3S5XMCx4rGCQpagcTohbxjGE77hyag9ZtuMFTdGtBURw2L9rm23JOFrpzBiAPAw"}
  try
    jsdata := TlkJSON.ParseText(Data) as TlkJSONobject;
    if not assigned(jsdata) then
    begin
        MainOutMessage('[Error] Letv Login Request Failed. Client Data error. Data: ' + Data);
        exit;
    end;

    if (jsdata.IndexOfName('uid')>=0) and (jsdata.IndexOfName('token')>=0) then
    begin
      uid:= jsdata.Field['uid'].Value;
      token:= jsdata.Field['token'].Value;
      url:=LETV_LOGIN_URL+'?client_id='+LETV_APP_ID+'&uid='+uid+'&access_token='+token;
      MainOutMessage('请求：' + url + SLineBreak);
      
      respData := Utf8ToAnsi(HttpsGet(url));
      MainOutMessage('返回结果：' + respData + SLineBreak);
    end
    else
      MainOutMessage('[Error] Letv Login Request Failed. Client Data error: Parameter is not Exists! Data: ' + Data);

  except on E:Exception do
  begin
    MainOutMessage('[Error] Letv Login Request Failed. Client Data error: unknown exception. Data: ' + Data);
    jsdata.Free;
    Exit;
  end;
  end;
  jsdata.Free;

  {"request":"\/oauthopen\/userbasic","error_code":1006,"error":"UNACCEPTABLE TOKEN","status":0}
  //登陆验证
  try
      retjs := TlkJSON.ParseText(respData) as TlkJSONobject;
      if not assigned(retjs) then
      begin
        MainOutMessage('[Error] Letv Login Verify Failed. Response Data error. respData: ' + respData);
        exit;
      end;

      if retjs.IndexOfName('status')<0 then
      begin
        MainOutMessage('[Error] Letv Login Verify Failed. Parameter status not exists!. respData: ' + respData);
        exit;
      end;

      //当status=1时验证成功，否则验证失败。
      if (retjs.IndexOfName('result')>=0) and (retjs.Field['status'].Value = 1) then
      begin
        
        if (retjs.Field['result'] as TlkJSONobject).IndexOfName('letv_uid')>=0 then
        begin
          uid:= (retjs.Field['result'] as TlkJSONobject).Field['letv_uid'].Value;
          MainOutMessage('[log] Letv Login Verify Success! UID: ' +
            uid + SLineBreak);
        end
        else
        begin
          MainOutMessage(format('[Error] Letv Login Verify Failed. Parameter letv_uid not exists! respData: %s',[respData]));
        end;
        
      end
      else
      begin
        MainOutMessage(format('[Error] Letv Login Verify Failed.请求失败! Error: %s, respData: %s',
                [retjs.Field['error'].Value, respData]));
      end;
      retjs.Free;

  except on E:Exception do
  begin
    MainOutMessage('[Error] Letv Login Verify Failed. unexpect exception! error. respData: ' + respData);
    retjs.Free;
    Exit;
  end;
  end;

end;

procedure TForm1.LetvPayVerifyBtnClick(Sender: TObject);
const
  LETV_SECRET_KEY = '09f22d9240d446faaee01279d21b4b01';
var
  Data,signStr,locSign:string;

  app_id :string;      //应用所属 AppId
  lepay_order_no :string;  //乐视支付平台流水号
  letv_user_id :string;
  out_trade_no :string;  //支付 sdk 订单号
  pay_time :string;
  price:string;  //金额，浮点数：元
  product_id :string;    //商品 id
  sign :string;
  sign_type :string;
  trade_result :string; //交易结果
  version :string;
  cooperator_order_no:string; //cp 订单号
  extra_info :string;    //cp 自定义信息
  original_price :string; //商品原始价格
  //对比original_price和price 的值，如果相同则表示未使用卡券，如果原金额大，则表示使用了卡券。

  retList:TStringList;
  i:Integer;

begin
  //Get请求发送过来的数据。
  Data:='app_id=229700&lepay_order_no=1532016041313376959361064961&letv_user_id=122648700'+
  '&out_trade_no=20160413192132122648700&pay_time=2016-04-13 19:21:53&price=0.01&product_id=8888'+
  '&sign=e159f0627f6e4d56b134c08b04449333&sign_type=MD5&trade_result=TRADE_SUCCESS'+
  '&version=2.0&cooperator_order_no=96557439&extra_info=测试自定义参数&original_price=0.01';

  retList := TStringList.Create;
  //第一个参数是分隔符; 第二个参数是开头被忽略的字符
  ExtractStrings(['&'],[],PChar(HttpDecode(Data)),retList);//ExtractStrings能避免空格也被视作分隔符的bug
  retList.Sort;

  try
    signStr := '';
    for i:=0 to retList.Count-1 do
    begin
      if retList.Names[i] = 'sign' then
        continue;

      if signStr = '' then
        signStr := retList.Names[i]+'='+retList.Values[retList.Names[i]]
      else
        signStr := signStr+'&'+retList.Names[i]+'='+retList.Values[retList.Names[i]];

      MainOutMessage(retList.Names[i] + '  -->  ' + retList.Values[retList.Names[i]]);
    end;
    signStr := signStr + '&key=' + LETV_SECRET_KEY;

    locSign := LowerCase(MD5(AnsiToUtf8(signStr)));
    MainOutMessage('[Log]signStr: '+signStr +', sign: ' + sign);

    sign:= retList.Values['sign'];
    trade_result:= retList.Values['trade_result'];

    if (sign = locSign) and (trade_result = 'TRADE_SUCCESS') then
    begin
      app_id:=retList.Values['app_id'];
      lepay_order_no:= retList.Values['lepay_order_no'];
      letv_user_id:= retList.Values['letv_user_id'];
      out_trade_no:= retList.Values['out_trade_no'];
      pay_time:= retList.Values['pay_time'];
      price:= retList.Values['price'];
      product_id:= retList.Values['product_id'];
      sign_type:= retList.Values['sign_type'];
      version:= retList.Values['version'];
      cooperator_order_no:= retList.Values['cooperator_order_no'];
      extra_info:= retList.Values['extra_info'];
      original_price:= retList.Values['original_price'];

      MainOutMessage('[Log] Letv Pay Verify Success: original_price: ' + original_price);
      //验证订单数据CallbackInfo:extra_info
      
    end
    else
    begin
      MainOutMessage('[Error] Letv Pay Verify Failed. 签名验证失败或支付失败! Data: ' + Data);
    end;
    retList.Free;

  except on E:Exception do
  begin
    MainOutMessage('[Error] Letv Pay Verify Failed: unexpect exception! error(1). respData: ' + Data);
    retList.Free;
    Exit;
  end;
  end;

end;

procedure TForm1.DangLeLoginBtnClick(Sender: TObject);
const
  DANGLE_LOGIN_URL = 'http://ngsdk.d.cn/api/cp/checkToken';
  DANGLE_APP_ID = '4580';
  DANGLE_APP_KEY = 'sdBmwD2v';

var
  Data,url:string;
  memberId,token,sign:string;
  jsdata:TlkJSONobject;

  respData:string;
  retjs:TlkJSONobject;
begin
  jsdata := nil;
  {"flag":0,"memberId":"2903960468220","username":"d8go37q275","nickname":"d8go37q275","token":"12673954D9044C09A547B816007A2A4D"}
  Data:=DangLeLoginEdit.Text;
  try
    jsdata := TlkJSON.ParseText(Data) as TlkJSONobject;
    if not assigned(jsdata) then
    begin
        MainOutMessage('[Error] DangLe Login Request Failed. Client Data error. Data: ' + Data);
        exit;
    end;

    if (jsdata.IndexOfName('memberId')>=0) and (jsdata.IndexOfName('token')>=0) then
    begin
      memberId:= jsdata.Field['memberId'].Value;
      token:= jsdata.Field['token'].Value;

      //MD5(appId|appKey|token|umid)字符串
      sign := MD5(UTF8Encode(DANGLE_APP_ID+'|'+DANGLE_APP_KEY+'|'+token+'|'+memberId));

      //?appid=195&umid=36223535814&token=4C18A0AEAB1B4C9BBFD49E21E202025C&sig=9405aec7d7785d4cbfa6126004635406
      url:=DANGLE_LOGIN_URL+'?appid='+DANGLE_APP_ID+'&umid='+memberId+'&token='+token+'&sig='+sign;
      MainOutMessage('请求：' + url + SLineBreak);

      respData := Utf8ToAnsi(HttpsGet(url));
      MainOutMessage('返回结果：' + respData + SLineBreak);
    end
    else
      MainOutMessage('[Error] DangLe Login Request Failed. Client Data error: Parameter is not Exists! Data: ' + Data);

  except on E:Exception do
  begin
    MainOutMessage('[Error] DangLe Login Request Failed. Client Data error: unknown exception. Data: ' + Data);
    jsdata.Free;
    Exit;
  end;
  end;
  jsdata.Free;
  
  {"valid":"1","roll":true,"interval":60,"times":4,"msg_code":2000,"msg_desc":"成功"}
  //登陆验证
  retjs := nil;
  try
      retjs := TlkJSON.ParseText(respData) as TlkJSONobject;
      if not assigned(retjs) then
      begin
        MainOutMessage('[Error] DangLe Login Verify Failed. Response Data error. respData: ' + respData);
        exit;
      end;

      //当valid=1,msg_code=2000时验证成功，否则验证失败。
      if (retjs.IndexOfName('valid')>=0) and (retjs.IndexOfName('msg_code')>=0) then
      begin

        if (retjs.Field['valid'].Value = '1') and (retjs.Field['msg_code'].Value = 2000) then
        begin
          //登录成功.
          MainOutMessage('[log] DangLe Login Verify Success. 登录成功！UID: ' +
            memberId + SLineBreak);
        end
        else
        begin
          MainOutMessage(format('[Error] DangLe Login Verify Failed.请求失败! valid: %s, msg_desc: %s, respData: %s',
                [retjs.Field['valid'].Value,retjs.Field['msg_desc'].Value,respData]));
        end;

      end
      else
      begin
        MainOutMessage(format('[Error] DangLe Login Verify Failed. Parameter not exists! respData: %s',[respData]));
      end;
      retjs.Free;

  except on E:Exception do
  begin
    MainOutMessage('[Error] DangLe Login Verify Failed. unexpect exception! error. respData: ' + respData);
    retjs.Free;
    Exit;
  end;
  end;

end;

procedure TForm1.DangLePayBtnClick(Sender: TObject);
const
  DANGLE_PAYMENT_KEY = 'NIhmYdfPe05f';//Demo测试密钥:NIhmYdfPe05f，刀塔西游支付密钥：w8hCFh5fqIbr

var
  Data,signStr,locSign:string;

  order:string;  //本次支付 SDK 生成的订单号
  money:string;//支付金额，单位：元，两位小数。
  mid:string; //本次支付用户的乐号，既登录后返回的 umid
  time:string;  //时间戳
  result:string; //支付结果，。“1”代表成功，“0”代表失败
  ext:string;  //客户端购买商品时候传入的 TransNo 字段（我方订单号）
  //subject:string;
  signature:string;

  retList : TStringList;

begin
  //order=ok123456&money=5.21&mid=123456&time=20141212105433&result=1&ext=1234567890&subject=item1&signature=21d1c6e109ef3ab56f1fc9bdce6f4e5d
  Data:=DangLePayEdit.Text;

  try
    retList := TStringList.Create;
    //第一个参数是分隔符; 第二个参数是开头被忽略的字符
    ExtractStrings(['&'],[],PChar(HttpDecode(Data)),retList);//ExtractStrings能避免空格也被视作分隔符的bug
    //retList.Sort;

    order:=retList.Values['order'];
    money:=retList.Values['money'];
    mid:=retList.Values['mid'];
    time:=retList.Values['time'];
    result:=retList.Values['result'];
    ext:=retList.Values['ext'];
    signature:=retList.Values['signature'];

    //签名：order=xxxx&money=xxxx&mid=xxxx&time=xxxx&result=x&ext=xxx&key=xxxx
    signStr:='order='+order+'&money='+money+'&mid='+mid+'&time='+time+'&result='+result+
        '&ext='+ext+'&key='+DANGLE_PAYMENT_KEY;

    locSign := LowerCase(MD5(AnsiToUtf8(signStr)));

    MainOutMessage('[Log] DangLe Pay Verify signStr: '+signStr +', sign: ' + locSign);
     
    if (signature = locSign) and (result = '1') then
    begin

      MainOutMessage('[Log] DangLe Pay Verify Success: money: ' + money);
      //验证订单数据，无CallbackInfo，*需要校验回调的金额是否跟商品的真实价格一致；
      
    end
    else
    begin
      MainOutMessage('[Error] DangLe Pay Verify Failed. 签名验证失败或支付失败! Data: ' + Data);
    end;
    retList.Free;

  except on E:Exception do
  begin
    MainOutMessage('[Error] DangLe Pay Verify Failed: unexpect exception! error(1). respData: ' + Data);
    retList.Free;
    Exit;
  end;
  end;

end;

procedure TForm1.AnZhiLoginBtnClick(Sender: TObject);
const
  ANZHI_LOGIN_URL = 'http://user.anzhi.com/web/cp/4/queryislogin';
  ANZHI_APP_KEY = '1447057589EKzb3L0xM5Nh9FSt3S6B';
  ANZHI_APP_SECRET = 'cNW16vj7C8Yc24sXm1UU3WK9';
  Header = 'Content-Type: application/x-www-form-urlencoded';

var
  Data,postData:string;
  uid,time,sid,sign:string;
  jsdata:TlkJSONobject;

  respData, userData:string;
  retjs,datajs:TlkJSONobject;
begin

  {"flag":"succeed","uid":"201611071531459LXKBQTKl6","token":"NzE5OTUxOTV8MTQ3ODUwMzkwNXwwMDJ8TU9WRV9URVJNSU5BTHw1NzgxNzQ="}
  Data:=AnZhiLoginEdit.Text;
  jsdata := nil;

  try
    jsdata := TlkJSON.ParseText(Data) as TlkJSONobject;
    if not assigned(jsdata) then
    begin
        MainOutMessage('[Error] AnZhi Login Request Failed. Client Data error. Data: ' + Data);
        exit;
    end;

    if (jsdata.IndexOfName('uid')>=0) and (jsdata.IndexOfName('token')>=0) then
    begin
      uid:= jsdata.Field['uid'].Value;
      sid:= jsdata.Field['token'].Value;
      time:= FormatdateTime('yyyymmddhhmmsszzzz', Now);//获取当前系统时间，精确到毫秒

      //Base64.encodeToString(appkey+sid+appsecret)
      sign := EncodeString(ANZHI_APP_KEY+sid+ANZHI_APP_SECRET);
      //删除加密后产生的换行
      sign := StringReplace(sign, #13, '', [rfReplaceAll]);
      sign := StringReplace(sign, #10, '', [rfReplaceAll]);

      MainOutMessage('signStr：' + ANZHI_APP_KEY+sid+ANZHI_APP_SECRET + SLineBreak + 'sign:'+sign+ SLineBreak);

      //uid,time,sid,sign:string;
      postData:='time='+time+'&appkey='+ANZHI_APP_KEY+'&sid='+sid+'&sign='+sign;

      MainOutMessage('请求postData：' + postData + SLineBreak);

      respData := Utf8ToAnsi(HttpsPost(ANZHI_LOGIN_URL, postData,Header));
      MainOutMessage('返回结果：' + respData + SLineBreak);
    end
    else
      MainOutMessage('[Error] AnZhi Login Request Failed. Client Data error: Parameter is not Exists! Data: ' + Data);

  except on E:Exception do
  begin
    MainOutMessage('[Error] AnZhi Login Request Failed. Client Data error: unknown exception. Data: ' + Data);
    jsdata.Free;
    Exit;
  end;
  end;
  jsdata.Free;

  {"code":1,"data":"eyJuaWNrbmFtZSI6IiIsInVpZCI6IjIwMTYxMTA3MTUzMTQ1OUxYS0JRVEtsNiJ9","msg":"成功(sid有效)","timestamp":1478510358042}
  //登陆验证
  retjs := nil;
  datajs := nil;
  try
      retjs := TlkJSON.ParseText(respData) as TlkJSONobject;
      if not assigned(retjs) then
      begin
        MainOutMessage('[Error] AnZhi Login Verify Failed. Response Data error. respData: ' + respData);
        exit;
      end;

      //当valid=1,msg_code=2000时验证成功，否则验证失败。
      if (retjs.IndexOfName('code')>=0) and (retjs.IndexOfName('data')>=0) then
      begin

        if retjs.Field['code'].Value = 1 then
        begin
          userData := DecodeString(retjs.Field['data'].Value);
          MainOutMessage('[Log] AnZhi Login Verify. data: '+userData);
          datajs := TlkJSON.ParseText(userData) as TlkJSONobject;
          if not assigned(datajs) then
          begin
            MainOutMessage('[Error] AnZhi Login Verify Failed. 解析data出错. userData: ' +userData + ', respData: '+ respData);
            retjs.Free;
            exit;
          end;

          if datajs.IndexOfName('uid')>=0 then
          begin
            //登录成功.
            MainOutMessage('[log] AnZhi Login Verify Success. 登录成功！UID: ' +
              datajs.Field['uid'].Value + SLineBreak);
          end
          else
            MainOutMessage('[Error] AnZhi Login Request Failed. Parameter is not Exists(1)! userData: ' +userData + ', respData: '+ respData);

          datajs.Free;
        end
        else
          MainOutMessage(format('[Error] AnZhi Login Verify Failed.请求失败! valid: %s, msg_desc: %s, respData: %s',
                [retjs.Field['valid'].Value,retjs.Field['msg_desc'].Value,respData]));

      end
      else
      begin
        MainOutMessage(format('[Error] AnZhi Login Verify Failed. Parameter not exists(2)! respData: %s',[respData]));
      end;
      retjs.Free;

  except on E:Exception do
  begin
    MainOutMessage('[Error] AnZhi Login Verify Failed. unexpect exception! error. respData: ' + respData);
    retjs.Free;
    Exit;
  end;
  end;

end;

procedure TForm1.AnZhiPayBtnClick(Sender: TObject);
const
  ANZHI_APP_SECRET = 'cNW16vj7C8Yc24sXm1UU3WK9';
var
  Data,info:string;
  uid:string;// 安智帐号
  orderId:string;// 安智订单号
  orderAmount:string;//用户实际支付金额，单位为分
  //orderTime:string;//支付时间
  code:Integer;//订单状态（1 为成功）
  //msg:string;//空
  //payAmount:string;//等于 orderAmount
  cpInfo:string;//第三方游戏订单号
  //notifyTime:Integer;//通知时间
  //memo:string;//备注
  cpCustomInfo:string;//callbackInfo

  des3:DES3DllClass;
  jsdata : TlkJSONobject;
begin
  //Data:='data=scTgncngsXGmNTLNgU1KrS7Ct6EaZjBu9BXB5b8Gs24=';
  Data:=AnZhiPayEdit.Text;
  info := Copy(Data, Pos('=', Data)+1, Length(Data)-Pos('=', Data));//截取'='之后的字符串.
  des3 := CoDES3DllClass.Create;
  info:= des3.Decrypt3DES(info, ANZHI_APP_SECRET);
  MainOutMessage('[log] AnZhi Pay Verify Data 解密：'+SLineBreak+info);

  {info:='{"payAmount":"10","uid":"20130708182839lYvY2bblnb","notifyTime":1373338174,'+
      '"cpInfo":"回调信息","memo":null,"orderAmount":"10","code":1,"orderTime":"2013-07-09 10:47:00",'+
  }//    '"msg":"","orderId":"20130709104714493","cpCustomInfo":"CallbackInfo"}';

  try
    jsdata := TlkJSON.ParseText(info) as TlkJSONobject;
    if not assigned(jsdata) then
    begin
      MainOutMessage('[Error] AnZhi Pay Verify Failed.返回数据解析出错. Data: '+Data+', 解析：'+info);
      exit;
    end;

    if (jsdata.IndexOfName('code')>=0)and(jsdata.IndexOfName('uid')>=0)and (jsdata.IndexOfName('orderId')>=0)
        and (jsdata.IndexOfName('orderAmount')>=0)and (jsdata.IndexOfName('cpInfo')>=0)and (jsdata.IndexOfName('cpCustomInfo')>=0) then
    begin
      code:= jsdata.Field['code'].Value;// 订单状态 1为成功

      if code = 1 then  //支付成功
      begin
        uid:= jsdata.Field['uid'].Value;// 安智帐号
        orderId:= jsdata.Field['orderId'].Value; //安智订单号
        orderAmount:= jsdata.Field['orderAmount'].Value;
        cpInfo:= jsdata.Field['cpInfo'].Value; //天游订单号.
        cpCustomInfo := jsdata.Field['cpCustomInfo'].Value; //callbackInfo

        //验证订单信息，使用callbackInfo
        MainOutMessage('[Log] AnZhi Pay Verify Success. uid:' + uid + ', orderAmount:' + orderAmount);
      end
      else
        MainOutMessage('[Error] AnZhi Pay Verify Failed. 订单状态为支付失败! Data: '+Data+', 解析info：'+info);

    end
    else
    begin
      MainOutMessage('[Error] AnZhi Pay Verify Failed. Return Data error: Parameter is not Exists! Data: '+Data+', 解析info：'+info);
    end;
    jsdata.Free;

  except on E:Exception do
  begin
    MainOutMessage('[Error] AnZhi Pay Verify Failed. unexpect exception! error. Data: '+Data+', 解析info：'+info);
    jsdata.Free;
    Exit;
  end;
  end;

end;

procedure TForm1.CoolPadLoginBtnClick(Sender: TObject);
const
  COOLPAD_LOGIN_URL = 'https://openapi.coolyun.com/oauth2/token';
  COOLPAD_APP_ID = '2000000682';
  COOLPAD_APP_KEY = '2335581b4f0e447ea4da2750b91fe81b';

var
  Data,Authcode:string;
  jsdata:TlkJSONobject;

  respData:string;
  retjs:TlkJSONobject;
  openid:string;
  grant_type:string;
begin
  grant_type := 'authorization_code';
  Data:=CoolPadLoginEdit.Text;

  {"flag":"succeed","Authcode":"97a526f3d3f95e131abf940affa9a98e","code":23}
  try
    jsdata := TlkJSON.ParseText(Data) as TlkJSONobject;
    if not assigned(jsdata) then
    begin
        MainOutMessage('[Error] CoolPad Login Request Failed. Client Data error. Data: ' + Data);
        exit;
    end;

    if jsdata.IndexOfName('Authcode')>=0 then
    begin
      Authcode:= jsdata.Field['Authcode'].Value;
      url:=COOLPAD_LOGIN_URL+'?grant_type='+grant_type+'&code='+Authcode+'&client_id='+COOLPAD_APP_ID
        +'&client_secret='+COOLPAD_APP_KEY+'&redirect_uri='+COOLPAD_APP_KEY;
      MainOutMessage('请求：' + url + SLineBreak);
      
      respData := Utf8ToAnsi(HttpsGet(url));
      MainOutMessage('返回结果：' + respData + SLineBreak);
    end
    else
      MainOutMessage('[Error] CoolPad Login Request Failed. Client Data error: Parameter is not Exists! Data: ' + Data);

  except on E:Exception do
  begin
    MainOutMessage('[Error] CoolPad Login Request Failed. Client Data error: unknown exception. Data: ' + Data);
    jsdata.Free;
    Exit;
  end;
  end;
  jsdata.Free;

  respData := '{"openid":"76723093","expires_in":"7776000","refresh_token":"5.303d61b09ea4ed2abf9894a2c0419788",'+
      '"access_token":"5.1fe53f68dfd249eea6554d6d05703dc9.862df48e73ed7df8b192599422094fd2.1478656156574"}';
  //登陆验证
  try
      retjs := TlkJSON.ParseText(respData) as TlkJSONobject;
      if not assigned(retjs) then
      begin
        MainOutMessage('[Error] CoolPad Login Verify Failed. Response Data error. respData: ' + respData);
        exit;
      end;

      if retjs.IndexOfName('openid')>=0 then
      begin
          openid:= retjs.Field['openid'].Value;
          MainOutMessage('[log] CoolPad Login Verify Success! UID: ' +
            openid + SLineBreak);

      end
      else
      begin
        MainOutMessage(format('[Error] CoolPad Login Verify Failed. Parameter not exists! respData: %s',[respData]));
      end;
      retjs.Free;

  except on E:Exception do
  begin
    MainOutMessage('[Error] CoolPad Login Verify Failed. unexpect exception! error. respData: ' + respData);
    retjs.Free;
    Exit;
  end;
  end;

end;
 
procedure TForm1.CoolPadOrderBtnClick(Sender: TObject);
const
  //以下都是西游的参数
  PAYORDER_URL = 'http://pay.coolyun.com:6988/payapi/order';
  COOLPAD_APP_ID = '5000002434';
 // COOLPAD_APP_KEY='8015073d41474b76adc1dbdaf08ce9d1';
  COOLPAD_NOTITYURL='http://192.168.0.140:8094/monizhuang/api?type=100';
  Header = 'Content-Type: application/x-www-form-urlencoded';
  COOLPAD_PUBLIC_KEY='MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDABF2g8r2lgf84eI9XIqUiOkRLOf+gP6J0aYGQT9oSRnkLMnRrocU8SGX1d3W/C3tqPIPrh/zBR0vL0vXlwxudG9QLz08baMvrAnkjqyuenSE1Gi9+u1MVMRZIqtS+KsVgzfoEHv7cXPqploxihH8uwa0ALYGj9Aehqh8CISQYCQIDAQAB';

  { 名验签使用的rsa私钥格式为pkcs8，酷派网站提供的rsa私钥为pkcs1，需要使用cptools工具，将pkcs1私钥转为pkcs8格式  }
  COOLPAD_PRIVATE_KEY='MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAKQ76WAwcwwaDl3DB8kqyEbXKm4YdXQt'+
    '9AlbTXpZDag1ZU5AQK4BwolRP3MvIq/iwWnGojDL/a6eUlhP3tMIHxabzWEg55kfkU4F/ShLYPXhUFe9'+
    'l5Wkk2DjHp6I3nI+qfKX8EczmWJ2xPcqskBsVJO4nhpbtSK2JJ09NmjySBB1AgMBAAECgYAF1NbBgpbj'+
    'LB2seJtTKkC4OzWXeSjaejM7DdHfcUAJ4/N35tIlG4zjwU3GcjsCEcQaVGI351ZXl+mGlzdrONOZtFi5'+
    'l+OeX4IGsU5ACmi3i+aEcHjbMY+nh0xaPrCGGo8pCjqR0S2HdBV8g8y+5r7XkpIm1iXw3VKW28bDill7'+
    'FQJBAM6ooKl3fQA1w5dR/K78TLUa/QkzBMslx66G1yiIkTUA4s/O6EeoV6yTLjRi4n/YbMhrGSiapr/+'+
    'qLfgjd6i1lcCQQDLcjUfZ4AAEeuJhKCzvhswKW9/jduAje6wz37fiSr1DxZzIiLFuqBXBID7c7Q616XZ'+
    'BFB8ZYL5Lb8Dq/YEdhgTAkAZxaPLnpAjL5FF1L6rX+F9EHGP7SHi58JAPKamcmmRb5vZiJclIJRWfEBd'+
    '3hsbEHV4hQqtKqQy+2I1FDb9FdefAkBlb5gVBGHJpyWs9ze45rxfkwlIq84Zlqq/9XTot1d3wAINfaOg'+
    'uqBfQpucw9/Exuil/4SxwVtAKhLnHcIYD1mJAkEAwu8pTxRua8tSplpLhDAIt4fJwRXGKNPn8uILlSCY'+
    '4qMcVovUIwMvroNs3OXL3p6k3goIxCnSR6fZQF902RrmZw==';

var
  waresid: Integer; //商品编号
  waresname: string; // 商品名称
  cporderid: string; // 商户订单号
  price: Double; // 支付金额：元
  currency: string;  // 货币类型
  appuserid: string;  //  用户在商户应用的唯一标识 UserId
  cpprivateinfo: string;  // 商户私有信息
 // notifyurl: string;  // 支付结果通知地址

  sign, Data, respData, transdata, transid:string;
  dataJs, retJs: TlkJSONobject;
  RsaMd5:SignAndVerifyClass;
  retList : TStringList;
begin
  dataJs := nil;
  retJs := nil;
  RsaMd5 := CoSignAndVerifyClass.Create();
  datajs := TlkJSONobject.Create;

  waresid:=1;
  waresname:='元宝';
  cporderid:= CoolPadCpOrderEdit.Text;
  price:=0.01;                          
  currency:='RMB';
  appuserid:='@ty-nt6439';
  cpprivateinfo:='tnyooprivateinfo';

  datajs.Add('appid', COOLPAD_APP_ID);
  datajs.Add('waresid', waresid);
  //datajs.Add('waresname', AnsiToUtf8(waresname));
  datajs.Add('cporderid', cporderid);
  datajs.Add('price', price);
  datajs.Add('currency', currency);
  datajs.Add('appuserid', appuserid);
  datajs.Add('cpprivateinfo', cpprivateinfo);
  datajs.Add('notifyurl', COOLPAD_NOTITYURL);
  Data := TlkJSON.GenerateText(datajs); //Utf8Decode(     HttpEncode  AnsiToUtf8
  datajs.Free;
  MainOutMessage('[Log] CoolPad Get Order Number. Data: ' + Data + SLineBreak);

  sign := RsaMd5.RsaMd5Sign(Data, COOLPAD_PRIVATE_KEY);
  MainOutMessage('[Log] CoolPad Get Order Number. sign: ' + sign + SLineBreak);

  Data := 'transdata='+Data+'&sign='+sign+'&signtype=RSA';
  Data:=StringReplace (Data, ' ', '+', [rfReplaceAll]); //替换字符串中所有的空格为+
  
  respData := Utf8ToAnsi(HttpDecode(HttpsPost(PAYORDER_URL, Data, Header)));
  MainOutMessage('[Log] CoolPad Get Order Number. postData：' + Data + SLineBreak);
  MainOutMessage('[Log] CoolPad Get Order Number. 返回结果：' + respData + SLineBreak);


  
  //成功：transdata={"transid":"11111"}&sign=xxxxxx&signtype=RSA
  //失败：transdata={"code":"1001","errmsg":"签名验证失败"}
  try
      respData:=StringReplace (respData, ' ', '+', [rfReplaceAll]); //替换字符串中所有的空格为+
      retList := TStringList.Create;
      //第一个参数是分隔符; 第二个参数是开头被忽略的字符
      ExtractStrings(['&'],[],PChar(respData),retList);//ExtractStrings能避免空格也被视作分隔符的bug

      transdata := retList.Values['transdata'];
      sign := retList.Values['sign'];

      if (transdata = ' ') or (sign = '') then
      begin
        MainOutMessage('[Error] CoolPad Get Order Number Failed. Request Failed! errmsg: '+retList.Values['errmsg']+
            ', respData: ' + respData);
        retList.Free;
        exit;
      end;
      retList.Free;

      if RsaMd5.RsaMd5Verify(transdata, COOLPAD_PUBLIC_KEY, sign) then
      begin

        retjs := TlkJSON.ParseText(transdata) as TlkJSONobject;
        if not assigned(retjs) then
        begin
          MainOutMessage('[Error] CoolPad Get Order Number Failed. Response Data error. transdata: '+retList.Values['transdata']+
            ', respData: ' + respData);
          exit;
        end;

        if retjs.IndexOfName('transid')>=0 then
        begin
          transid := retjs['transid'].value;
          MainOutMessage('[Log] CoolPad Get Order Number. 获取到定单号：' + transid + SLineBreak);
          //将order_no, submit_time, product_id发给客户端
        end
        else
        begin
          MainOutMessage('[Error] CoolPad Get Order Number Failed. Parameter transid not Exist! respData: ' + respData);
        end;

      end
      else
      begin
        MainOutMessage('[Log] CoolPad Get Order Number Failed. 验证签名失败! respData: ' + respData);
      end;
      retjs.Free;

  except on E:Exception do
  begin
    MainOutMessage('[Error] CoolPad Get Order Number Failed: unexpect exception! error. respData: ' + respData);
    retjs.Free;
    Exit;
  end;
  end;

end;

procedure TForm1.CoolPadPayVerifyBtnClick(Sender: TObject);
const
  //西游的参数
  COOLPAD_PUBLIC_KEY='MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDABF2g8r2lgf84eI9XIqUiOkRLOf+gP6J0aYGQT9oSRnkLMnRrocU8SGX1d3W/C3tqPIPrh/zBR0vL0vXlwxudG9QLz08baMvrAnkjqyuenSE1Gi9+u1MVMRZIqtS+KsVgzfoEHv7cXPqploxihH8uwa0ALYGj9Aehqh8CISQYCQIDAQAB';

var
//  cporderid: string; // 商户订单号
  transid: string; // 酷派交易流水号
 // appuserid: string;  //  用户在商户应用的唯一标识 UserId
//  appid: string;  // 游戏id
//  waresid: Integer; //商品编号
  money: Double; // 交易金额
  result: Integer; // 交易结果
  cpprivate: string;  // 商户私有信息

  Data, sign, transdata:string;
  retJs: TlkJSONobject;
  RsaMd5:SignAndVerifyClass;
  retList : TStringList;                   
begin
  Data:=CoolPadPayEdit.Text;
  retJs := nil;
  RsaMd5 := CoSignAndVerifyClass.Create;

  //成功：transdata={"transid":"11111"}&sign=xxxxxx&signtype=RSA
  //失败：transdata={"code":"1001","errmsg":"签名验证失败"}
  try
      retList := TStringList.Create;
      //第一个参数是分隔符; 第二个参数是开头被忽略的字符
      ExtractStrings(['&'],[],PChar(Data),retList);//ExtractStrings能避免空格也被视作分隔符的bug

      transdata := retList.Values['transdata'];
      sign := retList.Values['sign'];
      sign:=StringReplace (sign, ' ', '+', [rfReplaceAll]); //替换字符串中所有的空格为+
      MainOutMessage('transdata: ' + transdata+', sign: ' + sign);

      if (transdata = '') or (sign = '') then
      begin
        MainOutMessage('[Error] process CoolPad Pay Result Failed. Purchase Failed! errmsg: '+retList.Values['errmsg']+
          ', respData: ' + Data);
        retList.Free;
        exit;
      end;
      retList.Free;

      //transdata:='{"transid":"32021611141119047614"}';
      //sign:='U7rU4IbweDGn3KMHo3rbXXqFvmkTsW2pyrlEvdQxoJ+m2DbdkmZZFpfa7clr3vDTRfxxgh7LnyV4GAmnhOJ6sJGe7kOdNvnl+V0xkzbfLT/GJa5LbPTv339myHKTo+edlJGpdnNb0otvXABs5pValnbCQWhF2aZRnuybS1X/d7I=';
      if not RsaMd5.RsaMd5Verify(transdata, COOLPAD_PUBLIC_KEY, sign) then
      begin
        retjs := TlkJSON.ParseText(transdata) as TlkJSONobject;
        if not assigned(retjs) then
        begin
          MainOutMessage('[Error] process CoolPad Pay Result Failed. Return Data error. transdata: '+retList.Values['transdata']+
            ', respData: ' + Data);
          exit;
        end;

        {"transtype":0,"cporderid":"1","transid":"2","appuserid":"test","appid":"3","waresid":
        31,"feetype":4,"money":5.00, "currency":"RMB", "result":0, "transtime":"2012-12-12
        12:11:10","cpprivate":"test","paytype":1}

        if (retjs.IndexOfName('transid')>=0) and (retjs.IndexOfName('appid')>=0) and (retjs.IndexOfName('money')>=0)
          and (retjs.IndexOfName('result')>=0) and (retjs.IndexOfName('cpprivate')>=0) then
        begin
         // cporderid := retjs['cporderid'].value;
          transid := retjs['transid'].value; //第三方订单号
         // appuserid := retjs['appuserid'].value;
         // appid := retjs['appid'].value;
         // waresid := retjs['waresid'].value;
          money := retjs['money'].value;
          result := retjs['result'].value;
          cpprivate := retjs['cpprivate'].value;

          if result = 0 then    //交易成功
          begin
            //验证CallbackInfo

            
            MainOutMessage('[Log] process CoolPad Pay Result Success. 验证CallbackInfo！ money: ' + FloatToStr(money));
          end
          else
          begin
             MainOutMessage('[Error] process CoolPad Pay Result Failed. 交易失败！ respData: ' + Data);
          end;

        end
        else
        begin
          MainOutMessage('[Error] process CoolPad Pay Result Failed. Parameter not Exist! respData: ' + Data);
        end;

      end
      else
      begin
        MainOutMessage('[Error] process CoolPad Pay Result Failed. 验证签名失败！ transdata: ' + transdata+', sign: ' + sign);
      end;
      retjs.Free;

  except on E:Exception do
  begin
    MainOutMessage('[Error] process CoolPad Pay Result Failed. unexpect exception! error. respData: ' + Data);
    retjs.Free;
    Exit;
  end;
  end;

end;

procedure TForm1.YYHLoginVerifyBtnClick(Sender: TObject);
const
    //以下是Demo参数
  YINGYONGHUI_LOGIN_URL = 'http://api.appchina.com/appchina-usersdk/user/v2/get.json';
  YINGYONGHUI_LOGIN_ID = '11533';
  YINGYONGHUI_LOGIN_KEY='6Y9A2L4p5F83IYvg';
  Header = 'Content-Type: application/x-www-form-urlencoded';

var
  Data,url,respData, user_id:string;
  ticket:string;
  jsdata,retjs,datajs:TlkJSONobject;

begin
  {"flag":"succeed","ticket":"d836d5cd-4da0-46ab-9f18-71f2c0c1c799"}
  Data := YYHLoginEdit.Text;

  try
    jsdata := TlkJSON.ParseText(Data) as TlkJSONobject;
    if not assigned(jsdata) then
    begin
        MainOutMessage('[Error] YingYongHui Login Request Failed. Client Data error. Data: ' + Data);
        exit;
    end;
    //http://api.appchina.com/appchina-usersdk/user/v2/get.json?login_id=1&login_key=3c480af8&ticket=926d1cc2-1c66-4dcf-b0df-13ba294c9107%20%7F%C2%A0
    if jsdata.IndexOfName('ticket')>=0 then
    begin
      ticket:= jsdata.Field['ticket'].Value;
      url:=YINGYONGHUI_LOGIN_URL+'?login_id='+YINGYONGHUI_LOGIN_ID+'&login_key='+YINGYONGHUI_LOGIN_KEY+'&ticket='+ticket;
      MainOutMessage('请求：' + url + SLineBreak);
      
      respData := Utf8ToAnsi(HttpsGet(url));
      MainOutMessage('返回结果：' + respData + SLineBreak);
    end
    else
      MainOutMessage('[Error] YingYongHui Login Request Failed. Client Data error: Parameter is not Exists! Data: ' + Data);

  except on E:Exception do
  begin
    MainOutMessage(format('[Error] YingYongHui Login Request Failed. unknown exception. error: %s, Data: %s',
        [e.message, Data]));
    jsdata.Free;
    Exit;
  end;
  end;
  jsdata.Free;

  {"data":
  {"nick_name":"tnyoo",
  "valid":true,
  "user_name":"w5073109",
  "phone":"15198901047",
  "avatar_url":"",
  "actived":true,
  "email":"2862090242@qq.com",
  "ticket":"d836d5cd-4da0-46ab-9f18-71f2c0c1c799",
  "create_time":"2014-11-12 09:33:13",
  "user_id":2489898,      //用户唯一标识
  "role_type":0,
  "account_type":"YYH_ACCOUNT"】,
  "status":0,"message":"OK"}

  //respData := '{"data":null,"status":0,"message":"用户不存在"}';
  //登陆验证
  try
      retjs := TlkJSON.ParseText(respData) as TlkJSONobject;
      if not assigned(retjs) then
      begin
        MainOutMessage('[Error] YingYongHui Login Verify Failed. Response Data error. respData: ' + respData);
        exit;
      end;

      //Data := retjs.Field['data'].Value;
      //MainOutMessage('[Log] data:'+varToStr(retjs.Field['data'].Value)+', varIsEmpty: '+ Data);

      if (retjs.IndexOfName('data')>=0) and (retjs.IndexOfName('status')>=0)then
      begin

        //当status=0时验证成功，否则验证失败。                                                                           
        if (retjs.Field['status'].Value = 0)then // and (not varIsEmpty(retjs.Field['data'].Value))
        begin
        
          datajs := retjs.Field['data'] as TlkJSONobject;
          if not assigned(datajs) then
          begin
            MainOutMessage('[Error] YingYongHui Login Verify Failed. Response Data error. respData: ' + respData);
            exit;
          end;

          if datajs.IndexOfName('user_id')>=0 then
          begin
            user_id:= datajs.Field['user_id'].Value;
            MainOutMessage('[log] YingYongHui Login Verify Success! user_id: ' +
              user_id + SLineBreak);
          end
          else
          begin
            MainOutMessage(format('[Error] YingYongHui Login Verify Failed. Parameter user_id not exists(0)! respData: %s',[respData]));
          end;
          
        end
        else
        begin
          MainOutMessage(format('[Error] YingYongHui Login Verify Failed. 登录失败! respData: %s',
              [respData]));
        end;

      end
      else
      begin
        MainOutMessage(format('[Error] YingYongHui Login Verify Failed. Parameter not exists(1)! respData: %s',[respData]));
      end;
      retjs.Free;  //datajs是retjs的引用，无需再次释放。

  except on E:Exception do
  begin
    MainOutMessage(format('[Error] YingYongHui Verify Failed. unexpect exception! error: %s, respData: %s',[e.message, respData]));
    retjs.Free;
    Exit;
  end;
  end;

end;

procedure TForm1.YYHPayVerifyBtnClick(Sender: TObject);
const
  //西游的参数
  YINGYONGHUI_PUBLIC_KEY='MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCrw2xnHc/3EUMZoaVfPyh8bzEV3ZbrOQLiJTbfkfLQAUiTt6uzVj2OK5GOq1n+P5CSFIPCpn8mOQGeWWnBkLF+cpFi0WNn5gADnFzPSF3CXyg2KAqybSV0HZaA653CtJ7krq6cxgHm8aEnXIegkq9DeImiJfluvbVj+8nTOME1YQIDAQAB';
var
//  cporderid: string; // 商户订单号
  transid: string; // 酷派交易流水号
//  appuserid: string;  //  用户在商户应用的唯一标识 UserId
//  appid: string;  // 游戏id
//  waresid: Integer; //商品编号
  money: Double; // 交易金额
  result: Integer; // 交易结果
  cpprivate: string;  // 商户私有信息

  Data, sign, transdata:string;
  retJs: TlkJSONobject;
  RsaMd5:SignAndVerifyClass;
  retList : TStringList;
begin
  Data:=YYHPayEdit.Text;
  retJs := nil;
  RsaMd5 := CoSignAndVerifyClass.Create;

  //成功：transdata={"transid":"11111"}&sign=xxxxxx&signtype=RSA
  //失败：transdata={"code":"1001","errmsg":"签名验证失败"}
  try
      retList := TStringList.Create;
      //第一个参数是分隔符; 第二个参数是开头被忽略的字符
      ExtractStrings(['&'],[],PChar(Data),retList);//ExtractStrings能避免空格也被视作分隔符的bug

      transdata := retList.Values['transdata'];
      sign := retList.Values['sign'];
      sign:=StringReplace (sign, ' ', '+', [rfReplaceAll]); //替换字符串中所有的空格为+
      MainOutMessage('transdata: ' + transdata+', sign: ' + sign);

      if (transdata = '') or (sign = '') then
      begin
        MainOutMessage('[Error] process YingYongHui Pay Result Failed. Purchase Failed! errmsg: '+retList.Values['errmsg']+
          ', respData: ' + Data);
        retList.Free;
        exit;
      end;
      //retList.Free;

      if not RsaMd5.RsaMd5Verify(transdata, YINGYONGHUI_PUBLIC_KEY, sign) then
      begin
        retjs := TlkJSON.ParseText(transdata) as TlkJSONobject;
        if not assigned(retjs) then
        begin
          MainOutMessage('[Error] process YingYongHui Pay Result Failed. Return Data error. transdata: '+retList.Values['transdata']+
            ', respData: ' + Data);
          exit;
        end;

        {"transtype":0,"cporderid":"1","transid":"2","appuserid":"test","appid":"3","waresid":
        31,"feetype":4,"money":5.00, "currency":"RMB", "result":0, "transtime":"2012-12-12
        12:11:10","cpprivate":"test","paytype":1}

        if (retjs.IndexOfName('transid')>=0) and (retjs.IndexOfName('appid')>=0) and (retjs.IndexOfName('money')>=0)
          and (retjs.IndexOfName('result')>=0) and (retjs.IndexOfName('cpprivate')>=0) then
        begin
         // cporderid := retjs['cporderid'].value;
          transid := retjs['transid'].value; //第三方订单号
         // appuserid := retjs['appuserid'].value;
         // appid := retjs['appid'].value;
         // waresid := retjs['waresid'].value;
          money := retjs['money'].value;
          result := retjs['result'].value;
          cpprivate := retjs['cpprivate'].value;

          if result = 0 then    //交易成功
          begin
            //验证CallbackInfo

            
            MainOutMessage('[Log] process YingYongHui Pay Result Success. 验证CallbackInfo！ money: ' + FloatToStr(money));
          end
          else
          begin
             MainOutMessage('[Error] process YingYongHui Pay Result Failed. 交易失败！ respData: ' + Data);
          end;

        end
        else
        begin
          MainOutMessage('[Error] process YingYongHui Pay Result Failed. Parameter not Exist! respData: ' + Data);
        end;

      end
      else
      begin
        MainOutMessage('[Error] process YingYongHui Pay Result Failed. 验证签名失败！ transdata: ' + transdata+', sign: ' + sign);
      end;
      retjs.Free;

  except on E:Exception do
  begin
    MainOutMessage('[Error] process YingYongHui Pay Result Failed. unexpect exception! error. respData: ' + Data);
    retjs.Free;
    Exit;
  end;
  end;

end;

procedure TForm1.AIYouXiLoginBtnClick(Sender: TObject);
const
    //以下是刀塔参数
  AIYOUXI_LOGIN_URL = 'https://open.play.cn/oauth/token';
  AIYOUXI_CLIENT_ID = '59969702';
  AIYOUXI_CLIENT_SECRET='b900ae2f68894597a61538906371b9cf';
  AIYOUXI_VERSION = '2.1.0';
  Header = 'Content-Type: application/x-www-form-urlencoded';

var
  Data,url,respData, user_id:string;
  Token, sign, timestamp:string;
  jsdata,retjs:TlkJSONobject;

begin
  jsdata := nil;
  retjs := nil;
  {"flag":"succeed","code":"967e0940df9b347085a0fa79afe263b6"} //一个code只能使用一次.
  Data := AIYOUXILoginEdit.Text;
  try
    jsdata := TlkJSON.ParseText(Data) as TlkJSONobject;
    if not assigned(jsdata) then
    begin
        MainOutMessage('[Error] AiYouXi Login Request Failed. Client Data error. Data: ' + Data);
        exit;
    end;
    //http://api.appchina.com/appchina-usersdk/user/v2/get.json?login_id=1&login_key=3c480af8&ticket=926d1cc2-1c66-4dcf-b0df-13ba294c9107%20%7F%C2%A0
    if jsdata.IndexOfName('code')>=0 then
    begin
      Token:= jsdata.Field['code'].Value;
      timestamp := IntToStr(DateTimeToUnix(Now)-8*60*60);

      //签名顺序：timestamp+sign_method+client_secret+client_id+version
      sign:= MD5(UTF8Encode(timestamp + 'MD5' + AIYOUXI_CLIENT_SECRET + AIYOUXI_CLIENT_ID + AIYOUXI_VERSION));

      {client_id=XXX&client_secret=XXX&code=XXX&grant_type=authorization_code&sign_method=MD5&timestamp=XXX
      &sign_sort=timestamp%26sign_method%26client_secret%26client_id%26version&signature=XXX&version=XXX}
      url:=AIYOUXI_LOGIN_URL+'?client_id='+AIYOUXI_CLIENT_ID+'&client_secret='+AIYOUXI_CLIENT_SECRET+'&code='+Token
            +'&grant_type=authorization_code&sign_method=MD5'+'&timestamp='+timestamp+'&sign_sort=timestamp%26sign_method%26client_secret%26client_id%26version'
            +'&signature='+sign+'&version='+AIYOUXI_VERSION;
      MainOutMessage('请求：' + url + SLineBreak);
      
      respData := Utf8ToAnsi(HttpsGet(url, Header));
      MainOutMessage('返回结果：' + respData + SLineBreak);
    end
    else
      MainOutMessage('[Error] AiYouXi Login Request Failed. Client Data error: Parameter is not Exists! Data: ' + Data);

  except on E:Exception do
  begin
    MainOutMessage(format('[Error] AiYouXi Login Request Failed. unknown exception. error: %s, Data: %s',
        [e.message, Data]));
    jsdata.Free;
    Exit;
  end;
  end;
  jsdata.Free;

  respData:='{"scope":"权限","re_expires_in":"15552000","user_id":"74006459","token_type":"Bearer","expires_in":5184000,"refresh_token":"b703dd5c6d8f7ec48eb85095cf9fb4a7","access_token":"8c968cde45e2436f5ccfc9a0084c8d94","login_type":"1"}';
  //登陆验证
  try
      retjs := TlkJSON.ParseText(respData) as TlkJSONobject;
      if not assigned(retjs) then
      begin
        MainOutMessage('[Error] AiYouXi Login Verify Failed. Response Data error. respData: ' + respData);
        exit;
      end;

      if retjs.IndexOfName('user_id')>=0 then
      begin
          user_id:= retjs.Field['user_id'].Value;
          MainOutMessage('[log] AiYouXi Login Verify Success! UID: ' +
            user_id + SLineBreak);

      end
      else
      begin
        MainOutMessage(format('[Error] AiYouXi Login Verify Failed. Parameter not exists or Request failed! respData: %s',[respData]));
      end;
      retjs.Free;

  except on E:Exception do
  begin
    MainOutMessage('[Error] AiYouXi Login Verify Failed. unexpect exception! error. respData: ' + respData);
    retjs.Free;
    Exit;
  end;
  end;

end;

procedure TForm1.AIYOUXIPayIF2BtnClick(Sender: TObject);
const
  AIYOUXI_APP_KEY = '1550897cf9d021a60337d572cc02db9d';//西游参数
var
  Data:string;
  cp_order_id:string;// 	CP业务流水号（32位以内不含特殊字符）-(IF1-2)
  correlator:string;// 	爱游戏平台流水号（32位以内）-(IF1-2)
  method:string;// 	固定值 "check" - 短信请求扣费，"callback" -扣费成功回调-(IF1-2)
  sign:string;// 	MD5(cp_order_id+correlator+result_code+fee+paytype+method+appKey)-(IF1-2)
  version:string;// 	回调接口版本号，当前为1。-(IF1-2)

  order_time:string;// 订单时间戳，14位时间格式(yyyyMMddHHmmss)-(IF1)
  result_code:string;//   00为扣费成功，其他 状态码均为扣费不成功请勿发放道具-(IF2)
  fee:string;//   计费金额，单位：元，服务器端请务必自行校验订购金额和计费金额是否一致-(IF2)
  pay_type:string;// 	计费类型，smsPay：短代；alipay：支付宝；ipay：爱贝-(IF2)

  retList : TStringList;
  retData,mySign,accountInfo,money: string;
  retCode:Integer;
begin
  Data:='method=check&cp_order_id=1398232&correlator=20329021&sign=oijkuguiyttydfre5656'+
      '&version=1&result_code=00&pay_type=ipay&fee=1';
  try
      retCode := 1;// 0-成功/同意，1-失败/不同意
      retList := TStringList.Create;
      //第一个参数是分隔符; 第二个参数是开头被忽略的字符
      ExtractStrings(['&'],[],PChar(Data),retList);//ExtractStrings能避免空格也被视作分隔符的bug

      method := retList.Values['method'];
      cp_order_id := retList.Values['cp_order_id'];
      correlator := retList.Values['correlator'];
      sign := retList.Values['sign'];
      version := retList.Values['version'];

      MainOutMessage('[Log] request method: ' + method);

      if (trim(method)='') or (trim(cp_order_id)='') or (trim(correlator)='') or (trim(sign)='') then// or (trim(version)='') then
      begin
        MainOutMessage(format('[Error] process AiYouXi Pay Result Failed. Request Data Error: One or more Parameter not exists! Data: %s',[Data]));
        Exit;
      end;

      //两个验证接口，详见：http://180.96.63.72/Documents/PaySDK.html#Title3_3
      if method = 'check' then   //短信扣费确认
      begin
        order_time := retList.Values['order_time'];

        //MD5(cp_order_id+correlator+order_time+method+appKey)
        mySign:=MD5(UTF8Encode(cp_order_id+correlator+order_time+method+AIYOUXI_APP_KEY));
        MainOutMessage('signStr: ' + cp_order_id+correlator+order_time+method+AIYOUXI_APP_KEY
            +', mySign: ' + mySign);

        if sign = mySign then
        begin
          retCode := 0;
          order_time:= FormatdateTime('yyyymmddhhmmss', Now);//返回数据需要获取当前系统时间
          
          accountInfo:='UserID|ServerID';//网游游戏账号信息需要另外获取
          money:='1';//计费金额

          retData:='<sms_pay_check_resp>'+
                    '<cp_order_id>'+cp_order_id+'</cp_order_id>'+
                    '<correlator>'+correlator+'</correlator>'+
                    '<game_account>'+accountInfo+'</game_account>'+
                    '<fee>'+money+'</fee>'+
                    '<if_pay>'+IntToStr(retCode)+'</if_pay>'+
                    '<order_time>'+order_time+'</order_time>'+
                  '</sms_pay_check_resp>';

        end
        else
        begin
          MainOutMessage(format('[Error] process AiYouXi Pay Result Failed(F1-Check). 签名不匹配！ Data: %s',[Data]));
          Exit;
        end;

      end
      else if method = 'callback' then   //支付成功回调.
      begin
        result_code := retList.Values['result_code'];
        fee := retList.Values['fee'];
        pay_type := retList.Values['pay_type'];

        //MD5(cp_order_id+correlator+result_code+fee+paytype+method+appKey)
        sign:=MD5(UTF8Encode(cp_order_id+correlator+result_code+fee+pay_type+method+AIYOUXI_APP_KEY));
        MainOutMessage('signStr: ' + cp_order_id+correlator+result_code+fee+pay_type+method+AIYOUXI_APP_KEY
              +', mySign: ' + mySign);

        if sign = mySign then
        begin
          retCode := 0;
          retData:='<cp_notify_resp>'+
          '<h_ret>'+IntToStr(retCode)+'</h_ret>'+
          '<cp_order_id>'+cp_order_id+'</cp_order_id>'+
          '</cp_notify_resp>';

        end
        else
        begin
          MainOutMessage(format('[Error] process AiYouXi Pay Result Failed(F2-Callback). 签名不匹配！ Data: %s',[Data]));
          Exit;
        end;

      end
      else
      begin
         //未知方法 method
         MainOutMessage(format('[Error] process AiYouXi Pay Result Failed. 所请求方法不存在！ Method: %s, Data: %s',
              [method, Data]));
      end;

     
  except on E:Exception do
  begin
    MainOutMessage('[Error] process YingYongHui Pay Result Failed. unexpect exception! error. respData: ' + Data);
    Exit;
  end;
  end;

end;

end.
