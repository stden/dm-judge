<? include("_config.php"); // Глобальные переменные
   include("head.php");    // Заголовок - верхнее меню

  // Загружаем заголовки заданий из файла "chapters.txt"
  // Нечётные строки - заголовки
  // Чётные строки - списки задач. В списке задач задачи разделены запятыми

  $chapters = file("chapters.txt");
  // Цикл по заголовкам
  for($ch=0;$ch<count($chapters)/2;$ch++){ 
    $ch_header = $chapters[$ch*2];
    $ch_list   = $chapters[$ch*2+1];
    // Если пустой заголовок - кто-то добавил в конец файла пустые строки
    // пропускаем его смело
    if(!strcmp(trim($ch_header),"")) continue;
    // Выделяем список задач
    $ch_tasks = explode(",",$ch_list);
    // print_r($ch_tasks); - Предыдущая строка работает правильно
    // раскомментируйте, чтобы убедиться :)
?>
<center>
<table width="50%">
<tr><td class=header bgColor="#C7AF97">
  <b><?  // Выводим заголовок - раздел задач для первого курса
       echo( $ch_header ); ?></b>  
<td></tr>

<tr><td class=poles1 bgColor="#E7CFB7">

<center>
<table class=inside border=1 width="100%">
<?
  // Загружаем список задач из файла tasks.txt
  $l = file("tasks.txt");
  $sum = 0;
  // Гоним цикл по количеству задач
  for($i=0;$i<count($ch_tasks);$i++){
    $task_id = trim($ch_tasks[$i]);
    echo("<tr><td width=\"50\">");
    $f = explode(" ",$l[$task_id-1000]);
    $lnk = "tasks.php?tid=$f[0]";
    echo("<a href=$lnk target=_blank>$f[0]</a></td><td>");
    echo("<a href=$lnk target=_blank>");
    for($j=1;$j<count($f);$j++)
      echo("$f[$j] ");
    echo("</a></td></tr>");
  };
?>
</table></table>
<? } ?>
<tr><td class=poles1 bgColor="#E7CFB7">
<center>
<br>Чтобы прочитать текст задачи, просто кликните по ней левой кнопкой мыши
 и ее текст откроется в новом окне<br>
</td></tr>
</table>

<?
  echo("<center>Server time: ".date( "l d.m.Y H:i:s" ));
?>
