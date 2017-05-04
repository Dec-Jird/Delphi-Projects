unit TencentPayUnit;

interface

uses
  Windows, uLkJSON, TUHttpHelper, SysUtils, Classes, ActiveX, DateUtils, HTTPApp,
  WinInet, HmacSha1_TLB;

type
  TTencentBalance = record
    Request: string; //获取用户游戏币余额请求
    RequestTimes: Integer; //请求次数
    Balance: Integer; //腾讯 最新游戏币余额
    SaveAmt: Integer; //腾讯 累计充值的游戏币数量
    IsSuccess: boolean; //是否到帐
//  Response:string;  //获取用户游戏币余额响应
  end;

  TTencentCoin = record
    CoinAmount: Integer;
    ZoneId: string;
    BillNo: string;
    Data: string;
    OpenAPI: string;
    Balance: Integer; //腾讯 最新游戏币余额
    IsSuccess: boolean; //是否处理成功（扣除游戏币成功/赠送游戏币成功）
    Request: string; //游戏币操作请求
//  Response:string;  //游戏币操作响应
  end;

  {腾讯支付验证类，新建了类}
  TTencentPay = class
  private
    FTencentBalanceThread: THandle; //请求余额线程句柄，用于关闭线程。
    FTencentCoinThread: THandle; //请求余额线程句柄，用于关闭线程。
    TencentBalance: TTencentBalance;
    TencentCoin: TTencentCoin;

    procedure SetCookies(payPlatform: Integer; requestURL, orgLoc, serverIp: string); //设置cookie

    function TencentGetBalanceRequest(zoneid, Data: string): string; //查询余额请求构造
    function processTencentGetBalance(request: string): Boolean; //执行查询余额请求

    //使用游戏币支付、取消游戏币支付、赠送游戏币的请求构造
    function TencentGameCoinRequest(CoinAmount: Integer; ZoneId, BillNo, Data, OpenAPI: string): string;
    function processTencentCoinAction(ReqInfo: TTencentCoin; OpenAPI: string): Boolean; //执行游戏币请求
 //  function TencentGetBalanceThread(Param:Pointer):Integer;stdcall;   //请求余额线程  ; times:Integer

  public
    constructor Create;

    //同步腾讯游戏币余额和玩家的元宝余额
    procedure TencentSynchroBalance(zoneid, Data: string; reqTimes: Integer); //同步余额
    //使用游戏币支付、取消游戏币支付、赠送游戏币的请求构造
    procedure TencentGameCoinAction(CoinAmount: Integer; ZoneId, BillNo, Data, OpenAPI: string);
    procedure MainOutMessage(const Msg: string); //输出Log
  end;

var
  mHttpHelper: THttpHelper;

implementation

uses
  Unit1, TUTools, SDKConst;

constructor TTencentPay.Create;
begin
  mHttpHelper := THttpHelper.Create;
end;

procedure TTencentPay.MainOutMessage(const Msg: string); //输出Log
var
  s: string;
begin
  s := '[' + FormatDateTime('mmdd hh:nn:ss', Now) + '] ' + Msg;
  form1.Memo1.Lines.Add(s);
end;

function TencentGetBalanceThread(Param: Pointer): Integer; stdcall; //请求余额线程 ; times:Integer
var
  Server: TTencentPay;
  reqResult: boolean;

  times: Integer;
  CurrentTick, StartTick: Cardinal;

begin
  Server := TTencentPay(Param);
  Server.TencentBalance.IsSuccess := False;

  while Server.TencentBalance.RequestTimes > 0 do
  begin

    CurrentTick := GetTickCount; //获取当前时间
    if (CurrentTick - StartTick) > 1500 then //每15s请求一次(15000)，计算距离上次请求的时间间隔。
    begin
      StartTick := CurrentTick; //记录当前请求时间

      Server.TencentBalance.IsSuccess := Server.processTencentGetBalance(Server.TencentBalance.Request);
      if Server.TencentBalance.IsSuccess then //IsSuccess表示腾讯游戏币充值是否到帐
      begin
        Server.MainOutMessage('[Log] 支付已到帐！用户余额：' + IntToStr(Server.TencentBalance.Balance));
        Break;
      end;

      Dec(Server.TencentBalance.RequestTimes); //请求次数减一
    end

  end;
  Server.MainOutMessage('[Log] 查询余额完成！用户余额：' + IntToStr(Server.TencentBalance.Balance));

  //通过Server.TencentBalance中数据，对比同步元宝余额 TencentBalance.Balance

end;

//查询余额需要返回元宝最新余额
{查询余额接口-客户端支付成功回调到服务器，服务器查询余额，如果余额增加，则发放相应数目元宝。}

