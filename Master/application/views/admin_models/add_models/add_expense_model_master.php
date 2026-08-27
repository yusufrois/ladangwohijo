<!-- Select2 -->
<link rel="stylesheet" href="<?php echo base_url(); ?>assets/plugins/select2/select2.min.css">
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal">&times;</button>
	<h4 class="modal-title"><i class="fa fa-plus-square" aria-hidden="true"></i> Tambah Master Pupuk
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
					<?php echo form_open('expense/add_master',$attributes); ?>				
				<div class="form-group">
					<label>Jenis Pupuk: </label>				
					<select class="form-control select2" name="jenis" id="jenis"  style="width: 100%;">
						<?php
							//category_names from mp_category table;
						if($payee_list != NULL)
						{		
							foreach ($payee_list as $single_payee)
							{
								?>
								<option value="<?php echo $single_payee->jenis; ?>" ><?php echo $single_payee->jenis; ?> 
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
		<?php echo form_label('Nama Pupuk:'); ?>(<?php echo $this->db->get_where('mp_langingpage', array('id' => 1))->result_array()[0]['currency'] ;?>)
		<?php			
		$data = array('class'=>'form-control input-lg','type'=>'text','name'=>'nama_pupuk','placeholder'=>'e.g pupuk','reqiured'=>'');
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

	


</script>