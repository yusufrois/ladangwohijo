<?php
	header('Access-Control-Allow-Origin: *');
	header('Access-Control-Allow-Methods: POST');
	header('Access-Control-Max-Age: 1000');
	include 'koneksi.php';
	date_default_timezone_set('Asia/Jakarta');
	
	$q = explode("," , $_REQUEST["q"]);
	
	$ceck = "SELECT AUTO_INCREMENT FROM information_schema.TABLES WHERE TABLE_SCHEMA = 'u5635723_ghinamart' AND TABLE_NAME = 'mp_user'";
	if ($result=mysqli_query($con, $ceck)){
	while ($row=mysqli_fetch_assoc($result)){
		$output = $row['AUTO_INCREMENT'];
	}
	}
	$id = "USR/".$output;
	$_sql = "SELECT CASE WHEN COUNT(1) > 0 THEN 1 ELSE 0 END as user_name FROM tb_user WHERE user_name = '$q[0]'";
	if ($result=mysqli_query($con,$_sql)){
		while ($row=mysqli_fetch_assoc($result)){
			if($row['user_name']){
				echo '0';
			} else {
				$sql = "INSERT INTO tb_user (id, id_user, user_name, user_pass,jabatan,status, user_update)
					VALUES ('','$id','$q[0]','$q[1]','$q[2]','1','".date("Y-m-d H:i:s")."')";
				if (mysqli_query($con, $sql)) {
					mysqli_query($con, "INSERT INTO tb_log VALUES ('', '$q[0] Mendaftarkan Diri Pada Aplikasi','$q[0]', '".date("Y-m-d H:i:s")."')");
					echo '1';
				}
			}
		}
	}
?>