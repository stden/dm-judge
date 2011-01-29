{$APPTYPE CONSOLE}
var
  a: array[1..30] of int64;
  obaa: array[1..30] of int64;
  oba: array[1..30] of int64;
  ob: array[1..30] of int64;
  x, i, n: longint;
{}
begin
  obaa[1] := 0;
  oba[1] := 1;
  ob[1] := 1;
  a[1] := 2;
  {}
  for i := 2 to 30 do
    begin
      obaa[i] := oba[i-1];
      oba[i] := ob[i-1];
      ob[i] := obaa[i-1] + oba[i-1] + ob[i-1];
      a[i] := obaa[i] + oba[i] + ob[i];
    end;
  {}
  read( n );
  for i := 1 to n do
    begin
      read( x );
      writeln( a[x] );
    end;
end.