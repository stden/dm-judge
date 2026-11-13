var fi,fo : text;
  g : array [1..100,1..100] of boolean;
  t,n,m,q,k,i,j,test : longint;
  f : boolean;
begin
  assign(fi,'01'); rewrite(fi);
  assign(fo,'01.a'); rewrite(fo);
  {}
  randomize;
  T:=10;
  writeln(fi,T);
  for test:=1 to T do begin
    N := random(99)+2;
    for i:=1 to n do
      for j:=1 to n do
        g[i,j] := false;
    for q:=1 to 50 do
      g[random(N)+1,random(N)+1]:=true;
    for i:=1 to n do
      g[i,i] := false;
    M := 0;
    for i:=1 to n do
      for j:=1 to n do
        M := M + ord(g[i,j]);
    {}
    writeln(fi,N,' ',M);
    for i:=1 to n do
      for j:=1 to n do
        if g[i,j] then writeln(fi,' ',i,' ',j);
    {}
    for k:=1 to n do
      for i:=1 to n do
        for j:=1 to n do
          if g[i,k] and g[k,j] then g[i,j] := true;
    {}
    f := false;
    for i:=1 to n do
      if g[i,i] then f:=true;
    if f then begin
      writeln('YES');
      writeln(fo,'YES');
    end else begin
      writeln('NO');
      writeln(fo,'NO');
    end;
  end;
  {}
  close(fi); close(fo);
end.