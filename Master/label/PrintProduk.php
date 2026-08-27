<?php
session_start();
include 'back-end/koneksi.php';
?>
<html>
<head>
  	<link rel="stylesheet" href="css/vertical-layout-light/style.css">
  	<meta charset="utf-8">
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
	  .lb{ width: 225px; height: 166px; margin:4; position: relative; display: inline-block;}

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
<body>
	<!-- <div class="content-wrapper"> -->
	 <div class="col-md-12">
	 <div class="box" size="A4">
					<?php
					for($x=0; $x<count($_SESSION['keranjang']); $x++){
						$product = substr($_SESSION['nama_p_array'][$x], 0,20);
						$satuan = $_SESSION['satuan_p_array'][$x];
						//$product = $_POST['product'];
						$product_id = $_SESSION['kode_p_array'][$x];
						//$product_id = $_POST['product_id'];
						//$rate = $_POST['rate'];
						$rate_normal = number_format($_SESSION['harga_jual_array'][$x],0,",",".");
						$rate_diskon = number_format($_SESSION['harga_diskon_array'][$x],0,",",".");
						$status = $_SESSION['status_p_array'][$x];
						$ktg = substr($_SESSION['last_p_array'][$x],0,5);
						$date = date("Y-m-d");
						for($i=1;$i<=$_SESSION['qty_p_array'][$x];$i++){
							if($status == 'Normal' ||$status == 'NORMAL'){
								// if ($i % 32 == 0) {
        //         					echo "<div class='col-12' style='page-break-after: always;'><p></p></div>";
								// }
									echo "
									<div class='lb'>
										<div class='card rounded-0 body-label bg'>  
					                 	  <div class='card-body'>
					                    	 <div class='nama-produk text-uppercase' style='font-weight:bold; font-size:14px; '> $product $satuan</div>
					                        <div class='kode-produk d-flex justify-content-between' style='font-size:12px;'>
					                        <span> $product_id </span>  
					                        <span style='position:relative;'>
					                   			$ktg
					                 		</span>  
					                        </div>
					                   		 <div class='harga d-flex justify-content-between'>
					                      		<span style='align-self:center;'><small>Rp</small></span>
					                      		<span><h2>$rate_diskon</h2></span>
					                   		 </div>
					                   		 <div class='tgl'><small>$date</small></div>
					                  	  </div>
					                	</div>
				                	</div>
									";
					}else{
					echo"
					<div class='lb'>
						<div class='card rounded-0 body-label bg-promo'>  
	                  		<div class='card-body'>
	                    		<div class='nama-produk text-uppercase' style='font-weight:bold; font-size:12px;'> $product $satuan</div>
	                   			 <div class='kode-produk d-flex justify-content-between' style='font-size:12px;'> 
	                   				 <span>$product_id</span>  
	                   				 <span style='position:relative; display:inline-flex;'>
	                   				 $ktg
	                   				 </span>
	                   			 </div>
	                   			 <div style='font-size:10px;'>
	                   			 <span style='position:relative; display:inline-flex;'>Rp $rate_normal
	                   				 <hr class='border-dark m-0 w-100' style='position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);'></span>  
	                   				 
	                   			 </div>
	                   			 <div class='harga d-flex justify-content-between'>
	                   			   <span style='align-self:center;'><small>Rp</small></span>
	                   			   <span><h2>$rate_diskon</h2></span>
	                    		</div>
	                    		<div class='tgl'><small>$date</small></div>
	                  		</div>
	                	</div>
                	</div>
					";
					}
				   }
				}?>
				
		</div>
	</div>
<!-- </div> -->
</body>
</html>
<?php
unset($_SESSION['keranjang']);
	$sql = "DELETE FROM mp_label";
    $query = $con->query($sql);
	$_SESSION['message'] = 'cleared successfully';
	//header('location: index.php');
?>
<!-- 
<script type="text/javascript">

</script> -->