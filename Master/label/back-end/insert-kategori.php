<?php
	header('Access-Control-Allow-Origin: *');
	header('Access-Control-Allow-Methods: POST');
	header('Access-Control-Max-Age: 1000');
	include 'koneksi.php';
	date_default_timezone_set('Asia/Jakarta');
	
	$q = explode("," , $_REQUEST["q"]);
	
	$ceck = "SELECT AUTO_INCREMENT FROM information_schema.TABLES WHERE TABLE_SCHEMA = 'db_ghinamart' AND TABLE_NAME = 'tb_kategori'";
	if ($result=mysqli_query($con, $ceck)){
	while ($row=mysqli_fetch_assoc($result)){
		$output = $row['AUTO_INCREMENT'];
	}
	}
	$id = "KTG/".$output;
	$_sql = "SELECT CASE WHEN COUNT(1) > 0 THEN 1 ELSE 0 END as kategori FROM tb_kategori WHERE kategori = '$q[0]'";
	if ($result=mysqli_query($con,$_sql)){
		while ($row=mysqli_fetch_assoc($result)){
			if($row['kategori']){
				echo '0';
			} else {
				$sql = "INSERT INTO tb_kategori (id, id_kategori, kategori, keterangan, last_update)
					VALUES ('','$id','$q[0]','$q[1]','".date("Y-m-d H:i:s")."')";
				if (mysqli_query($con, $sql)) {
					mysqli_query($con, "INSERT INTO tb_log VALUES ('', '$q[0] ADD Pada Aplikasi','$q[2]', '".date("Y-m-d H:i:s")."')");
					echo '1';
				}
			}
		}
	}
?>