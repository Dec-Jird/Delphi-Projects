unit SDKConst;

interface

const
  Header = 'Content-Type:application/x-www-form-urlencoded';
  
  //google
  {��google��̨��ȡ�Ĳ���client_id��client_secret��refresh_token��ͨ������õ���}
  OAUTH2_REFRESH_TOKEN = '1/qnU8Dk6JDvrGewjdXtdUdvspeR1GdLSwjkiMComJ6QfJVHrhjV_4k1wh2GuxheOO';
  OAUTH2_CLIENT_ID = '747314688519-ee34q2qdgomlh35knesaue51trrn0d1u.apps.googleusercontent.com';
  OAUTH2_CLIENT_SECRET = '8K2eNCH08ov95QsrkOiibRyl';

  //��Ѷ
  TENCENT_QQ_APPID = '1104936787';
  TENCENT_QQ_APPKEY = 'BZMsqGV02ZxTZBLu';
  TENCENT_WX_APPID = 'wx352b03a01f2253c1';
  TENCENT_WX_APPKEY = 'f206cef86c174b72d887f23094e9ce88';

  TENCENT_LOGIN_URL = 'http://ysdktest.qq.com/auth';
 { QQLoginURL = 'http://ysdk.qq.com/auth/qq_check_token';//����URL http://ysdktest.qq.com/auth/qq_check_token
  WXLoginURL = 'http://ysdk.qq.com/auth/wx_check_token';//����URL http://ysdktest.qq.com/auth/wx_check_token    }

  { ע��:΢�ŵ�¼̬����Q��¼̬ʹ�õ�֧���ӿ���ͬ��֧��ID��ͬ�������ʹ�õ�appid��appkey��
  ʹ��֧����offerid��appkey��offerid��ӦQQ��APPID��appkey��Ӧ֧����appkey(����ɳ�������)}
  TENCENT_MIDAS_OFFERID = '1104936787'; //�״�ʦappid(QQ_APP_ID)
  TENCENT_MIDAS_APPKEY = 'BZMsqGV02ZxTZBLu'; //�״�ʦ����appKey:P4d26OxLKq45pk2ATTbZ5C7ESNCy2aFT ɳ��BZMsqGV02ZxTZBLu
  TENCENT_SDK_URL = 'https://ysdktest.qq.com';
  TENCENT_GET_BALANCE_URL = 'https://ysdktest.qq.com/mpay/get_balance_m';
  SERVER_IP = '192.168.21.116';


  //֧�����̻�֧����������������̻�Ӧ��id���̻�˽Կ�����﹫Կ
  ALI_APP_ID = '2016080400162673';

  //΢���̻�֧��      
  WX_APPPAY_ORDER_URL = 'https://api.mch.weixin.qq.com/pay/unifiedorder';
  WX_APPPAY_APP_ID = 'wx8b163c8fb479c29e'; //Ӧ��Id
  WX_APPPAY_MCH_ID = '1444147502'; //�̻���
  WX_APPPAY_MCH_KEY = 'OFPgwJXw0K6rVkIHebL8FMU0k2ASjvHQ'; //�̻�key

  //�����̻�֧��
  UNION_MERCHANT_ID = '777290058143823';

implementation

end.
