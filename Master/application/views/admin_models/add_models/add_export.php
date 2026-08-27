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
			<?php echo form_open('product/export_opname',$attributes); ?>
			   <div class="form-group"> 
			   <?php echo form_label('Kategori:'); ?> 
					<select class="form-control select2" name="item_id" id="item_id" style="width: 100%;" >
						<option data-packsize="0" data-retail="0" data-disc="0" data-promo="0" value="0"> Pilih Produk </option>
						<?php
							if($product_record_list != NULL)
							{	
								foreach ($product_record_list as $single_product_list)
								{	
							?>
								    <option value="<?php echo $single_product_list->id; ?>" ><?php echo $single_product_list->category_name; ?> 
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
				<?php
					$data = array('class'=>'btn btn-info btn-flat  btn-lg','type' => 'submit','name'=>'btn_submit_Item','value'=>'true', 'content' => '<i class="fa fa-floppy-o" aria-hidden="true"></i> Export');
					
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
       //var jual = selected.data('retail'); 
       //var disc = selected.data('disc'); 
       //var promo = selected.data('promo'); 
       $('#jumlah_sistem').val(extra);
       //$('#disc_jual').val(disc);
       //$('#harga_jual').val(jual);
       //$('#promo_date').val(promo);
    });

    $('#jumlah_real').keyup(function(value){
    	var packs = $('#jumlah_sistem').val();
    	var packsize = $('#jumlah_real').val();
    	$('#selisih').val(packs-packsize);
    });
});
</script>