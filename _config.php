<?
  // ��������� ��������� � ���������� ����������

  $password = "private/"; // �������, � ������� ��������� ������ � ������ � ���

  // ���. ������� ��� �������� ������� �������
  function pregtrim($str) {
    return preg_replace("/[^\x20-\xFF]/","",@strval($str));
  }

  //
  // ��������� ���� � ����������
  //  *  +1, ���� ���� ������
  //  *  -1, ���� �� ������, �� � �������
  //  *  ������, ���� ���� ������
  //

function checkmail($email) {
   // ����� ����� ������� � ������� �������
   $email=trim(pregtrim($email));
   // ���� ����� - �����
   if (strlen($email)==0) return 1;
   if (!preg_match("/^[a-z0-9_-]{1,20}@(([a-z0-9-]+\.)+(com|net|org|mil|".
   "edu|gov|arpa|info|biz|inc|name|[a-z]{2})|[0-9]{1,3}\.[0-9]{1,3}\.[0-".
   "9]{1,3}\.[0-9]{1,3})$/is",$email))
   return -1;
   return $email;
}

  // �������� ASCII ����� �������� �����
  function debugView( $s ){
    echo("[");
    for($i=0;$i<strlen($s);$i++)
      echo(ord($s[$i]).".");
    echo("]");
  };

  // ��������� ����� ��� ����� ����������� ��������
  // ����� ������������ ��������� �� ����
  function compare( $s1, $s2 ){
    $l1 = strlen($s1); $i1 = 0;
    $l2 = strlen($s2); $i2 = 0;
    while( $i1<=$l1 && $i2<=$l2 ){  // ������ � PHP ������������� �� 0
      while( $s1[$i1]<=' ' && ord($s1[$i1])!=0) $i1++;
      while( $s2[$i2]<=' ' && ord($s2[$i2])!=0) $i2++;
      if($i1>=$l1 && $i2>=$l2) break; // ��� ������ ���������
      // ���������� ����������� �������
      while($s1[$i1]>' ' && $s1[$i1]==$s2[$i2]){
        $i1++; $i2++;
      };
      // ���� ���� �� ���� �� ����� �� ���������
      // �� ����������� ������ => ������
      if($s1[$i1]>' ' || $s2[$i2]>' ') return false;
    };
    return true;
  };

  // �������� Judge_ID �� �������������
  //   ���� Judge_ID ����������, �� ������� �����������
  // ������ �������� $nickname
  function right_Judge_ID( $testJID ){
    global $fullname; // ������ � ������� ������������
    global $nickname;
    global $email;
    global $cur_no;  // ����� �������� ������������ � ������
    global $users;
    global $password;
    $users = file($password."users.txt");
    for($i=0;$i<count($users);$i++)
      $users[$i] = trim($users[$i]);
    for($i=0;$i<(count($users)/4);$i++)
      if(compare($testJID,$users[$i*4])){
        $fullname = $users[$i*4+1];
        $nickname = $users[$i*4+2];
        $email = $users[$i*4+3];
        $cur_no = $i;
        return true;
      };
    return false;
  };

  function myTime(){
    $r = explode(" ",microtime());
    return $r[0]+$r[1];
  };

  // TODO: ���� ����� ��������� ������ ������-�� ���
  $is_admin = compare($admin_pass,"adminpass"); 
?>