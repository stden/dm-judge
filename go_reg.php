<?
  include("_config.php");
  unset($wrong);
  $fullname = trim( strip_tags($fullname) );
  $nickname = trim( strip_tags($nickname) );
  $email = trim( strip_tags($email) );
  if(!strcmp($fullname,"")) $wrong = "�� ������� <u>������ ���</u><br>";
  if(!strcmp($nickname,"")) $wrong = $wrong."�� ������ <u>���</u><br>";
  switch(checkmail($email)){
    case -1: $wrong = $wrong."�� ������ <u>E-mail</u> $email!<br>"; break;
    case +1: $wrong = $wrong."�� ������ <u>E-mail</u><br>";
  };

  if(!isset($wrong)){
    // ��������� Judge_ID
    srand((double)microtime()*1000000);
    $jid = rand(1,9);
    for($i=1;$i<=4;$i++)
      $jid = $jid.rand(0,9);
    for($i=1;$i<=2;$i++)
      $jid = $jid.chr(rand(ord('A'),ord('Z')));
    setcookie ("jid","$jid");
    // ---
    // ���������� � ����
    $fp = fopen($password."users.txt","a");
    // 10000WA
    // ����
    // Jury
    // stden@mail.ru
    fwrite($fp,"$jid\n$fullname\n$nickname\n$email\n");
    fclose($fp);
    // ---
    include("head.php");
    // ---
?>

<center>

<table>
<tr><td class=header bgColor="#C7AF97">
  <b>����������� ������������ ������ �������!</b>
<td></tr>

<tr><td class=poles1 bgColor="#E7CFB7">
<center>
<?
  echo("<b>������ ���:</b> $fullname<br>");
  echo("<b>��� (������� ���):</b> $nickname<br>");
  echo("<b>E-mail:</b> $email<br>");
  echo("<b>Judge_ID:</b> $jid<br>");
?>
<b><font color="#550000">��������� ��� �������� ���� Judge_ID!!!<br>
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
  ������� �� ������ "Back" �������� ��� �� ������
  <a href="newreg.php">"������������������"</a> �
  ��������� ��� ��� ��������������� �����!
</table>
<? }; ?>

<?
  echo("<center>Server time: ".date( "l d.m.Y H:i:s" ));
?>
