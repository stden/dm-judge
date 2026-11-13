{$APPTYPE CONSOLE}

var t1,t2 : TextFile;
  A,B : Array [1..32768] of Byte;
  tests,cnt,test,NumVars,Len,i : Integer;
begin
  {}
  assign(t1,'01'); rewrite(t1);
  tests := 20;
  writeln(t1,tests);
  for test:=1 to tests do begin
    NumVars := Random(5)+2;
    Len := 1;
    for i:=1 to NumVars do Len := Len*2;
    repeat
      cnt:=0;
      for i:=1 to Len do begin
        A[i]:=Random(2);
        B[i]:=Random(2);
        if ((A[i]=1) and (B[i]=1)) then Inc(Cnt);
      end;
    until cnt>0;
    for i:=1 to Len do write(t1,A[i]);
    writeln(t1);
    for i:=1 to Len do write(t1,B[i]);
    writeln(t1);
  end;
  CloseFile(t1); 
end.