<?php
	header('Access-Control-Allow-Origin: *');
	header('Access-Control-Allow-Methods: POST');
	header('Access-Control-Max-Age: 1000');
	include 'koneksi.php';
	date_default_timezone_set('Asia/Jakarta');
	
	$q = explode("," , $_REQUEST["q"]);
	
	$ceck = "SELECT AUTO_INCREMENT FROM information_schema.TABLES WHERE TABLE_SCHEMA = 'db_ghinamart' AND TABLE_NAME = 'tb_produk'";
	if ($result=mysqli_query($con, $ceck)){
	while ($row=mysqli_fetch_assoc($result)){
		$output = $row['AUTO_INCREMENT'];
	}
	}
	$id = "GHM".$output;
	$_sql = "SELECT CASE WHEN COUNT(1) > 0 THEN 1 ELSE 0 END as nama_barang FROM tb_produk WHERE nama_barang = '$q[0]'";
	if ($result=mysqli_query($con,$_sql)){
		while ($row=mysqli_fetch_assoc($result)){
			if($row['nama_barang']){
				echo '0';
			} else {
				$sql = "INSERT INTO `tb_produk` (`id`, `kode_produk`, `nama_barang`, `kategori_produk`, `harga_beli`, `harga_jual`, `diskon`, `harga_diskon`, `status_produk`, `last_update`, `user`,`satuan`) VALUES('','$id','$q[0]','$q[1]','$q[2]','$q[3]','$q[4]','$q[5]','$q[6]','".date("Y-m-d H:i:s")."','$q[7]','$q[8]')";
					echo $sql;
					echo $q[0];
				if (mysqli_query($con, $sql)) {
					mysqli_query($con, "INSERT INTO tb_log VALUES ('', 'tambah barang $q[0] Pada Aplikasi','$q[7]', '".date("Y-m-d H:i:s")."')");
					echo '1';
				}
			}
		}
	}
?>