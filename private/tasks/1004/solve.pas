{ Решение задачи 1004 - Черепашка }
var i,j,n:longint;
    a,res:array [1..40,1..40] of longint;
Function Max(a,b:longint):longint;
  begin
    if a>b then max:=a else max:=b;
  end;

begin
  read(n);
  for i:=1 to n do 
    for j:=1 to n do
      read(a[i,j]);
  res[1,1]:=a[1,1];
  for i:=2 to n do
    begin
      res[1,i]:=a[1,i]+res[1,i-1];
      res[i,1]:=a[i,1]+res[i-1,1];
    end;
  for i:=2 to n do
    for j:=2 to n do
        res[i,j]:=max(res[i-1,j],res[i,j-1])+a[i,j];
  writeln(res[n,n]);
end.