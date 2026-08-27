<?php
session_start();
?>
<html>
<head>
  
  	<link rel="stylesheet" href="css/vertical-layout-light/style.css">
  	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.3/jspdf.min.js"></script>
	<script src="https://html2canvas.hertzen.com/dist/html2canvas.js"></script>

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
	  .lb{ width: 240px; margin:15; position: relative;}

	  .box{  
		max-width: 800px;
		}
		.box[size="A4"] {  
			width: 210mm;
			/*min-height: 297mm;*/
			margin: 10mm auto; 
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
<body>
	<!-- <div class="content-wrapper"> -->
	 <div class="col-md-12">
	 <div class="box" size="A4">
       <div class="row">
					<?php
					for($x=0; $x<count($_SESSION['keranjang']); $x++){
						$product = substr($_SESSION['nama_p_array'][$x], 0,10);
						//$product = $_POST['product'];
						$product_id = $_SESSION['kode_p_array'][$x];
						//$product_id = $_POST['product_id'];
						//$rate = $_POST['rate'];
						$rate_normal = $_SESSION['harga_jual_array'][$x];
						$rate_diskon = $_SESSION['harga_diskon_array'][$x];
						$status = $_SESSION['status_p_array'][$x];
						$date = $_SESSION['last_p_array'][$x];
						for($i=1;$i<=$_SESSION['qty_p_array'][$x];$i++){
							if($status == 'Normal'){
					echo "
					<div class='lb'>
						<div class='card rounded-0 body-label bg'>  
	                 	  <div class='card-body' style='height:166px;'>
	                    	 <div class='nama-produk text-uppercase' style='font-weight:bold; '> Tissue Rol 6</div>
	                        <div class='kode-produk' style='font-size:12px;'> 00112435  </div>
	                   		 <div class='harga d-flex justify-content-between'>
	                      		<span style='align-self:center;'><small>Rp</small></span>
	                      		<span><h2>18.900</h2></span>
	                   		 </div>
	                   		 <div class='tgl'><small>03-03-2022</small></div>
	                  	  </div>
	                	</div>
                	</div>
					";
				}else{
					echo "
					<div class='lb'>
						<div class='card rounded-0 body-label bg-promo'>  
	                  		<div class='card-body' style='height:166px;'>
	                    		<div class='nama-produk text-uppercase' style='font-weight:bold;'> Tissue Rol 6</div>
	                   			 <div class='kode-produk d-flex justify-content-between' style='font-size:12px;'> 
	                   				 <span>00112435</span>  
	                   				 <span>Rp 20.000</span>
	                   			 </div>
	                   			 <div class='harga d-flex justify-content-between'>
	                   			   <span style='align-self:center;'><small>Rp</small></span>
	                   			   <span><h2>18.900</h2></span>
	                    		</div>
	                    		<div class='tgl'><small>03-03-2022</small></div>
	                  		</div>
	                	</div>
                	</div>
					";
					}
				   }
				 }
				?>
			</div>
		</div>
	</div>
<!-- </div> -->
</body>
</html>

<!-- 
<script type="text/javascript">

</script> -->