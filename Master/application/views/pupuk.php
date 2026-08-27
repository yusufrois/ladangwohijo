<section class="content-header">
    <div class="row">
        <div class="col-md-12">
            <div class="pull pull-right">
                <a href="<?php echo base_url('expense/generate_penjualan'); ?>"  class="btn btn-danger btn-outline-primary"><i class="fa fa-plus-square" aria-hidden="true"></i>
                    <?php echo $page_add_button_report_penjualan; ?>
                </a>
                <button type="button" onclick="show_modal_page('<?php echo base_url();?>expense/popup/add_expense_penjualan')" class="btn btn-danger btn-outline-primary"><i class="fa fa-plus-square" aria-hidden="true"></i>
                    <?php echo $page_add_button_penjualan; ?>
                </button>
                <button type="button" onclick="show_modal_page('<?php echo base_url();?>expense/popup/add_expense_benih')" class="btn btn-primary btn-outline-primary"><i class="fa fa-plus-square" aria-hidden="true"></i>
                    <?php echo $page_add_button_benih; ?>
                </button>
                <button type="button" onclick="show_modal_page('<?php echo base_url();?>expense/popup/add_expense_model_pupuk')" class="btn btn-success btn-outline-primary"><i class="fa fa-plus-square" aria-hidden="true"></i>
                    <?php echo $page_add_button_name_pupuk; ?>
                </button>
                <button type="button" onclick="show_modal_page('<?php echo base_url();?>expense/popup/add_expense_model_master')" class="btn btn-warning btn-outline-primary"><i class="fa fa-plus-square" aria-hidden="true"></i>
                    <?php echo $page_add_button_name_master; ?>
                </button>
                <button type="button" onclick="show_modal_page('<?php echo base_url();?>expense/popup/add_expense_model')" class="btn btn-info btn-outline-primary"><i class="fa fa-plus-square" aria-hidden="true"></i>
                    <?php echo $page_add_button_name; ?>
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
                    <?php
                            $attributes = array('id'=>'Sales_form','method'=>'post');
                    ?>
                        <?php echo form_open('expense/generate_pupuk',$attributes); ?>
                        <div class="col-md-12 no-print">
                                <div class="col-md-4">
                                    <div class="form-group">
                                            <?php echo form_label('Nama Akun'); ?>
                                              <select name="account_head" class="form-control select2 input-lg">
                                                    <?php 
                                                      foreach ($heads_record as $single_head) {
                                                    ?>
                                                         <option value="<?php echo $single_head->id ?>">
                                                          <?php echo $single_head->name ?>
                                                          </option>
                                                    <?php   
                                                      }
                                                    ?>   
                                              </select>
                                        </div>
                                </div>
                                <div class="col-md-2">
                                <label>&nbsp;</label>
                                <div class="form-group">
                                
                                    <?php
                                        $data = array('class'=>'btn btn-info input-lg btn-outline-primary','type' => 'submit','name'=>'btnSubmit','value'=>'true', 'content' => '<i class="fa fa-search" aria-hidden="true"></i> Cari');
                                        echo form_button($data);
                                    ?>
                                </div>
                                </div>
                            </div>
                        <?php echo form_close(); ?> 
                        <div class="report-header">
                                <center><h2>📊 Pembelian PUPUK</h2>
                                <p>
                                <strong>Lokasi : </strong><?php echo $judul; ?>
                            </p></center>
                        </div>
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
                                        $total_bill = 0;
                                            $total_paid = 0;
                                            $total_pupuk = 0;
                                            $total_air=0;
                                            $total_bbm=0;
                                            $total_listrik=0;
                                            $total_benih=0;
                                            $total_polinasi=0;
                                            $total_pegawai=0;
                                            $total_dasar=0;
                                            $total_kocor=0;
                                            $total_spray=0;
                                            $total_peralatan=0;
                                            $total_benih_tanam=0;
                                            $jenis_benih ='';
                                            $total_penjualan=0;
                                            $total_a=0;
                                            $total_b=0;
                                            $total_c=0;
                                            $total_r=0;

                                        if($expense_record_list != NULL)
                                        {
                                            $counter = 1;
                                            foreach ($AIR as $single_AIR)
                                            {
                                                $total_air = $single_AIR->jumlah_all;
                                            }
                                            foreach ($BBM as $single_bbm)
                                            {
                                                $total_bbm = $single_bbm->jumlah_all;
                                            }
                                            //var_dump($total_bbm);
                                            foreach ($Benih as $single_benih)
                                            {
                                                $total_benih = $single_benih->jumlah_all;
                                            }
                                            foreach ($Listrik as $single_listrik)
                                            {
                                                $total_listrik = $single_listrik->jumlah_all;
                                            }
                                            foreach ($Pegawai as $single_pegawai)
                                            {
                                                $total_pegawai = $single_pegawai->jumlah_all;
                                            }
                                            foreach ($Peralatan as $single_peralatan)
                                            {
                                                $total_peralatan = $single_peralatan->jumlah_all;
                                            }
                                            foreach ($Polinasi as $single_polinasi)
                                            {
                                                $total_polinasi = $single_polinasi->jumlah_all;
                                            }
                                            foreach ($Dasar as $single_dasar)
                                            {
                                                $total_dasar = $single_dasar->jumlah_all;
                                            }
                                            foreach ($Kocor as $single_kocor)
                                            {
                                                $total_kocor = $single_kocor->jumlah_all;
                                            }
                                            foreach ($Spray as $single_spray)
                                            {
                                                $total_spray = $single_spray->jumlah_all;
                                            }
                                            foreach ($benih as $single_benih)
                                            {
                                                $total_benih_tanam = $single_benih->jumlah;
                                                $jenis_benih = $single_benih->jenis_melon;
                                            }
                                            foreach ($penjualan as $single_penjualan)
                                            {
                                                $total_penjualan = $single_penjualan->harga;
                                            }
                                            foreach ($tonase_a as $single_a)
                                            {
                                                $total_a = $single_a->tonase;
                                            }
                                            foreach ($tonase_b as $single_b)
                                            {
                                                $total_b = $single_b->tonase;
                                            }
                                            foreach ($tonase_c as $single_c)
                                            {
                                                $total_c = $single_c->tonase;
                                            }
                                            foreach ($tonase_r as $single_r)
                                            {
                                                $total_r = $single_r->tonase;
                                            }

                                            foreach ($expense_record_list as $single_expense)
                                            {
                                                 $total_pupuk = $total_pupuk + $single_expense->jumlah;
                                                 $total_bill =  $total_bill + $single_expense->harga;
                                                 $total_paid =  $total_paid + $single_expense->total;
                                        ?>
                                    <tr>
                                            <td>
                                                <?php echo $counter; ?>
                                            </td>
                                            <td>
                                                <?php echo $single_expense->name; ?>
                                            </td>
                                            <td>
                                                <?php echo $single_expense->nama; ?>
                                            </td>
                                            <td>
                                                <?php echo $single_expense->jenis_pupuk; ?>
                                            </td>
                                            <td>
                                                <?php echo $single_expense->jumlah; ?>
                                            </td>
                                            <td>
                                                <?php echo number_format($single_expense->harga,'0',',','.'); ?>
                                            </td>
                                            <td>
                                                <?php echo number_format($single_expense->total,'0',',','.'); ?>
                                            </td>
                                            <td>
                                                <?php echo substr($single_expense->keterangan,0,30); ?>
                                            </td>
                                            <td>
                                                <?php echo $single_expense->toko; ?>
                                            </td>
                                            <td>
                                                <?php echo $single_expense->tanggal; ?>
                                            </td>
                                            <!-- <td>
                                                <?php echo number_format($single_expense->harga_satuan,'0',',','.'); ?>
                                            </td>
                                            <td>
                                                <?php echo number_format($single_expense->jumlah,'0',',','.'); ?>
                                            </td>
                                             <td>
                                                <?php echo number_format($single_expense->total_bill,'0',',','.'); ?>
                                            </td>
                                            <td>
                                                <?php echo number_format($single_expense->total_paid,'0',',','.'); ?>
                                            </td> -->
                                            
                                        </tr>
                                    <?php
                                    $counter++;
                    					}

                    				}else{
                                        $total_benih_tanam=1;
                                    }	
                    				?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row bg-setting-product">
        
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="row">
                        <div class="col-md-3">AIR</div>
                        <div class="col-md-1">:</div>
                        <div class="col-md-3">Rp. <?php echo number_format($total_air,'0',',','.'); ?>/-</div>
                    </div>
                     <div class="row">
                        <div class="col-md-3">BBM</div>
                        <div class="col-md-1">:</div>
                        <div class="col-md-3">Rp. <?php echo number_format($total_bbm,'0',',','.'); ?>/-</div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">BENIH</div>
                        <div class="col-md-1">:</div>
                        <div class="col-md-3">Rp. <?php echo number_format($total_benih,'0',',','.'); ?>/-</div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">LISTRIK</div>
                        <div class="col-md-1">:</div>
                        <div class="col-md-3">Rp. <?php echo number_format($total_listrik,'0',',','.'); ?>/-</div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">PEGAWAI</div>
                        <div class="col-md-1">:</div>
                        <div class="col-md-3">Rp. <?php echo number_format($total_pegawai,'0',',','.'); ?>/-</div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">PERALATAN</div>
                        <div class="col-md-1">:</div>
                        <div class="col-md-3">Rp. <?php echo number_format($total_peralatan,'0',',','.'); ?>/-</div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">POLINASI</div>
                        <div class="col-md-1">:</div>
                        <div class="col-md-3">Rp. <?php echo number_format($total_polinasi,'0',',','.'); ?>/-</div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">PUPUK DASAR</div>
                        <div class="col-md-1">:</div>
                        <div class="col-md-3">Rp. <?php echo number_format($total_dasar,'0',',','.'); ?>/-</div>
                    </div><div class="row">
                        <div class="col-md-3">PUPUK KOCOR</div>
                        <div class="col-md-1">:</div>
                        <div class="col-md-3">Rp. <?php echo number_format($total_kocor,'0',',','.'); ?>/-</div>
                    </div><div class="row">
                        <div class="col-md-3">PUPUK SPRAY</div>
                        <div class="col-md-1">:</div>
                        <div class="col-md-3">Rp. <?php echo number_format($total_spray,'0',',','.'); ?>/-</div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="row">
                        <div class="col-md-3">JENIS BENIH</div>
                        <div class="col-md-1">:</div>
                        <div class="col-md-3"><?php echo $jenis_benih; ?></div>
                    </div>
                     <div class="row">
                        <div class="col-md-3">JUMLAH TANAM</div>
                        <div class="col-md-1">:</div>
                        <div class="col-md-3"><?php echo $total_benih_tanam; ?></div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">HPP TANAMAN</div>
                        <div class="col-md-1">:</div>
                        <div class="col-md-3">Rp. <?php echo number_format(($total_paid / $total_benih_tanam),'0',',','.'); ?>/-</div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">PENJUALAN</div>
                        <div class="col-md-1">:</div>
                        <div class="col-md-3">Rp. <?php echo number_format($total_penjualan,'0',',','.'); ?>/-</div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">HPP PENJUALAN</div>
                        <div class="col-md-1">:</div>
                        <div class="col-md-3">Rp. <?php echo number_format($total_penjualan / $total_benih_tanam,'0',',','.'); ?>/-</div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">LABA TANAMAN</div>
                        <div class="col-md-1">:</div>
                        <div class="col-md-3">Rp. <?php echo number_format(($total_penjualan / $total_benih_tanam) - ($total_paid / $total_benih_tanam),'0',',','.'); ?>/-</div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">TONASE A</div>
                        <div class="col-md-1">:</div>
                        <div class="col-md-3"><?php echo $total_a; ?> Kg</div>
                    </div><div class="row">
                        <div class="col-md-3">TONASE B</div>
                        <div class="col-md-1">:</div>
                        <div class="col-md-3"><?php echo $total_b; ?> Kg</div>
                    </div><div class="row">
                        <div class="col-md-3">TONASE C</div>
                        <div class="col-md-1">:</div>
                        <div class="col-md-3"><?php echo $total_c; ?> Kg</div>
                    </div><div class="row">
                        <div class="col-md-3">TONASE RIJECT</div>
                        <div class="col-md-1">:</div>
                        <div class="col-md-3"><?php echo $total_r; ?> Kg</div>
                    </div>
                </div>
             </div>
         </div>
         <div class="col-md-12">
            <!--<p><b> Total Pembelian Pupuk <?php echo $total_pupuk; ?> dengan harga  (<?php echo $this->db->get_where('mp_langingpage', array('id' => 1))->result_array()[0]['currency'] ;?>)</b> is <?php echo number_format($total_bill,'0',',','.'); ?> dan-->
               <b> Total (<?php echo $this->db->get_where('mp_langingpage', array('id' => 1))->result_array()[0]['currency'] ;?>): </b> <?php echo number_format($total_paid,'0',',','.'); ?> /- dengan Keuntungan Rp. <b><?php echo number_format($total_penjualan - $total_paid,'0',',','.'); ?></b>
            </p>
        </div>
    </div>
</section>
</div><div class="row">
                        <div class="col-md-3">Total Belanja PUPUK</div>
                        <div class="col-md-1">:</div>
                        <div class="col-md-3">Rp. <?php echo number_format($total_polinasi+$total_dasar+$total_kocor+$total_spray,'0',',','.'); ?>/-</div>
                    </div>
<!-- Bootstrap model  -->
<?php $this->load->view('bootstrap_model.php'); ?>
<!-- Bootstrap model  ends-->        
