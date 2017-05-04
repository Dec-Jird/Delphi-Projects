unit TUHttpHelper;

interface
uses
  Classes, Windows, Sockets, WinSock, SysUtils, StrUtils;

type
  THttpHelper = class
  private
    FStream: TStringStream;
    FBuffers: array[0..65535] of Byte;
    Fbuffer: PChar;
    FBuff: string;
    url: string;
    params: string;
    sigurl: string;
    
    procedure FHttpsPost(url, data: string; res: TStream; header: string = '');
    procedure FHttpsGet(url: string; res: TStream; header: string = '');
  public
    constructor Create;
    destructor Destroy; override;

    //Https
    function HttpsGet(url: string; header: string = ''): string;
    function HttpsPost(url, data: string; header: string = ''): string;
  end;

implementation

uses WinINet, IDURI, Unit1;// TUWorldUtils;

{ THttpHelper }
constructor THttpHelper.Create;
begin
  {FRequestor := TTcpClient.Create(nil);
  FRequestor.OnError := OnSockError;
  FLocalPort := IntToStr(RLocalPort + 20000);  }
  FStream := TStringStream.Create('');
  //GetMem(Fbuffer, 65536);
  FBuffer := @(FBuffers[0]);
end;

destructor THttpHelper.Destroy;
begin
  //FreeMem(Fbuffer);
  //FRequestor.Free;
  FStream.Free;
  inherited;
end;

//https·½·¨£¡£¡£¡£¡£¡
function THttpHelper.HttpsGet(url: string; header: string = ''): string;
begin

  try
    FStream.Position := 0;
    FHttpsGet(url, FStream, header);
    result := FStream.DataString;
  finally

  end;

end;

function THttpHelper.HttpsPost(url, data: string; header: string = ''): string;
begin
  try
    FStream.Position := 0;
    FHttpsPost(url, data, FStream, header);
    result := FStream.DataString;
  finally

  end;
end;

procedure THttpHelper.FHttpsPost(url, data: string; res: TStream; header: string = '');
var
  hInt, hConn, hreq: HINTERNET;
  dwRead, dwFlags: cardinal;
  port: Word;
  uri: TIdURI;
  proto, host, path: string;
  //SL: TStrings;

begin
  uri := TIdURI.Create(url);
  host := uri.Host;
  if uri.Params <> '' then
    path := uri.Path + uri.Document + '?' + uri.Params
  else
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
  hInt := InternetOpen('Delphi', INTERNET_OPEN_TYPE_PRECONFIG, nil, nil, 0);
  hConn := InternetConnect(hInt, PChar(host), port, nil, nil, INTERNET_SERVICE_HTTP, 0, 0);
  hreq := HttpOpenRequest(hConn, 'POST', PChar(Path), 'HTTP/1.1', nil, nil, dwFlags, 0);
  if header <> '' then
    HttpAddRequestHeaders(hreq, PChar(header), length(header), HTTP_ADDREQ_FLAG_ADD and HTTP_ADDREQ_FLAG_REPLACE);
  if HttpSendRequest(hReq, nil, 0, PChar(data), Length(data)) then
  begin
    dwRead := 0;
    repeat
      InternetReadFile(hreq, Fbuffer, 65536, dwRead);
      if (dwRead <> 0) and (Fbuffer <> nil) then
        res.Write(Fbuffer^, dwRead);
    until dwRead = 0;
  end;

  {SL := TStringList.Create;
  SL.LoadFromStream(res);
  Form1.MainOutMessage('[Log] res: ' + SL.GetText); }

  InternetCloseHandle(hreq);
  InternetCloseHandle(hConn);
  InternetCloseHandle(hInt);
end;

procedure THttpHelper.FHttpsGet(url: string; res: TStream; header: string = '');
const
  HTTP_VERSION = 'HTTP/1.1';
var
  hInt, hUrl: HINTERNET;
  dwRead: cardinal;

begin
  if res = nil then
    Exit;

  try
    hInt := InternetOpen('Delphi', INTERNET_OPEN_TYPE_PRECONFIG, nil, nil, 0);
    dwRead := 0;
    if header <> '' then
    begin
      HttpAddRequestHeaders(hInt, PChar(header), length(header), HTTP_ADDREQ_FLAG_ADD and HTTP_ADDREQ_FLAG_REPLACE);
      hurl := InternetOpenUrl(hInt, PChar(url), PChar(header), length(header), INTERNET_FLAG_RELOAD, 0);
    end
    else
    begin
      hurl := InternetOpenUrl(hInt, PChar(url), nil, 0, INTERNET_FLAG_RELOAD, 0);
    end;

    if hurl = nil then
    begin
      InternetCloseHandle(hInt);
      Exit;
    end;

    repeat
      if InternetReadFile(hUrl, Fbuffer, 1000, dwRead) then
      begin
        if (dwRead > 0) and (Fbuffer <> nil) then
          res.Write(Fbuffer^, dwRead)
        else if (dwRead < 0) then
        begin
          Form1.MainOutMessage('dwRead < 0 error:' + IntTostr(GetLastError()));
        end;
      end
      else
      begin
        Form1.MainOutMessage('InternetReadFile failed:' + IntTostr(GetLastError()));
      end;
    until dwRead = 0;
    InternetCloseHandle(hUrl);
    InternetCloseHandle(hInt);
  except
    on E: Exception do
    begin
      Form1.MainOutMessage(E.Message);
    end;
  end;
end;

end.
