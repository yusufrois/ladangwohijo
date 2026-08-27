<div class="col-md-12 set-no-padding">
	<div class="table-responsive">
      <table class="table table-bordered table-hover dataTable" id="dataTable" width="100%" cellspacing="0">
        <thead>
            <tr> 
                <th>Item</th>
                <th>Tanggal Kadaluarsa</th>
                <!--<th>Weight</th>
                <th>Harga</th>-->
                <th>Qty</th>
                <!--<th>Tanggal Produksi</th>-->
                
                <th>Ukuran Pak</th>
                <th>Total</th>
                <th>Total Harga Beli</th>
                <th>Harga Satuan</th>
                <th>Beli Lama</th>
                <th>Harga Jual</th>
                <th>Diskon %</th>
                <th>Tindakan</th>
            </tr>
        </thead>
        <tbody>
            <?php
            $currency =  $this->db->get_where('mp_langingpage', array('id' => 1))->result_array()[0]['currency'];
            $total_tax   = 0;  
            $total_gross = 0;
            $single_tax  = 0;
            if($temp_data != NULL)
            {
    // print "<pre>";
    // print_r($temp_data);
                foreach ($temp_data as $single_val) 
                {
                    $i=0;
                    $sub_total_tax = $single_val->qty * $single_val->tax;

                    $sub_total_pembelian = $single_val->qty * $single_val->pack;
                    $harga_satuan = $single_val->sales / $sub_total_pembelian;
                    $total_tax = number_format($total_tax + $sub_total_tax,0,'.','');
                    //$total_gross = number_format($total_gross+($single_val->price*$single_val->qty),0,'.','.');
                    $total_gross = number_format($total_gross+($single_val->sales),0,',','');
                    ?>
                    <tr > 
                        <td><input type="text" class="supply_fields" name="supply_nama[]" id="supply_tgl" value="<?php echo $single_val->product_name; ?>" readonly></td>
                        <td>
                            <input type="date" class="supply_fields" name="supply_tgl[]" id="supply_tgl" value="<?php echo $single_val->date_ex; ?>" onchange="date_ex(<?php echo $single_val->id; ?>,this.value)">
                        </td>
                        <!--<td><?php //echo $single_val->mg.' '.$single_val->unit_type; ?></td>-->
                        <!--<td>
                            <input type="number" onkeyup="amend_price(this.value,'<?php //echo $single_val->id; ?>')"  value="<?php //echo $single_val->price; ?>" />

                        </td>-->
                        <td><!-- update jumlah -->
                            <input type="number"  onchange="amend_qty(this.value,'<?php echo $single_val->id; ?>'),hitung_pcs(this.value,<?php echo $single_val->pack; ?>)" class="supply_fields" value="<?php echo $single_val->qty; ?>" name="supply_qty[]" id="supply_qty">
                        </td>
                        <td>
                            <?php echo $single_val->pack; ?>
                        </td>
                        <td>
                            <input type="number" class="supply_fields" name="supply_total[]" id="supply_total" value="<?php echo $sub_total_pembelian?>">
                        </td>
                        <td><input type="number" class="supply_fields" name="supply_tot_beli[]" id="supply_tot_beli" value="<?php echo $single_val->sales; ?>" onchange="amend_sales(this.value,<?php echo $single_val->id; ?>)">
                        </td>
                        <td>
                            <?php echo $harga_satuan; ?>
                        </td>
                        <td><input type="number" class="supply_fields" name="supply_satuan[]" id="supply_satuan"  onchange="amend_satuan(this.value,<?php echo $single_val->id; ?>)" value="<?php echo $single_val->purchase; ?>">
                        </td>
                        <td><input type="number" class="supply_fields" name="supply_jual[]" id="supply_jual" value="<?php echo $single_val->price; ?>" onchange="amend_jual(this.value,<?php echo $single_val->id; ?>)">
                        </td>
                        <td>
                            <input type="number" class="supply_fields" name="supply_dis[]" id="supply_dis" value="<?php echo $single_val->disc; ?>" onchange="amend_disc(this.value,<?php echo $single_val->id; ?>)">
                        </td>
                        <td >
                            <a onclick="delete_item('<?php echo $single_val->id; ?>')" ><i class="fa fa-trash margin" aria-hidden='true'></i>
                            </a>  
                        </td>
                    </tr>
                    <?php 
                    $i++;
                } 
            } 
            ?> 
        </tbody>
        </table>
    </div>
    <div class="row total-grid-values">
        <div class="col-md-12 col-sm-12 col-xs-12 text-right">
            Total Gross (<?php echo $currency; ?>) :
            <h2><?php echo $total_gross; ?></h2>
        </div>
    </div>
</div>
<script type="text/javascript">
    function delete_item(item_id)
    {
        // SHOW AJAX RESPONSE ON REQUEST SUCCESS
        $.ajax({
            url:'<?php echo base_url('Purchase/delete_item_temporary_purc/'); ?>'+item_id,
            success: function(response)
            {
                jQuery('#inner_purchase_area').html(response);
                $('#barcode_scan_area').val('');

            }
        });

        $('#barcode_scan_area').focus();
    }

    var discounttimmer;
    //USED TO CALCUATE DISCOUNT AMOUT
    function checkDiscount(dis_amt)
    {

      clearTimeout(discounttimmer);
      discounttimmer = setTimeout(function callback(){
       var total_gross_amt =  $('#total_gross_amt').val();
       var total_tax_amt   =  $('#total_tax_amt').val();
       if(dis_amt > 0)
       {
           var newamt = parseFloat(total_gross_amt-dis_amt)+parseFloat(total_tax_amt); 
           $('#net_total_amount').html(newamt.toFixed(2));
           $('#bill_paid').val(newamt.toFixed(2));
           $('#total_bill').val(newamt.toFixed(2));
       }
       else
       {   
        var pre_val =  parseFloat(total_gross_amt)+parseFloat(total_tax_amt);
        $('#net_total_amount').html(pre_val.toFixed(2));
        $('#bill_paid').val(pre_val.toFixed(2));
        $('#total_bill').val(pre_val.toFixed(2));
    }
},500)
  }

    //USED TO CALCULATE HOW MUCH AMOUNT SHOULD RETURN TO CUSTOMER
    function amount_refund(amt)
    {
        var netamt =  $('#net_total_amount').html();

        var cash_given = amt-parseFloat(netamt);
        $('#cash_given_to_customer').html(cash_given.toFixed(2));
    }

    //USED TO OPEN CUSTOMER PAYMENT MODEL 
    function open_payment_model()
    {
        var cus_id = $('#customer_id').val();
        show_modal_page('<?php echo base_url('Purchase/popup/add_customer_payment_pos_model/');?>'+cus_id)
    }

    function hitung_pcs(nilai, nilai2)
    {
        //var jml_qty = $('#supply_qty').val();
        var jml_qty = nilai;
       // var jml_pak = $('#supply_pak').val();
        var jml_pak = nilai2;
        var total_item = parseInt(jml_qty)*parseInt(jml_pak); 
        //var total_item = jml_pak;

        console.log(jml_qty);
        console.log(jml_pak);
        console.log(total_item);
        //$('#supply_total').html(total_item.toFixed(0));
        document.getElementById("supply_total").value = total_item;
    }
</script>