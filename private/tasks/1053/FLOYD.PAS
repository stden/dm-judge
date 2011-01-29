const MaxN = 100;

var
  A : array [1..MaxN,1..MaxN] of longint;
  err,Tests,Test,N,i,j,k : Integer;
  ch : char;
  s : string;
  flag : boolean;
begin
  assign(input,'in.txt'); reset(input);
  assign(output,'out.txt'); rewrite(output);
  {}
  read(Tests);
  for Test:=1 to Tests do begin
    { Читаем тест }
    read(N);
    for i:=1 to N do
      for j:=1 to N do begin
        read(ch);
        while not (ch in ['-','0'..'9','n','o']) do read(ch);
        s:='';
        while ch in ['-','0'..'9','n','o'] do begin
          s:=s+ch;
          read(ch);
        end;
        if s='no' then begin
          A[i,j] := maxLongInt div 2;
        end else begin
          val(s,A[i,j],err);
          if err <> 0 then  RunError(239);
        end;
      end;
    { Собственно алгоритм Флойда }
    for k:=1 to N do
      for i:=1 to N do 
        for j:=1 to N do 
          if A[i,k]+A[k,j] < A[i,j] then A[i,j]:=A[i,k]+A[k,j]; 
    { Ищем отрицательные циклы }
    flag:=false;
    for i:=1 to N do 
      if A[i,i]<0 then begin
        flag:=true;
        break;
      end;
    if flag then writeln('YES') else writeln('NO');
  end;
end.