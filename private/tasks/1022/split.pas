var i1,i2,o1,o2 : text;
  s,ss : string;
  _from,_to,test : longint;
begin
  write('Start test: '); readln(_from);
  write('End test: '); readln(_to);
  assign(o1,'02'); rewrite(o1);
  assign(o2,'02.a'); rewrite(o2);
  writeln(o1,_to-_from+1); writeln(o1);
  for test := _from to _to do begin
    str(test,s);
    while length(s)<2 do s:='0'+s;
    {}
    assign(i1,s+'.i'); reset(i1);
    assign(i2,s+'.o'); reset(i2);
    repeat
      readln(i1,ss);
      writeln(o1,ss);
    until eof(i1);
    writeln(o1);
    repeat
      readln(i2,ss);
      writeln(o2,ss);
    until eof(i2);
    writeln(o2);
    close(i1); close(i2);
  end;
  close(o1); close(o2);
end.