{$APPTYPE CONSOLE}
{$O-}
var
  i, n: longint;
  a: array[1..20000] of longint;
{}
procedure solve;
var
  x, n, k, i: longint;
  c, b: int64;
begin
  for i := 1 to 20000 do
    a[i] := 0;
  {}
  read( n, k );
  b := maxlongint;
  c := 0;
  for i := 1 to n do
    begin
      read( x );
      if ( x < 1 ) or ( x > 20000 ) then
        begin
          writeln( 'Hitler kaput' );
          exit;
        end;
      inc( a[x] );
      if ( x <> 1 ) then
        inc( c, k - x + 1 );
    end;
  {}
  if ( c < b ) then
    b := c;
  {}
  for i := 2 to k do
    begin
      c := c + n - a[i] * k;
      if ( c < b ) then
        b := c;
    end;
  {}
  writeln( b );
end;
{}
begin
  assign( input, 'in' ); reset( input );
  read( n );
  for i := 1 to n do
    solve;
end.