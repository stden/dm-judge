<?
// Checker for the problem 1013: "Words"  PHP 4.0
//   by Denis Stepoulenok 20.06.2003

// true  - all is ok (ACCEPTED)
// false - something wrong (WRONG ANSWER)
function check_one_test( $A, $B, $C, $sizeJury, $sizeStudent ) {
  if($sizeJury != $sizeStudent) return false;
  if(strlen($C) != (strlen($A)+strlen($B))) return false;
  $B = strtoupper($B);
  $A = strtolower($A);
  for($k=$i=$j=0; $C[$k]; $k++)
    if($C[$k]>='a' && $C[$k]<='z') {
      if($C[$k]!=$A[$i] || $i>=strlen($A)){ return false; } else $i++;
    } else {
      if($C[$k]!=$B[$j] || $j>=strlen($B)){ return false; } else $j++;
    };
  $C = strtolower($C);
  for($i=$k=0; $C[$k+1]; $k++)
    if($C[$k]>$C[$k+1]) $i++;
  if($i!=$sizeJury) return false;
  return true;
}

// true  = ACCEPTED
// false = WRONG ANSWER
function check_all_tests ( $in1, $st1, $jr1 ) {
  $in = explode(chr(13).chr(10),$in1);
  $st = explode(chr(13).chr(10),$st1);
  $jr = explode(chr(13).chr(10),$jr1);
  sscanf($in[0],"%d",&$tests);
  // echo("- $tests -<br>"); if Debug
  for($t=0;$t<$tests;$t++){
    sscanf($in[$t*3+1],"%s",$tmp);
    sscanf($in[$t*3+2],"%s",$A);
    sscanf($in[$t*3+3],"%s",$B);
    sscanf($st[$t*2],  "%d",&$sizeStudent);
    sscanf($st[$t*2+1],"%s",$C);
    sscanf($jr[$t*2],  "%d",&$sizeJury);
    sscanf($jr[$t*2+1],"%s",$D);
    // echo("- $A - $B - $C - $sizeStudent - $sizeJury -<br>"); if Debug
    if (!check_one_test($A,$B,$C,$sizeJury,$sizeStudent)) return false;
  };
  return true;
}

?>