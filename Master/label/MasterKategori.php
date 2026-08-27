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
        <h3 class="font-weight-bold">Master Kategori</h3>
      </div>
      <div class="card col-md-12 p-4"><div class="add">
       <button type="button" class="btn btn-info mb-3 btn-sm btn-icon-text" data-toggle="modal" data-target="#exampleModalAdd">
         Tambah Kategori<i class="ti-plus btn-icon-append"></i>                          
       </button>
     </div>
     <div class="table-responsive">
      <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
        <thead>
          <tr>
            <th>Nama kategori</th>
            <th>Keterangan</th>
            <th>Opsi</th>
          </tr>
        </thead>
        <tbody>
          <?php
          $sql = "SELECT kategori,Keterangan FROM tb_kategori";
          $index = 0;
          if($result=mysqli_query($con,$sql)){
            while ($row=mysqli_fetch_assoc($result)) {
    # code...
              ?>
              <tr>
                <td><?php echo substr($row['kategori'], 0,16); ?></td>
                <td><?php echo $row['Keterangan']; ?></td>
                <td style="text-align:center;">
                  <a href="back-end/delete_kategori.php?id=<?php echo $row['kategori']; ?>&index=<?php echo $index; ?>" class="btn btn-danger btn-sm btn-icon-text"> Hapus <span class="ti-trash btn-icon-append"></span></a>
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
  <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Edit Kategori</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <form class="forms-sample">
            <div class="form-group">
              <label for="exampleInputUsername1">Nama Kategori</label>
              <input type="text" class="form-control form-control-sm" placeholder="Nama Kategori">
            </div>
            <div class="form-group">
              <label for="exampleTextarea1">Keterangan</label>
              <textarea class="form-control" id="exampleTextarea1" rows="4"></textarea>
            </div>
          </form>                    
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-success">Save changes</button>
        </div>
      </div>
    </div>
  </div>
  <!-- Modal add -->
  <div class="modal fade" id="exampleModalAdd" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabelAdd" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Tambah Kategori</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <form class="forms-sample">
            <div class="form-group">
              <label for="nama_kategori">Nama Kategori</label>
              <input type="text" id="nama_kategori" class="form-control form-control-sm" placeholder="Nama Kategori">
            </div>
            <div class="form-group">
              <label for="keterangan_kategori">Keterangan</label>
              <textarea class="form-control" id="keterangan_kategori" rows="4"></textarea>
            </div>
          </form>                    
        </div>
        <div class="modal-footer">
          <button type="button" onclick="add_kategori();" class="btn btn-success">Save changes</button>
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
  $(document).ready(function() {
    $('#dataTable').DataTable();
  } );

  var xhr = new XMLHttpRequest();
  function add_kategori(){
    var nama_kategori = document.getElementById('nama_kategori').value;
    var keterangan_kategori = document.getElementById('keterangan_kategori').value;
    var user_login = localStorage.getItem("user-login");
    //console.log(nama_kategori);
    //console.log(user_login);

    var data = [];
    if (nama_kategori && keterangan_kategori) {
      data.push(nama_kategori);
      data.push(keterangan_kategori);
      data.push(user_login);
          //data.push(input_outvar);
          xhr.open('POST', 'https://ghinamart.com/label/back-end/insert-kategori.php?q=' + data, false); xhr.send();
          location.reload();
        }  
      }

      function view_kategori(){

      }

    </script>


