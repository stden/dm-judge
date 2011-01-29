 {$APPTYPE CONSOLE}
var
  nb0: array[1..18] of int64;
  nb: array[1..18] of int64;
  i, n: longint;
{}
procedure solve;
var
  i, n, k: longint;
begin
  read( n, k );
  {}
  nb0[1] := 1;
  nb[1] := k - 1;
  {}
  for i := 2 to n do
    begin
      nb0[i] := nb[i-1];
      nb[i] := ( k - 1 ) * ( nb[i-1] + nb0[i-1] );
    end;
  {}
  writeln( nb[n] );
end;
{}
begin
  read( n );
  {}
  for i := 1 to n do
    solve;
end.