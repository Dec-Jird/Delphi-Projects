unit UnionAppPayUnit;

interface
uses
  uLkJSON, EncdDecd, SysUtils, ActiveX, Classes, UnionPayDLL_TLB;

function UnionAppPayGetOrder(order_id, order_time, order_amount, callbackInfo:
  string): string; //返回订单

function UnionAppPayVerify(ret_data: string): boolean;

implementation
uses Unit1, SDKConst; //, AsphyreMD5, IniFiles;

const
  UNION_ORDER_URL = 'https://gateway.test.95516.com/gateway/api/appTransReq.do';
  UNION_NOTIFY_URL = 'http://182.254.244.236:3358/unionapppay';

function UnionAppPayGetOrder(order_id, order_time, order_amount, callbackInfo:
  string): string; //返回订单
var
  UnionPayDLL: UnionPayDLLClass;
  union_order_id: string;

begin
  Result := '';
  
  try
    CoInitialize(nil);

    UnionPayDLL := CoUnionPayDLLClass.Create;
    Result := UnionPayDLL.GetUnionpayOrder(UNION_MERCHANT_ID, order_id,
      order_time, order_amount, callbackInfo, UNION_ORDER_URL,
      UNION_NOTIFY_URL);

    CoUninitialize;
  except
    on E: Exception do
    begin
      Form1.MainOutMessage('[Error] UnionAppPayGetOrder. 请求订单号出错，请确认DLL是否注册。merc_id='
        +
        UNION_MERCHANT_ID + ', order_id=' + order_id + ', order_time=' +
        order_time + ', orde    r_amount=' + order_amount + ', callbackInfo=' +
        callbackInfo + ', order_url=' + UNION_ORDER_URL +
        ', notify_url=' + UNION_NOTIFY_URL + ' Error: ' + E.Message);
      Exit;
    end;
  end;

end;

function UnionAppPayVerify(ret_data: string): boolean;
var
  UnionPayDLL: UnionPayDLLClass;

begin
  //调用dll获取订单，GetAliOrder为C#中接口
  Result := False;
  try
    CoInitialize(nil);
    UnionPayDLL := CoUnionPayDLLClass.Create;
    Result := UnionPayDLL.UnionpayVerify(ret_data);
    CoUninitialize;
  except
    on E: Exception do
    begin
      Form1.MainOutMessage('[Error] UnionAppPayVerify. 支付回调验签出错，连接DLL出错 Data： '
        + ret_data + ' Error: ' + E.Message);
      Exit;
    end;
  end;
end;

end.

