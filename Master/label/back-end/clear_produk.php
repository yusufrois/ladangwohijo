<?php
	session_start();
	unset($_SESSION['keranjang']);
	$_SESSION['message'] = 'Label cleared successfully';
	//header('location: CetakBarcode.php');
	header('location: '.$_SERVER['HTTP_REFERER']);
?>