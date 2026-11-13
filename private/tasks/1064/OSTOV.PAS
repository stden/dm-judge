{Zadacha reshaetsa po formule Kely O(Kp) = p^(p-2)}
var i,p:integer;
    O:extended;
    t:text;

begin
assign(t,'ostov.txt');
rewrite(t);
repeat
  O:=1;
  readln(p);
  if p < 3 then begin close(t); exit; end;
  for i:=1 to (p-2) do O:=p*O;
  writeln(t,'p= ',p,'; O= ',O:0:0);
until false;
close(t);
end.

