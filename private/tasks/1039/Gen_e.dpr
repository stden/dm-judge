{$APPTYPE CONSOLE}
const max = 15;

type
  poly = array [0..max] of longint;

procedure mod_poly( var p:poly; n:longint );
var i,idx : longint;
begin
  for i:=n to max do begin
    idx := (i-1) mod (n-1) + 1;
    p[idx] := (p[idx] + p[i]) mod n;
    p[i] := 0;
  end;
  for i:=0 to n-1 do
    p[i] := p[i] mod n;
end;

procedure rand_poly( var p:poly; n:longint );
var i : longint;
begin
  for i:=0 to max do
    p[i] := random(10000);
  mod_poly(p,n);
end;

procedure null_poly( var p:poly );
var i : longint;
begin
  for i:=0 to max do
    p[i] := 0;
end;

procedure add_poly( var a,b,c:poly; n:longint  ); {mod}
var i : longint;
begin
  null_poly(c);
  for i:=0 to max do
    c[i] := c[i] + a[i] + b[i];
  mod_poly(c,n);
end;

procedure mul_poly( var a,b,c:poly; n:longint ); {mod}
var i,j : longint;
begin
  null_poly(c);
  for i:=0 to max do
    for j:=0 to max do
      if (i+j)<=max then
        c[i+j] := (c[i+j] + a[i] * b[j]) mod n;
  mod_poly(c,n);
end;

function is_one( a:poly ):boolean;
var i : longint;
begin
  is_one := true;
  if a[0]<>1 then is_one := false;
  for i:=1 to max do
    if a[i]<>0 then is_one := false;
end;

function is_zero( a:poly ):boolean;
var i : longint;
begin
  is_zero := true;
  for i:=0 to max do
    if a[i]<>0 then is_zero := false;
end;

procedure show( var f:text; p:poly; n:longint );
var i : longint;
begin
  mod_poly(p,n);
  for i:=0 to n-1 do
    write(f,p[i],' ');
  writeln(f);
end;

var fi,fo : text;
  a,b,p,q,c1,c2,c3 : poly;
  T,j,i,pp : longint;
begin
  assign(fi,'00'); rewrite(fi);
  assign(fo,'00.a'); rewrite(fo);
  {}
  randomize;
  T := 13;
  writeln(fi,T);
  for i:=1 to T do begin
    if random(2)=0 then pp := 7 else pp := 5;
    writeln(fi,pp);
    writeln(fo);
    if random(2)=0 then begin
      repeat
        rand_poly(a,pp);
        rand_poly(b,pp);
        rand_poly(p,pp);
        rand_poly(q,pp);
        mul_poly(a,p,c1,pp);
        mul_poly(b,q,c2,pp);
        add_poly(c1,c2,c3,pp);
      until is_one(c3);
      {}
      show(fo,p,pp);
      show(fo,q,pp);
    end else begin
      writeln(fo,'NO');
      writeln(fo);
      repeat
        rand_poly(c1,3);
        rand_poly(c2,3);
        rand_poly(c3,3);
        mul_poly(c1,c2,a,pp);
        mul_poly(c1,c3,b,pp);
      until (not is_zero(a)) and (not is_zero(b)) and
            (not is_one(c1)) and (not is_one(c2)) and
            (not is_one(c3));
    end;
    show(fi,a,pp);
    show(fi,b,pp);
  end;
  close(fi); close(fo);
end.