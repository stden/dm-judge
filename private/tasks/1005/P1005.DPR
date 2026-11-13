{$APPTYPE CONSOLE}
var
  i, n: longint;
  a: array[-17..17, -17..17, 0..1] of longint;
{}
procedure solve;
var
  cur, i, j, l, k, x, y: longint;
begin
  read( k, x, y );
  for i := -17 to 17 do
    for j := -17 to 17 do
      for l := 0 to 1 do
        a[i, j, l] := 0;
  {}
  cur := 0;
  a[0, 0, cur] := 1;
  for l := 1 to k do
    begin
      for i := -17 to 17 do
        for j := -17 to 17 do
          a[i, j, 1-cur] := 0;
      {}
      for i := -16 to 16 do
        for j := -16 to 16 do
          begin
            inc( a[i-1, j, 1-cur], a[i, j, cur] );
            inc( a[i+1, j, 1-cur], a[i, j, cur] );
            inc( a[i, j-1, 1-cur], a[i, j, cur] );
            inc( a[i, j+1, 1-cur], a[i, j, cur] );
          end;
      cur := 1 - cur;
    end;
  writeln( a[x, y, cur] );
end;
{}
begin
  read( n );
  for i := 1 to n do
    solve;
end.