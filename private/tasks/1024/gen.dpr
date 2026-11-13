{$APPTYPE CONSOLE}

var fi,fo : text;
  N : LongInt;

Procedure gen;
var
  D : array [0..20] of LongInt;
  Ans : array [0..20] of LongInt;
  i : LongInt;
begin
  {}
  for i := 1 to N do
    Ans [i] := random(3)+1;
  {}
  D[N] := 1;
  for i:= N downto 1 do
    D[i-1] := D[i] * (Ans[i] + 1);
  {}
  write(fi,N,' ');
  for i:=0 to N do writeln(fi,D[i]);
  for i:=1 to N do writeln(fo,Ans[i]);
  {}
  writeln(fi);
  writeln(fo);
end;

Begin
  randomize;
  Assign(fi,'02.'); Assign(fo,'02.a');
  rewrite(fi); rewrite(fo);
  for N:=7 to 20 do gen;
  close(fi); close(fo);
End.