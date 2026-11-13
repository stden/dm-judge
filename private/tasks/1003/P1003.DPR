{$APPTYPE CONSOLE}
var
  i, n, x: longint;
  a: array[-2..34] of longint;
{}
begin
  a[-2] := 0;
  a[-1] := 0;
  a[0] := 1;
  for i := 1 to 34 do
    a[i] := a[i-1] + a[i-2] + a[i-3];
  {}
  read( n );
  for i := 1 to n do
    begin
      read( x );
      writeln( a[x] );
    end;
end.