var 
  A : array [1..100,1..100] of Longint;
  fileNum : char;
  i,j,k,TT,T,N,x,y : Integer;
  sum : Longint;
begin
  for fileNum := '0' to '2' do begin
    assign(input,'0'+fileNum); reset(input);
    assign(output,'0'+fileNum+'.a'); rewrite(output);
    {}
{    read(TT); }
    for T:=1 to 1 do begin
      sum:=0;
      Read(N);
      for i:=1 to N do begin
        read(x,y);
        sum:=sum+abs(x-125);
        sum:=sum+abs(y-125);
      end;
      writeln(sum);
    end;
    {}
    close(input); close(output);
  end;
end.