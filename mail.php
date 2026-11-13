<?
  $mailto = "stden@mail.ru";
  $z = "xxxxx";
  echo(mail("stden@mail.ru", "My Subject", "Line 1\nLine 2\nLine 3"));     
  mail($mailto, "INTERNET-SCHOOL", $z,
        "From: \"WWW script, DO NOT REPLAY\" <$mailto>\n".
        "BCC: stden@mail.ru\n".
        "CC: stden@mail.ru\n".
        "MIME-Version: 1.0\n".
        "Content-Type: text/plain; charset=Windows-1251\n".
        "Content-Transfer-Encoding: 8bit");
  phpinfo();
?>