<?
  // Отображение текущих настроек пользователя и верхнего меню
  if(isset($judge_id)){
     if(right_judge_ID($judge_id)){
       setcookie("jid",$judge_id);
       $jid = $judge_id;
       $show_right_jid = true;
     } else {
       $show_right_jid = false;
     };
   } else {
     $show_right_jid = true;
     right_judge_ID($jid); // -- Это сделано для того, чтобы получить NickName --
   };
?>
<html>
<head>
  <title>acm.eltech.ru/judge - архив задач с тестирующей системой</title>
  <link href="img/border.css" type=text/css rel=stylesheet>
  <META http-equiv=Content-Type content="text/html; charset=windows-1251">
  <SCRIPT language=JavaScript>
    function ou(d) {
      d.style.backgroundColor   = '#F8FFF8';
      d.style.borderRightColor  = '#F8FFF8'; 
      d.style.borderLeftColor   = '#F8FFF8'; 
      d.style.borderTopColor    = '#F8FFF8'; 
      d.style.borderBottomColor = '#F8FFF8'; 
    }
    function ov(d) {
      d.style.backgroundColor='#F8F8F8';
      d.style.cursor= 'hand';
      d.style.borderRightColor = '#3070C8'; 
      d.style.borderLeftColor = '#3070C8'; 
      d.style.borderTopColor = '#3070C8'; 
      d.style.borderBottomColor = '#3070C8'; 
    }
    function cl(d) {
      d.children.tags('a')[0].click();
    }
  </SCRIPT>
</head>
<body background=img/back.jpg>

<TABLE width="100%" cellPadding=3>
  <TR><TD width="75%" class=header bgColor="#FFE0E0"><center><b>
    Санкт-Петербургский Государственный Электротехнический Университет ("ЛЭТИ")<br>
    </b>-=#$<b>&nbsp;&nbsp;Архив задач с тестирующей системой&nbsp;&nbsp;</b>$#=-
  <TD width="25%" class=header bgColor="#FFE0E0">
  <center>
<?
  if(isset($jid)){
    if($show_right_jid){
      echo("<b>Здравствуйте, $fullname!");
    } else {
      echo("Не существует <b>Judge_ID</b> = $judge_id!");
    };
  } else {
    echo("<b>Judge_ID</b> не установлен.<br>Регистрация <b><a href=\"newreg.php\">тут</a></b>");
  };
?>
  <tr>
  <TD width="75%" class=poles1 bgColor="#E7CFB7">
   <table width="100%" class=mymenu>
   <tr>
     <td width="33%" class=mymenu onmouseover=ov(this) onclick=cl(this) onmouseout=ou(this)>
     <a href="index.php"> О сайте. Прочитай!</a>
     <td width="33%" class=mymenu onmouseover=ov(this) onclick=cl(this) onmouseout=ou(this)>
     <a href="newreg.php"> Зарегистрироваться </a>
     <td width="33%" class=mymenu onmouseover=ov(this) onclick=cl(this) onmouseout=ou(this)>
     <a href="edituser.php">Изменение личных данных</a><br>
   <tr>
     <td width="33%" class=mymenu onmouseover=ov(this) onclick=cl(this) onmouseout=ou(this)>
     <a href="list.php"> Список задач </a>
     <td width="33%" class=mymenu onmouseover=ov(this) onclick=cl(this) onmouseout=ou(this)>
     <a href="submit.php"> Послать ответ на проверку </a>
     <td width="33%" class=mymenu onmouseover=ov(this) onclick=cl(this) onmouseout=ou(this)>
     <a href="users.php"> Рейтинг участников </a>
   <tr>
     <td width="33%" class=mymenu onmouseover=ov(this) onclick=cl(this) onmouseout=ou(this)>
     <a href="status.php"> Полный список посылок </a>
     <td width="33%" class=mymenu onmouseover=ov(this) onclick=cl(this) onmouseout=ou(this)>
     <a href="mailto:etuclub@mail.ru"> Администрация: etuclub@mail.ru </a></b>
   <tr>
     <td width="33%" class=mymenu onmouseover=ov(this) onclick=cl(this) onmouseout=ou(this)>
     <a href="links.php">Ссылки</a><br>
     <td width="33%" class=mymenu onmouseover=ov(this) onclick=cl(this) onmouseout=ou(this)>
     <a href="download.php">Скачать с сайта</a><br>
     <td width="33%" class=mymenu onmouseover=ov(this) onclick=cl(this) onmouseout=ou(this)>
     <a href="chapters.php">Задачи 1-го курса</a></b>

   </table>

   <td class=poles1 bgColor="#E7CFB7">
    <center>
    <FORM name=enterJid action=list.php method=post>
    <b>Judge_ID:</b>&nbsp;
    <INPUT class=pole size=10 name=judge_id value="">
     &nbsp;
    <INPUT type=submit name=submit value="Вход!">
    </FORM>
</TABLE>
