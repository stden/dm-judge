{ Решение задачи 1000 на языке Паскаль }
procedure solve;
var a,b : longint;
begin
  read(a,b);
  writeln(a+b);
end;

{ Общая для всех задач часть }
var i,n : longint;
begin
  { Входные данные следует скопировать в файл in.txt }
  assign(input,'02.'); reset(input);
  { Выходные данные будут выведены в файл out.txt }
  assign(output,'02.a'); rewrite(output);
  {}
  read(n); { Считываем количество тестов }
  for i:=1 to n do solve;
end.

