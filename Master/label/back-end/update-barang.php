<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Max-Age: 1000');
include 'koneksi.php';
date_default_timezone_set('Asia/Jakarta');

$q = explode("," , $_REQUEST["q"]);
if($q[1] == 'update'){
$sql = "UPDATE `tb_produk` SET `harga_jual` = '$q[3]', `diskon` = '$q[4]', `harga_diskon` = '$q[5]', `status_produk` = '$q[6]', `last_update` = '".date("Y-m-d H:i:s")."', `user` = '$q[7]' WHERE `nama_barang` = '$q[0]'";
}else{
$sql = "UPDATE `tb_produk` SET `harga_beli` = '$q[2]', `harga_jual` = '$q[3]', `diskon` = '$q[4]', `harga_diskon` = '$q[5]', `status_produk` = '$q[6]', `last_update` = '".date("Y-m-d H:i:s")."', `user` = '$q[7]' WHERE `nama_barang` = '$q[0]'";
}
if (mysqli_query($con, $sql)) {
	mysqli_query($con, "INSERT INTO tb_log VALUES ('', 'Update barang $q[0] Pada Aplikasi','$q[7]', '".date("Y-m-d H:i:s")."')");
	echo '1';
}
?>