var q,i,j,l : longint;
begin
  randomize;
  assign(output,'in.txt'); rewrite(output);
  {}
  writeln(6);
  for l:=1 to 6 do begin
    writeln;
    writeln(20);
    for i:=1 to 20 do begin
      for j:=1 to 20 do begin
        q:=longint(random(20000))-600;
        if i=j then q:=0;
        if q > 8000 then write('no ')
        else write(q,' ');
      end;
      writeln;
    end;
  end;
end.