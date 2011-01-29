<?
// Checker for the problem 1039: "Polynoms"  PHP 4.0
//   by Denis Stepoulenok 02.07.2003

function mod_poly( $P, $m ){
  for($i=0;$i<$m;$i++)
    $R[$i] = $P[$i];
  for($i=$m;$i<count($P);$i++){ 
    $idx = ($i-1) % ($m-1) + 1;
    $R[$idx] = $P[$idx] + $P[$i];
  };
  for($i=0;$i<$m;$i++)
    $R[$i] = $R[$i] % $m;
  return $R;
};

function add_poly( $A,$B ){ 
  $b = min(count($A),count($B));
  $e = max(count($A),count($B));
  for($i=0;$i<$e;$i++){
    $R[$i] += $A[$i] + $B[$i];
  };
  return $R;
};

function mul_poly( $A,$B ){
  for($i=0;$i<count($A);$i++) 
    for($j=0;$j<count($B);$j++){ 
      $R[$i+$j] += $A[$i] * $B[$j];
    };
  return $R;
};

// true  - all is ok (ACCEPTED)
// false - something wrong (WRONG ANSWER)
function check_one_test( $A, $B, $P, $Q, $deg ) {
  $T = mod_poly( add_poly( mul_poly($A,$P), mul_poly($B,$Q) ), $deg );
  // if $T == 1 + 0x + 0x^2 + ...
  if($T[0]!=1) return false;
  for($i=1;$i<count($T);$i++) 
    if($T[$i]!=0) return false;
  return true;
}

// true  = ACCEPTED
// false = WRONG ANSWER
function check_all_tests ( $in, $st, $jr ) {
  // Parse Input File
  $tests = strtok($in," \r\n\t");
  for($t=0;$t<$tests;$t++){
    $deg[$t] = strtok(" \r\n\t");
    for($i=0;$i<$deg[$t];$i++)
      $A[$t][$i] = strtok(" \r\n\t");
    for($i=0;$i<$deg[$t];$i++)
      $B[$t][$i] = strtok(" \r\n\t");
  };
  // Parse Jury Output File
  $first = strtok($jr," \r\n\t"); // Maybe 'NO'
  for($t=0;$t<$tests;$t++){
    if (!strcmp($first,"NO")) { 
      $noAnswer[$t] = true;
    } else {
      for($i=0;$i<(2*$deg[$t]-1);$i++) strtok(" \r\n\t");
    };
    $first = strtok(" \r\n\t");
  };
  // Parse Student Output File
  $first = strtok($st," \r\n\t"); // Maybe 'NO'
  for($t=0;$t<$tests;$t++){
    if (!strcmp($first,"NO")) { 
      if(!isset($noAnswer[$t])) return false;
    } else {
      unset($P); unset($Q);
      $P[0] = $first;
      for($i=1;$i<$deg[$t];$i++) $P[$i] = strtok(" \r\n\t");
      for($i=0;$i<$deg[$t];$i++) $Q[$i] = strtok(" \r\n\t");
      if (!check_one_test($A[$t],$B[$t],$P,$Q,$deg[$t])) return false;
    };
    $first = strtok(" \r\n\t");
  };
  return true;
}

?>
