unit WXAppPayUnit;

interface
uses //xml解析
  SysUtils, Classes, TUTools, DateUtils, ActiveX, XMLIntf, XMLDoc, HttpPostXML_TLB;

function WXAppPayGetOrder(body, out_trade_no, spbill_create_ip, total_fee,
  callback_info: string): string; //返回订单

function AliAppPayVerify(Data: string): string;

function WXAPPPAYReadXml(xmlStr: string): TStringList;

implementation
uses Unit1, SDKConst; //, AsphyreMD5, IniFiles;

const
  WX_APPPAY_NOTIFY_URL = 'http://182.254.244.236:3358/weixinapppay';
  WX_APPPAY_TRADE_TYPE = 'APP';

  {  attach: string; //callbackInfo
    body: string; //商品描述
    out_trade_no: string; //订单号
    spbill_create_ip: string; //用户ip
    total_fee: string; //总金额： 分
    nonce_str: string; //随机字符串
  }

//使用C#实现的post函数发送xml数据

function WXAppPayGetOrder(body, out_trade_no, spbill_create_ip, total_fee,
  callback_info: string): string; //返回订单
var
  nonce_str: string; //随机字符串
  signStr: string;
  sign: string;

  timestamp: string;
  httpTool: HttpPostXMLClass;
  postData, respData: string;
  retList: TStringList;
  i: Integer;
begin
  Result := '';
  nonce_str := Form1.GetRandStr(16);

  signStr := 'appid=' + WX_APPPAY_APP_ID + '&attach=' + callback_info + '&body='
    + body
    + '&mch_id=' + WX_APPPAY_MCH_ID + '&nonce_str=' + nonce_str + '&notify_url='
    +
    WX_APPPAY_NOTIFY_URL + '&out_trade_no=' + out_trade_no + '&spbill_create_ip='
    + spbill_create_ip + '&total_fee=' + total_fee +
    '&trade_type=' + WX_APPPAY_TRADE_TYPE + '&key=' + WX_APPPAY_MCH_KEY;

  sign := UpperCase(MD5(UTF8Encode(signStr)));

  //MainOutMessage('signStr: ' + signStr + ', sign: ' + sign);

  postData := '<xml>' +
    '<appid>' + WX_APPPAY_APP_ID + '</appid>' +
    '<attach>' + callback_info + '</attach>' +
    '<body>' + body + '</body>' +
    '<mch_id>' + WX_APPPAY_MCH_ID + '</mch_id>' +
    '<nonce_str>' + nonce_str + '</nonce_str>' +
    '<notify_url>' + WX_APPPAY_NOTIFY_URL + '</notify_url>' +
    '<out_trade_no>' + out_trade_no + '</out_trade_no>' +
    '<spbill_create_ip>' + spbill_create_ip + '</spbill_create_ip>' +
    '<total_fee>' + total_fee + '</total_fee>' +
    '<trade_type>' + WX_APPPAY_TRADE_TYPE + '</trade_type>' +
    '<sign>' + sign + '</sign>' +
    '</xml>';

  Form1.MainOutMessage('[Log] WXAPPPAY 下单请求. postData：' + SLineBreak +
    postData + SLineBreak);

  try
    CoInitialize(nil);
    httpTool := CoHttpPostXMLClass.Create;
    respData := httpTool.PostXML(WX_APPPAY_ORDER_URL, postData);
    CoUninitialize;
  except
    on E: Exception do
    begin
      Form1.MainOutMessage('[Error] WXAPPPAY. 请求下单出错: PostXML Error postData '
        +postData+' Error: ' +E.Message);
      Exit;
    end;
  end;

  if respData = '' then
  begin
    Form1.MainOutMessage('[Error] WXAPPPAY. 请求下单出错: 返回数据为空 respData '
      +
      respData);
    Exit;
  end;
  Form1.MainOutMessage('[Log] WXAPPPAY Get Order Number. 返回结果：' + SLineBreak
    +
    respData);

  timestamp := IntToStr(DateTimeToUnix(Now) - 8 * 60 * 60);
  //Form1.MainOutMessage('timestamp = ' + timestamp);
  //解析返回数据
  retList := WXAPPPAYReadXml(respData);

  //验证签名
  retList.Sort;
  signStr := '';
  for i := 0 to retList.Count - 1 do
  begin
    if retList.Names[i] = 'sign' then
      continue;

    if signStr = '' then
      signStr := retList.Names[i] + '=' + retList.Values[retList.Names[i]]
    else
      signStr := signStr + '&' + retList.Names[i] + '=' +
        retList.Values[retList.Names[i]];

    //Form1.MainOutMessage(retList.Names[i] + '  -->  ' +
    //  retList.Values[retList. Names[i]]);
  end;
  signStr := signStr + '&key=' + WX_APPPAY_MCH_KEY;
  sign := UpperCase(MD5(UTF8Encode(signStr)));

  //MainOutMessage('signStr: ' + signStr + ', sign: ' + sign);
  if sign = retList.Values['sign'] then
  begin
    Form1.MainOutMessage('验证签名成功!' + SLineBreak);
    signStr := 'appid=' + WX_APPPAY_APP_ID + '&noncestr=' + nonce_str +
      '&package='
      + 'Sign=WXPay' + '&partnerid=' + WX_APPPAY_MCH_ID + '&prepayid='
      + retList.Values['prepay_id'] + '&timestamp=' + timestamp + '&key=' +
      WX_APPPAY_MCH_KEY;

    sign := UpperCase(MD5(UTF8Encode(signStr)));
    //Form1.MainOutMessage('signStr: ' + signStr + ', sign: ' + sign);

    Result := 'signStr: ' + signStr + ', sign: ' + sign;
  end
  else
  begin
    Form1.MainOutMessage('[Error] WXAPPPAY. 请求下单出错: 返回数据签名验证不匹配 respData: '
      +
      respData + ', signStr: ' + signStr + ', locSign: ' + sign);
    Exit;
  end;

