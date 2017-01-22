unit THttpClient;

interface
  function HttpsPost(line: string):string;
implementation

uses
  Unit1;

function HttpsPost(line: string):string;
begin
   Form1.Memo1.Lines.Add(line);
   Result:='HttpsPost: '+line;
end;

end.
 