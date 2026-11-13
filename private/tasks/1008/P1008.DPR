{$APPTYPE CONSOLE}
var
  a: array[1..16, 1..16] of int64;
  pr, p, i, j, n: longint;
{}
begin
  assign( input, 'in' ); reset( input );
  {}
  for i := 1 to 16 do
    for j := 1 to 16 do
      a[i, j] := 0;
  {}
  pr := 1;
  a[1, 1] := 1;
  for i := 1 to 16 do
    begin
      a[i, 1] := pr;
      a[i, i] := 1;
      pr := pr * i;
    end;
  {}
  for i := 2 to 16 do
    for j := 2 to i do
      a[i, j] := a[i-1, j-1] + ( ( i - 1 ) * a[i-1, j] );
  {}
  read( n );
  for i := 1 to n do
    begin
      read( n, p );
      writeln( a[n, p] );
    end;
end.