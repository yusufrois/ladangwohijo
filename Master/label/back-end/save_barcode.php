<?php
	session_start();
	if(isset($_POST['save'])){
		foreach($_POST['indexes'] as $key){
			$_SESSION['qty_array'][$key] = $_POST['qty_'.$key];
		}

		$_SESSION['message'] = 'Barcode updated successfully';
		//header('location: ViewBarcode.php');
		header('location: '.$_SERVER['HTTP_REFERER']);
	}
?>
