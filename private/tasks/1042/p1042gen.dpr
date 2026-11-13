{$APPTYPE CONSOLE}

var t1,t2 : TextFile;
  ones,zeros : array [2..70] of int64;
  i : longint;
  total : int64;

begin
  total:=4;
  ones[2]  := 3;
  zeros[2] := 1;
  for i:=3 to 62 do begin
    total := total*int64(2);
    zeros[i] := ones[i-1];
    ones[i]  := total - zeros[i];
  end;
  {}
  assign(t1,'01'); rewrite(t1);
  assign(t2,'01.a'); rewrite(t2);
  for i:=2 to 30 do begin
    writeln(t1,i);
    writeln(t2,zeros[i]);
  end;
  CloseFile(t1); CloseFile(t2);
  {}
  assign(t1,'02'); rewrite(t1);
  assign(t2,'02.a'); rewrite(t2);
  for i:=31 to 62 do begin
    writeln(t1,i);
    writeln(t2,zeros[i]);
  end;
  CloseFile(t1); CloseFile(t2);
end.