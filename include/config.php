<?php
$today = date("Y-m-d H:i:s");
$is_admin =intval($_SESSION["is_admin"]); 

function searchForArray($id, $array,$elmint) {
    foreach ($array as $key => $val) {
        if ($val[$elmint] === $id) {
            return $key;
        }
    }
    return null;
 }
 
 function searchIMO($id, $array,$elmint) {
    foreach ($array as $key => $val) {
        if ($val[$elmint] == $id) {
            return 1;
        }
    }
    return 0;
 }
 function SAPPOStatus($Status){
    switch($Status)
        {
        case  "No":
            $is_paid='<span class="float-left badge bg-danger">No</span>';
            break;
        case  "Partial":
            $is_paid='<span class="float-left badge bg-warning">Partial</span>';
            break;
        case  "Yes":
            $is_paid='<span class="float-left badge bg-success">Yes</span>';
            break;
        }
    return $is_paid;
 }
 function SAPPOSelect($Option){
    switch($Option)
        {
        case  "No":
            $Select="<option Value='Yes'>Yes</option>
                <option Value='Partial' >Partial</option>
                <option Value='No' selected>No</option>";
            break;
        case  "Partial":
            $Select="<option Value='Yes'>Yes</option>
                <option Value='Partial' selected>Partial</option>
                <option Value='No' >No</option>";
            break;
        case  "Yes":
            $Select="<option Value='Yes' selected>Yes</option>
            <option Value='Partial' >Partial</option>
            <option Value='No' >No</option>";
            break;
        }
        return $Select;
     } 
if(isset($_SESSION["is_admin"])){$admin_access = $_SESSION["is_admin"];} 
	else{
		header('Location: ../access/logout.php');
		exit; 
	}

$username_now=$_SESSION["username"];
$debug_sql = "SELECT `debug` FROM `users` WHERE `username` = '".$username_now."' LIMIT 1 ;"; 
 
$debug_sqlr = $dbop->query($debug_sql)->fetchAll();   
                foreach ($debug_sqlr as $debug_row) { $debug = $debug_row['debug'] ; }  


$info_sql = "SELECT `name`, `value` FROM `info`";
$info_result = $dbop->query($info_sql)->fetchAll();   
$info_data = array();
foreach($info_result  as $row){ 
		$name = $row['name'];
    		$value = $row['value'];
		$info_data[$name] = $value; 
}
// if($debug){echo "<b>Debug :</b>".$debug."<br>";}
// if($debug){echo "<b>Debug :</b>";print_r($info_data);echo  "<br>";}

// ######################################################################
// ########################## 	NEW ICON 		#######################
// ######################################################################
$newIcon='';
// Remove the old one in " nav.php " Change the Date and Add echo $newIcon;
$given_date = "2024-03-23 01:01:01";
if ($today < $given_date) {
	
	$newIcon='
	<style> 
		.shake {  animation: shake 0.2s infinite; } 
				@keyframes shake { 
			0% { transform: rotate(0deg); }
			25% { transform: rotate(5deg); }
			50% { transform: rotate(0eg); }
			75% { transform: rotate(-5deg); }
			100% { transform: rotate(0deg); }
				} 
	</style>
	<span class="constant-tilt-shake"> 
		<span class="right badge badge-danger shake">New</span>
	</span> ';}
// #####################################################################
// #######################  SELECT  FROM  users  #######################
// #####################################################################

$sql="SELECT * FROM `users` WHERE  `username` ='".$username_now."';";
$result = $dbop->query($sql)->fetchAll();
$dataArray = array();
foreach ($result as $row) {
	$userid = $row['id'];
	$username = $row['username'];
	$f_name = $row['f_name'];
	$l_name = $row['l_name'];
	$avatar = $row['avatar'];
	$created_at = $row['created_at'];
	$is_admin = $row['is_admin'];
	$is_active = $row['is_active'];
	$clear_pass = $row['clear_pass'];
	$user_2fa_enable = $row['user_2fa_enable'];
	$user_2fa_secret = $row['user_2fa_secret'];
	$user_2fa_code = $row['user_2fa_code'];      
}  

// #####################################################################
// #######################  SELECT  FROM  config #######################
// #####################################################################

$config_sql = "SELECT `name`, `value` FROM `config`";
	$config_result = $dbop->query($config_sql)->fetchAll();   
	$config_data = array();
	$config_data = array_column($config_result, 'value', 'name');  
		 
		

// #####################################################################
// #######################  SELECT  FROM  info   #######################
// #####################################################################

$info_sql = "SELECT `name`, `value` FROM `info`";
		$info_result = $dbop->query($info_sql)->fetchAll();   
		$info_data = array();
		$info_data = array_column($info_result, 'value', 'name'); 
		 
			$info_data =[0];
			$info_result=[0];   
 ?>

