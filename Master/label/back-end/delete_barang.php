<?php
include 'koneksi.php';
//echo $_GET['id'];
$q = $_GET['id'];
$sql = "DELETE FROM tb_produk WHERE nama_barang = '$q'";
//echo $sql;
mysqli_query($con,$sql);
//header('location: MasterBarang.php');
header('location: '.$_SERVER['HTTP_REFERER']);
?>