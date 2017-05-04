unit TencentPayUnit;

interface

uses
  Windows, uLkJSON, TUHttpHelper, SysUtils, Classes, ActiveX, DateUtils, HTTPApp,
  WinInet, HmacSha1_TLB;

type
  TTencentBalance = record
    Request: string; //��ȡ�û���Ϸ���������
    RequestTimes: Integer; //�������
    Balance: Integer; //��Ѷ ������Ϸ�����
    SaveAmt: Integer; //��Ѷ �ۼƳ�ֵ����Ϸ������
    IsSuccess: boolean; //�Ƿ���
//  Response:string;  //��ȡ�û���Ϸ�������Ӧ
  end;

  TTencentCoin = record
    CoinAmount: Integer;
    ZoneId: string;
    BillNo: string;
    Data: string;
    OpenAPI: string;
    Balance: Integer; //��Ѷ ������Ϸ�����
    IsSuccess: boolean; //�Ƿ���ɹ����۳���Ϸ�ҳɹ�/������Ϸ�ҳɹ���
    Request: string; //��Ϸ�Ҳ�������
//  Response:string;  //��Ϸ�Ҳ�����Ӧ
  end;

  {��Ѷ֧����֤�࣬�½�����}
  TTencentPay = class
  private
    FTencentBalanceThread: THandle; //��������߳̾�������ڹر��̡߳�
    FTencentCoinThread: THandle; //��������߳̾�������ڹر��̡߳�
    TencentBalance: TTencentBalance;
    TencentCoin: TTencentCoin;

    procedure SetCookies(payPlatform: Integer; requestURL, orgLoc, serverIp: string); //����cookie

    function TencentGetBalanceRequest(zoneid, Data: string): string; //��ѯ���������
    function processTencentGetBalance(request: string): Boolean; //ִ�в�ѯ�������

    //ʹ����Ϸ��֧����ȡ����Ϸ��֧����������Ϸ�ҵ�������
    function TencentGameCoinRequest(CoinAmount: Integer; ZoneId, BillNo, Data, OpenAPI: string): string;
    function processTencentCoinAction(ReqInfo: TTencentCoin; OpenAPI: string): Boolean; //ִ����Ϸ������
 //  function TencentGetBalanceThread(Param:Pointer):Integer;stdcall;   //��������߳�  ; times:Integer

  public
    constructor Create;

    //ͬ����Ѷ��Ϸ��������ҵ�Ԫ�����
    procedure TencentSynchroBalance(zoneid, Data: string; reqTimes: Integer); //ͬ�����
    //ʹ����Ϸ��֧����ȡ����Ϸ��֧����������Ϸ�ҵ�������
    procedure TencentGameCoinAction(CoinAmount: Integer; ZoneId, BillNo, Data, OpenAPI: string);
    procedure MainOutMessage(const Msg: string); //���Log
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

procedure TTencentPay.MainOutMessage(const Msg: string); //���Log
var
  s: string;
begin
  s := '[' + FormatDateTime('mmdd hh:nn:ss', Now) + '] ' + Msg;
  form1.Memo1.Lines.Add(s);
end;

function TencentGetBalanceThread(Param: Pointer): Integer; stdcall; //��������߳� ; times:Integer
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

    CurrentTick := GetTickCount; //��ȡ��ǰʱ��
    if (CurrentTick - StartTick) > 1500 then //ÿ15s����һ��(15000)����������ϴ������ʱ������
    begin
      StartTick := CurrentTick; //��¼��ǰ����ʱ��

      Server.TencentBalance.IsSuccess := Server.processTencentGetBalance(Server.TencentBalance.Request);
      if Server.TencentBalance.IsSuccess then //IsSuccess��ʾ��Ѷ��Ϸ�ҳ�ֵ�Ƿ���
      begin
        Server.MainOutMessage('[Log] ֧���ѵ��ʣ��û���' + IntToStr(Server.TencentBalance.Balance));
        Break;
      end;

      Dec(Server.TencentBalance.RequestTimes); //���������һ
    end

  end;
  Server.MainOutMessage('[Log] ��ѯ�����ɣ��û���' + IntToStr(Server.TencentBalance.Balance));

  //ͨ��Server.TencentBalance�����ݣ��Ա�ͬ��Ԫ����� TencentBalance.Balance

