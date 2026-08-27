<?php
session_start();
  //initialize cart if not set or is unset
if(!isset($_SESSION['cart'])){
  $_SESSION['cart'] = array();
}
//unset qunatity
unset($_SESSION['qty_array']);
unset($_SESSION['kode_array']);
unset($_SESSION['nama_array']);
unset($_SESSION['satuan_array']);
unset($_SESSION['harga_array']);
include 'back-end/koneksi.php';
?>
<?php include 'header.php' ?>

<?php include 'sidebar.php' ?>
<link rel="stylesheet" href="css/sweetalert.min.css">
<script src="js/sweetalert.min.js"></script>
<!-- partial -->
<div class="main-panel">
  <div class="content-wrapper">
    <div class="row">
      <div class="col-md-12 grid-margin">
        <h3 class="font-weight-bold">Print Barcode</h3>
      </div>
      <div class="card col-md-12 p-4">
        <div class="add">
         <a class="btn btn-success mb-3 btn-sm btn-icon-text" href="ViewBarcode.php"><?php echo count($_SESSION['cart']); ?> Cetak <i class="ti-printer btn-icon-prepend"></i></a>
       </p>
       <?php
               //info message
       if(isset($_SESSION['message'])){
        ?>
        <div class="row">
          <div class="col-sm-6 col-sm-offset-6">
            <div class="alert alert-info text-center">
              <?php echo $_SESSION['message']; ?>
            </div>
          </div>
        </div>
        <?php
        unset($_SESSION['message']);
      }
      ?>
    </div>
    <div class="table-responsive">
      <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
        <thead>
          <tr>
            <th>Nama Barang</th>
            <th>Barcode</th>
            <th>Satuan</th>
            <th>Harga Normal</th>
            <th>Diskon</th>
            <th>Harga</th>
            <th>Status</th>
            <th>KTG</th>
            <th>Add</th>
          </tr>
        </thead>
        <tbody>
          <?php
          //$sql = "SELECT id,satuan,nama_barang,harga_jual,harga_diskon,diskon, status_produk, kategori_produk FROM tb_produk";
          $sql = "SELECT mp_productslist.id as id, product_name as nama_barang,barcode,retail as harga_jual, CASE WHEN CURRENT_DATE <= date_disc THEN
          retail - disc
          ELSE
          retail
          END as harga_diskon,CASE WHEN CURRENT_DATE <= date_disc THEN
          'PROMO'
          ELSE
          'NORMAL'
          END as status_produk, disc as diskon, unit_type as satuan, category_name as kategori_produk FROM mp_productslist JOIN mp_category ON mp_category.id = category_id ORDER BY product_name asc";
          $index = 0;
          if($result=mysqli_query($con,$sql)){
            while ($row=mysqli_fetch_assoc($result)) {
                # code...
              ?>
              <tr>
                <td><?php echo substr($row['nama_barang'], 0,15); ?></td>
                <td><?php echo $row['barcode']; ?></td>
                <td><?php echo $row['satuan']; ?></td>
                <td><?php echo $row['harga_jual']; ?></td>
                <td><?php echo $row['diskon']; ?></td>
                <td><?php echo $row['harga_diskon']; ?></td>
                <td><?php echo $row['status_produk']; ?></td>
                <td><?php echo substr($row['kategori_produk'], 0,15); ?></td>
                <td style="text-align:center;">
                <!--  <a class="btn btn-secondary  btn-sm btn-icon-text" href="back-end/add_barcode.php?id=<?php //echo $row['id']; ?>" target="_blank">ADD <i class="ti-upload btn-icon-prepend"> </i></a>-->
                <a class="btn btn-secondary  btn-sm btn-icon-text call" data="<?php echo $row['id'];?>" >ADD <i class="ti-upload btn-icon-prepend"> </i></a>
                  <!-- <button type="button" class="btn btn-warning btn-lg btn-icon-text" data-toggle="modal" id='detail' name='detail' data-target="#edit-data">
                    Edit<i class="ti-file btn-icon-append"></i>                          
                  </button>  -->                         
                </td>
              </tr>
              <?php
              $index ++;
            }

          }
          ?>
        </tbody>
      </table>
    </div>
  </div>

