var 
  A : array [1..100,1..100] of Longint;
  fileNum : char;
  i,j,k,TT,T,N : Integer;
  sum : Longint;
begin
  for fileNum := '0' to '2' do begin
    assign(input,'0'+fileNum); reset(input);
    assign(output,'0'+fileNum+'.a'); rewrite(output);
    {}
    read(TT);
    for T:=1 to TT do begin
      Read(N);
      if ((N<1) or (N>100)) then RunError(239);
      for i:=1 to N do 
        for j:=1 to N do begin
          {$I-} read( A[i,j] ); {$I+}
          if IOResult<>0 then begin Writeln(i,' ',j); Halt; end;
          if ((A[i,j]<-1) or (A[i,j]>100)) then RunError(100+A[i,j]);
          if A[i,j]=-1 then A[i,j]:=MaxInt;
        end;
      {}
      for i:=1 to N do 
        if A[i,i]<>0 then RunError(239);
      {}
      for k:=1 to N do 
        for i:=1 to N do 
          for j:=1 to N do 
            if A[i,k]+A[k,j] < A[i,j] then 
              A[i,j] := A[i,k]+A[k,j];
      {}
      sum:=0;
      for i:=1 to N do 
        if A[1,i]<>MaxInt then  
          sum := sum + A[1,i];
      writeln(sum);
    end;
    {}
    close(input); close(output);
  end;
end.