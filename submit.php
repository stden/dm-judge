<? include("_config.php");
   include("head.php"); ?>

<center>

<table>
<tr><td class=header colSpan=2 bgColor="#C7AF97">
  <b>������� ����� �� ��������</b>
<td></tr>

<tr><td class=poles1 bgColor="#E7CFB7">
<form method="POST" action="check.php">

<table class=inside>
<tr><td>
<b>Judge_ID:<td>
<input type="text" name="new_jid" value="<? echo("$jid"); ?>" size="7">
&nbsp;&nbsp;
������� ���� Judge_ID. �������� 12345NO
<tr><td>
<b>Task_ID:<td>
<input type="text" name="tid" value="<? echo("$tid"); ?>" size="4">
&nbsp;&nbsp;
������� Task_ID. �������� 1001
<tr><td>
<b>Test_No:<td>
<SELECT name="test">
  <OPTION <? if($test=="01") echo("selected"); ?> value="01">Test 1</OPTION>
  <OPTION <? if($test=="02") echo("selected"); ?> value="02">Test 2</OPTION>
</SELECT>
&nbsp;&nbsp;
�������� ����. 1-�������, 2-�������

<tr><td>
<b>Answer:<td>
<textarea rows="12" name="answer" value="<? echo("$answer"); ?>" cols="57">
</textarea>

<tr><td colspan="2" align="center">
<input type="submit" value="���������!" name="���������!">
</td></tr>
</table>

</table>

<?
  echo("<center>Server time: ".date( "l d.m.Y H:i:s" ));
?>
