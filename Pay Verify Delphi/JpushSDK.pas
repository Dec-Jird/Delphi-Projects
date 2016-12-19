unit JpushSDK;

interface


 uses
 Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, EncdDecd;

type

  TJPushData = Record
  Key: String;
  Value: String;
  end;

  TJPushDataArray = array of TJPushData;

  function SendJPushMessage(MessageStr :String; DataArray : TJPushDataArray):string;
  procedure SetJpushInfo(Url, KeyStr, SecretStr :String);

var
   JPushUrl, AppKey, MasterSecret : String;

implementation

 procedure SetJpushInfo(Url, KeyStr, SecretStr :String);
 begin
     JPushUrl := Url;
     AppKey := KeyStr;
     MasterSecret := SecretStr;
 end;

 function SendJPushMessage(MessageStr :String; DataArray : TJPushDataArray):string;
 var

   Header : String;
   PlatStr, Audience : String; //平台，设备别名指定.
   IOSFlag : String; //true IOS生产环境；false 测试环境.
   JSONStr : String;
   i : integer;
   ArrayJsonStr , TempStr: String;
 begin
 //url := 'https://api.jpush.cn/v3/push';
// AppKey := 'dd96aa1b76ae32bc27c29266';
 //MasterSecret := '1f82a5a86e79d76572dfe7c8';
 PlatStr := 'all';
 Audience := 'all';
 IOSFlag := 'false';

  for i := 0 to length(DataArray)-1 do
  begin
    TempStr := '"' + DataArray[i].Key + '":' +'"' + DataArray[i].Value + '"';
    if  ArrayJsonStr <> '' then
    begin
       ArrayJsonStr := ArrayJsonStr + ',' + TempStr;
    end
    else
       ArrayJsonStr := TempStr;
  end;

 JSONStr :='{"platform": "'+PlatStr+'","audience" : "'+Audience+'","notification" : {"alert" : "'+MessageStr+'","android" :{"extras" : {'+ArrayJsonStr+'}},"ios" : {"extras" : {'+ArrayJsonStr+'}}},"options" : {"apns_production":'+IOSFlag+'}} ';

 Header := AnsiToUtf8('Authorization: Basic ' + EncodeString(AppKey + ':' + MasterSecret));


 //result := Utf8ToAnsi(HttpsPost(JPushUrl, AnsiToUtf8(JSONStr), Header));




 end;



end.
