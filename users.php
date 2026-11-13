<? include("_config.php");
   include("head.php"); ?>

<!-- Отображение списка участников -->

<center>

<table>
<tr><td class=header bgColor="#C7AF97">
  <b>Рейтинг участников
  <? if ($is_admin) echo("Режим администратора"); ?>
</b>
<td></tr>

<tr><td class=poles1 bgColor="#E7CFB7">

<center>
<table class=inside border=1>

<tr>
<td bgcolor="#D7BF97"><center><b><i>№
<? if ($is_admin) { ?>
<td bgcolor="#D7BF97"><center><b>Judge_ID
<? }; ?>
<td bgcolor="#D7BF97"><center><b>Полное имя
<td bgcolor="#D7BF97"><center><b>Ник
<!--<td><center><b>E-mail -->
<td bgcolor="#D7BF97"><center><b>Посылок
<td bgcolor="#D7BF97"><center><b>Счет
<td bgcolor="#D7BF97"><center><b>Решенные задачи
<?
  // Заполняем масив $q
  unset($q);
  unset($try);
  $s = file($password."submits.txt");
  for($i=0;$i<count($s);$i++){
    $s[$i] = trim($s[$i]);
    $r = explode(" ",$s[$i]);
    $try[$r[0]]++;
    if(strcmp($r[3],"AC")==0){
      // echo("---- ".$r[0].$r[1].$r[2]."<br>");
      $q[$r[0].$r[1].$r[2]] = 1;
    };
  };
  // Заполняем список задач
  unset($tasks);
  $tasksQ = file("tasks.txt");
  for($i=0;$i<count($tasksQ);$i++){
    $r = explode(" ",$tasksQ[$i]);
    $tasks[$i] = $r[0];
  };
  // Загружаем список участников из файла tasks.txt
  unset($show);
  // Гоним цикл по количеству участников
  for($i=0;$i<(count($users)/4);$i++){
    $k = "";
    if ($is_admin) $k .= "<a href=list.php?judge_id=".$users[$i*4].">".$users[$i*4]."</a><td>";
    if (!isset($try[$users[$i*4]])) $try[$users[$i*4]] = 0;
    // Calc sum
    $sum = 0;
    $lst = "";
    for($j=0;$j<count($tasks);$j++){
      $cur_sum = 0;
      if(isset($q[$users[$i*4].$tasks[$j]."01"])) $cur_sum += 1;
      if(isset($q[$users[$i*4].$tasks[$j]."02"])) $cur_sum += 3;
      if($cur_sum>0)
        $lst = $lst."<a href=tasks.php?tid=".$tasks[$j]." target=_blank>".
          $tasks[$j]."</a>"."-".$cur_sum." ";
      $sum += $cur_sum;
    };
    $k = $k."<center><a href=\"mailto:".$users[$i*4+3]."\">".$users[$i*4+1].
      "<td><center><b>".$users[$i*4+2]."<td>"."<center><b>".$try[$users[$i*4]].
      "<td><center><b>".$sum;
    $solved[$k] = $lst;
    $show[$k] = $sum + 1/($try[$users[$i*4]]+2);
  };
  // Сортировка и отображение
  arsort($show);
  $i = 1;
  for(reset($show); $key = key($show); next($show)) {
    echo("<tr><td><center><b>".$i."<td><center>".$key);
    echo("<td><font size=-1>".$solved[$key]."&nbsp;");
    $i++;
    echo("</td></tr>");
  }
?>
</table>
</table>

<?
  echo("<center>Server time: ".date( "l d.m.Y H:i:s" ));
?>
