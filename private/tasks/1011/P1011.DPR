{$APPTYPE CONSOLE}
var
  i, n: longint;
  a: array[0..1000] of longint;
{}
procedure solve;
var
  t, n, k, i, j: longint;
begin
  for i := 0 to 1000 do
    a[i] := 0;
  {}
  read( n, a[0], a[1], k );
  t := k;
  {}
  for i := 2 to t do
    begin
      a[i] := ( ( a[i-1] * a[i-1] ) + ( a[i-2] * a[i-2] ) ) mod n;
      {}
      for j := 1 to i - 1 do
        if ( ( a[j-1] = a[i-1] ) and ( a[j] = a[i] ) ) then
          begin
            k := j - 1 + (k - j + 1) mod (i - j);
            writeln( a[k] );
            exit;
          end;
    end;
  {}
  writeln( a[k] );
end;
{}
begin
  read( n );
  for i := 1 to n do
    solve;
end.