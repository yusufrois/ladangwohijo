<?php
	session_start();
	unset($_SESSION['cart']);
	$_SESSION['message'] = 'Barcode cleared successfully';
	//header('location: CetakBarcode.php');
	header('location: '.$_SERVER['HTTP_REFERER']);
?>