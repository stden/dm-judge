<? include("_config.php");
   include("head.php");
  ?>

<center>
<table>
<tr><td class=header bgColor="#C7AF97">
  <b>������ �����</b>
<td></tr>

<tr><td class=poles1 bgColor="#E7CFB7">

<center>
<table class=inside border=1>
<?
  unset($q); unset($mySum); unset($allSum);
  $s = file($password."submits.txt");
  for($i=0;$i<count($s);$i++){
    $r = explode(" ",trim($s[$i]));
    // ��������� ��� �� ������, ����� ������� �������� ���� :)
    $judge_id = trim($r[0]); $task_id = $r[1];
    $test_no  = $r[2];       $result = $r[3];
    if(!strcmp($test_no,"01")){ $add=1; } else $add=3; // ������� �������� �� ���� ����
    if(!strcmp($result,"AC")){
      if(!isset($q[$judge_id.$task_id.$test_no])){ // ������ ���� ����� � $q
        $allSum[$task_id]+=$add;
        if(!strcmp($judge_id,$jid)) $mySum[$task_id]+=$add;
      };
      $q[$judge_id.$task_id.$test_no] = 1;
    };
  };
  // ��������� ������ ����� �� ����� tasks.txt
  $l = file("tasks.txt");
  $sum = 0;
  // ����� ���� �� ���������� �����
  for($i=0;$i<count($l);$i++){
    echo("<tr><td>");
    $f = explode(" ",$l[$i]);
    $lnk = "tasks.php?tid=$f[0]";
    echo("<a href=$lnk target=_blank>$f[0]</a></td><td>");
    echo("<a href=$lnk target=_blank>");
    for($j=1;$j<count($f);$j++)
      echo("$f[$j] ");
    echo("</a></td><td> ");
    // ������ ����� �� ������ ������
    if(!isset($mySum[$f[0]])) $mySum[$f[0]]=0;
    if(!isset($allSum[$f[0]])) $allSum[$f[0]]=0;
    echo("&nbsp;<b>".$mySum[$f[0]]."&nbsp;</td><td>"); 
    echo("&nbsp;<b>".$allSum[$f[0]]."&nbsp;"); // ������ ���� ����� � $q
    $sum = $sum + $mySum[$f[0]];
    echo("</td></tr>");
  };
?>
</table>
<tr><td class=poles1 bgColor="#E7CFB7">
<center>
����� ����� �����:<b> <? echo("$sum"); ?></b>.
<br>����� ��������� ����� ������, ������ �������� �� ��� ����� ������� ����
 � �� ����� ��������� � ����� ����<br>

</td></tr>

</table>

<?
  echo("<center>Server time: ".date( "l d.m.Y H:i:s" ));
?>
