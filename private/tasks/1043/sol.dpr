{$APPTYPE CONSOLE}

var F : String; { Логическая функция }

function replace( _from,_to:String ):Boolean;
var i : Integer;
begin
  Result:=false;
  for i:=1 to (Length(F)-Length(_From)+1) do begin
    if Copy(F,i,Length(_from))=_from then begin
      Delete(F,i,Length(_from));
      Insert(_to,F,i);
      Result:=true;
    end;
  end;
end;

procedure Simplify;
begin
  while Length(F)>1 do begin
    {!}
    While Replace('!0','1') do;
    While Replace('!1','0') do;
    {&}
    While Replace('0&0','0') do;
    While Replace('0&1','0') do;
    While Replace('1&0','0') do;
    While Replace('1&1','1') do;
    {|}
    While Replace('0|0','0') do;
    While Replace('0|1','1') do;
    While Replace('1|0','1') do;
    While Replace('1|1','1') do;
  end;
end;

var
  testNum,test,vectors,vv : integer;
  FF : String; { Логическая функция }
  v : String; { Вектор значений }
  ch : Char;
begin
  assign(input,'01'); reset(input);
  assign(output,'01.a'); rewrite(output);
  {}
  readln(testNum);
  for test:=1 to testNum do begin
    {}
    FF:='';
    repeat
      read(ch);
      if ch<>' ' then FF:=FF+ch;
    until ch=' ';
    {}
    readln(vectors);
    Writeln;
    for vv:=1 to vectors do begin
      readln(v);
      F:=FF;
      {}
      for ch:='A' to Chr(Length(v)+Ord('A')-1) do
        Replace(ch,v[Ord(ch)-Ord('A')+1]);
      Simplify;
      {}
      Writeln(F);
    end;
  end;
  {}
  CloseFile(input); CloseFile(output);
end.