end;

{
 返回状态码 	return_code SUCCESS/FAIL SUCCESS表示商户接收通知成功并校验成功
返回信息 	return_msg 	OK 返回信息，如非空，为错误原因： 签名失败/参数格式校验错误
}

function AliAppPayVerify(Data: string): string;
var
  signStr: string;
  sign: string;

  retList: TStringList;
  i: Integer;

begin
  //返回数据
  Result := '<xml>' +
    '<return_code><![CDATA[FAIL]]></return_code>' +
    '<return_msg><![CDATA[参数格式校验失败]]></return_msg>' +
    '</xml>';

  //解析返回数据
  retList := WXAPPPAYReadXml(Data);

  //验证签名
  retList.Sort;
  signStr := '';
  for i := 0 to retList.Count - 1 do
  begin
    if retList.Names[i] = 'sign' then
      continue;

    if signStr = '' then
      signStr := retList.Names[i] + '=' + retList.Values[retList.Names[i]]
    else
      signStr := signStr + '&' + retList.Names[i] + '=' +
        retList.Values[retList.Names[i]];

    //Form1.MainOutMessage(retList.Names[i] + '  -->  ' +
    //  retList.Values[retList.Names[i]]);
  end;
  signStr := signStr + '&key=' + WX_APPPAY_MCH_KEY;
  sign := UpperCase(MD5(UTF8Encode(signStr)));
  //MainOutMessage('signStr: ' + signStr + ', sign: ' + sign);

  if sign = retList.Values['sign'] then
  begin
    Form1.MainOutMessage('验证签名成功!' + SLineBreak);

    //验证支付信息

    //返回数据
    Result := '<xml>' +
      '<return_code><![CDATA[SUCCESS]]></return_code>' +
      '<return_msg><![CDATA[OK]]></return_msg>' +
      '</xml>';

  end
  else
  begin
    Form1.MainOutMessage('[Error] WXAPPPAY. 支付验证出错: 回调数据签名不匹配 signStr: ' + signStr + ', locSign: ' + sign +
      ', Data: ' + Data);
    Exit;
  end;

end;

function WXAPPPAYReadXml(xmlStr: string): TStringList;
var
  //读取xml参数
  NodeList: IXMLNodeList;
  myNode: IXMLNode;
  xmlDocument: IXMLDocument;
  mainNode: IXMLNode;

  strName: string;
  i: Integer;
  retList: TStringList;
begin

  try
    xmlDocument := LoadXMLData(xmlStr);
    mainNode := xmlDocument.DocumentElement;
    retList := TStringList.Create;

    if not mainNode.HasChildNodes then
    begin
      Form1.MainOutMessage('[Error] WXAPPPAYReadXml. 解析XML出错: 无子节点 xmlStr: ' +
        xmlStr);
      Exit;
    end;
    nodeList := mainNode.ChildNodes;

    for i := 0 to nodeList.Count - 1 do
    begin
      strName := nodeList[i].NodeName;

      if nodeList[i].HasChildNodes then //如果有子节点
      begin
        if NodeList[i].text <> '' then
          //if NodeList[i].IsTextElement then  //不能用
        begin
          retList.Add(strName + '=' + NodeList[i].text); //解析出来的数据放入List
          Form1.MainOutMessage(strName + '=' + NodeList[i].text);
        end;
      end;

    end;
    Result := retList;

  except
    on E: Exception do
    begin
      Form1.MainOutMessage('[Error] WXAPPPAYReadXml. 解析XML出错: unknown exception: '
        + E.Message + ' xmlStr: ' + xmlStr);
    end;
  end;

end;

end.

