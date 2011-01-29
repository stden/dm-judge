{$APPTYPE CONSOLE}

var
  ch : char;
  N,Cnt : Integer;
begin
  assign(output,'02'); rewrite(output);
  {}
  randomize;
  {}
  N:=1000;
  write(N,'   ');
  Cnt:=0;
  while Cnt<N do begin
    ch:=chr( random(4) + ord('a') );
    if ch='d' then begin 
      ch:='#'; inc(cnt);
    end;
    write(ch);
  end;
  {}
  close(output);
end.