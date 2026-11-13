{$APPTYPE CONSOLE}

var n:integer;

procedure solve;
{Zadacha reshaetsa po formule Kely O(Kp) = p^(p-2)}
var p,O:int64;
  i : integer;
begin
  p:=n;
  O:=1;
  for i:=1 to (p-2) do O:=p*O;
  writeln(O);
//  writeln(high(int64));
end;

var tests,test : integer;
  tt : char;
begin
  for tt:='0' to '2' do begin
    assign(input,'0'+tt); reset(input);
    assign(output,'0'+tt+'.a'); rewrite(output);
    {}
    read(tests);
    for test:=1 to tests do begin
      read(n);
      solve;
    end;
    {}
    close(output); close(input);
  end;
end.