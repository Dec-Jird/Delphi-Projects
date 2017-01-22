unit TUTools;

interface
  function DateTimeToUnixDate(const ADate: TDateTime): string;
  function DateTimeToUnixDateInt(const ADate: TDateTime): Int64;
  function MD5(const s: string): string;
  function URLEncode(const AStr: string): string;
  
implementation

uses
  SysUtils, AsphyreMD5;

function DateTimeToUnixDate(const ADate: TDateTime): string;
const
  cUnixStarDate: TDateTime = 25569.0;
begin
  Result := IntToStr(Round((ADate - cUnixStarDate) * 86400));
end;

function DateTimeToUnixDateInt(const ADate: TDateTime): Int64;
const
  cUnixStarDate: TDateTime = 25569.0;
begin
  Result := Round((ADate - cUnixStarDate) * 86400);
end;

function MD5(const s: string): string;
var
  I: integer;
  MD5Bytes: array[1..16] of Byte;
begin
  Result := '';

  MD5Checksum(@S[1], Length(s), @MD5Bytes[1]);

  for i := 1 to 16 do
    Result := Result + Lowercase(IntToHex(MD5Bytes[i], 2));
end;


function URLEncode(const AStr: string): string;
// The NoConversion set contains characters as specificed in RFC 1738 and
// should not be modified unless the standard changes.
const
  NoConversion = ['A'..'Z', 'a'..'z', '@', '.', '_', '-',
    '0'..'9', '$', '!', '''', '(', ')'];
var
  Sp, Rp: PChar;
begin
  SetLength(Result, Length(AStr) * 3);
  Sp := PChar(AStr);
  Rp := PChar(Result);
  while Sp^ <> #0 do
  begin
    if Sp^ in NoConversion then
      Rp^ := Sp^
    else
      if Sp^ = ' ' then
        Rp^ := '+'
      else
      begin
        FormatBuf(Rp^, 3, '%%%.2x', 6, [Ord(Sp^)]);
        Inc(Rp, 2);
      end;
    Inc(Rp);
    Inc(Sp);
  end;
  SetLength(Result, Rp - PChar(Result));
end;

end.
