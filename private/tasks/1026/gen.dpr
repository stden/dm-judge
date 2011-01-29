{$APPTYPE CONSOLE}

{ Генератор тестов к задаче "Китайская теорема об остатках" } 

Function NOD( A,B : Int64 ): Int64;
Begin
  While ((A>0) And (B>0)) do begin
    if A>B then
      A := A mod B
    else
      B := B mod A;
  end;
  If A>0 then NOD:=A else NOD:=B;
End;

Var N,I,Tests,Test,J:LongInt;
  Accept : Boolean;
  M,R : Array [1..20] of Int64;
  MM,X : Int64;
  FI, FO : Text;
Begin
  Assign(FI,'00.'); Rewrite(FI);
  Assign(FO,'00.a'); Rewrite(FO);
  Randomize;
  {}
  Tests := 6;
  Writeln(FI,Tests);
  For Test := 1 to Tests do begin
    N := Random(3) + 1;
    Write(FI,N);
    { Generate Mi }
    MM := 1;
    For I:=1 to N do begin
      Repeat
        M[I] := Random(9)+2;
        Accept := true;
        For J:=1 to I-1 do
          If NOD(M[I],M[J])>1 then begin
            Accept := false;
            break;
          end;  
        If MM * M[i] > MaxLongint then Accept := false;
      Until Accept;
      MM := MM * M[i];
      Write(FI,' ',M[I]);
    end;
    { Generate X }
    X := (Int64(Random(65536)) * Random(65536) + Int64(Random(65536)) * Random(256)
          + Random(65536)) mod MM;
    Writeln(FO,X);
    { Calculate Ri }
    For I:=1 to N do begin
      R[I] := X mod M[I];
      Write(FI,' ',R[I]);
    end;
    Writeln(FI);
  end;
  {}
  Close(FI); Close(FO);
End.