{$APPTYPE CONSOLE}
var
  i, n: longint;
  a, b: int64;

begin
  read( n );
  for i := 1 to n do
    begin
      read( a, b );
      writeln( a + b );
    end;
end.