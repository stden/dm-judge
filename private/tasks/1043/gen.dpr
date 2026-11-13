{$APPTYPE CONSOLE}

var
  NumVars,j,testNum,test,vectors,vec,i : integer;
  F : String; { Логическая функция }
  v : String; { Вектор значений }
  D : String;
  ch,VV,cur,c : Char;
  Ex : Array ['A'..'Z'] of boolean; { Есть ли в выражении такая буква }
  Change : Array ['A'..'Z'] of Char; { Замена }
begin
  assign(output,'01'); rewrite(output);
  {}
  randomize;
  {}
  testNum := 3;
  FillChar(Ex,SizeOf(Ex),false);
  writeln(testNum);
  for test:=1 to testNum do begin
    {}
    F:='';
    for i:=1 to 1200 do begin
      VV := Chr(Ord('A')+Random(26));
      D:=VV;
      for j:=1 to Random(3) do
        D:='!'+D;
      Case Random(2) of
        0: if i<>1 then D:='&'+D;
        1: if i<>1 then D:='|'+D;
      end;
      Ex[VV]:=true;
      F:=F+D;
    end;
    {normalize}
    NumVars:=0;
    cur:='A';
    for c:='A' to 'Z' do
      if Ex[c] then begin
        Change[c]:=cur;
        Inc(NumVars);
        cur := Chr(Ord(cur)+1);
      end;
     for i:=1 to Length(F) do
       if F[i] in ['A'..'Z'] then
         F[i]:=Change[F[i]];
    {}
    Write(F,'  ');
    { Генерация векторов значений }
    vectors:=random(5)+1;
    writeln(vectors);
    for vec:=1 to vectors do begin
      for i:=1 to NumVars do
        Write(Random(2));
      Writeln;
    end;
  end;
  {}
  CloseFile(output);
end.