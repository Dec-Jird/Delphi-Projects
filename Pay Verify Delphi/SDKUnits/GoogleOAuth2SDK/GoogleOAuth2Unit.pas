unit GoogleOAuth2Unit;
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

刀塔西游参数：
Client ID
747314688519-ee34q2qdgomlh35knesaue51trrn0d1u.apps.googleusercontent.com

Client secret
8K2eNCH08ov95QsrkOiibRyl

refresh_token
1/qnU8Dk6JDvrGewjdXtdUdvspeR1GdLSwjkiMComJ6QfJVHrhjV_4k1wh2GuxheOO
*)

interface

uses
  uLkJSON, TUHttpHelper, SysUtils, Classes; //json, http, time, TStringList

type

  TGoogleOAuth2 = class
  private

  public
    constructor Create;

    function RefreshAccessToken(accessTokenJs: TlkJSONobject): Boolean;
    function GetVerifyJson(package_name, product_id, purchase_token, access_token: string): string;
  end;

var
  mHttpHelper: THttpHelper;
  //accessTokenJs: TlkJSONobject;

implementation
uses Unit1, TUTools, SDKConst; //, AsphyreMD5, IniFiles;

{ TGoogleOAuth2 }

constructor TGoogleOAuth2.Create;
begin
  mHttpHelper := THttpHelper.Create;

 { accessTokenJs := TlkJSONobject.Create;
  accessTokenJs.Add('access_token','');
  accessTokenJs.Add('valid_time',0);             }
  //Form1.MainOutMessage('[Log] Create accessTokenJs: ' + TlkJSON.GenerateText(accessTokenJs));
end;

//post请求 ，刷新access_token, access_token过期后，可以使用refresh_token在任何时间，多次刷新access_token.

function TGoogleOAuth2.RefreshAccessToken(accessTokenJs: TlkJSONobject): Boolean;
const
  HEADER = 'Content-Type:application/x-www-form-urlencoded';
  GOOGLE_OAUTH2_TOKEN_URL = 'https://accounts.google.com/o/oauth2/token';
var
  Jso: TlkJSONobject;
  valid_time: Integer; //有效时间.
  access_token: string;
  postInfo: string;
  respData: string;

begin
  Result := False;
  //初次启动初始化access_token
  if (accessTokenJs.IndexOfName('access_token') < 0) or (accessTokenJs.IndexOfName('valid_time') < 0) then
  begin
    accessTokenJs.Add('access_token', '');
    accessTokenJs.Add('valid_time', 0);
  end;

  Form1.MainOutMessage('[Log] 时间 DIFFER: ' + IntToStr(accessTokenJs.Field['valid_time'].Value - DateTimeToUnixDateInt(now)));

  //初次获取access_token和access_token还有3分钟就过期的时候，请求新的access_token
  if (accessTokenJs.Field['access_token'].Value = '') or (accessTokenJs.Field['valid_time'].Value = 0)
    or ((accessTokenJs.Field['valid_time'].Value - DateTimeToUnixDateInt(now)) < 180) then
  begin

    postInfo := 'refresh_token=' + OAUTH2_REFRESH_TOKEN + '&client_id=' + OAUTH2_CLIENT_ID +
      '&client_secret=' + OAUTH2_CLIENT_SECRET + '&grant_type=refresh_token';

    //Post请求,依靠refresh_token:、client_id、 client_secret三个参数刷新 access_token.
    respData := mHttpHelper.HttpsPost(GOOGLE_OAUTH2_TOKEN_URL, postInfo, HEADER);
    try
      {"access_token" : "xxx","expires_in" : 3600, "token_type" : "Bearer"}//3600s = 60min
      Jso := TlkJSON.ParseText(UTF8Decode(respData)) as TlkJSONobject;
      if not assigned(Jso) then
      begin
        Form1.MainOutMessage('[Error] GoogleOAuth2 RefreshAccessToken Failed. Response Data error. Data: ' + respData);
        exit;
      end;

      if (Jso.Field['access_token'] <> nil) and (Jso.Field['expires_in'] <> nil) then
      begin
        //生成有效时间valid_time(当前时间+有效期).
        access_token := (Jso.Field['access_token'] as TlkJSONstring).Value;
        valid_time := DateTimeToUnixDateInt(now) + (Jso.Field['expires_in'] as TlkJSONnumber).Value;

        accessTokenJs.Field['access_token'].Value := access_token;
        accessTokenJs.Field['valid_time'].Value := valid_time;

        Result := True;
        Form1.MainOutMessage('[Log] GoogleOAuth2 RefreshAccessToken: ' + TlkJSON.GenerateText(accessTokenJs) + SLineBreak);
      end
      else
      begin
        Form1.MainOutMessage('[Error] GoogleOAuth2 RefreshAccessToken Failed. Parameter not exist! Data: ' + respData);
      end;
      Jso.Free;

    except on E: Exception do
      begin
        Form1.MainOutMessage(format('[Error] GoogleOAuth2 RefreshAccessToken Failed. unknown exception. error: %s, Data: %s',
          [e.message, respData]));
        Jso.Free;
        Exit;
      end;
    end;

  end
  else
    Result := True;
  //  Form1.MainOutMessage('[Log] GoogleOAuth2 RefreshAccessToken Token还未过期！');

