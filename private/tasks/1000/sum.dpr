{ ������� ������ 1000 �� ����� ������� }
procedure solve;
var a,b : longint;
begin
  read(a,b);
  writeln(a+b);
end;

{ ����� ��� ���� ����� ����� }
var i,n : longint;
begin
  { ������� ������ ������� ����������� � ���� in.txt }
  assign(input,'02.'); reset(input);
  { �������� ������ ����� �������� � ���� out.txt }
  assign(output,'02.a'); rewrite(output);
  {}
  read(n); { ��������� ���������� ������ }
  for i:=1 to n do solve;
end.

