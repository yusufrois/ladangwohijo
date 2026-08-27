<?php
	session_start();
?>
<html>
<head>
  
  	<link rel="stylesheet" href="css/vertical-layout-light/style.css">
  	<meta charset="utf-8">
 	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 	<title>Ghina Mart Admin</title>
 	<link rel="shortcut icon" href="images/logo.png" />


  	<style type="text/css">
		.bg {
	    /* The image used */
	    background-image: url("images/bg-label.png");

	    /* Full height */
	    height: 100%; 

	    /* Center and scale the image nicely */
	    background-position: center;
	    background-repeat: no-repeat;
	    background-size: cover;
	  }
	  .bg-promo {
	    /* The image used */
	    background-image: url("images/bg-label-promo.png");
	    /* Full height */
	    height: 100%; 
	    /* Center and scale the image nicely */
	    background-position: center;
	    background-repeat: no-repeat;
	    background-size: cover;

	  }
	  .lb{ width: 180px; margin:4; position: relative;}

/*	  .box{  
		max-width: 800px;
		}
		.box[size="A4"] {  
			width: 210mm;
			/*min-height: 297mm;
			margin: 10mm auto; 
		}*/
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
	<!--<div style="margin-left: 5%">-->
		<div class="col-md-12">
	 <div class="box" size="A4">
       <div class="row">
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
			$rate = $_SESSION['price_array'][$x];

			for($i=1;$i<=$_SESSION['qty_array'][$x];$i++){
				//echo "<p class='inline'><span ><b> $product</b></span>".bar128(stripcslashes($product_id))."<span ><b>Rp. ".$rate." </b><span></p>&nbsp&nbsp&nbsp&nbsp";
				echo " <div class='lb'>
						<div class='card rounded-0 body-label'>  
	                 	  <div class='card-body' style='height:166px;'>
	                    	 <div class='nama-produk text-uppercase' > $product</div>
	                   		 <div class='harga d-flex justify-content-between'>
	                   		 <p class='inline'>
	                      		".bar128(stripcslashes($product_id))."
	                   		 </p>
	                   		 </div>
	                   		 <div class='nama-produk text-uppercase'> $rate</div>
	                  	  </div>
	                	</div>
                	</div>
					";
			}
		}

		?>
	</div>
	</div>
	</div>
</body>
</html>
<?php
unset($_SESSION['cart']);
	$_SESSION['message'] = 'Cart cleared successfully';
	//header('location: index.php');
?>