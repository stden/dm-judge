{$APPTYPE CONSOLE}

{ Решение задачи C }
Var N,I,Tests,Test:LongInt;
  F : Boolean;
Begin
  Assign(Input,'C.IN'); Reset(Input);
  Assign(Output,'C.OUT'); Rewrite(Output);
  Read(Tests);
  For Test := 1 to Tests do begin
    Read(N);
    F := true;
    For I:=2 to Trunc(Sqrt(N)) do
      If (N mod I)=0 then
        Begin Writeln('NO,',I); F:=false; break; End;
    If F then Writeln('YES');
  end;
End.