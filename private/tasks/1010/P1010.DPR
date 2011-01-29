{$APPTYPE CONSOLE}
var
  i, n: longint;

procedure solve;
var
  i: longint;
  tt, t, r: longint;
  st1, st2: string;
begin
  readln( st1 );
  readln( st2 );
  {}
  t := ord( st1[length(st1)] ) - ord( '0' );
  r := 0;
  if ( t = 0 ) and ( st2 <> '0' ) then
    begin
      writeln( 0 );
      exit;
    end;
  {}
  for i := 1 to length( st2 ) do
    begin
      r := r * 10 + ord( st2[i] ) - ord( '0' );
      r := r mod 1000;
    end;
  {}
  tt := 1;
  for i := 1 to r do
    tt := ( tt * t ) mod 10;
  {}
  writeln( tt );
end;

begin
  readln( n );
  for i := 1 to n do
    solve;
end.