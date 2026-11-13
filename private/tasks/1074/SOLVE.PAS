var
  A,B,AA : String;
  fileNum : char;
  i,j,k,TT,T,N : Integer;
  sum : Longint;
begin
  for fileNum := '0' to '2' do begin
    assign(input,'0'+fileNum); reset(input);
    assign(output,'0'+fileNum+'.a'); rewrite(output);
    {}
    readln(TT);
    for T:=1 to TT do begin
      Readln(A);
      AA := A;
      Readln(B);
      while ((Length(A)>0) and (Length(B)>0)) do begin
        if A[1]=B[1] then Delete(A,1,1);
        Delete(B,1,1);
      end;
      if Length(A)>0 then 
        writeln('слово '+AA+' не найдено')
      else 
        writeln('слово '+AA+' найдено');
    end;
    {}
    close(input); close(output);
  end;
end.