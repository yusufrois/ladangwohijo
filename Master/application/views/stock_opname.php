<section class="content-header">
    <div class="row">
        <div class="col-md-12">
            <div class="pull pull-right">
                <button type="button" onclick="show_modal_page('<?php echo base_url();?>product/popup/add_opname')" class="btn btn-primary btn-outline-primary" ><i class="fa fa-plus-square" aria-hidden="true"></i>
                    <?php echo $page_stock_button_name; ?>
                </button> 
                <button onclick="printDiv('print-section')" class="btn btn-default btn-outline-primary pull-right "><i class="fa fa-print pull-left"></i> Cetak</button>
            </div>
        </div>
    </div>
</section>
<section class="content">
    <div class="row">
        <div class="col-xs-12 col-md-12 col-sm-12">
            <div class="box " id="print-section">
                <div class="box-header">
                    <h3 class="box-title"><i class="fa fa-arrow-circle-right" aria-hidden="true"></i> <?php echo $table_name; ?></h3>
                </div>
                <div class="box-body">
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
                    				if($stock_list != NULL)
                                    {
                                        $sno = 1;
                    					foreach ($stock_list as $single_list)
                                        {
                    				?>
                                    <tr>
                                        <td>
                                            <?php echo $sno; ?>
                                        </td>
                                        <td>
                                            <?php echo $single_list->nama_barang; ?>
                                        </td> 
                                        <td>
                                            <?php echo $single_list->jumlah_sistem; ?>
                                        </td>
                                        <td>
                                            <?php echo $single_list->jumlah_real; ?>
                                        </td>
                                        <td>
                                            <?php echo $single_list->selisih; ?>
                                        </td>
                                        <td>
                                            <?php echo $single_list->harga; ?>
                                        </td>
                                        <td>
                                            <?php echo $single_list->hutang; ?>
                                        </td>
                                        <td>
                                            <?php echo $single_list->tanggal; ?>
                                        </td>
                                        <td>
                                            <div class="btn-group no-print pull pull-right">
                                                <button type="button" class="btn btn-info btn-flat">Tindakan</button>
                                                <button type="button" class="btn btn-default btn-flat dropdown-toggle" data-toggle="dropdown">
                                                    <span class="caret"></span>
                                                    <span class="sr-only">Toggle Dropdown</span>
                                                </button>
                                                <ul class="dropdown-menu " role="menu">
                                                    <li>
                                                        <a onclick="confirmation_alert('update this to Buy  ','<?php echo base_url().'product/update_opname/'.$single_list->id; ?>')"  href="javascript:void(0)"><i class="fa  fa-arrow-circle-o-right"></i> Sudah diBayar
                                                        </a>
                                                    </li> 
                                                </ul>
                                            </div>
                                        </td>
                                    </tr>
                                    <?php
                                         $sno++;
                    					}
                    				}	
                    				?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Bootstrap model  -->
<?php $this->load->view('bootstrap_model.php'); ?>
<!-- Bootstrap model  ends-->        
