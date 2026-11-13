<?
  include("_config.php");

  function get_MT(){
    $e = explode(" ",microtime());
    return $e[0]+$e[1];
  };

  function testBoolean( $testNo, $a, $b ){
    if($a!=$b){
      echo("Неправильный ответ на тесте $testNo<br><br>");
    } else {
      echo("Test $testNo OK!<br>");
    };
  };

  testBoolean(1,compare(" 1 2 3 ","1  2  3"),true);
  testBoolean(2,compare(" 1 2\n\n\n3\n","  1  2 3"),true);
  testBoolean(3,compare("   123   234   35","123\n234  35\n"),true);
  testBoolean(4,compare(" 1 2 3 ","1  22  3"),false);
  testBoolean(5,compare(" denis xxx 2 3 ","\ndenis\nxxx\n 2  \n 3  \n"),true);
  testBoolean(6,compare("123","1  2  3"),false);
  testBoolean(7,compare("     ","    1 "),false);
  testBoolean(8,compare(" 1  \n\n\n\n\t\t\t\t ","    1"),true);
  testBoolean(9,compare(" \n\n\n\n\t\t\t\t ","   \t\n "),true);
  testBoolean(10,compare(""," 1 "),false);

  $t1 = get_MT();
  $s1 = ""; for($i=0;$i<10000;$i++) $s1[$i] = " ";
  $s2 = ""; for($i=0;$i<10000;$i++) $s2[$i] = "\n";
  $t2 = get_MT();
  echo("Время генерации: ".($t2 - $t1)."<br>");
  testBoolean(11,compare($s1,$s2),true);
  echo("Время сравнения: ".(get_MT() - $t2)."<br>");
?>