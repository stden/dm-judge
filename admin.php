<? include("_config.php");
   include("head.php");
  ?>

<center>
<table>
<tr><td class=header bgColor="#C7AF97">
  <b>Вход администратора</b>
<td></tr>

<tr><td class=poles1 bgColor="#E7CFB7">
<center>
<table class=inside border=0 cellpadding=3 cellspacing=3>
<tr><td>
<? if($is_admin){ 
     setcookie("admin_pass",$admin_pass); ?>
       Теперь можете смело ходить по страничкам и править что угодно :)!
<? } else { 
     if(strcmp(trim($admin_pass),"")!=0)
       echo("<center><b>Вы ввели неверный пароль! Попробуйте еще раз!</b>");  ?>
  <form action="admin.php" method="post">
    Введите пароль:
    <input type=password name="admin_pass">
    <input type=submit value="Вход!">
  </form>
<? }; ?>
</table>
</table>

<?
  echo("<center>Server time: ".date( "l d.m.Y H:i:s" ));
?>
