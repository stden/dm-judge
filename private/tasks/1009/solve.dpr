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

procedure solve;
var n,i,p,hour,min,sec : longint;
  err : integer;
  cur,time : int64;
  s : string;
begin
  readln(fi,n);
  cur := 1;
  for i:=1 to n do begin
    readln(fi,s);
    { parse time }
    p := pos(':',s);
    val( copy(s,1,p-1), hour, err);
    delete(s,1,p);
    p := pos(':',s);
    val( copy(s,1,p-1), min, err);
    delete(s,1,p);
    val( s, sec, err);
    {}
    time := (hour*60 + min)*60 + sec;
    min := NOD(cur,time);
    cur := (cur*time) div NOD(cur,time);
  end;
  sec := cur mod 60;  cur := cur div 60;
  min := cur mod 60;  cur := cur div 60;
  hour := cur;
  writeln(fo,two_digits(hour),':',two_digits(min),':',two_digits(sec));
end;

var test,tests : longint;
begin
  Assign(fi, 'in.txt'); Reset(fi);
  Assign(fo, 'out.txt'); ReWrite(fo);
  {}
  readln(fi,tests);
  for test:=1 to tests do
    solve;
  {}
  close(fi); close(fo);
end.
