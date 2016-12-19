//---------------------------------------------------------------------------
// 单元名称：TUHttpClient.pas
// 所属模块：天游服务器引擎
// 单元内容：二次验证Http请求类
// 版权声明：2002 - 2014 云南天游科技
// 修改历史: 20014-7-5 谢华
//---------------------------------------------------------------------------

unit TUHttpClient;

interface

uses
  Classes, Windows, Sockets, WinSock, SysUtils, StrUtils;

const
  HTTP_HEADER = 'http://';
  HTTPS_HEADER = 'https://';

type
  THttpClient = class
  private
    FRequestor: TTcpClient;
    FLocalPort: AnsiString;
    FRequestSucc: ByteBool;
    FHaveErr: ByteBool;
    FErrMsg: AnsiString;
    FResponse: AnsiString;
    FBuffers: Array[0..65535] of Byte;
    Fbuffer: PChar;
    FBuff: string;
    FStream: TStringStream;

    function GetResponse: AnsiString;
    function GetErrMsg: AnsiString;
    procedure OnSockError(RSender: TObject; RSocketErr: Integer);

    procedure FHttpsPost(url, data: string; res: TStream);
    procedure FHttpsGet(url: string; res: TStream);
  public
    constructor Create(RLocalPort: Word);
    destructor Destroy; override;

    //Https
    function HttpsGet(url: string): string;
    function HttpsPost(url, data: string): string;
  end;

implementation

uses WinINet,IDURI, TUWorldUtils;

{ THttpClient }

constructor THttpClient.Create(RLocalPort: Word);
begin
  FRequestor := TTcpClient.Create(nil);
  FRequestor.OnError := OnSockError;
  FLocalPort := IntToStr(RLocalPort + 20000);
  FStream := TStringStream.Create('');
  //GetMem(Fbuffer, 65536);
  FBuffer := @(FBuffers[0]);
end;

destructor THttpClient.Destroy;
begin
  //FreeMem(Fbuffer);
  FRequestor.Free;
  FStream.Free;
  inherited;
end;

function THttpClient.GetErrMsg: AnsiString;
begin
  if not FHaveErr then
    Result := ''
  else
    Result := FErrMsg;
end;

function THttpClient.GetResponse: AnsiString;
begin
  if FRequestSucc then
    Result := FResponse
  else
    Result := '';
end;

procedure THttpClient.OnSockError(RSender: TObject; RSocketErr: Integer);
begin
  FHaveErr := True;
  FErrMsg := Format('Socket Error Code: %d', [RSocketErr]);
end;

//https方法！！！！！
function THttpClient.HttpsGet(url: string): string;
begin
  try
    FStream.Position := 0;
    FHttpsGet(url, FStream);
    result := FStream.DataString;
  finally
  end;
end;

function THttpClient.HttpsPost(url, data: string): string;

begin
  try
    FStream.Position := 0;
    FHttpsPost(url, data, FStream);
    result := FStream.DataString;
  finally

  end;
end;

procedure THttpClient.FHttpsPost(url, data:string;res:TStream);
var
  hInt,hConn,hreq:HINTERNET;
  dwRead, dwFlags:cardinal;
  port: Word;
  uri: TIdURI;
  proto, host, path: string;
begin
  uri := TIdURI.Create(url);
  host := uri.Host;
  path := uri.Path + uri.Document;
  proto := uri.Protocol;
  if UpperCase(proto) = 'HTTPS' then
  begin
    port := INTERNET_DEFAULT_HTTPS_PORT;
    dwFlags := INTERNET_FLAG_SECURE;
  end
  else
  begin
    port := StrToIntDef(uri.Port, 80);
    dwFlags := INTERNET_FLAG_RELOAD;
  end;
  uri.Free;
  hInt := InternetOpen('Delphi',INTERNET_OPEN_TYPE_PRECONFIG,nil,nil,0);
  hConn := InternetConnect(hInt,PChar(host),port,nil,nil,INTERNET_SERVICE_HTTP,0,0);
  hreq := HttpOpenRequest(hConn,'POST',PChar(Path),'HTTP/1.1',nil,nil,dwFlags,0);
  if HttpSendRequest(hReq,nil,0,PChar(data),Length(data)) then
  begin
    dwRead:=0;
    repeat
      InternetReadFile(hreq,Fbuffer,65536,dwRead);
      if (dwRead <> 0) and (Fbuffer <> nil) then
        res.Write(Fbuffer^, dwRead);
    until dwRead=0;
  end;
 InternetCloseHandle(hreq);
 InternetCloseHandle(hConn);
 InternetCloseHandle(hInt);
end;

procedure THttpClient.FHttpsGet(url: string;res: TStream);
var
  hInt,hUrl:HINTERNET;
  dwRead:cardinal;
begin
  if res = nil then
    Exit;

  try
    hInt := InternetOpen('Delphi',INTERNET_OPEN_TYPE_PRECONFIG,nil,nil,0);
    dwRead:=0;
    hurl:=InternetOpenUrl(hInt,PChar(url),nil,0,INTERNET_FLAG_RELOAD,0);
    if hurl = nil then
    begin
      InternetCloseHandle(hInt);
      Exit;
    end;
    
    repeat
      if InternetReadFile(hUrl,Fbuffer,1000,dwRead) then
      begin
        if (dwRead > 0) and (Fbuffer <> nil) then
          res.Write(Fbuffer^, dwRead)
        else if (dwRead < 0) then
          MainOutMessage('dwRead < 0 error:' + IntTostr(GetLastError()));
      end
      else
      begin
        MainOutMessage('InternetReadFile failed:' + IntTostr(GetLastError()));
      end;
    until dwRead=0;
    InternetCloseHandle(hUrl);
    InternetCloseHandle(hInt);
  except
    on E: Exception do
    begin
      MainOutMessage(E.Message);
    end; 
  end;
end;

end.