end;

//��ѯ�����Ҫ����Ԫ���������
{��ѯ���ӿ�-�ͻ���֧���ɹ��ص�������������������ѯ�����������ӣ��򷢷���Ӧ��ĿԪ����}

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
      MainOutMessage('[error] Tencent Pay Get Balance Failed. �˻�����id����! zoneid: ' + zoneid + ', Data: ' + Data);
      exit;
    end;

    jsdata := TlkJSON.ParseText(Data) as TlkJSONobject;
    if not assigned(jsdata) then
    begin
      MainOutMessage('[error] Tencent Pay Get Balance Failed. ��¼�ص���������! Data: ' + Data);
      exit;
    end;

    if (jsdata.IndexOfName('platform') >= 0) and (jsdata.IndexOfName('open_id') >= 0)
      and (jsdata.IndexOfName('pf') >= 0) and (jsdata.IndexOfName('pf_key') >= 0) then
    begin
      payPlatform := jsdata.Field['platform'].Value;
      openid := jsdata.Field['open_id'].Value;
      pf := jsdata.Field['pf'].Value;
      pf_key := jsdata.Field['pf_key'].Value;

      //openkey����Q��½ʱ����Q��½�ص����ȡ��paytokenֵ��΢�ŵ�½ʱ��΢�ŵ�½�ص����ȡ�Ĵ�access_tokenֵ��
      if (payPlatform = 1) and (jsdata.IndexOfName('PayToken') >= 0) then //QQ
      begin
        openkey := jsdata.Field['PayToken'].Value;
      end
      else if (payPlatform = 2) and (jsdata.IndexOfName('token') >= 0) then //΢��
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

  //������������
  OpenAPI := '/v3/r/mpay/get_balance_m';
  signStr0 := 'appid=' + TENCENT_MIDAS_OFFERID + '&openid=' + openid + '&openkey=' + openkey +
    '&pf=' + pf + '&pfkey=' + pf_key + '&ts=' + IntToStr(timestamp) + '&zoneid=' + zoneid;
 { signStr0:=StringReplace (signStr0, '@', '%40', [rfReplaceAll]);//������������@����@��Ҫ�ֶ�����Ϊ%40   }
  //MainOutMessage('signStr0: '+signStr0+#13#10);

  //��������������@����@Ҳ�ᱻ����Ϊ%N��ʽ����Ҫ�Ļ�@������ǩ������
  signStr := 'GET&' + HttpEncode(OpenAPI) + '&' + HttpEncode(signStr0);
  //MainOutMessage('signStr: '+signStr+#13#10);

  //'hex'С������ʹ�ã�����bytesToHexStr(hmac.Hash).ToLower(); 'base64'��Ѷ����ʹ�ã�����Convert.ToBase64String(hmac.Hash).
  sign := HmacSha1.HmacSha1Sign(signStr, TENCENT_MIDAS_APPKEY + '&', 'base64'); //ע�������appkeyָ�����״�ʦ��appkey, ���Ի�����ɳ��appkey, ��ʽ��������ʽ������appkey
  sign := HttpEncode(sign);

  requestStr := TENCENT_GET_BALANCE_URL + '?' + signStr0 + '&sig=' + sign;
  Result := requestStr;
  MainOutMessage('[Log] ��ѯ�������: ' + requestStr);

  SetCookies(payPlatform, TENCENT_GET_BALANCE_URL, '/mpay/get_balance_m', SERVER_IP);
  CounInitialize;
  //ʹ�ü�ʱ�����ж������
 { TencentTimer.Enabled := True;
  TencentTimer.Interval := 15000;//ÿ��15������һ��
  TencentRequestTimes := 0;               }
end;

procedure TTencentPay.TencentSynchroBalance(zoneid, Data: string; reqTimes: Integer); //ͬ�����
var
  ThreadID: DWORD;
begin
  //��ʼ��
  //TencentBalance := TTencentBalance.Create;
  TencentBalance.RequestTimes := reqTimes;
  TencentBalance.Balance := -1;
  TencentBalance.SaveAmt := -1;
  TencentBalance.Request := TencentGetBalanceRequest(zoneid, Data); //��������

  if Trim(TencentBalance.Request) = '' then
  begin
    MainOutMessage('[error] TencentSynchroBalance Failed. Request can not be null! Request: ' + TencentBalance.Request);
    Exit;
  end;

  //��һ���̣߳��������߼��ж�ֻ����һ�Σ����������Ρ�
  FTencentBalanceThread := CreateThread(nil, 0, @TencentGetBalanceThread, Pointer(Self), 0, ThreadID);
  if FTencentBalanceThread = 0 then
  begin
    MainOutMessage(Format('[Error]Create TencentGetBalanceThread Failed: %d', [GetLastError]));
  end;

end;

function TTencentPay.processTencentGetBalance(request: string): Boolean; //���Ͳ�ѯ�������
var
  returnJs: string;
  jsdata: TlkJSONobject;
  save_amt: Integer;
  //StartTick:Cardinal;

begin
  jsdata := nil;
  Result := False;

  try
      //Ȼ�� �����ѯ��Ԫ����������.
    returnJs := Utf8ToAnsi(mHttpHelper.HttpsGet(TencentBalance.Request));
    MainOutMessage('[Log] ��ѯ���������Ӧ (' + IntToStr(TencentBalance.RequestTimes) + ') ' + returnJs);

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
      if (jsdata.IndexOfName('save_amt') >= 0) and (jsdata.IndexOfName('balance') >= 0) then //save_amt: �ۼƳ�ֵ������Ϸ������
      begin
        save_amt := jsdata.Field['save_amt'].Value;
        TencentBalance.Balance := jsdata.Field['balance'].Value;

        if TencentBalance.SaveAmt = -1 then //��һ�������ʱ��
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
        MainOutMessage('[Error] Tencent Timer Get Balance Failed. Return Data Error��returnJs��' + returnJs);

    end
    else
    begin
      MainOutMessage('[Error] Tencent Timer Get Balance Failed. ���������returnJs��' + returnJs);
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


{����ƽ̨��������cookie}

procedure TTencentPay.SetCookies(payPlatform: Integer; requestURL, orgLoc, serverIp: string);
begin
  if payPlatform = 1 then //����QQ cookie
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
  else //����΢��cookie
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
  //����ʣ�µ�cookie
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
  CoInitialize(nil); //��ʼ��COM����������������þ�����ʱ���ܽ�����⣬��ΪĬ���ǳ�ʼ�����̵߳ģ�ֻ�������̻߳򷽷�������С�
  jsdata := nil;
  HmacSha1 := CoHmacSha1Class.Create;

  { ע��:΢�ŵ�¼̬����Q��¼̬ʹ�õ�֧���ӿ���ͬ��֧��ID��ͬ�������ʹ�õ�appid��appkey��
  ʹ��֧����offerid��appkey��offerid��ӦQQ��APPID��appkey��Ӧ֧����appkey(����ɳ�������)}

  ConsumeCoinURL := TENCENT_SDK_URL + OpenAPI;
  timestamp := DateTimeToUnix(Now) - 8 * 60 * 60;

  if Trim(zoneId) = '' then
  begin
    MainOutMessage('[error] Tencent Pay Get Balance Failed. �˻�����id����! zoneId: ' + zoneId + ', Data: ' + data);
    exit;
  end;

  if coinAmount <= 0 then
  begin
    MainOutMessage('[error] Tencent GameCoinAction Data error(3): coinAmount�������0. coinAmount: ' + IntToStr(coinAmount) +
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

      //openkey����Q��½ʱ����Q��½�ص����ȡ��paytokenֵ��΢�ŵ�½ʱ��΢�ŵ�½�ص����ȡ�Ĵ�access_tokenֵ��
      if (payPlatform = 1) and (jsdata.IndexOfName('PayToken') >= 0) then //QQ
      begin
        openkey := jsdata.Field['PayToken'].Value;
      end
      else if (payPlatform = 2) and (jsdata.IndexOfName('token') >= 0) then //΢��
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

  //������������
  EncodeURL := '/v3/r' + OpenAPI;
  if OpenAPI = '/mpay/present_m' then //������Ϸ��
    signStr0 := 'appid=' + TENCENT_MIDAS_OFFERID + '&billno=' + billno + '&openid=' + openid + '&openkey=' + openkey + '&pf=' + pf +
      '&pfkey=' + pf_key + '&presenttimes=' + IntToStr(coinAmount) + '&ts=' + IntToStr(timestamp) + '&zoneid=' + zoneId

  else //��Ϸ��֧����ȡ��֧��
    signStr0 := 'amt=' + IntToStr(coinAmount) + '&appid=' + TENCENT_MIDAS_OFFERID + '&billno=' + billno + '&openid=' + openid + '&openkey=' + openkey +
      '&pf=' + pf + '&pfkey=' + pf_key + '&ts=' + IntToStr(timestamp) + '&zoneid=' + zoneId;
  //MainOutMessage('[Log] signStr0: '+signStr0+#13#10);

  signStr := 'GET&' + HttpEncode(EncodeURL) + '&' + HttpEncode(signStr0);
  //MainOutMessage('[Log] signStr: '+signStr+#13#10);

  //'hex'С������ʹ�ã�����bytesToHexStr(hmac.Hash).ToLower(); 'base64'��Ѷ����ʹ�ã�����Convert.ToBase64String(hmac.Hash).
  sign := HmacSha1.HmacSha1Sign(signStr, TENCENT_MIDAS_APPKEY + '&', 'base64'); //ע�������appkeyָ�����״�ʦ��appkey, ���Ի�����ɳ��appkey, ��ʽ��������ʽ������appkey
  sign := HttpEncode(sign);
  //MainOutMessage('[Log] sign: '+sign+#13#10);

  requestStr := ConsumeCoinURL + '?' + signStr0 + '&sig=' + sign;
  SetCookies(payPlatform, ConsumeCoinURL, OpenAPI, SERVER_IP);
  Result := requestStr;
  //Ȼ�� �����ѯ��Ԫ����������.
  //Result := Utf8ToAnsi(HttpsGet(requestStr));
  CoUninitialize(); //�����ʼ��COM����
end;

function TencentCoinActionThread(Param: Pointer): Integer; stdcall; //������Ϸ�Ҳ����߳� ; times:Integer
var
  Server: TTencentPay;
  //ReqInfo:TTencentCoin;
  times: Integer;
  executeTimeTick, StartTick: Cardinal;
begin
  Server := TTencentPay(Param);
  //ReqInfo:= Server.TencentCoin;
  times := 3;

  //����ʧ��Ҫ���Լ��飬������Ѷ��������Ϸ����Ϸ�������᲻ͳһ���������Ѷ��߲����ɹ�����ͬ��
  while times > 0 do
  begin

    StartTick := GetTickCount; //��ȡ��ǰʱ��
    if (StartTick - executeTimeTick) > 1500 then //ÿ15s����һ��(15000)����������ϴ������ʱ������
    begin
      executeTimeTick := StartTick; //��¼��ǰ����ʱ��

      Server.TencentCoin.isSuccess := Server.processTencentCoinAction(Server.TencentCoin, Server.TencentCoin.OpenAPI);
      if Server.TencentCoin.isSuccess then
        break;

      Dec(times); //���������һ
    end;

  end;
  Server.MainOutMessage('[Log] ��Ϸ�Ҳ�����ɣ��û���' + IntToStr(Server.TencentCoin.Balance));
  //Server.TencentCoin.isSuccess := Server.TencentCoinActionExecute(Server.TencentCoin, Server.TencentCoin.OpenAPI);

end;

function TTencentPay.processTencentCoinAction(ReqInfo: TTencentCoin; OpenAPI: string): Boolean; //ִ������
var
  request, returnJs: string;
  jsdata: TlkJSONobject;
  success: Boolean; //�Ƿ񷢻��ɹ�

  ret: Integer; //�����롣0���ɹ���1001����������1018����½У��ʧ�ܡ�
  balance: Integer; //����֮�����Ϸ����������������Ϸ�ң�
  billno: string; //������ˮ��
begin
  ret := -1;
  Result := False;

  //��������
  request := TencentGameCoinRequest(ReqInfo.CoinAmount, ReqInfo.ZoneId, ReqInfo.BillNo, ReqInfo.Data, OpenAPI);
  if Trim(request) = '' then
  begin
    MainOutMessage('[error] Tencent CoinActionThread Failed. Request can not be null! Request: ' + request);
    Exit;
  end;
  MainOutMessage('[Log] ��Ϸ�Ҳ�������: ' + request);

  //����Ԫ������������.
  returnJs := Utf8ToAnsi(mHttpHelper.HttpsGet(request));
  MainOutMessage('[Log] ��Ϸ�Ҳ���������Ӧ: ' + returnJs);

  //�۳���Ϸ��
  {"ret":0,"balance":142,"gen_balance":32,"billno":"86756","used_gen_amt":10}
  //ȡ��֧��
  {"ret":0,"balance":152,"gen_balance":42,"billno":"86756"}
  //ֱ��������Ϸ��
  {"ret":0,"balance":157,"gen_balance":47,"billno":"86756"}
  //��������json���������
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

  {�жϲ����Ƿ�ɹ�}
  if OpenAPI = '/mpay/present_m' then //������Ϸ��
  begin

    if ret = 0 then //���ͳɹ���ͬ���ͻ�����Ϸ����� ����Ԫ����
    begin
      MainOutMessage('[Log] Tencent CoinActionThread ������Ϸ�ҳɹ�����' + IntToStr(balance));
      Result := True;
    end
    else //������Ϸ��ʧ�ܣ�����Ԫ��
    begin
      MainOutMessage('[Error] Tencent CoinActionThread ������Ϸ��ʧ��. Data: ' + returnJs);

    end;

  end
  else if OpenAPI = '/mpay/pay_m' then //��Ϸ��֧��
  begin

    if ret = 0 then //�۳���Ϸ�ҳɹ���������   1018
    begin
      MainOutMessage('[Log] Tencent CoinActionThread �۳�Ԫ���ɹ������з���. Data: ' + returnJs);

      //����
      success := False;

      //�����ɹ���ͬ��Ԫ�����
      if success then
      begin
        Result := True;
      end
      else
      begin
        //����ʧ�ܣ�����ȡ��֧���ӿڣ��˻��ѿ۳���Ϸ��
        processTencentCoinAction(ReqInfo, '/mpay/cancel_pay_m');
      end;

    end
    {�۳���Ϸ��ʧ�ܣ�ʧ��Ҫ���Լ��飬������Ѷ��������Ϸ����Ϸ�������᲻ͳһ�����ְ��Ѿ����˵��ߵ�Ԫ����������������
    �������Ѷ��߲����ɹ�����ͬ���� }
    else //��Ϸ��֧��ʧ�ܣ������ŵ���
    begin
      MainOutMessage('[Error] Tencent CoinActionThread �۳���Ϸ��ʧ��. Data: ' + returnJs);
    end;

  end
  else if OpenAPI = '/mpay/cancel_pay_m' then //ȡ��֧��
  begin

    if ret = 0 then //�˿�ɹ�
    begin
      MainOutMessage('[Log] Tencent CoinActionThread �˻��ѿ۳���Ϸ�ҳɹ�. Data: ' + returnJs);
      //����ʧ�ܣ�����ȡ��֧���ӿڣ��˻��ѿ۳���Ϸ��
      Result := True;
    end
    else //�˿�ʧ��
    begin
      MainOutMessage('[Error] Tencent CoinActionThread �˻��ѿ۳���Ϸ��ʧ��. Data: ' + returnJs);

    end;

  end
  else
  begin
    MainOutMessage('[Error] Tencent CoinActionThread Request error: δ֪��������: ' + OpenAPI + '. Data: ' + returnJs);
  end;

end;

procedure TTencentPay.TencentGameCoinAction(CoinAmount: Integer; ZoneId, BillNo, Data, OpenAPI: string); //ͬ�����
var
  ThreadID: DWORD;
begin
  //��ʼ��
  TencentCoin.Balance := -1;
  TencentCoin.CoinAmount := CoinAmount;
  TencentCoin.ZoneId := ZoneId;
  TencentCoin.BillNo := BillNo;
  TencentCoin.Data := Data; //��������
  TencentCoin.OpenAPI := OpenAPI; //��������
  TencentCoin.IsSuccess := False;

  //��һ���̣߳��������߼��ж�ֻ����һ�Σ����������Ρ�
  FTencentCoinThread := CreateThread(nil, 0, @TencentCoinActionThread, Pointer(Self), 0, ThreadID);
  if FTencentCoinThread = 0 then
  begin
    MainOutMessage(Format('[Error]Create TencentCoinActionThread Failed: %d', [GetLastError]));
  end;

end;
end.

