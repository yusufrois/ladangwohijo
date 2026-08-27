<?php include 'back-end/koneksi.php';?>

<?php include 'header.php' ?>

<?php include 'sidebar.php' ?>



<!-- partial -->
<div class="main-panel">
  <div class="content-wrapper">
    <div class="row">
      <div class="col-md-12 grid-margin">
        <h3 class="font-weight-bold">Master Barang</h3>
      </div>
    </div>

    <div class="card col-md-12 p-4">
      <div class="add">
       <button type="button" class="btn btn-info mb-3 btn-sm btn-icon-text" data-toggle="modal" data-target="#exampleModalAdd">
         Tambah Barang<i class="ti-plus btn-icon-append"></i>                          
       </button>
     </div>
     <div class="table-responsive">
      <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
        <thead>
          <tr>
            <th>Nama Barang</th>
            <th>Satuan</th>
            <th>Kategori</th>
            <th>Harga Beli</th>
            <th>Harga Jual</th>
            <th>Diskon</th>
            <th>Harga</th>
            <th>Status</th>
            <th>Update</th>
            <th>Opsi</th>
          </tr>
        </thead>
        <tbody>
          <?php
          $sql = "SELECT nama_barang, kategori_produk, harga_beli,diskon, harga_jual, harga_diskon, status_produk, last_update,satuan FROM tb_produk ORDER BY nama_barang ASC";
          $index = 0;
          if($result=mysqli_query($con,$sql)){
            while ($row=mysqli_fetch_assoc($result)) {
    # code...
              ?>
              <tr>
                <td><?php echo substr($row['nama_barang'], 0,16); ?></td>
                <td><?php echo $row['satuan']; ?></td>
                <td><?php echo substr($row['kategori_produk'], 0,10); ?></td>
                <td><?php echo $row['harga_beli']; ?></td>
                <td><?php echo $row['harga_jual']; ?></td>
                <td><?php echo $row['diskon']; ?></td>
                <td><?php echo $row['harga_diskon']; ?></td>
                <td><?php echo $row['status_produk']; ?></td>
                <td><?php echo $row['last_update']; ?></td>
                <td>
                    <button type="button" class="btn btn-warning btn-lg btn-icon-text" data-toggle="modal" id='detail' name='detail' data-target="#edit-data">
                      Edit<i class="ti-file btn-icon-append"></i>                          
                    </button>
                    <a href="back-end/delete_barang.php?id=<?php echo $row['nama_barang']; ?>&index=<?php echo $index; ?>" class="btn btn-danger btn-sm btn-icon-text"> Hapus<i class="ti-trash btn-icon-append"></i>
                    </a>
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

  <!-- Modal -->
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
              <label for="editsatuan">Satuan</label>
              <input type="text" id="editsatuan" class="form-control form-control-sm" readonly placeholder="Satuan Barang">
            </div>
            <div class="form-group">
              <label for="editkategori">Kategori</label>
              <input type="text" id="editkategori" class="form-control form-control-sm" readonly placeholder="Kategori Barang">
            </div>
            <div class="form-group">
              <label for="editbeli">Harga Beli</label>
              <input type="text" id="editbeli" class="form-control form-control-sm" placeholder="Harga Beli">
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
          <button type="button" class="btn btn-success" onclick="update_barang();">Save changes</button>
        </div>
      </div>
    </div>
  </div>

    <!-- Modal add -->
    <div class="modal fade" id="exampleModalAdd" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabelAdd" aria-hidden="true">
      <div class="modal-dialog modal-scroll" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Tambah Barang</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <form class="forms-sample">
              <div class="form-group">
                <label for="namabarang">Nama Barang</label>
                <input type="text" id="namabarang" class="form-control form-control-sm" placeholder="Nama Barang">
              </div>
              <div class="form-group">
                <label for="satuanbarang">Satuan Barang</label>
                <input type="text" id="satuanbarang" class="form-control form-control-sm" placeholder="Nama Barang">
              </div>
              <div class="form-group">
                <label for="kategoribarang">Kategori</label>
                <select class="form-control form-control-sm" id="kategoribarang">
                  <?php
                  $result_kategori = mysqli_query($con, "SELECT kategori FROM tb_kategori ORDER BY kategori ASC");
                  while($row_kategori = mysqli_fetch_assoc($result_kategori)) {
                    echo $html = "  
                    <option value='".$row_kategori['kategori']."'>".$row_kategori['kategori']."</option>
                    ";  
                  }
                  ?>
                </select>
              </div>
              <div class="form-group">
                <label for="hargabeli">Harga Beli</label>
                <input type="text" id="hargabeli" class="form-control form-control-sm" placeholder="Harga Beli">
              </div>
              <div class="form-group">
                <label for="hargajual">Harga Jual</label>
                <input type="text" id="hargajual" class="form-control form-control-sm" placeholder="Nama Kategori">
              </div>
              <div class="form-group">
                <label for="hargadiskon">Diskon</label>
                <input type="text" id="hargadiskon" class="form-control form-control-sm" placeholder="Harga Jual">
              </div>
              <div class="form-group">
                <label for="statusbarang">Status</label>
                <select class="form-control form-control-sm" id="statusbarang">
                  <option>Normal</option>
                  <option>Promo</option>
                </select>
              </div>
            </form>                    
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-success" onclick="add_barang();">Save changes</button>
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
    $("#editkategori").val(data[2]);
    $("#editbeli").val(data[3]);
    $("#editjual").val(data[4]);
    $("#editdiskon").val(data[5]);
    $("#editstatus").val(data[7]);
  });
 } );

  function add_barang(){
    var input_nama = document.getElementById('namabarang').value;
    var input_kategori = document.getElementById('kategoribarang').value;
    var input_hargabeli = document.getElementById('hargabeli').value;
    var input_hargajual = document.getElementById('hargajual').value;
    var input_hargadiskon = document.getElementById('hargadiskon').value;
    var input_status = document.getElementById('statusbarang').value;
    var input_satuan = document.getElementById('satuanbarang').value;
    var user_login = localStorage.getItem("user-login");

    var data = [];
    if (input_nama && input_kategori) {
      data.push(input_nama);
      data.push(input_kategori);
      data.push(input_hargabeli);
      data.push(input_hargajual);
      data.push(input_hargadiskon);
      data.push(input_hargajual - input_hargadiskon);
      data.push(input_status);
      data.push(user_login);
      data.push(input_satuan);
          //data.push(input_outvar);
          //console.log(data);
          xhr.open('POST', 'https://ghinamart.com/label/back-end/insert-barang.php?q=' + data, false); xhr.send();
          location.reload();
        }  
      }

      function update_barang(){
        var update_nama = document.getElementById('editnama').value;
        var update_kategori = document.getElementById('editkategori').value;
        var update_hargabeli = document.getElementById('editbeli').value;
        var update_hargajual = document.getElementById('editjual').value;
        var update_hargadiskon = document.getElementById('editdiskon').value;
        var update_status = document.getElementById('editstatus').value;
        var user_login = localStorage.getItem("user-login");

        var data = [];
        if (update_nama && update_kategori) {
          data.push(update_nama);
          data.push(update_kategori);
          data.push(update_hargabeli);
          data.push(update_hargajual);
          data.push(update_hargadiskon);
          data.push(update_hargajual - update_hargadiskon);
          data.push(update_status);
          data.push(user_login);
          //data.push(input_outvar);
          //console.log(data);
          xhr.open('POST', 'https://ghinamart.com/label/back-end/update-barang.php?q=' + data, false); xhr.send();
          location.reload();
        }
      }
    </script>

