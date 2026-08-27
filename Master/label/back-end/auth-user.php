<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Max-Age: 1000');
include 'koneksi.php';
date_default_timezone_set('Asia/Jakarta');

$q = explode(",",$_REQUEST["q"]);
$sql = "SELECT user_email as user_namse, user_description as jabatan FROM mp_users WHERE user_email = '$q[0]'";

$myObj = new stdClass();
if ($result=mysqli_query($con,$sql)){
	while ($row=mysqli_fetch_assoc($result)){
		if($row['user_email']){
			$_sql = "SELECT CASE WHEN COUNT(1) > 0 THEN 1 ELSE 0 END as result FROM mp_users WHERE user_email = '$q[0]' AND status = '0'";
			if ($_result=mysqli_query($con,$_sql)){
				while ($_row=mysqli_fetch_assoc($_result)){
					if($_row['result']){
						//mysqli_query($con, "UPDATE tb_user SET user_update = '".date("Y-m-d H:i:s")."' WHERE user_name = '$q[0]'");
						$myObj->username = $row['user_name'];
						$myObj->userjabatan = $row['jabatan'];
						$myObj->status = '1';
					} else {
						$myObj->status = '0';
					}
				}
			}
		}
	}
	echo json_encode($myObj);
}
?>