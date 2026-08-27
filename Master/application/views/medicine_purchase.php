<!-- Main content -->
<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title"><i class="fa fa-arrow-circle-right" aria-hidden="true"></i> <?php echo $table_name; ?></h3>
                </div>
                <div class="box-body ">
                    <?php
						$attributes = array('id'=>'Sales_form','method'=>'post','class'=>'form-horizontal');
					?>
                        <?php echo form_open('purchasereport/',$attributes); ?>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <?php echo form_label('Dari Tanggal:'); ?>
                                    <?php
                                        $data = array('class'=>'form-control input-lg','type'=>'date','name'=>'date1');
										echo form_input($data); 
                                    ?>
                                </div>
                                <div class="form-group">
                                    <?php echo form_label('Sampai Tanggal:'); ?>
                                    <?php $data1 = array('class'=>'form-control input-lg','type'=>'date','name'=>'date2');
										echo form_input($data1); 
                                    ?>
                                </div>

                                <div class="form-group">
                                    <?php echo form_label('Pilih Supplier.'); ?>
                                        <select name="customer_id" class="form-control select2 input-lg">
                                            <?php 
                                            foreach ($customer_list as $single_customer) 
                                            {
                                            ?>
                                                <option value="<?php echo $single_customer->id; ?>">
                                                    <?php //echo $single_customer->customer_name; ?>  
                                                    <?php echo 'Nama: '.$single_customer->customer_name.' - '.$single_customer->cus_company.' - '.$single_customer->cus_contact_2.' - '.$single_customer->cus_type.' - '.$single_customer->cus_region;

                                                ?>   
                                                </option>
                                            <?php 
                                            }
                                            ?>
                                        </select>
                                </div> 
                                
                                <div class="form-group">
                                    <?php
										$data = array('class'=>'btn btn-info  btn-outline-primary pull-right','type' => 'submit','name'=>'btnSubmit','value'=>'true', 'content' => '<i class="fa fa-search" aria-hidden="true"></i> Cari Pembelian');
										echo form_button($data);
									?>
                                </div>
                            </div>
                         <?php echo form_close(); ?> 
                            <div class=" no-print">
                                <div class="col-md-12">
                                   <!--  <button onclick="printDiv('print-section')" class="btn btn-default btn-outline-primary  pull-right "><i class="fa fa-print pull-left"></i> Cetak</button> -->
                                </div>
                            </div>
                </div>
                <div id="print-section ">
                <div class="col-md-12 table-responsive">
                    <table id="example1" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <?php
            					foreach ($table_heading_names_of_coloums as $table_head)
                                {
                    			?>
                            <th>
                                <?php echo $table_head; ?>
                            </th>
                               <?php
                    			}
                    			?>
                            </tr>
                        </thead>
                        <tbody>
                            <?php

    			            $sno = 1;
    			            $total_revenue =0;
                            $discount_offered = 0;
                            $total_expense = 0;
    			            $total_items_sold = 0;
                            $subtotal = 0;
                            foreach($invoices_record as $record){
                                $subtotal = $record->pack * $record->qty * $record->purchase;
                                //$subtotal = $record->qty *$record->purchase;
                                $total_expense = $total_expense + $subtotal;
                                ?>

                                <tr>
                            <td>
                                <?php echo $sno; ?>
                            </td>
                            <td>
                                <?php echo $record->invoice; ?>
                            </td>
                            <td>
                                <?php echo $record->customer_name; ?>
                            </td>
                            <td>
                                <?php echo $record->date_purc; ?>
                            </td>
                            <td>
                                <?php echo $record->product_name; ?>
                            </td>
                            <td>
                                <?php echo $record->pack; ?>
                            </td>
                            <td>
                                <?php echo number_format($record->purchase,0,",","."); ?>
                            </td>
                            <td>
                                <?php echo $record->qty; ?>
                            </td>
                            <td>
                                <?php echo number_format($subtotal,0,",","."); ?>
                            </td>
                        </tr><?php $sno++; 
                            }
                            ?>

            </tbody>
        </table>
    </div>
        <section class="content" style="background-color:#fff;">
            <div class="row">
                <table class="table table-striped table-bordered">
                    <tr>
                        <th>Laporan Pembelian</th>
                        <th></th>
                    </tr>
                    <tr>
                        <td>Total Modal / Pengeluaran</td>
                        <td class="text-right">
                            <?php echo $this->db->get_where('mp_langingpage', array('id' => 1))->result_array()[0]['currency'] ;?>
                                <?php echo number_format($total_expense,0,",","."); ?> /- </td>
                    </tr>
                </table>
            </div>
        </section>
        <!-- /.box-body -->
    </div>
    <!-- /.box -->
</div>
<!-- /.col -->