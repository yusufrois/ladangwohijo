<?php
	session_start();
	if(isset($_POST['save_p'])){
		foreach($_POST['indexes_p'] as $key){
			$_SESSION['qty_p_array'][$key] = $_POST['qty_p_'.$key];
		}

		$_SESSION['message'] = 'Label updated successfully';
		//header('location: ViewBarcode.php');
		header('location: '.$_SERVER['HTTP_REFERER']);
	}
?>