<div class="modal fade" id="edit-data" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-scroll" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Edit Barang</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
         <form class="forms-sample">
          <div class="form-group">
            <label for="editnama">Nama Barang</label>
            <input type="text" id="editnama" class="form-control form-control-sm" readonly placeholder="Nama Barang">
          </div>
          <div class="form-group">
            <label for="editsatuan">Satuan Barang</label>
            <input type="text" id="editsatuan" class="form-control form-control-sm" readonly placeholder="Nama Barang">
          </div>
          <div class="form-group">
            <label for="editjual">Harga Jual</label>
            <input type="text" id="editjual" class="form-control form-control-sm" placeholder="Nama Kategori">
          </div>
          <div class="form-group">
            <label for="editdiskon">Diskon</label>
            <input type="text" id="editdiskon" class="form-control form-control-sm" placeholder="Harga Jual">
          </div>
          <div class="form-group">
            <label for="editstatus">Status</label>
            <select class="form-control form-control-sm" id="editstatus">
              <option>Normal</option>
              <option>Promo</option>
            </select>
          </div>
        </form>                    
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-success" onclick="update_();">Save changes</button>
      </div>
    </div>
  </div>
</div>

</div>
<!-- partial -->
</div>
<!-- main-panel ends -->
</div>
<!-- page-body-wrapper ends -->
</div>
<!-- container-scroller -->

<?php include 'footer.php' ?>

<script type="text/javascript">
  var xhr = new XMLHttpRequest();

  $(document).ready(function() {
   let table = $('#dataTable').DataTable();
   $('#dataTable tbody').on( 'click', '#detail', function () {
    var current_row = $(this).parents('tr');
    if (current_row.hasClass('child')) {
      current_row = current_row.prev();
    }
    var data = table.row( current_row ).data();
    //console.log(data)
    $("#editnama").val(data[0]);
    $("#editsatuan").val(data[1]);
    //$("#editkategori").val(data[1]);
    //$("#editbeli").val(data[2]);
    $("#editjual").val(data[2]);
    $("#editdiskon").val(data[3]);
    $("#editstatus").val(data[5]);
  });
 } );

$('.call').click(function(e) {
    e.preventDefault();
    const id = $(this).attr('data')
          //console.log(id)
          xhr.open('POST', 'https://ghinamart.com/label/back-end/add_barcode.php?id=' + id, false); xhr.send();
          if (xhr.responseText == 1) {
            swal({
              title: 'Congratulations!',
              text: 'Berasil ditambah',
              type: 'success',
		timer: 1000,
              button: {
                text: "Continue",
                value: true,
                visible: true,
                className: "btn btn-primary"
              }
            });
         } else {
           swal("Data Sudah ada");
          }
          xhr.abort();
       });

  function update_(){
    var update_nama = document.getElementById('editnama').value;
    //var update_kategori = document.getElementById('editkategori').value;
    //var update_hargabeli = document.getElementById('editbeli').value;
    var update_hargajual = document.getElementById('editjual').value;
    var update_hargadiskon = document.getElementById('editdiskon').value;
    var update_status = document.getElementById('editstatus').value;
    var user_login = localStorage.getItem("user-login");

    var data = [];
    if (update_nama) {
      data.push(update_nama);
      data.push('update');
      data.push('0');
      data.push(update_hargajual);
      data.push(update_hargadiskon);
      data.push(update_hargajual - update_hargadiskon);
      data.push(update_status);
      data.push(user_login);
          //data.push(input_outvar);
          //console.log(data);
          xhr.open('POST', 'https://ghinamart.com/label/back-end/update-barang.php?q=' + data, false); xhr.send();
          console.log('https://ghinamart.com/label/back-end/update-barang.php?q=' + data);
          location.reload();
        }
      }
    </script>

