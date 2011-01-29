<? include("_config.php"); 
   include("head.php"); ?>
<style>
  .regform_font
  {
    font-family:Tahoma;
    font-size: 12px;
    color: #00000;
  }
</style>

<center>
<form method="post" action="go_reg.php">
<table border="0" cellpadding="1" cellspacing="0" bgcolor="#aaaaaa" class="regform_font">
<tr><td>
<table width="409" cellpadding="0" cellspacing="0" border="0" bgcolor="#ddddff" class="regform_font">

<tr height="18"><td valign="middle" align="center" bgcolor="#c0c0ff" colspan="4">
  <span class="regform_font" style="font-weight:bold">
  -=:: Регистрация на сайте acm.eltech.ru/judge ::=-</span></td></tr>
<tr height="1"><td bgcolor="#aaaaaa" colspan="4"></td></tr>
<tr height="26"><td width="10" rowspan="3"></td>
<td width="150"><span class="regform_font">Полное имя: </span></td>
<td width="239"><input class="regform_font" type="text" name="fullname" size="50"></td>
<td width="10" rowspan="3"></td></tr>
<tr height="26">
<td width="150"><span class="regform_font">Ник (краткое имя): </span></td>
<td width="239"><input class="regform_font" type="text" name="nickname" size="50"></td></tr>
<tr height="24">
<td width="150"><span class="regform_font">E-mail: </span></td>
<td width="239"><input class="regform_font" type="text" name="email" size="50"></td></tr>
<tr height="28">
<td colspan="3" valign="middle" align="right"><input type="submit" name="submit" value="Зарегистрироваться!"></td></tr>

</table>
</tr></td>
</table>
</center>
</form>