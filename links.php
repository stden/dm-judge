<?
  include("_config.php");
  include("head.php");  ?>

<center>
<table>

<tr><td class=header bgColor="#C7AF97">
  Подборка ссылок
<tr><td class=poles1 bgColor="#E7CFB7">
<?
  $links = file("links.txt");
  for($i=0;$i<count($links)/2;$i++){
    echo("<a href=".$links[$i*2].">".$links[$i*2]."</a> - ".$links[$i*2+1]."<br>");
  };
?>
</table>

<?
  echo("<center>Server time: ".date( "l d.m.Y H:i:s" ));
?>
