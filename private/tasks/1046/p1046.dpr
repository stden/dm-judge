{$APPTYPE CONSOLE}

var N,i,j,cnt : Integer;
  S : String;
  c : Char;
begin
  for c:='1' to '2' do begin
    assign(input,'0'+c); reset(input);
    assign(output,'0'+c+'.a'); rewrite(output);
    {}
    readln(N);
    if N<0 then RunError(239);
    for i:=1 to N do begin
      readln(S);
      if Length(S)>255 then RunError(239);
      cnt:=0;
      for j:=1 to Length(S)-4+1 do
        if Copy(s,j,4) = 'nano' then
          inc(cnt);
      writeln(cnt);
    end;
    {}
    close(input); close(output);
  end;
end.