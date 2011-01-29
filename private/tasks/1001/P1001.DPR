{$APPTYPE CONSOLE}
var
  i, n: longint;
  a, b: array[0..100, 1..100] of longint;
  c: array[0..100] of longint;

procedure solve;
var
  n, i, j, k: longint;
  minv, maxv, minind, maxind: longint;
  besti, bestj, bestminind, bestmaxind, bestv: longint;
begin
  read( n );
  for i := 0 to 100 do
    for j := 1 to 100 do
      begin
        a[i, j] := 0;
        b[i, j] := 0;
      end;
  {}
  for i := 1 to n do
    for j := 1 to n do
      read( a[i, j] );
  {}
  for i := 1 to n do
    for j := 1 to n do
      b[i, j] := b[i-1, j] + a[i, j];
  {}
  for i := 0 to 100 do
    c[i] := 0;
  {}
  bestminind := 0;
  bestmaxind := 0;
  bestv := 0;
  besti := 0;
  bestj := 0;
  for i := 1 to n do
    for j := 0 to i - 1 do
      begin
        for k := 1 to n do
          c[k] := c[k-1] + b[i, k] - b[j, k];
        minind := 0;
        maxind := 0;
        minv := maxlongint;
        maxv := -maxlongint;
        for k := 0 to n do
          begin
            if c[k] < minv then
              begin
                minv := c[k];
                minind := k;
                maxv := c[k];
                maxind := k;
              end;
            if c[k] > maxv then
              begin
                maxv := c[k];
                maxind := k;
                if ( maxv - minv > bestv ) then
                  begin
                    bestv := maxv - minv;
                    bestmaxind := maxind;
                    bestminind := minind;
                    besti := i;
                    bestj := j;
                  end;
              end;
          end;
      end;
  if ( bestv = 0 ) then
    begin
      writeln;
      exit;
    end;
  for i := bestj + 1 to besti do
    begin
      for j := bestminind + 1 to bestmaxind do
        write( a[i, j], ' ' );
      writeln;
    end;
  writeln;
end;

begin
  read( n );
  for i := 1 to n do
    solve;
end.