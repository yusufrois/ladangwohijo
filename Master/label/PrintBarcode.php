<?php
	session_start();
	include 'back-end/koneksi.php';
?>
<html>
<head>
	<style>
/*		p.inline {display: inline-block; width:33mm; height:15mm; margin-bottom: 2mm;
        margin-top: 1mm; margin-left:0mm;}*/
		p.inline {display: inline-block; width:33mm; height:15mm; margin-bottom: 0mm;
        margin-top: 0mm; margin-left:0mm;}
		span { font-size: 8px; margin-left:6.5mm;}
		table {margin-left:6.5mm;}
			.text1 {
	      writing-mode:tb-rl;
	    -webkit-transform:rotate(-90deg);
	    -moz-transform:rotate(-90deg);
	    -o-transform: rotate(-90deg);
	    -ms-transform:rotate(-90deg);
	    transform: rotate(180deg);
	    white-space:nowrap;
	    float:left;
	    }
	</style>
	<style type="text/css" media="print">
		@page 
		{
			size: auto;   /* auto is the initial value */
			margin: 0mm;  /* this affects the margin in the printer settings */

		}
	</style>
</head>
<body onload="window.print();">
	<div style="max-width:396.8503937px;">
		<?php
		//$coba = array();

		//array_push($coba, 'tahu');
		//echo $coba[0];
		//$cars = array("Volvo1234567890123456", "BMW Mobil Indonesia", "Toyota", "honda");
		//$kode_pro = array("1234567k", "34567890", "12234563", "32145643");
		//$harga_pro = array("1000000", "63220", "50000", "10000");
		//$cetak_pro = array("1", "6", "5", "3");
		//echo "I like " . $cars[0] . ", " . $cars[1] . " and " . $cars[2] . ".";
		include 'back-end/barcode128.php';
		for($x=0; $x<count($_SESSION['cart']); $x++){
			$product = substr($_SESSION['name_array'][$x], 0,16);
			$satuan = $_SESSION['satuan_array'][$x];
			//$product = $_POST['product'];
			$product_id = $_SESSION['kode_array'][$x];
			//$product_id = $_POST['product_id'];
			//$rate = $_POST['rate'];
			$rate = number_format($_SESSION['price_array'][$x],0,",",".");

			for($i=1;$i<=$_SESSION['qty_array'][$x];$i++){
				//echo "<p class='inline'><span ><b> $product $satuan</b></span>".bar128(stripcslashes($product_id))."<span ><b>Rp. ".$rate." </b><span></p>";
				echo "<p class='inline'><span ><b> $product $satuan</b></span>".bar128(stripcslashes($product_id))."<span ><b>Rp. ".$rate." </b><span></p>";
			}
		}

		?>
	</div>
</body>
</html>
<?php
unset($_SESSION['cart']);
	$sql = "DELETE FROM mp_label_barcode";
    $query = $con->query($sql);
	$_SESSION['message'] = 'Cart cleared successfully';
	//header('location: index.php');
?>