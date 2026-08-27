<section class="content">
    <div class="row">
        <div class="col-lg-3 col-xs-6">
            <div class="small-box bg-yellow">
                <div class="inner">
                    <h3><label class="label "><?php echo number_format($cash_in_hand,0,'.','');?></label></h3>

                    <h4 class="paragraph">Donasi Masuk <?php echo $currency; ?></h4>
                </div>
                <div class="icon">
                    <i class="fa fa-money " aria-hidden="true"></i>
                </div>
                <a  class="small-box-footer">Lihat <i class="fa fa-hand-o-right"></i></a>
            </div>
        </div>
        <div class="col-lg-3 col-xs-6">
            <div class="small-box bg-red">
                <div class="inner">
                    <?php 
                    if($payables < 0)
                    {
                        $payables = '('.-(number_format($payables,0,'.','')).')';
                    }

                     ?>
                    <h3><label class="label"><?php echo $payables; ?></label></h3>

                    <h4 class="paragraph">Donasi Keluar <?php echo $currency; ?></h4>
                </div>
                <div class="icon">
                    <i class="fa fa-hand-o-right" aria-hidden="true"></i>
                </div>
                 <a  class="small-box-footer">Lihat <i class="fa fa-hand-o-right"></i></a>
            </div>
        </div>
        <div class="col-lg-3 col-xs-6">
            <div class="small-box bg-green ">
                <div class="inner">
                    <h3><label class="label"><?php echo number_format($account_recieveble,0,'.','');?></label></h3>

                    <h4 class="paragraph">Saldo Donasi <?php echo $currency; ?></h4>
                </div>
                <div class="icon">
                    <i class="fa fa-lemon-o"></i>
                </div>
                <a  class="small-box-footer">Lihat <i class="fa fa-hand-o-right"></i></a>
            </div>
        </div>
        <div class="col-lg-3 col-xs-6">
            <div class="small-box bg-blue ">
                <div class="inner">
                    <h3><label class="label"><?php echo number_format($hariini,0,'.','');?></label></h3>

                    <h4 class="paragraph">Donasi Hariini <?php echo $currency; ?></h4>
                </div>
                <div class="icon">
                    <i class="fa fa-lemon-o"></i>
                </div>
                <a  class="small-box-footer">Lihat <i class="fa fa-hand-o-right"></i></a>
            </div>
        </div>
        <div class="col-lg-3 col-xs-6">
            <div class="small-box custom-bg-color-second">
                <div class="inner">
                    <h3><label class="label">Donasi</label></h3>

                    <h4 class="paragraph">Kirim Donasi</h4>
                </div>
                <div class="icon">
                    <i class="fa fa-shopping-basket" aria-hidden="true"></i>
                </div>

                <li onclick="show_modal_page('<?php echo base_url().'donasi/popup/add_donasi'; ?>')"><a href="#" class="small-box-footer">Donasi <i class="fa fa-hand-o-right"></i></a></li>
            </div>
        </div>
    </div>
    
       
</section>

<style>
.small-box > .inner {
    padding: 20px;
}
@media (min-width: 992px){
.col-md-10 {
    width: 85.333333%;
}
}
</style>
<?php $this->load->view('bootstrap_model.php'); ?>