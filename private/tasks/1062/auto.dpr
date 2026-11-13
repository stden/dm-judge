{$APPTYPE CONSOLE}

var ch : char; { Текущий символ }

procedure nextChar; { Игнорируем все промежуточные символы }
begin
  read(ch);
  while not (ch in ['a','b','c','#']) do begin
    read(ch);
    if eof(input) then break;
  end;
end;

var
  test : char;
  lastChar : (no,aa,bb,cc);
  fail : boolean;
  N,i,Cnt : Integer;
begin
  for test:='0' to '2' do begin
    {}
    assign(input,'0'+test); reset(input);
    assign(output,'0'+test+'.a'); rewrite(output);
    {}
    read(N);
    Cnt:=0;
(*    for i:=1 to N do begin *)
    while not eof(input) do begin
      lastChar:=no;
      fail:=false;
      repeat
        nextChar;
        if eof(input) then break;
        case ch of
          'a': if lastChar in [no,aa] then lastChar:=aa else fail:=true;
          'b': if lastChar in [aa,bb] then lastChar:=bb else fail:=true;
          'c': if lastChar in [bb,cc] then lastChar:=cc else fail:=true;
        end;
      until ch = '#';
      if ch<>'#' then break;
      inc(Cnt);
      if ((not fail) and (lastChar=cc)) then writeln('YES') else writeln('NO');
(*    end; *)
    end;
    {}
//    writeln(Cnt);
    close(input); close(output);
  end;
end.