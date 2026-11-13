{--$APPTYPE CONSOLE}
var nn,n,i,ii,j,q,qq,w,a,b : longint;
begin
  assign(input,'src.txt'); reset(input);
  assign(output,'01'); rewrite(output);
  {}
  read(nn);
  qq := 14;
  q := 0;
  writeln(qq);
  for ii:=1 to nn do begin
    read(n);
    for i:=1 to n do begin
      inc(q);
      if q>qq then exit;
      read(w);
      writeln;
      writeln(w);
      for j:=1 to w do begin
        read(a,b);
        writeln(a,' ',b);
      end;
    end;
  end;
  close(output);
  if q<qq then writeln('!!!!!!!!!!!!!!!!!!!!!! ERROR !!');
end.