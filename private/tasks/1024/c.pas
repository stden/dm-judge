{Array}
Var
  D : array[0..20] of LongInt;
  i, j, N, S : LongInt;
Begin
  Assign(input, 'c.in'); ReSet(input);
  Assign(output, 'c.out'); ReWrite(output);

  Read(N, S);
  for i := 1 to N do Read(D[i]);
  D[0] := S;

  for i := 1 to N do Begin
    WriteLn((D[i - 1] div D[i]) - 1);
  end;

End.