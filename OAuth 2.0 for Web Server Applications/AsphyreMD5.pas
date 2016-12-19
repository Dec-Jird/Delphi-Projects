unit AsphyreMD5;

interface
uses SysUtils;

procedure MD5Checksum(Source: Pointer; Size: Integer; Checksum: Pointer);

implementation
{$R-}
{$Q-}

type
   MD5Block = array[0..15] of Longword;
   MD5CBits = array[0..7] of Byte;
   TMD5State = array[0..3] of Longword;
   TMD5Digest = array[0..15] of Byte;
   TMD5Buffer = array[0..63] of Byte;
   TMD5Context = record
      State: TMD5State;
      Count: array[0..1] of Longword;
      Buffer: TMD5Buffer;
   end;

//---------------------------------------------------------------------------
var
   Padding: TMD5Buffer = ($80, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
      $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
      $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
      $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
      $00, $00, $00, $00, $00, $00, $00, $00);

//---------------------------------------------------------------------------

function F(x, y, z: Longword): Longword; {$IFDEF VER170}inline; {$ENDIF}
begin
   Result := (x and y) or ((not x) and z);
end;

//---------------------------------------------------------------------------

function G(x, y, z: Longword): Longword; {$IFDEF VER170}inline; {$ENDIF}
begin
   Result := (x and z) or (y and (not z));
end;

//---------------------------------------------------------------------------

function H(x, y, z: Longword): Longword; {$IFDEF VER170}inline; {$ENDIF}
begin
   Result := x xor y xor z;
end;

//---------------------------------------------------------------------------

function I(x, y, z: Longword): Longword; {$IFDEF VER170}inline; {$ENDIF}
begin
   Result := y xor (x or (not z));
end;

//---------------------------------------------------------------------------

procedure Rot(var x: Longword; n: Byte); {$IFDEF VER170}inline; {$ENDIF}
begin
   x := (x shl n) or (x shr (32 - n));
end;

//---------------------------------------------------------------------------

procedure FF(var a: Longword; b, c, d, x: Longword; s: Byte; ac: Longword);
{$IFDEF VER170}inline; {$ENDIF}
begin
   Inc(a, F(b, c, d) + x + ac);
   Rot(a, s);
   Inc(a, b);
end;

//---------------------------------------------------------------------------

procedure GG(var a: Longword; b, c, d, x: Longword; s: Byte; ac: Longword);
{$IFDEF VER170}inline; {$ENDIF}
begin
   Inc(a, G(b, c, d) + x + ac);
   Rot(a, s);
   Inc(a, b);
end;

//---------------------------------------------------------------------------

procedure HH(var a: Longword; b, c, d, x: Longword; s: Byte; ac: Longword);
{$IFDEF VER170}inline; {$ENDIF}
begin
   Inc(a, H(b, c, d) + x + ac);
   Rot(a, s);
   Inc(a, b);
end;

//---------------------------------------------------------------------------

procedure II(var a: Longword; b, c, d, x: Longword; s: Byte; ac: Longword);
{$IFDEF VER170}inline; {$ENDIF}
begin
   Inc(a, I(b, c, d) + x + ac);
   Rot(a, s);
   Inc(a, b);
end;

//---------------------------------------------------------------------------

procedure Encode(Source, Target: Pointer; Count: Longword);
var
   S: PByte;
   T: PLongword;
   i: Longword;
begin
   S := Source;
   T := Target;

   for i := 0 to (Count div 4) - 1 do
   begin
      T^ := S^;
      Inc(S);
      T^ := T^ or (S^ shl 8);
      Inc(S);
      T^ := T^ or (S^ shl 16);
      Inc(S);
      T^ := T^ or (S^ shl 24);

      Inc(S);
      Inc(T);
   end;
end;

//---------------------------------------------------------------------------

procedure Decode(Source, Target: Pointer; Count: Longword);
var
   S: PLongword;
   T: PByte;
   i: Longword;
