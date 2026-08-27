<?php
include 'koneksi.php';
//echo $_GET['id'];
$q = $_GET['id'];
$sql = "DELETE FROM tb_kategori WHERE kategori = '$q'";
//echo $sql;
mysqli_query($con,$sql);
//header('location: MasterKategori.php');
header('location: '.$_SERVER['HTTP_REFERER']);
?>