<?php
	session_start();

	//remove the id from our cart array
	$key = array_search($_GET['id'], $_SESSION['keranjang']);	
	unset($_SESSION['keranjang'][$key]);

	unset($_SESSION['qty_p_array'][$_GET['index']]);
	//rearrange array after unset
	$_SESSION['qty_p_array'] = array_values($_SESSION['qty_p_array']);

	$_SESSION['message'] = "Product deleted from Label";
	//header('location: ViewBarcode.php');
	header('location: '.$_SERVER['HTTP_REFERER']);
?>