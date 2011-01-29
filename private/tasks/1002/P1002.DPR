{$APPTYPE CONSOLE}
var
  x, i, n: longint;
  a: array[0..70] of int64;
{}
begin
  read( n );
  a[0] := 0;
  a[1] := 1;
  for i := 2 to 70 do
    a[i] := a[i-1] + a[i-2];
  {}
  for i := 1 to n do
    begin
      read( x );
      writeln( a[x] );
    end;
end.