<? include("_config.php");
   include("head.php");
  ?>

<center>
<table>
<tr><td class=header bgColor="#C7AF97">
  <b>���� ��������������</b>
<td></tr>

<tr><td class=poles1 bgColor="#E7CFB7">
<center>
<table class=inside border=0 cellpadding=3 cellspacing=3>
<tr><td>
<? if($is_admin){ 
     setcookie("admin_pass",$admin_pass); ?>
       ������ ������ ����� ������ �� ���������� � ������� ��� ������ :)!
<? } else { 
     if(strcmp(trim($admin_pass),"")!=0)
       echo("<center><b>�� ����� �������� ������! ���������� ��� ���!</b>");  ?>
  <form action="admin.php" method="post">
    ������� ������:
    <input type=password name="admin_pass">
    <input type=submit value="����!">
  </form>
<? }; ?>
</table>
</table>

<?
  echo("<center>Server time: ".date( "l d.m.Y H:i:s" ));
?>
