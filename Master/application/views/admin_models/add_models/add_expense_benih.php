<!-- Select2 -->
<link rel="stylesheet" href="<?php echo base_url(); ?>assets/plugins/select2/select2.min.css">
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal">&times;</button>
	<h4 class="modal-title"><i class="fa fa-plus-square" aria-hidden="true"></i> Tambah Benih
	</h4>
</div>
<div class="modal-body">
	<div class="row">
		<div class="box box-danger">
			<div class="box-body">	
				<div class="col-md-12">
					<?php
					$attributes = array('id'=>'add_expense_form','method'=>'post','class'=>'form-horizontal');
					?>
					<?php echo form_open('expense/add_benih',$attributes); ?>				
					<div class="form-group">
						<label>Pilih Expense: </label>				
						<select class="form-control select2" name="head_id" id="head_id"  style="width: 100%;">
							<?php
							//category_names from mp_category table;
							if($head_list != NULL)
							{		
								foreach ($head_list as $single_head_list)
								{
									?>
									<option value="<?php echo $single_head_list->id; ?>" ><?php echo $single_head_list->name; ?> 
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
				<label>Jenis Benih: </label>	
				<select name="nama_pupuk" id="nama_pupuk" class="form-control select2">
					<?php
                                        //category_names from mp_category table;
					if($nama_list != NULL)
					{       
						foreach ($nama_list as $single_akun)
						{
							?>
							<option value="<?php echo $single_akun->nama_pupuk; ?>" ><?php echo $single_akun->nama_pupuk; ?> 
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
			   	<?php echo form_label('Jumlah Tanam:'); ?>
               	<?php
					$data = array('class'=>'form-control input-lg','type'=>'number','name'=>'jumlah','id'=>'jumlah','placeholder'=>'e.g 10');
					echo form_input($data);
			  	?>
                </div>
                <div class="form-group">
		<?php
		$data = array('class'=>'btn btn-info btn-outline-primary','type' => 'submit','name'=>'btn_submit_medicine','value'=>'true', 'content' => '<i class="fa fa-floppy-o" aria-hidden="true"></i> Simpan');
		
		echo form_button($data);
		?>
	</div>
	
	<?php echo form_close(); ?>
</div>
</div>
</div>
</div>
</div>
<!-- Select2 -->
<!-- Form Validation -->
<script src="<?php echo base_url(); ?>assets/dist/js/custom.js"></script>
<script src="<?php echo base_url(); ?>assets/plugins/select2/select2.full.min.js"></script>
<script type="text/javascript">
	$(function () {
    //Initialize Select2 Elements
    $(".select2").select2();
	});

	$('#payment_id').change(function(){
		var method = $('#payment_id').val();
		if(method == 'Cheque')
		{
			$('.bank-section-details').css('display','block');
		}
		else
		{
			$('.bank-section-details').css('display','none');
		}
	});

	$('#bank_id').change(function(){
		var bank_id = $('#bank_id').val();


		if(bank_id != 0)
		{
		// SHOW AJAX RESPONSE ON REQUEST SUCCESS
		$.ajax({
			url: '<?php echo base_url('bank/check_available_balance/'); ?>'+bank_id,
			success: function(response)
			{
				$('#available_balance').html(response);
				$('#save_available_balance').val(response);
			}
		});

		$('#bank-cheque-no').css('display','block');
	}

	
});


</script>