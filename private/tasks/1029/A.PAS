function is_simple( n:longint ):boolean;
var i : longint;
begin
  is_simple := true;
  if n=1 then is_simple := false;
  for i:=2 to trunc(sqrt(n)) do
    if n mod i = 0 then begin
      is_simple := false;
      exit;
    end;
end;
{}
function is_symmetry( n:longint ):boolean;
var A : array [1..100] of byte;
  i,j,m : longint;
begin
  is_symmetry := true;
  i := 1;
  m := n;
  while m > 0 do begin
    a[i] := m mod 2;
    m := m div 2;
    inc(i);
  end;
  for j:=1 to (i div 2) do
    if a[j]<>a[i-j] then begin
      is_symmetry := false;
      exit;
    end;
end;
{}
var q,i,j,m,n,cnt : longint;
begin
  assign(input,'a.in'); reset(input);
  assign(output,'a.out'); rewrite(output);
  {}
  read(q);
  for i:=1 to q do begin
    read(m,n);
    cnt := 0;
    for j:=M to N do
      if is_simple(j) then
        if is_symmetry(j) then begin
          write(j,' ');
          inc(cnt);
        end;
    if cnt = 0 then write('No');
    writeln;
  end;
end.
