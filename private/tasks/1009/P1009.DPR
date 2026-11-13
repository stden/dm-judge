{$APPTYPE CONSOLE}
var
  i, n: longint;
  a: array[1..20] of int64;
  t, s: longint;
{}
function nod( a, b: int64 ): int64;
var
  t, ta, tb: int64;
begin
  if ( a < b ) then
    begin
      ta := b;
      tb := a;
    end
  else
    begin
      ta := a;
      tb := b;
    end;
  {}
  while ( tb <> 0 ) do
    begin
      t := ta mod tb;
      ta := tb;
      tb := t
    end;
  nod := ta;
end;
{}
procedure solve;
var
  r, t, err, i, j, n: longint;
  st, st1: string;
begin
  readln( n );
  for i := 1 to n do
    begin
      a[i] := 0;
      {}
      readln( st );
      {}
      st1 := '';
      for j := 1 to length( st ) do
        if ( st[j] <> ':' ) then
          st1 := st1 + st[j]
        else
          break;
      delete( st, 1, pos( ':', st ) );
      {}
      val( st1, t, err );
      a[i] := t;
      {}
      st1 := '';
      for j := 1 to length( st ) do
        if ( st[j] <> ':' ) then
          st1 := st1 + st[j]
        else
          break;
      delete( st, 1, pos( ':', st ) );
      {}
      val( st1, t, err );
      a[i] := a[i] * 60 + t;
      {}
      st1 := '';
      for j := 1 to length( st ) do
        if ( st[j] <> ':' ) then
          st1 := st1 + st[j]
        else
          break;
      {}
      val( st1, t, err );
      a[i] := a[i] * 60 + t;
    end;
  {}
  t := a[1];
  for i := 2 to n do
    t := t * a[i] div nod( t, a[i] );
  {}
  r := t div 3600;
  str( r, st1 );
  while ( length( st1 ) < 2 ) do
    st1 := '0' + st1;
  st := st1;
  {}
  t := t mod 3600;
  r := t div 60; 
  str( r, st1 );
  while ( length( st1 ) < 2 ) do
    st1 := '0' + st1;
  st := st + ':' + st1;
  {}
  r := t mod 60;
  str( r, st1 );
  while ( length( st1 ) < 2 ) do
    st1 := '0' + st1;
  st := st + ':' + st1;
  writeln( st );
end;
{}
begin
  read( n );
  for i := 1 to n do
    solve;
end.