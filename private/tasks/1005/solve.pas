{ Пример, иллюстрирующий решение задачи }
type TPole = Array [-17..17,-17..17] of LongInt;
     PPole = ^TPole;
var p : array [0..18] of PPole;
    k,i,j,n,x,y : integer;
begin
 { NULL }
  for k:=0 to 16 do begin
    new(p[k]);
    for i:=-17 to 17 do
      for j:=-17 to 17 do
        p[k]^[i,j] := 0;
  end;
 { Init }
  p[0]^[0,0]:=1;
 { Work }
  for k:=1 to 18 do
    for i:=-16 to 16 do
      for j:=-16 to 16 do
        p[k]^[i,j]:=p[k-1]^[i-1,j]+p[k-1]^[i+1,j]+
                    p[k-1]^[i,j+1]+p[k-1]^[i,j-1];
 { Out }
  for i:=-5 to 5 do begin
    for j:=-5 to 5 do write(p[18]^[i,j]:4,' [',i:2,',',j:2,']');
    writeln;
  end;
end.