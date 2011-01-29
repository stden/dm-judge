program King;

uses Crt;
type
 Mas=array [1..25,1..26] of byte;

var
M1: Mas;
X: array[1..25] of byte;
Y: array [1..25] of byte;
F, G: Text;
tmp: byte;
i, j, n: byte;
Sum: word;

Procedure Dobav_1_0(VAR M111 : Mas; i: byte);
begin
M111[i,26]:=1;
end;

Procedure Schet;
var
   k:byte;
   min:word;
   tmp_minj, tmp_mini: byte;
begin
for k:=1 to n-2 do
 begin
  min := 255;
  for i:=1 to 25 do
   begin
    if M1[i,26]=1 then
     begin
       for j:=1 to 25 do
        begin
          if M1[i,j] < min then
             begin
               min := M1[i,j];
               tmp_mini := i;
               tmp_minj := j;
             end;
        end;
     end;
   end;
      Sum := Sum + M1[tmp_mini , tmp_minj];
      M1[tmp_mini, tmp_minj] := 255;
      M1[tmp_minj, tmp_mini] := 255;
      M1[tmp_minj, 26] := 1;
      for i:=1 to 25 do
       begin
        if M1[i,26]=1 then
          begin
            M1[i, tmp_minj] := 255;
            M1[tmp_minj, i] := 255;
            M1[i, tmp_mini] := 255;
            M1[tmp_mini, i] := 255;
          end;
       end;
 end;
end;

begin
 Assign(f, 'd:\input.txt');
 Assign(g, 'd:\output.txt');
 Reset(f);
 Read(f, tmp);
 X[1]:=125;
 Y[1]:=125;
 i:=2;
  while (not Eof(f)) do
  begin
   Read(f, tmp);
   X[i]:=tmp;
   Read(f, tmp);
   Y[i] := tmp;
   Inc(i);
  end;
 n := i;
 for i:=i to 25 do
  begin
   X[i]:=255;
   Y[i]:=255;
  end;
 Close(f);
 for i:=1 to 25 do
 begin
  for j:=1 to 25 do
   begin
    if (i=j) or (X[i] = 255) or (X[j]=255) then M1[i,j] := 255 else
     begin
      M1[i,j] := abs(X[j] - X[i]) + abs(Y[j] - Y[i]);
     end;
   end;
 end;

 Dobav_1_0(M1,1);
 Schet;
 Rewrite(g);
 Write(g, sum);
 Close(g);
end.