begin
   S := Source;
   T := Target;

   for i := 0 to Count - 1 do
   begin
      T^ := S^ and $FF;
      Inc(T);
      T^ := (S^ shr 8) and $FF;
      Inc(T);
      T^ := (S^ shr 16) and $FF;
      Inc(T);
      T^ := (S^ shr 24) and $FF;

      Inc(T);
      Inc(S);
   end;
end;

//---------------------------------------------------------------------------

procedure Transform(Buffer: Pointer; var State: TMD5State);
var
   a, b, c, d: Longword;
   Block: MD5Block;
begin
   Encode(Buffer, @Block, 64);

   a := State[0];
   b := State[1];
   c := State[2];
   d := State[3];

   FF(a, b, c, d, Block[0], 7, $D76AA478);
   FF(d, a, b, c, Block[1], 12, $E8C7B756);
   FF(c, d, a, b, Block[2], 17, $242070DB);
   FF(b, c, d, a, Block[3], 22, $C1BDCEEE);
   FF(a, b, c, d, Block[4], 7, $F57C0FAF);
   FF(d, a, b, c, Block[5], 12, $4787C62A);
   FF(c, d, a, b, Block[6], 17, $A8304613);
   FF(b, c, d, a, Block[7], 22, $FD469501);
   FF(a, b, c, d, Block[8], 7, $698098D8);
   FF(d, a, b, c, Block[9], 12, $8B44F7AF);
   FF(c, d, a, b, Block[10], 17, $FFFF5BB1);
   FF(b, c, d, a, Block[11], 22, $895CD7BE);
   FF(a, b, c, d, Block[12], 7, $6B901122);
   FF(d, a, b, c, Block[13], 12, $FD987193);
   FF(c, d, a, b, Block[14], 17, $A679438E);
   FF(b, c, d, a, Block[15], 22, $49B40821);
   GG(a, b, c, d, Block[1], 5, $F61E2562);
   GG(d, a, b, c, Block[6], 9, $C040B340);
   GG(c, d, a, b, Block[11], 14, $265E5A51);
   GG(b, c, d, a, Block[0], 20, $E9B6C7AA);
   GG(a, b, c, d, Block[5], 5, $D62F105D);
   GG(d, a, b, c, Block[10], 9, $2441453);
   GG(c, d, a, b, Block[15], 14, $D8A1E681);
   GG(b, c, d, a, Block[4], 20, $E7D3FBC8);
   GG(a, b, c, d, Block[9], 5, $21E1CDE6);
   GG(d, a, b, c, Block[14], 9, $C33707D6);
   GG(c, d, a, b, Block[3], 14, $F4D50D87);
   GG(b, c, d, a, Block[8], 20, $455A14ED);
   GG(a, b, c, d, Block[13], 5, $A9E3E905);
   GG(d, a, b, c, Block[2], 9, $FCEFA3F8);
   GG(c, d, a, b, Block[7], 14, $676F02D9);
   GG(b, c, d, a, Block[12], 20, $8D2A4C8A);
   HH(a, b, c, d, Block[5], 4, $FFFA3942);
   HH(d, a, b, c, Block[8], 11, $8771F681);
   HH(c, d, a, b, Block[11], 16, $6D9D6122);
   HH(b, c, d, a, Block[14], 23, $FDE5380C);
   HH(a, b, c, d, Block[1], 4, $A4BEEA44);
   HH(d, a, b, c, Block[4], 11, $4BDECFA9);
   HH(c, d, a, b, Block[7], 16, $F6BB4B60);
   HH(b, c, d, a, Block[10], 23, $BEBFBC70);
   HH(a, b, c, d, Block[13], 4, $289B7EC6);
   HH(d, a, b, c, Block[0], 11, $EAA127FA);
   HH(c, d, a, b, Block[3], 16, $D4EF3085);
   HH(b, c, d, a, Block[6], 23, $4881D05);
   HH(a, b, c, d, Block[9], 4, $D9D4D039);
   HH(d, a, b, c, Block[12], 11, $E6DB99E5);
   HH(c, d, a, b, Block[15], 16, $1FA27CF8);
   HH(b, c, d, a, Block[2], 23, $C4AC5665);
   II(a, b, c, d, Block[0], 6, $F4292244);
   II(d, a, b, c, Block[7], 10, $432AFF97);
   II(c, d, a, b, Block[14], 15, $AB9423A7);
   II(b, c, d, a, Block[5], 21, $FC93A039);
   II(a, b, c, d, Block[12], 6, $655B59C3);
   II(d, a, b, c, Block[3], 10, $8F0CCC92);
   II(c, d, a, b, Block[10], 15, $FFEFF47D);
   II(b, c, d, a, Block[1], 21, $85845DD1);
   II(a, b, c, d, Block[8], 6, $6FA87E4F);
   II(d, a, b, c, Block[15], 10, $FE2CE6E0);
   II(c, d, a, b, Block[6], 15, $A3014314);
   II(b, c, d, a, Block[13], 21, $4E0811A1);
   II(a, b, c, d, Block[4], 6, $F7537E82);
   II(d, a, b, c, Block[11], 10, $BD3AF235);
   II(c, d, a, b, Block[2], 15, $2AD7D2BB);
   II(b, c, d, a, Block[9], 21, $EB86D391);

   Inc(State[0], a);
   Inc(State[1], b);
   Inc(State[2], c);
   Inc(State[3], d);
