<?php
session_start();
include 'back-end/koneksi.php';
?>
<?php include 'header.php' ?>

<?php include 'sidebar.php' ?>

<!-- partial -->
<div class="main-panel">
  <div class="content-wrapper">
    <div class="row">
      <div class="col-md-12 grid-margin">
        <h3 class="font-weight-bold">Print Barcode</h3>
      </div>
      <div class="card col-md-12 p-4">
        <div class="add">
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
      <form method="POST" action="back-end/save_barcode.php">
        <div class="table-responsive">
          <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
            <thead>
              <tr>
                <th></th>
                <th>Kode Barang</th>
                <th>Nama Barang</th>
                <th>Satuan</th>
                <th>Harga</th>
                <th>Jumlah</th>
              </tr>
            </thead>
            <tbody>
              <?php
              if(!empty($_SESSION['cart'])){
              //create array of initail qty which is 1
                $index = 0;
                if(!isset($_SESSION['qty_array'])){
                  $_SESSION['qty_array'] = array_fill(0, count($_SESSION['cart']), 1);
              //$_SESSION['name_array'] = 'coba';
                }
                //$sql = "SELECT id,kode_produk,nama_barang,harga_diskon,satuan FROM tb_produk WHERE id IN (".implode(',',$_SESSION['cart']).")";
                $sql = "SELECT mp_productslist.id as id, barcode as kode_produk, product_name as nama_barang, category_name as kategori_produk, retail as harga_jual, CASE WHEN CURRENT_DATE <= date_disc THEN
                retail - disc
                ELSE
                retail
                END as harga_diskon,CASE WHEN CURRENT_DATE <= date_disc THEN
                'PROMO'
                ELSE
                'NORMAL'
                END as status_produk, unit_type as satuan FROM mp_productslist JOIN mp_category on mp_category.id = category_id WHERE mp_productslist.id IN (".implode(',',$_SESSION['cart']).")";
                $query = $con->query($sql);
                while($row = $query->fetch_assoc()){
                  ?>
                  <tr>
                    <td>
                      <a href="back-end/delete_barcode.php?id=<?php echo $row['id']; ?>&index=<?php echo $index; ?>" class="btn btn-danger btn-sm btn-icon-text"> Hapus <i class="ti-trash btn-icon-append"></i></a>
                    </td>
                    <td><?php echo $_SESSION['kode_array'][$index] = $row['kode_produk']; ?></td>
                    <td><?php echo $_SESSION['name_array'][$index] = $row['nama_barang']; ?></td>
                    <td><?php echo $_SESSION['satuan_array'][$index] = $row['satuan']; ?></td>
                    <td><?php echo $_SESSION['price_array'][$index] = $row['harga_diskon']; ?></td>
                    <input type="hidden" name="indexes[]" value="<?php echo $index; ?>">
                    <td><input type="text" class="form-control form-control-sm" value="<?php echo $_SESSION['qty_array'][$index]; ?>" name="qty_<?php echo $index; ?>"></td>
                  </tr>
                  <?php
                  $index ++;
                } 
              }
              else{
                ?>
                <tr>
                  <td colspan="4" class="text-center">No Item in Cart</td>
                </tr>
                <?php
              }
              ?>
            </tbody>
          </table>
        </div>
        <a href="CetakBarcode.php" class="btn btn-primary"><span class="glyphicon glyphicon-arrow-left"></span> Back</a>
        <button type="submit" class="btn btn-success" name="save">Save Changes</button>
        <a href="back-end/clear_barcode.php" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span> Clear Cart</a>
        <a href="PrintBarcode.php" class="btn btn-success"><span class="glyphicon glyphicon-check"></span> Print</a>
      </form>
    </div>

    <!-- Button trigger modal -->
           <!--  <button type="button" classs="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
              Launch demo modal
            </button> -->

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
      $(document).ready(function() {
        $('#dataTable').DataTable();
      } );
    </script>

