unit GoogleOAuth2Unit;
(*
OAuth 2.0 for Web Server Applications.

ʹ��http��ȸ��������֤֧���������Ҫ������5����
1����Google Developer Console�д���һ�� Web Application�˻����õ�
   client_id��client_secret �� redirect_uri����3��������߲��賣�õ�����Ϊǰ�ᣩ.
2����ȡAuthorization code .
3������code ��ȡaccess_token(һСʱ����Ч��)��refresh_token(��Ӧ�ô��ھ���Ч).
4������access_token��ʱ�����ƣ�������refresh_token��ȡ�µ�access_token.
5��ʹ��access_token ����Google API �ﵽ����Ŀ��.

Ҫ�õ��Ĳ�����client_id��client_secret ��redirect_uri/refresh_token��packageName(Ӧ�ð���)
    productId(��ƷID)��purchaseToken.

֧����֤������ȷ��json ��
   {
                      "kind": "androidpublisher#productPurchase",
                      "purchaseTimeMillis": long,��Ʒ�Ĺ���ʱ��.
                     *"purchaseState": integer,������������жϹ�����Ϣ��0 ����ɹ�;1 ȡ������.
                      "consumptionState": integer,��Ʒ����״̬��0 δ����;1 ���ĳɹ���.
                      "developerPayload": string �����Ĳ�����Ϣ.
   }

������������
(1) ���� access_token��(https://accounts.google.com/o/oauth2/token?grant_type=refresh_token
   &client_id={CLIENT_ID} &client_secret = {CLIENT_SECRET} &refresh_token = {REFRESH_TOKEN}).
(2)��֤֧�����(https: //www.googleapis.com/androidpublisher/v2/applications/{packageName}
  / purchases / products / {productId} / tokens / {purchaseToken} ?access_token = {access_token}).
(3)�ο���վds��http: //blog.csdn.net/hjun01/article/details/42032841

�������β�����
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

//post���� ��ˢ��access_token, access_token���ں󣬿���ʹ��refresh_token���κ�ʱ�䣬���ˢ��access_token.

function TGoogleOAuth2.RefreshAccessToken(accessTokenJs: TlkJSONobject): Boolean;
const
  HEADER = 'Content-Type:application/x-www-form-urlencoded';
  GOOGLE_OAUTH2_TOKEN_URL = 'https://accounts.google.com/o/oauth2/token';
var
  Jso: TlkJSONobject;
  valid_time: Integer; //��Чʱ��.
  access_token: string;
  postInfo: string;
  respData: string;

begin
  Result := False;
  //����������ʼ��access_token
  if (accessTokenJs.IndexOfName('access_token') < 0) or (accessTokenJs.IndexOfName('valid_time') < 0) then
  begin
    accessTokenJs.Add('access_token', '');
    accessTokenJs.Add('valid_time', 0);
  end;

  Form1.MainOutMessage('[Log] ʱ�� DIFFER: ' + IntToStr(accessTokenJs.Field['valid_time'].Value - DateTimeToUnixDateInt(now)));

  //���λ�ȡaccess_token��access_token����3���Ӿ͹��ڵ�ʱ�������µ�access_token
  if (accessTokenJs.Field['access_token'].Value = '') or (accessTokenJs.Field['valid_time'].Value = 0)
    or ((accessTokenJs.Field['valid_time'].Value - DateTimeToUnixDateInt(now)) < 180) then
  begin

    postInfo := 'refresh_token=' + OAUTH2_REFRESH_TOKEN + '&client_id=' + OAUTH2_CLIENT_ID +
      '&client_secret=' + OAUTH2_CLIENT_SECRET + '&grant_type=refresh_token';

    //Post����,����refresh_token:��client_id�� client_secret��������ˢ�� access_token.
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
        //������Чʱ��valid_time(��ǰʱ��+��Ч��).
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
  //  Form1.MainOutMessage('[Log] GoogleOAuth2 RefreshAccessToken Token��δ���ڣ�');

end;

//Get����������֤֧����json.  ����access_token������GoogleApi�����ѯ֧���������

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
    Form1.MainOutMessage('[Error] GoogleOAuth2 GetVerifyJson �������Ϊ�գ�access_token: ' + access_token);
    Exit;
  end;

  requestUrl := GOOGLE_PURCHASE_URL + package_name + '/purchases/products/' + product_id + '/tokens/' + purchase_token + '?access_token=' + access_token;
  Form1.MainOutMessage('[Log] GoogleOAuth2 GetVerifyJson  ����' + requestUrl);
  try
    //Get��������ȸ�֧����֤���json.
    respData := mHttpHelper.HttpsGet(requestUrl);
    //�����õ���json.
    Jso := TlkJSON.ParseText(UTF8Decode(respData)) as TlkJSONobject;
    if not assigned(Jso) then
    begin
      Form1.MainOutMessage('[Error] GoogleOAuth2 GetAccessToken Failed. Response Data error. Data: ' + respData);
      exit;
    end;

    //�����������£��������ݿ�
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

