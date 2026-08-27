<?php
session_start();
// cek produk apakah sudah ada pada cart
if(!in_array($_GET['id'], $_SESSION['cart'])){
		array_push($_SESSION['cart'], $_GET['id']);
		$_SESSION['message'] = 'Product added to cart';
		echo 1;
	}
	else{
		$_SESSION['message'] = 'Product already in cart';
		echo 0;
	}
?>
