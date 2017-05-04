unit TencentLoginUnit;

interface

uses
  uLkJSON, DateUtils, SysUtils;
  //TlkJSONobject DateTimeToUnix Now()依赖的库
type

  //不包含构造函数constructor Create; 调用时不需要X.Create
  TTencentLogin = class
  private

  public
    function TencentLoginRequest(clientData: string): string; //返回requestData
    function TencentLoginVerify(respData: string): boolean;
  end;

implementation

uses
  Unit1, TUTools, SDKConst;

function TTencentLogin.TencentLoginRequest(clientData: string): string; //返回requestData
var
  openid, openkey, sign: string;
  timestamp, loginPlatform: Integer;
  jsdata: TlkJSONobject;

begin
  jsdata := nil;
  Result := '';

  timestamp := DateTimeToUnix(Now) - 8 * 60 * 60;
  try
    jsdata := TlkJSON.ParseText(clientData) as TlkJSONobject;
    if not assigned(jsdata) then
    begin
      Form1.MainOutMessage('[Error] Tencent Login Request Failed. Client Data error. Data: ' + clientData);
      exit;
    end;

    if (jsdata.IndexOfName('platform') >= 0) and (jsdata.IndexOfName('token') >= 0) and (jsdata.IndexOfName('open_id') >= 0) then
    begin
      loginPlatform := jsdata.Field['platform'].Value;
      openkey := jsdata.Field['token'].Value;
      openid := jsdata.Field['open_id'].Value;
    end
    else
    begin
      Form1.MainOutMessage('[Error] Tencent Login Request Failed. Parameter not exist! Data: ' + clientData);
      jsdata.Free;
      exit;
    end;

  except on E: Exception do
    begin
      Form1.MainOutMessage('[Error] Tencent Login Request Failed. catch exception:' + E.Message + ', Data: ' + clientData);
      jsdata.Free;
      Exit;
    end;
  end;

  //针对不同平台进行签名.
  if loginPlatform = 1 then //QQ 请求时使用QQ的App_Id和App_Key
  begin
    sign := LowerCase(Md5(TENCENT_QQ_APPKEY + IntToStr(timestamp)));
    Result := TENCENT_LOGIN_URL + '/qq_check_token?' + 'timestamp=' + IntToStr(timestamp) + '&appid=' + TENCENT_QQ_APPID +
      '&sig=' + sign + '&openid=' + openid + '&openkey=' + openkey
  end
  else //微信 请求时使用微信的App_Id和App_Key
  begin
    sign := LowerCase(Md5(TENCENT_WX_APPKEY + IntToStr(timestamp)));
    Result := TENCENT_LOGIN_URL + '/wx_check_token?' + 'timestamp=' + IntToStr(timestamp) + '&appid=' + TENCENT_WX_APPID +
      '&sig=' + sign + '&openid=' + openid + '&openkey=' + openkey;
  end;
  
end;

function TTencentLogin.TencentLoginVerify(respData: string): boolean;
var
  js: TlkJSONobject;
begin
  js := nil;
  Result := False;
  try
    js := TlkJSON.ParseText(respData) as TlkJSONobject;
    if not assigned(js) then
    begin
      Form1.MainOutMessage('[Error] Tencent Login Verify Failed. Response Data error. Data: ' + respData);
      exit;
    end;

    if (js.IndexOfName('ret') >= 0) and (js.IndexOfName('msg') >= 0) then
    begin
      if js.Field['ret'].Value = 0 then
      begin
        Result := True;
        //Form1.MainOutMessage('[Log] 登录验证成功！UID ');
      end
      else
      begin
        Form1.MainOutMessage('[Error] Tencent Login Verify Failed. 登录失败. Data: ' + respData);
      end;
      js.Free;

    end
    else
    begin
      Form1.MainOutMessage('[Error] Tencent Login Verify Failed. Parameter not exist! Data: ' + respData);
    end;

  except on E: Exception do
    begin
      Form1.MainOutMessage('[Error] Tencent Login Verify Failed. catch exception:' + E.Message + ', Data: ' + respData);
      js.Free;
      Exit;
    end;
  end;

end;

end.

