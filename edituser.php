<?
  include("_config.php");
  include("head.php");  ?>

<center>

<table>

<?
  if(!isset($jid)){ ?>
<tr><td class=header bgColor="#C7AF97">
  Ввод <b>Judge_ID</b>
<td></tr>
<tr><td class=poles1 bgColor="#E7CFB7">
<center><br>
     Ваш <b>Judge_ID</b> не установлен!
     <br>
    <FORM name=enterJid action=edituser.php method=post>
     &nbsp;&nbsp;
    <b>Judge_ID:</b>&nbsp;
    <INPUT class=pole size=10 name=judge_id value="">
     &nbsp;
    <INPUT type=submit name=submit value="Вход!">
     &nbsp;&nbsp;
    </FORM>
     <br>
<? } else { // Если все нормально с Judge_ID  ?>
  <tr><td class=header bgColor="#C7AF97">
    <b>Изменение личных данных</b>
  <td></tr>
<tr><td class=poles1 bgColor="#E7CFB7">
<center>
    <FORM name=changeData action=go_edit.php method=post>
     &nbsp;&nbsp;
    <table class=inside>
    <tr><td>
    <b>Полное имя:</b><td>
    <INPUT class=pole size=40 name=fullname value="<? echo($fullname); ?>">
    <tr><td>
    <b>Ник (краткое имя):</b><td>
    <INPUT class=pole size=40 name=nickname value="<? echo($nickname); ?>">
    <tr><td>
    <b>E-mail:</b><td>
    <INPUT class=pole size=40 name=email value="<? echo($email); ?>">
    <tr><td colspan=2><center>
    <INPUT type=submit name=submit value="Изменить данные!">
    </table>
    </FORM>
<? }; ?>
</table>

<?
  echo("<center>Server time: ".date( "l d.m.Y H:i:s" ));
?>
