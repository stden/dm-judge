<? include("_config.php"); // ���������� ����������
   include("head.php");    // ��������� - ������� ����

  // ��������� ��������� ������� �� ����� "chapters.txt"
  // �������� ������ - ���������
  // ׸���� ������ - ������ �����. � ������ ����� ������ ��������� ��������

  $chapters = file("chapters.txt");
  // ���� �� ����������
  for($ch=0;$ch<count($chapters)/2;$ch++){ 
    $ch_header = $chapters[$ch*2];
    $ch_list   = $chapters[$ch*2+1];
    // ���� ������ ��������� - ���-�� ������� � ����� ����� ������ ������
    // ���������� ��� �����
    if(!strcmp(trim($ch_header),"")) continue;
    // �������� ������ �����
    $ch_tasks = explode(",",$ch_list);
    // print_r($ch_tasks); - ���������� ������ �������� ���������
    // ����������������, ����� ��������� :)
?>
<center>
<table width="50%">
<tr><td class=header bgColor="#C7AF97">
  <b><?  // ������� ��������� - ������ ����� ��� ������� �����
       echo( $ch_header ); ?></b>  
<td></tr>

<tr><td class=poles1 bgColor="#E7CFB7">

<center>
<table class=inside border=1 width="100%">
<?
  // ��������� ������ ����� �� ����� tasks.txt
  $l = file("tasks.txt");
  $sum = 0;
  // ����� ���� �� ���������� �����
  for($i=0;$i<count($ch_tasks);$i++){
    $task_id = trim($ch_tasks[$i]);
    echo("<tr><td width=\"50\">");
    $f = explode(" ",$l[$task_id-1000]);
    $lnk = "tasks.php?tid=$f[0]";
    echo("<a href=$lnk target=_blank>$f[0]</a></td><td>");
    echo("<a href=$lnk target=_blank>");
    for($j=1;$j<count($f);$j++)
      echo("$f[$j] ");
    echo("</a></td></tr>");
  };
?>
</table></table>
<? } ?>
<tr><td class=poles1 bgColor="#E7CFB7">
<center>
<br>����� ��������� ����� ������, ������ �������� �� ��� ����� ������� ����
 � �� ����� ��������� � ����� ����<br>
</td></tr>
</table>

<?
  echo("<center>Server time: ".date( "l d.m.Y H:i:s" ));
?>
