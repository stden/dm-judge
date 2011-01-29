<?
  // Системные процедуры и глобальные переменные

  $password = "private/"; // Каталог, в котором находятся задачи и ответы к ним

  // доп. функция для удаления опасных сиволов
  function pregtrim($str) {
    return preg_replace("/[^\x20-\xFF]/","",@strval($str));
  }

  //
  // проверяет мыло и возвращает
  //  *  +1, если мыло пустое
  //  *  -1, если не пустое, но с ошибкой
  //  *  строку, если мыло верное
  //

function checkmail($email) {
   // режем левые символы и крайние пробелы
   $email=trim(pregtrim($email));
   // если пусто - выход
   if (strlen($email)==0) return 1;
   if (!preg_match("/^[a-z0-9_-]{1,20}@(([a-z0-9-]+\.)+(com|net|org|mil|".
   "edu|gov|arpa|info|biz|inc|name|[a-z]{2})|[0-9]{1,3}\.[0-9]{1,3}\.[0-".
   "9]{1,3}\.[0-9]{1,3})$/is",$email))
   return -1;
   return $email;
}

  // Просмотр ASCII кодов заданной стоки
  function debugView( $s ){
    echo("[");
    for($i=0;$i<strlen($s);$i++)
      echo(ord($s[$i]).".");
    echo("]");
  };

  // Сравнение строк без учета разделяющих символов
  // Много разделителей считается за один
  function compare( $s1, $s2 ){
    $l1 = strlen($s1); $i1 = 0;
    $l2 = strlen($s2); $i2 = 0;
    while( $i1<=$l1 && $i2<=$l2 ){  // Строки в PHP заканчиваются на 0
      while( $s1[$i1]<=' ' && ord($s1[$i1])!=0) $i1++;
      while( $s2[$i2]<=' ' && ord($s2[$i2])!=0) $i2++;
      if($i1>=$l1 && $i2>=$l2) break; // Обе строки кончились
      // Пропускаем совпадающие символы
      while($s1[$i1]>' ' && $s1[$i1]==$s2[$i2]){
        $i1++; $i2++;
      };
      // Если хотя бы одна из строк не кончилась
      // на контрольный символ => ошибка
      if($s1[$i1]>' ' || $s2[$i2]>' ') return false;
    };
    return true;
  };

  // Проверка Judge_ID на существование
  //   Если Judge_ID существует, то функция присваивает
  // нужное значение $nickname
  function right_Judge_ID( $testJID ){
    global $fullname; // Данные о текущем пользователе
    global $nickname;
    global $email;
    global $cur_no;  // Номер текущего пользователя в списке
    global $users;
    global $password;
    $users = file($password."users.txt");
    for($i=0;$i<count($users);$i++)
      $users[$i] = trim($users[$i]);
    for($i=0;$i<(count($users)/4);$i++)
      if(compare($testJID,$users[$i*4])){
        $fullname = $users[$i*4+1];
        $nickname = $users[$i*4+2];
        $email = $users[$i*4+3];
        $cur_no = $i;
        return true;
      };
    return false;
  };

  function myTime(){
    $r = explode(" ",microtime());
    return $r[0]+$r[1];
  };

  // TODO: Надо брать админский пароль откуда-то ещё
  $is_admin = compare($admin_pass,"adminpass"); 
?>