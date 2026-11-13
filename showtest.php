<pre>
<?
  include("_config.php");
  // Этот файл отображает ответы 
  // Это сделано для дополнительной защиты Ans файлов
  if($test=="01" || $test=="02" || $test=="01.a" || $test=="02.a"){
    include($password."tasks/$tid/$test");
  } else {
    echo("Ничего тут нет :))");
  };
?>