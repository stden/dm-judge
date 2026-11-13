<? include("_config.php");
   $l = file("tasks.txt");
   // Гоним цикл по количеству задач
   $start = max( 1000, $start );
   if(!isset($end)) $end = 1000000;
   $end = min( 1000+count($l)-1, $end );
   if($end<$start) $start = $end;
   //
   echo("Всего задач на сайте: ".count($l)."<br>");
   echo("Start = ".$start."   end = ".$end."<br><hr>");
   for($i=0;$i<count($l);$i++){
     $e = explode(" ",$l[$i]);
     $tid_ = $e[0];
     if ($tid_ >= $start && $tid_ <= $end) {
       $f = implode(file($password."tasks/$tid_/text.html")," ");
       $f = str_replace("text.files",$password."tasks/$tid_/text.files",$f);
       echo("$f"); 
     };
   };
?>
<hr>
