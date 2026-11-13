{$APPTYPE CONSOLE}
{$N+}

{}
var fi,fo : text;

function NOD( a,b : int64 ):int64;
begin
  while ((a>0) and (b>0)) do
    if a>b then
      a:=a mod b
    else
      b:=b mod a;
  if a>0 then
    NOD := a
  else
    NOD := b;
end;

function two_digits( n : longint ):string;
begin
  str( n, Result );
  while Length(Result)<2 do Result := '0' + Result;
end;

var long : longint;

procedure gen;
var n,i,p,hour,min,sec : longint;
  err : integer;
  cur,time,t,curnew : int64;
  s : string;
begin
  n := random(10)+2;
  writeln(fi,n);
  cur := 1;
  for i:=1 to n do begin
    repeat
      time := random(long)+1;
      t := time;
      sec := t mod 60; t := t div 60;
      min := t mod 60; t := t div 60;
      hour := t;
      {}
      curnew := (cur*time) div NOD(cur,time);
    until curnew < (int64(24)*60*int64(60));
    cur := curnew;
    {}
    writeln(fi,two_digits(hour),':',two_digits(min),':',two_digits(sec));
  end;
  sec := cur mod 60;  cur := cur div 60;
  min := cur mod 60;  cur := cur div 60;
  hour := cur;
  writeln(fo,two_digits(hour),':',two_digits(min),':',two_digits(sec));
end;

var test,tests : longint;
begin
  Assign(fi, '01.'); ReWrite(fi);
  Assign(fo, '01.a'); ReWrite(fo);
  {}
  long := 60;
  tests := 30;
  writeln(fi,tests);
  for test:=1 to tests do gen;
  {}
  close(fi); close(fo);
  // -------------------------------
  Assign(fi, '02.'); ReWrite(fi);
  Assign(fo, '02.a'); ReWrite(fo);
  {}
  long := 5000;
  tests := 30;
  writeln(fi,tests);
  for test:=1 to tests do gen;
  {}
  close(fi); close(fo);
end.
