<? include("_config.php");
 if(!file_exists($password."tasks/$tid/text.html")){ 
  include("head.php"); ?>
<br><br><center>  ����� ������ �� ����������!
<? } else {
   // echo("����: tasks/$tid/text.html");
   $f = implode(file($password."tasks/$tid/text.html")," ");
   $f = str_replace("text.files",$password."tasks/$tid/text.files",$f);
   echo($f);
   // include("tasks/$tid/text.html"); ?>
<hr>

<table border=0>
<tr><td>
<a href="<? echo("showtest.php?&tid=$tid&test=01"); ?>" target=_blank>������� ���� (1 ����)</a>
<td>
>>>>
<td>
<a href="<? echo("submit.php?&tid=$tid&test=01"); ?>">
  ������� ����� �� ��������!</a>
<td width=100>
<td>
  <a href="<? $q=$tid-1; echo("tasks.php?&tid=$q"); ?>">
  ���������� ������</a>
<tr><td>
<a href="<? echo("showtest.php?&tid=$tid&test=02"); ?>" target=_blank>������� ���� (3 ����)</a>
<td>
>>>>
<td>
<a href="<? echo("submit.php?&tid=$tid&test=02"); ?>">
  ������� ����� �� ��������!</a>
<td width=100>
<td>
  <a href="<? $q=$tid+1; echo("tasks.php?&tid=$q"); ?>">
  ��������� ������</a>
<table>
<? } ?>