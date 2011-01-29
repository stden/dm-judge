{$APPTYPE CONSOLE}

var
  NumVars : Integer;
  Bin : Array [0..20] of Byte; { �������� ������������� ����� }

procedure toBin( i : Integer );
var q,j : Integer;
begin
  { �������� i � �������� ���� }
  q:=i;
  for j:=0 to NumVars-1 do begin
    Bin[j]:=q mod 2;
    q:=q div 2;
  end;
end;

var t1,t2 : TextFile;
  A : Array [0..320768] of Byte;
  tests,cnt,test,Len,i,j : Integer;
  first : Boolean;

begin
  assign(t1,'01'); rewrite(t1);
  assign(t2,'01.a'); rewrite(t2);
  {}
  tests := 3;
  writeln(t1,tests);
  for test:=1 to tests do begin
    { �������� ���������� ���������� }
    NumVars := Random(7)+2;
    { ������� 2^n }
    Len := 1;
    for i:=1 to NumVars do Len := Len*2;
    { ���������� ������ �� 0 � 1, ��� ����� �� ��� ���� ���� � �� ��� ������� }
    repeat
      Cnt:=0;
      for i:=1 to Len do begin
        A[i]:=Random(2);
        if A[i]=1 then Inc(Cnt);
      end;
    until ((Cnt<>0) and (Cnt<>Len));
    { ������� ��������� - ���� }
    first:=true;
    for i:=0 to Len-1 do begin
      toBin(i);
      {}
      if A[i]=1 then begin { ���� }
        if first then first:=false else write(t1,'|');
        for j:=0 to NumVars-1 do begin
          if j<>0 then write(t1,'&');
          if Bin[j]=0 then write(t1,'!');
          write(t1,chr(ord('A')+j));
        end;
      end;
    end;
    writeln(t1);
    { ������� ��������� - ���� }
    first:=true;
    for i:=Len-1 downto 0 do begin
      toBin(i);
      {}
      if A[i]=0 then begin { ���� }
        if first then begin first:=false; write(t2,'('); end else write(t2,')&(');
        for j:=NumVars-1 downto 0 do begin
          if j<>NumVars-1 then write(t2,'|');
          if Bin[j]=1 then write(t2,'!');
          write(t2,chr(ord('A')+NumVars-1-j));
        end;
      end;
    end;
    write(t2,')');
    writeln(t2);
  end;
  {}
  CloseFile(t1); CloseFile(t2);
end.