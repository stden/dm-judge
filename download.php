<?
  include("_config.php");
  include("head.php");  ?>

<center>
<table>

<tr><td class=header bgColor="#C7AF97">
  Скачать с сайта
  <tr><td class=poles1 bgColor="#E7CFB7">
<?
  $links = file("download.txt");
  for($i=0;$i<count($links)/2;$i++){
    $links[$i*2] = trim($links[$i*2]);
    $size=filesize($links[$i*2]);
    echo("<a href=".$links[$i*2].">".$links[$i*2]."</a> ($size байт) - ".$links[$i*2+1]."<br>");
  };
?>
</table>

<?
  echo("<center>Server time: ".date( "l d.m.Y H:i:s" ));
?>
