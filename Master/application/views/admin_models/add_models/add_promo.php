<!-- Select2 -->
 <link rel="stylesheet" href="<?php echo base_url(); ?>assets/plugins/select2/select2.min.css">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal">&times;</button>
<h4 class="modal-title"><i class="fa fa-plus-square" aria-hidden="true"></i>
 	Tambah Promo & Harga 
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
			<?php echo form_open('product/add_promo',$attributes); ?>
			   <div class="form-group"> 
			   <?php echo form_label('Nama Produk:'); ?> 
				    <label >
				  		 (<a href="<?php echo base_url('product/add_new_product'); ?>">Tambah Produk </a>)
					</label>
					<select class="form-control select2" name="item_id" id="item_id" style="width: 100%;" >
						<option data-packsize="0" data-retail="0" data-disc="0" data-promo="0" data-purchase="0" value="0"> Pilih Produk </option>
						<?php
							if($product_record_list != NULL)
							{	
								foreach ($product_record_list as $single_product_list)
								{	
							?>
								    <option data-packsize="<?php echo $single_product_list->packsize; ?>" data-disc="<?php echo $single_product_list->disc; ?>" data-purchase="<?php echo $single_product_list->purchase; ?>" data-retail="<?php echo $single_product_list->retail; ?>" data-promo="<?php echo $single_product_list->date_disc; ?>" data-start="<?php echo $single_product_list->start_disc; ?>" value="<?php echo $single_product_list->id; ?>" ><?php echo 'Produk : '.$single_product_list->product_name.' | Weight '.$single_product_list->mg.' '.$single_product_list->unit_type.' | Quantity '.$single_product_list->quantity.
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
			   	<?php echo form_label('Harga Beli:'); ?>
               	<?php
					$data = array('class'=>'form-control input-lg','type'=>'number','name'=>'harga_beli','value'=>'0','id'=>'harga_beli');
					echo form_input($data);
			  	?>
                </div>
              <div class="form-group">
			   	<?php echo form_label('Harga Jual:'); ?>
               	<?php
					$data = array('class'=>'form-control input-lg','type'=>'number','name'=>'harga_jual','value'=>'0','id'=>'harga_jual');
					echo form_input($data);
			  	?>
                </div>
                <div class="form-group">
			   	<?php echo form_label('Diskon:'); ?>
               	<?php
					$data = array('class'=>'form-control input-lg','type'=>'number','name'=>'disc_jual','value'=>'0','id'=>'disc_jual');
					echo form_input($data);
			  	?>
                </div>
                <div class="form-group">
			   <?php echo form_label('Tanggal Start Promo:'); ?>
               <?php
					$data = array('class'=>'form-control input-lg','type'=>'date','id'=>'start_date','name'=>'start_date','placeholder'=>'e.g 10','reqiured'=>'');
					echo form_input($data);
			  ?>
                </div>
			   <div class="form-group">
			   <?php echo form_label('Tanggal End Promo:'); ?>
               <?php
					$data = array('class'=>'form-control input-lg','type'=>'date','id'=>'promo_date','name'=>'promo_date','placeholder'=>'e.g 10','reqiured'=>'');
					echo form_input($data);
			  ?>
                </div>			   
              
			  	<div class="form-group">  				
				<?php
					$data = array('class'=>'btn btn-info btn-flat  btn-lg','type' => 'submit','name'=>'btn_submit_Item','value'=>'true', 'content' => '<i class="fa fa-floppy-o" aria-hidden="true"></i> Simpan Promo ');
					
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
       //var extra = selected.data('packsize');
       var jual = selected.data('retail'); 
       var beli = selected.data('purchase'); 
       var disc = selected.data('disc'); 
       var promo = selected.data('promo'); 
       var start = selected.data('start'); 
       //$('#packsize').val(extra);
       $('#disc_jual').val(disc);
       $('#harga_jual').val(jual);
       $('#harga_beli').val(beli);
       $('#promo_date').val(promo);
       $('#start_date').val(start);
    });

    // $('#packs').keyup(function(value){
    // 	var packs = $('#packs').val();
    // 	var packsize = $('#packsize').val();
    // 	$('#quantity').val(packs*packsize);
    // });
});
</script>