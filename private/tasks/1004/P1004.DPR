{$APPTYPE CONSOLE}
var
  i, n: longint;
  a, b: array[1..50, 1..50] of longint;
{}
function max( a, b: longint ): longint;
begin
  max := a;
  if ( b > a ) then
    max := b;
end;
{}
procedure solve;
var
  pr, i, j, n: longint;
begin
  read( n );
  for i := 1 to n do
    for j := 1 to n do
      begin
        read( a[i, j] );
        b[i, j] := maxlongint;
      end;    
  {}
  pr := 0;
  for i := 1 to n do
    begin
      b[i, 1] := pr + a[i, 1];
      pr := b[i, 1];
    end;
  {}
  pr := 0;
  for j := 1 to n do
    begin
      b[1, j] := pr + a[1, j];
      pr := b[1, j];
    end;
  {}
  for i := 2 to n do
    for j := 2 to n do
      b[i, j] := max( b[i-1, j], b[i, j-1] ) + a[i, j];
  {}
  pr := 0;
  for j := 1 to n do
    if ( pr < b[n, j] ) then 
      pr := b[n, j];
  writeln( pr );
end;
{}
begin
  read( n );
  for i := 1 to n do
    solve;
end.