end;

//Get请求，请求验证支付的json.  带着access_token参数向GoogleApi发起查询支付情况请求

function TGoogleOAuth2.GetVerifyJson(package_name, product_id, purchase_token, access_token: string): string;
const
  GOOGLE_PURCHASE_URL = 'https://www.googleapis.com/androidpublisher/v2/applications/';
var
  requestUrl, respData: string;
  Jso: TlkJSONobject;
  purchaseTimeMillis: string;
  purchaseState: string;
  developerPayload: string;

begin
  Jso := nil;
  Result := 'Purchase GetVerifyJson Failed!';

  if (Trim(package_name) = '') or (Trim(product_id) = '') or (Trim(purchase_token) = '') or (Trim(access_token) = '') then
  begin
    Form1.MainOutMessage('[Error] GoogleOAuth2 GetVerifyJson 请求参数为空！access_token: ' + access_token);
    Exit;
  end;

  requestUrl := GOOGLE_PURCHASE_URL + package_name + '/purchases/products/' + product_id + '/tokens/' + purchase_token + '?access_token=' + access_token;
  Form1.MainOutMessage('[Log] GoogleOAuth2 GetVerifyJson  请求：' + requestUrl);
  try
    //Get请求，请求谷歌支付验证结果json.
    respData := mHttpHelper.HttpsGet(requestUrl);
    //解析得到的json.
    Jso := TlkJSON.ParseText(UTF8Decode(respData)) as TlkJSONobject;
    if not assigned(Jso) then
    begin
      Form1.MainOutMessage('[Error] GoogleOAuth2 GetAccessToken Failed. Response Data error. Data: ' + respData);
      exit;
    end;

    //返回数据如下，存入数据库
    if (Jso.Field['purchaseTimeMillis'] <> nil) and (Jso.Field['purchaseState'] <> nil) and (Jso.Field['developerPayload'] <> nil) then
    begin
      purchaseTimeMillis := Jso.Field['purchaseTimeMillis'].Value;
      purchaseState := Jso.Field['purchaseState'].Value;
      developerPayload := Jso.Field['developerPayload'].Value;

      Result := '{"purchaseTimeMillis":' + purchaseTimeMillis + ',"purchaseState":' + purchaseState +
        ',"developerPayload":"' + developerPayload + '"}';
    end
    else
    begin
      Form1.MainOutMessage('[Error] GoogleOAuth2 GetAccessToken Failed. Parameter not exist! Data: ' + respData);
    end;
    Jso.Free;

  except on E: Exception do
    begin
      Form1.MainOutMessage(format('[Error] GoogleOAuth2 GetVerifyJson Failed. unknown exception. error: %s, Data: %s',
        [e.message, respData]));
      Jso.Free;
      Exit;
    end;
  end;

end;

end.

