<? include("_config.php");
   $start_time = myTime();
   include("head.php"); ?>

<center>

<table>
<tr><td class=header bgColor="#C7AF97">
  <b>Список посылок</b>
<td></tr>

<tr><td class=poles1 bgColor="#E7CFB7">

<table class=inside border=1>

<tr>
  <td><center><b>Полное имя<td><center><b>Задача<td><center><b>Тест
  <td><center><b>Результат<td><center><b>Время
</tr>
<?
  if(!isset($users)) $users = file($password."users.txt"); 
  $users_num = count($users)/4;
  for($i=0;$i<$users_num*4;$i++)
    $users[$i] = trim($users[$i]);
  unset($nicks);
  for($i=0;$i<$users_num;$i++)
    $nicks[$users[$i*4]] = $users[$i*4+1];
  // Отображение файла
  $f = file($password."submits.txt");
  for($i=(count($f)-1);$i>=(count($f)-60);$i--){
    $q = explode(" ",$f[$i]);
    echo("<tr><td>".$nicks[$q[0]]."<td><a href=tasks.php?tid=".$q[1].">".$q[1]."</a><td>".$q[2]."<td>".$q[3]."<td>".$q[4]." ".$q[5]."</tr>");
  };
?>
</table>
</td></tr>

</table>

<?
  echo("<center>Server time: ".date( "l d.m.Y H:i:s" )."&nbsp;&nbsp;");
  printf("Page generation: %0.3f sec",(myTime()-$start_time));
?>
