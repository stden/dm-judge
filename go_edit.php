<?
  include("_config.php");
  unset($wrong);
  if(!isset($jid)) $wrong = $wrong."Не установлен <u>Judge_ID</u><br>";
  $fullname = trim(strip_tags($fullname));
  $nickname = trim(strip_tags($nickname));
  $email = strip_tags($email);
  if(!strcmp($fullname,"")) $wrong = $wrong."Не указано <u>Полное имя</u><br>";
  if(!strcmp($nickname,"")) $wrong = $wrong."Не указан <u>Ник</u><br>";
  switch(checkmail($email)){
    case -1: $wrong = $wrong."Не верный <u>E-mail</u> $email!<br>"; break;
    case +1: $wrong = $wrong."Не указан <u>E-mail</u><br>";
  };

  if(!isset($wrong)){
    // Загрузка файла
    $u = file($password."users.txt");
    for($i=0;$i<(count($u)/4);$i++)
      if(compare($jid,$u[$i*4])){
        $cur_no = $i;
        break;
      };
    // Изменение данных пользователя
    $u[$cur_no*4] = $jid."\n";
    $u[$cur_no*4+1] = $fullname."\n";
    $u[$cur_no*4+2] = $nickname."\n";
    $u[$cur_no*4+3] = $email."\n";
    // Сохранение в файл
    $fp = fopen($password."users.txt","w");
    for($i=0;$i<count($u);$i++){
      $u[$i] = trim($u[$i]);
      fwrite($fp,$u[$i]."\n");
    };
    fclose($fp);
    // ---
    include("head.php");
    // ---
?>

<center>

<table>
<tr><td class=header bgColor="#C7AF97">
  <b>Изменение личных данных прошло успешно!</b>
<td></tr>

<tr><td class=poles1 bgColor="#E7CFB7">
<center>
<?
  echo("<b>Полное имя:</b> $fullname<br>");
  echo("<b>Ник (краткое имя):</b> $nickname<br>");
  echo("<b>E-mail:</b> $email<br>");
  echo("<b>Judge_ID:</b> $jid<br>");
?>
</table>

<? } else {
      include("head.php");
?>
<center>
<table>
<tr><td class=header bgColor="#C7AF97">
  <b><? echo($wrong); ?></b>
<td></tr>

<tr><td class=poles1 bgColor="#E7CFB7">
<center>
  Нажмите на кнопку "Back" броузера или на ссылку
  <a href="edituser.php">"Изменение личных данных"</a>,
  проверьте и отредактируйте еще раз регистрационную форму!
</table>
<? }; ?>

<?
  echo("<center>Server time: ".date( "l d.m.Y H:i:s" ));
?>
