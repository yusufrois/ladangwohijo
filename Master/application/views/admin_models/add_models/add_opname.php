<!-- Select2 -->
 <link rel="stylesheet" href="<?php echo base_url(); ?>assets/plugins/select2/select2.min.css">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal">&times;</button>
<h4 class="modal-title"><i class="fa fa-plus-square" aria-hidden="true"></i>
 	Stock Opname 
</h4>
</div>
      <div class="modal-body">
		<div class="row">
         <div class="box box-danger">
           <div class="box-body">
		    <div class="col-md-12">
			<?php
					$attributes = array('id'=>'stock_items_form','method'=>'post','class'=>'form-horizontal');
			?>
			<?php echo form_open('product/add_opname',$attributes); ?>
			   <div class="form-group"> 
			   <?php echo form_label('Nama Produk:'); ?> 
				    <label >
				  		 (<a href="<?php echo base_url('product/add_new_product'); ?>">Tambah Produk </a>)
					</label>
					<select class="form-control select2" name="item_id" id="item_id" style="width: 100%;" >
						<option data-packsize="0" data-retail="0" data-disc="0" data-promo="0" value="0"> Pilih Produk </option>
						<?php
							if($product_record_list != NULL)
							{	
								foreach ($product_record_list as $single_product_list)
								{	
							?>
								    <option data-name="<?php echo $single_product_list->product_name; ?>" data-packsize="<?php echo $single_product_list->quantity; ?>" data-disc="<?php echo $single_product_list->disc; ?>" data-retail="<?php echo $single_product_list->retail; ?>" data-promo="<?php echo $single_product_list->date_disc; ?>" value="<?php echo $single_product_list->id; ?>" ><?php echo 'Produk : '.$single_product_list->product_name.' | Weight '.$single_product_list->mg.' '.$single_product_list->unit_type.' | Quantity '.$single_product_list->quantity.
								  	  ' | Barcode '.$single_product_list->barcode.
								  	  ' | Min stock level '.$single_product_list->min_stock; ?> 
								  	</option>	 
							<?php
									}
								}
								else
								{
									echo "No Record Found";
								}	
							?>	 
					</select>
              </div>
              <div class="form-group">
			   	<?php echo form_label('Stock System :'); ?>
               	<?php
					$data = array('class'=>'form-control input-lg','type'=>'number','name'=>'jumlah_sistem','value'=>'0','id'=>'jumlah_sistem');
					echo form_input($data);
			  	?>
                </div>
                <div class="form-group">
			   	<?php echo form_label('Stock Real :'); ?>
               	<?php
					$data = array('class'=>'form-control input-lg','type'=>'number','name'=>'jumlah_real','id'=>'jumlah_real','placeholder'=>'e.g 10');
					echo form_input($data);
			  	?>
                </div>
			   <div class="form-group">
			   <?php echo form_label('minus :'); ?>
               <?php
					$data = array('class'=>'form-control input-lg','type'=>'number','id'=>'selisih','name'=>'selisih','placeholder'=>'e.g 10','reqiured'=>'', 'readonly');
					echo form_input($data);
			  ?>
                </div>
                <div class="form-group">
			   <?php echo form_label('Harga Jual :'); ?>
               <?php
					$data = array('class'=>'form-control input-lg','type'=>'number','id'=>'jual','name'=>'jual','placeholder'=>'e.g 10','reqiured'=>'', 'readonly');
					echo form_input($data);
			  ?>
                </div>	
                <div class="form-group">
			   <?php echo form_label('Jumlah Yang Harus diBayar :'); ?>
               <?php
					$data = array('class'=>'form-control input-lg','type'=>'number','id'=>'hutang','name'=>'hutang','placeholder'=>'e.g 10','reqiured'=>'', 'readonly');
					echo form_input($data);
			  ?>
                </div>
                <div class="form-group">
               <?php
					$data = array('class'=>'form-control input-lg','type'=>'hidden','id'=>'nama','name'=>'nama','placeholder'=>'e.g 10','reqiured'=>'', 'readonly');
					echo form_input($data);
			  ?>
                </div>			   
              	<div class="form-group">
              		stock yang ada didalam system akan diupdate berdasar stock real yang diinput, setelah itu silahkan lakukan pengisian jurnal berdasar jumlah uang yang harus digantikan, yang akan dianggap hutang dan harus digantikan sesuai ketentuan yang ada
              	</div>
			  	<div class="form-group">  				
				<?php
					$data = array('class'=>'btn btn-info btn-flat  btn-lg','type' => 'submit','name'=>'btn_submit_Item','value'=>'true', 'content' => '<i class="fa fa-floppy-o" aria-hidden="true"></i> Simpan Opname');
					
					echo form_button($data);
				 ?>   
              </div> 
			<?php echo form_close(); ?>
        </div>
      </div>
    </div>
  </div>
</div>
 <!-- Form Validation -->
<script src="<?php echo base_url(); ?>assets/dist/js/custom.js"></script>
<!-- Select2 -->
<script src="<?php echo base_url(); ?>assets/plugins/select2/select2.full.min.js"></script>
<script type="text/javascript">
	  $(function () {
    //Initialize Select2 Elements
    $(".select2").select2();
  });

//SETTIING PACKSIZE
$(function(){
    $('#item_id').change(function(){
       var selected = $(this).find('option:selected');
       var extra = selected.data('packsize');
       var nama = selected.data('name');
       //var jual = selected.data('retail'); 
       //var disc = selected.data('disc'); 
       //var promo = selected.data('promo'); 
       $('#jumlah_sistem').val(extra);
       var jual = selected.data('retail');
       $('#jual').val(jual);
       $('#nama').val(nama);
       //$('#disc_jual').val(disc);
       //$('#harga_jual').val(jual);
       //$('#promo_date').val(promo);
    });

    $('#jumlah_real').keyup(function(value){
    	var packs = $('#jumlah_sistem').val();
    	var packsize = $('#jumlah_real').val();
    	var jual = $('#jual').val();
    	
    	$('#selisih').val(packs-packsize);
    	$('#hutang').val((packs-packsize)* jual);
    });
});
</script>