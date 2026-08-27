<?php
include 'koneksi.php';
//echo $_GET['id'];
$q = $_GET['id'];
$sql = "DELETE FROM tb_user WHERE user_name = '$q'";
//echo $sql;
mysqli_query($con,$sql);
//header('location: UserMangement.php');
header('location: '.$_SERVER['HTTP_REFERER']);
?>