{$APPTYPE CONSOLE}

var
  A,B : String;
  Bin : Array [0..20] of Byte; { Двоичное представление числа }
  first : boolean;
  tests,test,i,j,k,q,t : Integer;
begin
  if ParamCount=2 then begin
    assign(input,ParamStr(1)); reset(input);
    assign(output,ParamStr(2)); rewrite(output);
  end else begin
    assign(input,'01'); reset(input);
    assign(output,'01.a'); rewrite(output);
  end;
  {}
  readln(tests);
  for test:=1 to tests do begin
    first := true;
    readln(A);
    readln(B);
    for i:=1 to Length(A) do
      if ((B[i]='1') and (A[i]='1')) then begin
        if first then first:=false else write('|');
        q:=i-1;
        t:=Length(A)-1;
        j:=-1;
        while t>0 do begin
          inc(j);
          Bin[j]:=q mod 2;
          q:=q div 2;
          t:=t div 2;
        end;
        {}
        for k:=j downto 0 do begin {?}
          if k<>j then write('&');
          if Bin[k]=0 then write('!'); {?}
          write(Chr(Ord('A')+j-k));
        end;
      end;
    writeln;
  end;
  {}
  CloseFile(input); CloseFile(output);
end.