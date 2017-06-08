unit SDKConst;

interface

const
  Header = 'Content-Type:application/x-www-form-urlencoded';
  
  //google
  {从google后台获取的参数client_id，client_secret；refresh_token（通过请求得到）}
  OAUTH2_REFRESH_TOKEN = '1/qnU8Dk6JDvrGewjdXtdUdvspeR1GdLSwjkiMComJ6QfJVHrhjV_4k1wh2GuxheOO';
  OAUTH2_CLIENT_ID = '747314688519-ee34q2qdgomlh35knesaue51trrn0d1u.apps.googleusercontent.com';
  OAUTH2_CLIENT_SECRET = '8K2eNCH08ov95QsrkOiibRyl';

  //腾讯
  TENCENT_QQ_APPID = '1104936787';
  TENCENT_QQ_APPKEY = 'BZMsqGV02ZxTZBLu';
  TENCENT_WX_APPID = 'wx352b03a01f2253c1';
  TENCENT_WX_APPKEY = 'f206cef86c174b72d887f23094e9ce88';

  TENCENT_LOGIN_URL = 'http://ysdktest.qq.com/auth';
 { QQLoginURL = 'http://ysdk.qq.com/auth/qq_check_token';//测试URL http://ysdktest.qq.com/auth/qq_check_token
  WXLoginURL = 'http://ysdk.qq.com/auth/wx_check_token';//测试URL http://ysdktest.qq.com/auth/wx_check_token    }

  { 注意:微信登录态和手Q登录态使用的支付接口相同，支付ID相同；服务端使用的appid和appkey都
  使用支付的offerid和appkey。offerid对应QQ的APPID，appkey对应支付的appkey(区分沙箱和现网)}
  TENCENT_MIDAS_OFFERID = '1104936787'; //米大师appid(QQ_APP_ID)
  TENCENT_MIDAS_APPKEY = 'BZMsqGV02ZxTZBLu'; //米大师现网appKey:P4d26OxLKq45pk2ATTbZ5C7ESNCy2aFT 沙箱BZMsqGV02ZxTZBLu
  TENCENT_SDK_URL = 'https://ysdktest.qq.com';
  TENCENT_GET_BALANCE_URL = 'https://ysdktest.qq.com/mpay/get_balance_m';
  SERVER_IP = '192.168.21.116';


  //支付宝商户支付所需参数：阿里商户应用id，商户私钥，阿里公钥
  ALI_APP_ID = '2016080400162673';

  //微信商户支付      
  WX_APPPAY_ORDER_URL = 'https://api.mch.weixin.qq.com/pay/unifiedorder';
  WX_APPPAY_APP_ID = 'wx8b163c8fb479c29e'; //应用Id
  WX_APPPAY_MCH_ID = '1444147502'; //商户号
  WX_APPPAY_MCH_KEY = 'OFPgwJXw0K6rVkIHebL8FMU0k2ASjvHQ'; //商户key

  //银联商户支付
  UNION_MERCHANT_ID = '777290058143823';

implementation

end.
