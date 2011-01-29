{$APPTYPE CONSOLE}
{$N+}

function solve( n: longint ):longint;
var
  br, bw, r, w: array[0..45] of longint;
  i : longint;
  res: extended;
begin
  for i := 0 to 45 do begin
    br[i] := 0;
    bw[i] := 0;
    r[i] := 0;
    w[i] := 0;
  end;
  {}
  br[1] := 0;
  bw[1] := 0;
  w[1] := 1;
  r[1] := 1;
  {}
  for i := 2 to n do begin
    r[i] := bw[i-1] + w[i-1];
    w[i] := br[i-1] + r[i-1];
    br[i] := r[i-1];
    bw[i] := w[i-1];
  end;
  {}
  solve := r[n] + w[n];
end;

{}
var fi,fo : text;
  n : longint;
begin
  Assign(fi, '01.'); ReWrite(fi);
  Assign(fo, '01.a'); ReWrite(fo);
  {}
  writeln(fi,10); writeln(fi);
  for n:=1 to 10 do begin
    writeln(fi,n);
    writeln(fo, solve(n) );
  end;
  {}
  close(fi); close(fo);
  { ------ }
  Assign(fi, '02.'); ReWrite(fi);
  Assign(fo, '02.a'); ReWrite(fo);
  {}
  writeln(fi,34); writeln(fi);
  for n:=11 to 44 do begin
    writeln(fi,n);
    writeln(fo, solve(n) );
  end;
  {}
  close(fi); close(fo);
end.