end;

//---------------------------------------------------------------------------

procedure MD5Init(out Context: TMD5Context);
begin
   with Context do
   begin
      State[0] := $67452301;
      State[1] := $EFCDAB89;
      State[2] := $98BADCFE;
      State[3] := $10325476;

      Count[0] := 0;
      Count[1] := 0;

      FillChar(Buffer, SizeOf(TMD5Buffer), 0);
   end;
end;

//---------------------------------------------------------------------------

procedure MD5Update(var Context: TMD5Context; Source: Pointer; Size: Longword);
var
   Index: Longword;
   PartLen: Longword;
   i: Longword;
begin
   with Context do
   begin
      Index := (Count[0] shr 3) and $3F;
      Inc(Count[0], Size shl 3);
      if (Count[0] < (Size shl 3)) then Inc(Count[1]);
      Inc(Count[1], Size shr 29);
   end;

   PartLen := 64 - Index;
   if (Size >= PartLen) then
   begin
      Move(Source^, Context.Buffer[Index], PartLen);
      Transform(@Context.Buffer, Context.State);
      i := PartLen;
      while (i + 63 < Size) do
      begin
         Transform(@PByteArray(Source)[i], Context.State);
         Inc(i, 64);
      end;

      Index := 0;
   end else i := 0;

   Move(PByteArray(Source)[i], Context.Buffer[Index], Size - i);
end;

//---------------------------------------------------------------------------

procedure MD5Final(var Context: TMD5Context; out Digest: TMD5Digest);
var
   Bits: MD5CBits;
   Index: Longword;
   PadLen: Longword;
begin
   Decode(@Context.Count, @Bits, 2);
   Index := (Context.Count[0] shr 3) and $3F;
   if (Index < 56) then PadLen := 56 - Index else PadLen := 120 - Index;

   MD5Update(Context, @Padding, PadLen);
   MD5Update(Context, @Bits, 8);

   Decode(@Context.State, @Digest, 4);
   FillChar(Context, SizeOf(TMD5Context), 0);
end;

//---------------------------------------------------------------------------

procedure MD5Checksum(Source: Pointer; Size: Integer; Checksum: Pointer);
var
   Context: TMD5Context;
   DigestM: TMD5Digest;
begin
   MD5Init(Context);
   MD5Update(Context, Source, Size);
   MD5Final(Context, DigestM);

   Move(DigestM, Checksum^, SizeOf(TMD5Digest));
end;

//---------------------------------------------------------------------------
end.
