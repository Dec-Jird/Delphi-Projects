unit AliAppPayUnit;

interface
uses                                   //CreateOleObject
  uLkJSON, EncdDecd, SysUtils, Classes, Comobj, SDKConst;

function AliAppPayGetOrder(app_priv_key, ali_pub_key, subject, total_amount, out_trade_no,
    notify_url, callback_info: string): string; //���ض���

function AliAppPayVerify(ret_data, ali_pub_key: string): boolean;

implementation
  
const
  ALI_PAY_SIGN_AND_VERIFY_LIB_CLASS = 'AopApiSDK.AlipaySignAndVerifyClass'; //��Ҫ���õ�DLL���ж������
  ALI_APPPAY_DEV_GATEWAY = 'http://openapi.alipaydev.com/gateway.do';
  ALI_APPPAY_GATEWAY = 'https://openapi.alipay.com/gateway.do';

function AliAppPayGetOrder(app_priv_key, ali_pub_key, subject, total_amount, out_trade_no,
    notify_url, callback_info: string): string; //���ض���
var
  aClass: Variant;
  
begin
  //callbackInfo := HttpEncode(callbackInfo);
  {string GetAliOrder(string app_id, string app_priv_key, string ali_pub_key, string subject, string total_amount,
           string our_trade_no, string callbackInfo);    }

//        //֧�������ص�ַ
//        // -----ɳ���ַ-----
//        string serverUrl = "http://openapi.alipaydev.com/gateway.do";
//        // -----���ϵ�ַ-----
//        string serverUrl = "https://openapi.alipay.com/gateway.do";

  //����dll��ȡ������GetAliOrderΪC#�нӿ�
  aClass:= CreateOleObject(ALI_PAY_SIGN_AND_VERIFY_LIB_CLASS);
  Result := aClass.GetAliOrder (ALI_APPPAY_DEV_GATEWAY, ALI_APP_ID, app_priv_key, ali_pub_key, subject, total_amount,
      out_trade_no, notify_url, callback_info);
end;

function AliAppPayVerify(ret_data, ali_pub_key: string): boolean;
var
  aClass: Variant;

begin
  //����dll��ȡ������GetAliOrderΪC#�нӿ�
  aClass:= CreateOleObject(ALI_PAY_SIGN_AND_VERIFY_LIB_CLASS);
  Result := aClass.AlipayVerify (ret_data, ali_pub_key);
end;

end.
