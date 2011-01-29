{$APPTYPE CONSOLE}
var in_use : array [1..10] of byte;
    n : longint;
    a : array [1..3628800,1..10] of byte;
    cnt : longint;

procedure recurse( step:longint );
var i,j : longint;
begin
  if step=0 then begin
    inc(cnt);
    for i:=n downto 1 do
      for j:=1 to n do
        if in_use[j]=i then begin
          a[cnt,n-i+1] := j;
          break;
        end;
  end else begin
    for i:=1 to n do
      if in_use[i]=0 then begin
        in_use[i]:=step;
        recurse(step-1);
        in_use[i]:=0;
      end;
  end;
end;

var fi,fo:text; j,i,q,ans_cnt:longint;
begin
  assign(fi,'02'); rewrite(fi);
  assign(fo,'02.a'); rewrite(fo);
  {}
  cnt := 0;
  {}
  n := 10;
  for i:=1 to n do in_use[i] := 0;
  {}
  recurse(n);
  {}
  ans_cnt := 300;
  writeln(fi,ans_cnt);
  {}
  for q:=1 to ans_cnt do begin
    i := random(cnt) + 1;
    write(fi,n,'  ');
    for j:=1 to n do
      write(fi,a[i,j],' ');
    writeln(fi);
    writeln(fo,i);
  end;
  {}
  close(fi); close(fo);
end.