uses crt;

procedure prover;
var znak, operand : set of char;
    i, t, p : -100..100;
    s : string;
begin
  readln(s);
  t := 0;
  znak := ['+', '/', '-', '*', '^'];
  operand := ['x', 'y', 'z'];
  p := 0;
  for i := length(s) downto 1 do
    begin
      if s[i] in znak
        then dec(t)
        else
          if s[i] in operand
            then inc(t);
      if t <= 0 then inc(p);
    end;

  if (t = 1) and (p = 0)
    then writeln('TRUE')
    else writeln('FALSE');
end;

var n, i : longint;
 begin
   clrscr;
   assign(input,'c:\in1.txt');
   reset(input);
   readln(n);
   assign(output,'c:\out1.txt');
   rewrite(output);
for I := 1 to n do
   prover;
end.