function TTencentPay.TencentGetBalanceRequest(zoneid, Data: string): string;
var
  openid, openkey, pf, pf_key, signStr0, signStr, sign: string;
  timestamp, payPlatform: Integer;

  OpenAPI, requestStr: string;
  jsdata: TlkJSONobject;
  HmacSha1: HmacSha1Class;
begin
  jsdata := nil;
  CoInitialize(nil);
  HmacSha1 := CoHmacSha1Class.Create;
  timestamp := DateTimeToUnix(Now) - 8 * 60 * 60;

  try
    if Trim(zoneid) = '' then
    begin
      MainOutMessage('[error] Tencent Pay Get Balance Failed. 账户分区id有误! zoneid: ' + zoneid + ', Data: ' + Data);
      exit;
    end;

    jsdata := TlkJSON.ParseText(Data) as TlkJSONobject;
    if not assigned(jsdata) then
    begin
      MainOutMessage('[error] Tencent Pay Get Balance Failed. 登录回调参数有误! Data: ' + Data);
      exit;
    end;

    if (jsdata.IndexOfName('platform') >= 0) and (jsdata.IndexOfName('open_id') >= 0)
      and (jsdata.IndexOfName('pf') >= 0) and (jsdata.IndexOfName('pf_key') >= 0) then
    begin
      payPlatform := jsdata.Field['platform'].Value;
      openid := jsdata.Field['open_id'].Value;
      pf := jsdata.Field['pf'].Value;
      pf_key := jsdata.Field['pf_key'].Value;

      //openkey：手Q登陆时传手Q登陆回调里获取的paytoken值，微信登陆时传微信登陆回调里获取的传access_token值。
      if (payPlatform = 1) and (jsdata.IndexOfName('PayToken') >= 0) then //QQ
      begin
        openkey := jsdata.Field['PayToken'].Value;
      end
      else if (payPlatform = 2) and (jsdata.IndexOfName('token') >= 0) then //微信
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

  except on E: Exception do
    begin
      MainOutMessage('[error] Tencent Pay Get Balance Failed. unknown exception! Data: ' + Data);
      jsdata.Free;
      Exit;
    end;
  end;
  jsdata.Free;

  //构造请求数据
  OpenAPI := '/v3/r/mpay/get_balance_m';
  signStr0 := 'appid=' + TENCENT_MIDAS_OFFERID + '&openid=' + openid + '&openkey=' + openkey +
    '&pf=' + pf + '&pfkey=' + pf_key + '&ts=' + IntToStr(timestamp) + '&zoneid=' + zoneid;
 { signStr0:=StringReplace (signStr0, '@', '%40', [rfReplaceAll]);//如果参数里包含@，那@需要手动编码为%40   }
  //MainOutMessage('signStr0: '+signStr0+#13#10);

  //如果参数里面包含@，那@也会被编码为%N格式，需要改回@，否则签名错误。
  signStr := 'GET&' + HttpEncode(OpenAPI) + '&' + HttpEncode(signStr0);
  //MainOutMessage('signStr: '+signStr+#13#10);

  //'hex'小米渠道使用，返回bytesToHexStr(hmac.Hash).ToLower(); 'base64'腾讯渠道使用，返回Convert.ToBase64String(hmac.Hash).
  sign := HmacSha1.HmacSha1Sign(signStr, TENCENT_MIDAS_APPKEY + '&', 'base64'); //注意这里的appkey指的是米大师的appkey, 测试环境用沙箱appkey, 正式环境用正式环境的appkey
  sign := HttpEncode(sign);

  requestStr := TENCENT_GET_BALANCE_URL + '?' + signStr0 + '&sig=' + sign;
  Result := requestStr;
  MainOutMessage('[Log] 查询余额请求: ' + requestStr);

  SetCookies(payPlatform, TENCENT_GET_BALANCE_URL, '/mpay/get_balance_m', SERVER_IP);
  CounInitialize;
  //使用计时器进行多次请求
 { TencentTimer.Enabled := True;
  TencentTimer.Interval := 15000;//每隔15秒请求一次
  TencentRequestTimes := 0;               }
end;

procedure TTencentPay.TencentSynchroBalance(zoneid, Data: string; reqTimes: Integer); //同步余额
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
    MainOutMessage('[error] TencentSynchroBalance Failed. Request can not be null! Request: ' + TencentBalance.Request);
    Exit;
  end;

  //开一个线程，请求余额，逻辑判断只请求一次，还是请求多次。
  FTencentBalanceThread := CreateThread(nil, 0, @TencentGetBalanceThread, Pointer(Self), 0, ThreadID);
  if FTencentBalanceThread = 0 then
  begin
    MainOutMessage(Format('[Error]Create TencentGetBalanceThread Failed: %d', [GetLastError]));
  end;

end;

function TTencentPay.processTencentGetBalance(request: string): Boolean; //发送查询余额请求
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
    returnJs := Utf8ToAnsi(mHttpHelper.HttpsGet(TencentBalance.Request));
    MainOutMessage('[Log] 查询余额请求响应 (' + IntToStr(TencentBalance.RequestTimes) + ') ' + returnJs);

    {"ret" : 0,"balance" : 167,"gen_balance" : 57,"first_save" : 0,"save_amt" : 110,
      "gen_expire" : 0,"tss_list" : [],"save_sum" : 237,"cost_sum" : 70,"present_sum" : 127}
    jsdata := TlkJSON.ParseText(returnJs) as TlkJSONobject;
    if not assigned(jsdata) then
    begin
      MainOutMessage('[Error] Tencent Timer Get Balance Failed. returnData error(1). returnJs: ' + returnJs);
      exit;
    end;

    if (jsdata.IndexOfName('ret') >= 0) and (jsdata.Field['ret'].Value = 0) then
    begin
      if (jsdata.IndexOfName('save_amt') >= 0) and (jsdata.IndexOfName('balance') >= 0) then //save_amt: 累计充值金额的游戏币数量
      begin
        save_amt := jsdata.Field['save_amt'].Value;
        TencentBalance.Balance := jsdata.Field['balance'].Value;

        if TencentBalance.SaveAmt = -1 then //第一次请求的时候
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
        MainOutMessage('[Error] Tencent Timer Get Balance Failed. Return Data Error！returnJs：' + returnJs);

    end
    else
    begin
      MainOutMessage('[Error] Tencent Timer Get Balance Failed. 返回码错误！returnJs：' + returnJs);
      jsdata.Free;
      Exit;
    end;

  except on E: Exception do
    begin
      MainOutMessage('[Error] Tencent Timer Get Balance Failed. unknown exception!. returnJs: ' + returnJs);
      jsdata.Free;
      Exit;
    end;
  end;

end;


{根据平台类型设置cookie}

procedure TTencentPay.SetCookies(payPlatform: Integer; requestURL, orgLoc, serverIp: string);
begin
  if payPlatform = 1 then //设置QQ cookie
  begin
    if not InternetSetCookie(PAnsiChar(requestURL), 'session_id', PAnsiChar(httpEncode('openid'))) then
    begin
      MainOutMessage('[ERROR] Tencent SetCookies qq session_id: ' + SysErrorMessage(GetLastError));
    end;

    if not InternetSetCookie(PAnsiChar(requestURL), 'session_type', PAnsiChar(httpEncode('kp_actoken'))) then
    begin
      MainOutMessage('[ERROR] Tencent SetCookies qq session_type: ' + SysErrorMessage(GetLastError));
    end
  end
  else //设置微信cookie
  begin
    if not InternetSetCookie(PAnsiChar(requestURL), 'session_id', PAnsiChar(httpEncode('hy_gameid'))) then
    begin
      MainOutMessage('[ERROR] Tencent SetCookies wx session_id: ' + SysErrorMessage(GetLastError));
    end;

    if not InternetSetCookie(PAnsiChar(requestURL), 'session_type', PAnsiChar(httpEncode('wc_actoken'))) then
    begin
      MainOutMessage('[ERROR] Tencent SetCookies wx session_id: ' + SysErrorMessage(GetLastError));
    end;
  end;
  //设置剩下的cookie
  if not InternetSetCookie(PAnsiChar(requestURL), 'org_loc', PAnsiChar(httpEncode(orgLoc))) then
  begin
    MainOutMessage('[ERROR] Tencent SetCookies org_loc: ' + SysErrorMessage(GetLastError));
  end;

  if not InternetSetCookie(PAnsiChar(requestURL), 'appip', PAnsiChar(httpEncode(serverIp))) then
  begin
    MainOutMessage('[ERROR] Tencent SetCookies appip: ' + SysErrorMessage(GetLastError));
  end;
end;

function TTencentPay.TencentGameCoinRequest(coinAmount: Integer; zoneId, billNo, data, openAPI: string): string;
var
  openid, openkey, pf, pf_key, signStr0, signStr, sign: string;
  timestamp, payPlatform: Integer;

  ConsumeCoinURL, EncodeURL, requestStr, returnStr: string;
  jsdata: TlkJSONobject;

  HmacSha1: HmacSha1Class;
begin
  CoInitialize(nil); //初始化COM对象，在主方法加入该句子有时候不能解决问题，因为默认是初始化主线程的，只有在子线程或方法加入才行。
  jsdata := nil;
  HmacSha1 := CoHmacSha1Class.Create;

  { 注意:微信登录态和手Q登录态使用的支付接口相同，支付ID相同；服务端使用的appid和appkey都
  使用支付的offerid和appkey。offerid对应QQ的APPID，appkey对应支付的appkey(区分沙箱和现网)}

  ConsumeCoinURL := TENCENT_SDK_URL + OpenAPI;
  timestamp := DateTimeToUnix(Now) - 8 * 60 * 60;

  if Trim(zoneId) = '' then
  begin
    MainOutMessage('[error] Tencent Pay Get Balance Failed. 账户分区id有误! zoneId: ' + zoneId + ', Data: ' + data);
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

    if (jsdata.IndexOfName('platform') >= 0) and (jsdata.IndexOfName('open_id') >= 0)
      and (jsdata.IndexOfName('pf') >= 0) and (jsdata.IndexOfName('pf_key') >= 0) then
    begin
      payPlatform := jsdata.Field['platform'].Value;
      openid := jsdata.Field['open_id'].Value;
      pf := jsdata.Field['pf'].Value;
      pf_key := jsdata.Field['pf_key'].Value;

      //openkey：手Q登陆时传手Q登陆回调里获取的paytoken值，微信登陆时传微信登陆回调里获取的传access_token值。
      if (payPlatform = 1) and (jsdata.IndexOfName('PayToken') >= 0) then //QQ
      begin
        openkey := jsdata.Field['PayToken'].Value;
      end
      else if (payPlatform = 2) and (jsdata.IndexOfName('token') >= 0) then //微信
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

  except on E: Exception do
    begin
      MainOutMessage('[error] Tencent GameCoinAction Data error(2). returnStr: ' + returnStr);
      jsdata.Free;
      Exit;
    end;
  end;

  //构造请求数据
  EncodeURL := '/v3/r' + OpenAPI;
  if OpenAPI = '/mpay/present_m' then //赠送游戏币
    signStr0 := 'appid=' + TENCENT_MIDAS_OFFERID + '&billno=' + billno + '&openid=' + openid + '&openkey=' + openkey + '&pf=' + pf +
      '&pfkey=' + pf_key + '&presenttimes=' + IntToStr(coinAmount) + '&ts=' + IntToStr(timestamp) + '&zoneid=' + zoneId

  else //游戏币支付或取消支付
    signStr0 := 'amt=' + IntToStr(coinAmount) + '&appid=' + TENCENT_MIDAS_OFFERID + '&billno=' + billno + '&openid=' + openid + '&openkey=' + openkey +
      '&pf=' + pf + '&pfkey=' + pf_key + '&ts=' + IntToStr(timestamp) + '&zoneid=' + zoneId;
  //MainOutMessage('[Log] signStr0: '+signStr0+#13#10);

  signStr := 'GET&' + HttpEncode(EncodeURL) + '&' + HttpEncode(signStr0);
  //MainOutMessage('[Log] signStr: '+signStr+#13#10);

  //'hex'小米渠道使用，返回bytesToHexStr(hmac.Hash).ToLower(); 'base64'腾讯渠道使用，返回Convert.ToBase64String(hmac.Hash).
  sign := HmacSha1.HmacSha1Sign(signStr, TENCENT_MIDAS_APPKEY + '&', 'base64'); //注意这里的appkey指的是米大师的appkey, 测试环境用沙箱appkey, 正式环境用正式环境的appkey
  sign := HttpEncode(sign);
  //MainOutMessage('[Log] sign: '+sign+#13#10);

  requestStr := ConsumeCoinURL + '?' + signStr0 + '&sig=' + sign;
  SetCookies(payPlatform, ConsumeCoinURL, OpenAPI, SERVER_IP);
  Result := requestStr;
  //然后 发起查询用元宝余额的请求.
  //Result := Utf8ToAnsi(HttpsGet(requestStr));
  CoUninitialize(); //解除初始化COM对象
end;

function TencentCoinActionThread(Param: Pointer): Integer; stdcall; //请求游戏币操作线程 ; times:Integer
var
  Server: TTencentPay;
  //ReqInfo:TTencentCoin;
  times: Integer;
  executeTimeTick, StartTick: Cardinal;
begin
  Server := TTencentPay(Param);
  //ReqInfo:= Server.TencentCoin;
  times := 3;

  //操作失败要再试几遍，否则腾讯和我们游戏的游戏币数量会不统一，最好在腾讯这边操作成功后再同步
  while times > 0 do
  begin

    StartTick := GetTickCount; //获取当前时间
    if (StartTick - executeTimeTick) > 1500 then //每15s请求一次(15000)，计算距离上次请求的时间间隔。
    begin
      executeTimeTick := StartTick; //记录当前请求时间

      Server.TencentCoin.isSuccess := Server.processTencentCoinAction(Server.TencentCoin, Server.TencentCoin.OpenAPI);
      if Server.TencentCoin.isSuccess then
        break;

      Dec(times); //请求次数减一
    end;

  end;
  Server.MainOutMessage('[Log] 游戏币操作完成！用户余额：' + IntToStr(Server.TencentCoin.Balance));
  //Server.TencentCoin.isSuccess := Server.TencentCoinActionExecute(Server.TencentCoin, Server.TencentCoin.OpenAPI);

end;

function TTencentPay.processTencentCoinAction(ReqInfo: TTencentCoin; OpenAPI: string): Boolean; //执行请求
var
  request, returnJs: string;
  jsdata: TlkJSONobject;
  success: Boolean; //是否发货成功

  ret: Integer; //返回码。0：成功；1001：参数错误；1018：登陆校验失败。
  balance: Integer; //操作之后的游戏币余额（包含了赠送游戏币）
  billno: string; //操作流水号
begin
  ret := -1;
  Result := False;

  //构造请求
  request := TencentGameCoinRequest(ReqInfo.CoinAmount, ReqInfo.ZoneId, ReqInfo.BillNo, ReqInfo.Data, OpenAPI);
  if Trim(request) = '' then
  begin
    MainOutMessage('[error] Tencent CoinActionThread Failed. Request can not be null! Request: ' + request);
    Exit;
  end;
  MainOutMessage('[Log] 游戏币操作请求: ' + request);

  //发起元宝操作的请求.
  returnJs := Utf8ToAnsi(mHttpHelper.HttpsGet(request));
  MainOutMessage('[Log] 游戏币操作请求响应: ' + returnJs);

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

    if (jsdata.IndexOfName('ret') >= 0) then
      ret := jsdata.Field['ret'].Value;

    if (jsdata.IndexOfName('balance') >= 0) then
      TencentCoin.Balance := jsdata.Field['balance'].Value;

    if (jsdata.IndexOfName('billno') >= 0) then
      billno := jsdata.Field['billno'].Value;

  except on E: Exception do
    begin
      MainOutMessage('[Error] Tencent CoinActionThread Return Data error: unknown exception. Data: ' + returnJs);
      jsdata.Free;
      Exit;
    end;
  end;
  jsdata.Free;

  {判断操作是否成功}
  if OpenAPI = '/mpay/present_m' then //赠送游戏币
  begin

    if ret = 0 then //赠送成功，同步客户端游戏币余额 （发元宝）
    begin
      MainOutMessage('[Log] Tencent CoinActionThread 赠送游戏币成功，余额：' + IntToStr(balance));
      Result := True;
    end
    else //赠送游戏币失败，不发元宝
    begin
      MainOutMessage('[Error] Tencent CoinActionThread 赠送游戏币失败. Data: ' + returnJs);

    end;

  end
  else if OpenAPI = '/mpay/pay_m' then //游戏币支付
  begin

    if ret = 0 then //扣除游戏币成功，发道具   1018
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
      MainOutMessage('[Error] Tencent CoinActionThread 扣除游戏币失败. Data: ' + returnJs);
    end;

  end
  else if OpenAPI = '/mpay/cancel_pay_m' then //取消支付
  begin

    if ret = 0 then //退款成功
    begin
      MainOutMessage('[Log] Tencent CoinActionThread 退还已扣除游戏币成功. Data: ' + returnJs);
      //发货失败，调用取消支付接口，退还已扣除游戏币
      Result := True;
    end
    else //退款失败
    begin
      MainOutMessage('[Error] Tencent CoinActionThread 退还已扣除游戏币失败. Data: ' + returnJs);

    end;

  end
  else
  begin
    MainOutMessage('[Error] Tencent CoinActionThread Request error: 未知请求类型: ' + OpenAPI + '. Data: ' + returnJs);
  end;

end;

procedure TTencentPay.TencentGameCoinAction(CoinAmount: Integer; ZoneId, BillNo, Data, OpenAPI: string); //同步余额
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
  FTencentCoinThread := CreateThread(nil, 0, @TencentCoinActionThread, Pointer(Self), 0, ThreadID);
  if FTencentCoinThread = 0 then
  begin
    MainOutMessage(Format('[Error]Create TencentCoinActionThread Failed: %d', [GetLastError]));
  end;

end;
end.

