<? include("_config.php");
   unset($jid);
   $wrong_action = false;
   if(right_Judge_ID($new_jid)){
     $new_jid = trim($new_jid);
     setcookie("jid","$new_jid");
     $jid = $new_jid;
   }; 
   include("head.php"); ?>
<center>

<table>
<tr><td class=header bgColor="#C7AF97">
  <b>�������� ������</b>
<td></tr>

<tr><td class=poles1 bgColor="#E7CFB7">
<center><br>
<?
 if(right_Judge_ID($new_jid)){
   // �������� Task_ID
   $f = file("tasks.txt");
   $tid = trim($tid);
   $exists = false;
   for($i=0;$i<count($f);$i++){
     $e = explode(" ",$f[$i]);
     if(!strcmp($e[0],$tid)){
       $exists = true;
       break;
     };
   };
   //
   if($exists==false){
     echo(" ������������ <b>Task_ID!</b> <hr>");
     $wrong_action = true;
   } else {
   if(!($test=="01" || $test=="02")){
     echo(" ������������ <b>Test_ID!</b> <hr>");
     $wrong_action = true;
   } else {

     echo("<b>Judge_ID:</b> $jid<br>");
     echo("<b>Task_ID:</b> $tid<br>");
     echo("<b>Test:</b> $test<br><hr>");

     // echo("<hr><per>");
     // include("tasks/".$tid."/".$test.".a"); ������ ��� ������� ;)
     $output = implode( "", file($password."tasks/".$tid."/".$test.".a") );

  //   echo("<br><hr>$answer / $ans / $out"); // ������ ��� ������� ;)
  //   debugView($ans);
     $fp = fopen($password."submits.txt","a");
     fwrite($fp,$jid." ".$tid." ".$test." ");

     // ��������� �������� ����� � ��������
     if(!strcmp($tid,"1013") || !strcmp($tid,"1039")){
       include($password."tasks/".$tid."/check.php");
       $answer = str_replace(chr(13).chr(10).chr(13).chr(10),chr(13).chr(10),$answer);
       $output = str_replace(chr(13).chr(10).chr(13).chr(10),chr(13).chr(10),$output);
       $res = check_all_tests( implode( "", file($password."tasks/".$tid."/".$test) ),
         $answer, $output );
     } else {
       $res = compare($output,$answer); 
     };

     if($res){ // Check
       echo("<b>ACCEPTED!<br>�������!</b>");
       fwrite($fp,"AC ");
     } else {
       echo("<b>WRONG ANSWER!<br>������������ �����!</b><br>");
       fwrite($fp,"WA ");
     };
     fwrite($fp,date("d.m.Y H:i:s")."\n");
     fclose($fp);
   };
   };
 } else { 
   echo("Judge_ID = $new_jid �� ����������!<hr>");
   $wrong_action = true;
 };
 if($wrong_action){ ?>
  ������� �� ������ "Back" �������� ��� �� ������
  <a href="<? echo("submit.php?&tid=$tid&test=$test"); ?>">"������� ����� �� ��������"</a> �
  ��������� ��� ��� �����!
<? };
?>
<br>
<hr>
&nbsp;&nbsp;
<a href="<? echo("tasks.php?&tid=$tid"); ?>">��������� � ������� ������!</a>
&nbsp;&nbsp;
<br>
</td></tr>
</table>
<br>
<?
  echo("<center>Server time: ".date( "l d.m.Y H:i:s" ));
?>
