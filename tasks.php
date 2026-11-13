<? include("_config.php");
 if(!file_exists($password."tasks/$tid/text.html")){ 
  include("head.php"); ?>
<br><br><center>  Такой задачи не существует!
<? } else {
   // echo("Файл: tasks/$tid/text.html");
   $f = implode(file($password."tasks/$tid/text.html")," ");
   $f = str_replace("text.files",$password."tasks/$tid/text.files",$f);
   echo($f);
   // include("tasks/$tid/text.html"); ?>
<hr>

<table border=0>
<tr><td>
<a href="<? echo("showtest.php?&tid=$tid&test=01"); ?>" target=_blank>Простой тест (1 очко)</a>
<td>
>>>>
<td>
<a href="<? echo("submit.php?&tid=$tid&test=01"); ?>">
  Послать ответ на проверку!</a>
<td width=100>
<td>
  <a href="<? $q=$tid-1; echo("tasks.php?&tid=$q"); ?>">
  Предыдущая задача</a>
<tr><td>
<a href="<? echo("showtest.php?&tid=$tid&test=02"); ?>" target=_blank>Сложный тест (3 очка)</a>
<td>
>>>>
<td>
<a href="<? echo("submit.php?&tid=$tid&test=02"); ?>">
  Послать ответ на проверку!</a>
<td width=100>
<td>
  <a href="<? $q=$tid+1; echo("tasks.php?&tid=$q"); ?>">
  Следующая задача</a>
<table>
<? } ?>