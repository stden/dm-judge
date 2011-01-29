{$APPTYPE CONSOLE}
var
  ar:array[0..1001] of integer;
  n:longint;
  l,x,i,j,test,tests:longint;
  maxh:longint;
{}
begin
  if ParamCount <> 2 then exit;
  assign(input,ParamStr(1));reset(input);
  assign(output,ParamStr(2));rewrite(output);
  {}
  read(tests);
  for test:=1 to tests do begin
    {}
    read(n);
    for i:=0 to 1001 do ar[i]:=0;
    for i:=1 to n do begin
      read(l,x);maxh:=0;
      for j:=x to x+l-1 do if ar[j]>maxh then maxh:=ar[j];
      for j:=x to x+l-1 do ar[j]:=maxh+1;
    end;
    {}
    maxh:=0;
    for i:=0 to 1001 do if ar[i]>maxh then maxh:=ar[i];
    {}
    writeln(maxh);
  end;
  close(input);close(output);
end.