<pre>
<?
  include("_config.php");
  // ���� ���� ���������� ������ 
  // ��� ������� ��� �������������� ������ Ans ������
  if($test=="01" || $test=="02" || $test=="01.a" || $test=="02.a"){
    include($password."tasks/$tid/$test");
  } else {
    echo("������ ��� ��� :))");
  };
?>