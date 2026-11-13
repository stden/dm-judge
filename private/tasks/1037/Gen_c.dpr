{$APPTYPE CONSOLE}
var fi,fo : text;
  w : array [1..1000] of longint;
  e : array [1..1000] of longint;
  T,j,i,a,b,n,q : longint;
begin
  assign(fi,'02'); rewrite(fi);
  assign(fo,'02.a'); rewrite(fo);
  {}
  randomize;
  T := 7;
  writeln(fi,T);
  for i:=1 to T do begin
    a:=random(1000)+1;
    b:=random(1000)+1;
    n:=random(100)+1;
    writeln(fi,a,' ',b,' ',n);
    for j:=1 to n do begin
      w[j] := random(10000)+1;
      e[j] := 1;
      write(fi,w[j],' ');
    end;
    writeln(fi);
    {}
    for q:=1 to b do
      for j:=1 to n do
        e[j] := (e[j] * a) mod w[j];
    {}
    for j:=1 to n do
      write(fo,e[j],' ');
    writeln(fo);
  end;
  close(fi); close(fo);
end.