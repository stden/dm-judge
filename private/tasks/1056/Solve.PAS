 procedure solve;
 var
 n,i,j,k:integer;
 mas:array[1..50,1..50] of integer;

 begin
 read(input,n);

 for j:=1 to n do
    for i:=1 to n do
      begin
        read(input,k);
        mas[j,i]:=k;
      end;

  for i:=1 to n do if mas[i,i]>=0 then mas[i,i]:=0;

    for k:=1 to n do
      for j:=1 to n do
        for i:=1 to n do
          begin
            if (mas[j,k]>=0) and (mas[J,I]>=0) and (mas[k,i]>=0) then
            if mas[j,k]+mas[k,i]< mas[J,I] then
            mas[J,I]:= mas[j,k]+mas[k,i];
          end;
  for j:=1 to n do
    begin
      for i:=1 to n do write (output,mas[j,i],' ');
      writeln;
      end;
      writeln;
  end;
var i,p:integer;
 begin
   assign(input,'in.txt');
   reset(input);
   assign(output,'out.txt');
   rewrite(output);
   read(input,p);
   for i:=1 to p do solve;
   close(input);
   close(output);
 end.