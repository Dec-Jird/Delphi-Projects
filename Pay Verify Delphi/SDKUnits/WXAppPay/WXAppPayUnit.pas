unit WXAppPayUnit;

interface
uses //xml����
  SysUtils, Classes, TUTools, DateUtils, ActiveX, XMLIntf, XMLDoc, HttpPostXML_TLB;

function WXAppPayGetOrder(body, out_trade_no, spbill_create_ip, total_fee,
  callback_info: string): string; //���ض���

function AliAppPayVerify(Data: string): string;

function WXAPPPAYReadXml(xmlStr: string): TStringList;

implementation
uses Unit1, SDKConst; //, AsphyreMD5, IniFiles;

const
  WX_APPPAY_NOTIFY_URL = 'http://182.254.244.236:3358/weixinapppay';
  WX_APPPAY_TRADE_TYPE = 'APP';

  {  attach: string; //callbackInfo
    body: string; //��Ʒ����
    out_trade_no: string; //������
    spbill_create_ip: string; //�û�ip
    total_fee: string; //�ܽ� ��
    nonce_str: string; //����ַ���
  }

//ʹ��C#ʵ�ֵ�post��������xml����

function WXAppPayGetOrder(body, out_trade_no, spbill_create_ip, total_fee,
  callback_info: string): string; //���ض���
var
  nonce_str: string; //����ַ���
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

  Form1.MainOutMessage('[Log] WXAPPPAY �µ�����. postData��' + SLineBreak +
    postData + SLineBreak);

  try
    CoInitialize(nil);
    httpTool := CoHttpPostXMLClass.Create;
    respData := httpTool.PostXML(WX_APPPAY_ORDER_URL, postData);
    CoUninitialize;
  except
    on E: Exception do
    begin
      Form1.MainOutMessage('[Error] WXAPPPAY. �����µ�����: PostXML Error postData '
        +postData+' Error: ' +E.Message);
      Exit;
    end;
  end;

  if respData = '' then
  begin
    Form1.MainOutMessage('[Error] WXAPPPAY. �����µ�����: ��������Ϊ�� respData '
      +
      respData);
    Exit;
  end;
  Form1.MainOutMessage('[Log] WXAPPPAY Get Order Number. ���ؽ����' + SLineBreak
    +
    respData);

  timestamp := IntToStr(DateTimeToUnix(Now) - 8 * 60 * 60);
  //Form1.MainOutMessage('timestamp = ' + timestamp);
  //������������
  retList := WXAPPPAYReadXml(respData);

  //��֤ǩ��
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
    Form1.MainOutMessage('��֤ǩ���ɹ�!' + SLineBreak);
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
    Form1.MainOutMessage('[Error] WXAPPPAY. �����µ�����: ��������ǩ����֤��ƥ�� respData: '
      +
      respData + ', signStr: ' + signStr + ', locSign: ' + sign);
    Exit;
  end;

end;

{
 ����״̬�� 	return_code SUCCESS/FAIL SUCCESS��ʾ�̻�����֪ͨ�ɹ���У��ɹ�
������Ϣ 	return_msg 	OK ������Ϣ����ǿգ�Ϊ����ԭ�� ǩ��ʧ��/������ʽУ�����
}

function AliAppPayVerify(Data: string): string;
var
  signStr: string;
  sign: string;

  retList: TStringList;
  i: Integer;

begin
  //��������
  Result := '<xml>' +
    '<return_code><![CDATA[FAIL]]></return_code>' +
    '<return_msg><![CDATA[������ʽУ��ʧ��]]></return_msg>' +
    '</xml>';

  //������������
  retList := WXAPPPAYReadXml(Data);

  //��֤ǩ��
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
    Form1.MainOutMessage('��֤ǩ���ɹ�!' + SLineBreak);

    //��֤֧����Ϣ

    //��������
    Result := '<xml>' +
      '<return_code><![CDATA[SUCCESS]]></return_code>' +
      '<return_msg><![CDATA[OK]]></return_msg>' +
      '</xml>';

  end
  else
  begin
    Form1.MainOutMessage('[Error] WXAPPPAY. ֧����֤����: �ص�����ǩ����ƥ�� signStr: ' + signStr + ', locSign: ' + sign +
      ', Data: ' + Data);
    Exit;
  end;

end;

function WXAPPPAYReadXml(xmlStr: string): TStringList;
var
  //��ȡxml����
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
      Form1.MainOutMessage('[Error] WXAPPPAYReadXml. ����XML����: ���ӽڵ� xmlStr: ' +
        xmlStr);
      Exit;
    end;
    nodeList := mainNode.ChildNodes;

    for i := 0 to nodeList.Count - 1 do
    begin
      strName := nodeList[i].NodeName;

      if nodeList[i].HasChildNodes then //������ӽڵ�
      begin
        if NodeList[i].text <> '' then
          //if NodeList[i].IsTextElement then  //������
        begin
          retList.Add(strName + '=' + NodeList[i].text); //�������������ݷ���List
          Form1.MainOutMessage(strName + '=' + NodeList[i].text);
        end;
      end;

    end;
    Result := retList;

  except
    on E: Exception do
    begin
      Form1.MainOutMessage('[Error] WXAPPPAYReadXml. ����XML����: unknown exception: '
        + E.Message + ' xmlStr: ' + xmlStr);
    end;
  end;

end;

end.

