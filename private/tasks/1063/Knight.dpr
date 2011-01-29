{$APPTYPE CONSOLE}

var i,j,n,Nsqr:integer;
    q:boolean;
    dx,dy:array[1..8]of integer;
    h:array[1..8,1..8]of integer;

procedure _Try(i,x,y:integer;var q:boolean);
var k,u,v:integer;
    q1:boolean;
begin
  q:=false;
  for k:=1 to 8 do begin
    u:=x+dy[k];
    v:=y+dx[k];
    if(1<=u)and(u<=n)and(1<=v)and(v<=n)and(h[u,v]=0)then
      begin
        h[u,v]:=i;
        if i < Nsqr then
          begin
            _try(i+1,u,v,q1);
            if (not q1) then h[u,v]:=0;
            if q1 then begin
              q := true; break;
            end;
          end
        else begin
          q := true;
          break;
        end;
      end;
  end;
end;

var tests,test : integer;
  tt : char;
begin
  dx[1]:=-1; dy[1]:=-2;
  dx[2]:=+1; dy[2]:=-2;
  dx[3]:=-2; dy[3]:=-1;
  dx[4]:=+2; dy[4]:=-1;
  dx[5]:=-2; dy[5]:=+1;
  dx[6]:=+2; dy[6]:=+1;
  dx[7]:=-1; dy[7]:=+2;
  dx[8]:=+1; dy[8]:=+2;
  {}
  for tt:='0' to '2' do begin
    assign(input,'0'+tt); reset(input);
    assign(output,'0'+tt+'.a'); rewrite(output);
    {}
    read(tests);
    for test:=1 to tests do begin
      read(n);
      fillChar(h,sizeOf(h),0);
      {}
      Nsqr := n*n;
      read(i,j);
      h[i,j]:= 1;
      _Try(2,i,j,q);
      if q then
        for i:=1 to n do
          begin
            for j:= 1 to n do
              write(h[i,j]:4);
            writeln;
          end
      else writeln('no path');
      writeln;
    end;
    {}
    close(output); close(input);
  end;
end.