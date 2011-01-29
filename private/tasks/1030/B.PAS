var n,i,j,a,b : longint;
  f : boolean;
begin
  assign(input,'b.in'); reset(input);
  assign(output,'b.out'); rewrite(output);
  {}
  read(n);
  for i:=1 to n do begin
    read(a,b);
    f:=false;
    if ((a=0) or (b=0)) then begin
      writeln(0);
      f := true;
      continue;
    end;
    for j:=1 to 32 do begin
      if a>b then begin
        a:=a - b;  b := b * 2;
      end else begin
        b:=b - a;  a := a * 2;
      end;
      if ((a=0) or (b=0)) then begin
        writeln(j);
        f := true;
        break;
      end;
    end;
    if (not f) then writeln(-1);
  end;
end.