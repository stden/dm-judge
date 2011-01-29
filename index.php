<? include("_config.php"); ?>
<!-- Главная страница сайта -->

<table>
<tr><td>
<?
  include("head.php");
?>
</td></tr>
<tr><td>
<?
  include("rules.html");
?>
</td></tr>
</table>

<?
  echo("<center>Server time: ".date( "l d.m.Y H:i:s" ));
?>
