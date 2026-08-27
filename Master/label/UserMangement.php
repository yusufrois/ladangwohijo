h<?php
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
        <h3 class="font-weight-bold">Management User</h3>
      </div>
      <div class="card col-md-12 p-4">
        <div class="add">
         <button type="button" class="btn btn-info mb-3 btn-sm btn-icon-text" data-toggle="modal" data-target="#exampleModalAdd">
           Tambah user<i class="ti-plus btn-icon-append"></i>                          
         </button>
       </div>
       <div class="table-responsive">
        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
          <thead>
            <tr>
              <th>Nama</th>
              <th>Jabatan</th>
              <th>Status</th>
              <th>Opsi</th>
            </tr>
          </thead>
          <tbody>
            <?php
            $sql = "SELECT user_name,status, jabatan FROM tb_user WHERE jabatan NOT LIKE 'root%'";
            $index = 0;
            if($result=mysqli_query($con,$sql)){
              while ($row=mysqli_fetch_assoc($result)) {
    # code...
                ?>
                <tr>
                  <td><?php echo $row['user_name']; ?></td>
                  <td><?php echo $row['jabatan']; ?></td>
                  <td><?php if($row['status'] =='1'){echo 'aktif';}else{echo "banned";} ?></td>
                  <td style="text-align:center;">
                    <a href="back-end/delete_user.php?id=<?php echo $row['user_name']; ?>&index=<?php echo $index; ?>" class="btn btn-danger btn-sm btn-icon-text"> Hapus <span class="ti-trash btn-icon-append"></span></a>
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

    <!-- Button trigger modal -->
           <!--  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
              Launch demo modal
            </button> -->

            <!-- Modal edit -->
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Edit User</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
                  <div class="modal-body">
                    <form class="forms-sample">
                      <div class="form-group">
                        <label for="exampleInputUsername1">Nama</label>
                        <input type="text" class="form-control form-control-sm" placeholder="Username">
                      </div>
                      <div class="form-group">
                        <label for="exampleInputUsername1">Jabatan</label>
                        <input type="text" class="form-control form-control-sm" placeholder="Jabatan">
                      </div>
                      <div class="form-group">
                        <label for="exampleFormControlSelect3">Status</label>
                        <select class="form-control form-control-sm" id="exampleFormControlSelect3">
                          <option>Aktif</option>
                          <option>Tidak Aktif</option>
                        </select>
                      </div>
                    </form>                    
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-success">Save changes</button>
                  </div>
                </div>
              </div>
            </div>

            <!-- Modal tambah -->
            <div class="modal fade" id="exampleModalAdd" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabelAdd" aria-hidden="true">
              <div class="modal-dialog" >
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Tambah User</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
                  <div class="modal-body">
                    <form class="forms-sample">
                      <div class="form-group">
                        <label for="username">Nama</label>
                        <input type="text" id="username" class="form-control form-control-sm" placeholder="Username">
                      </div>
                      <div class="form-group">
                        <label for="userpassword">Password</label>
                        <input type="text" id="userpassword" class="form-control form-control-sm" placeholder="Password">
                      </div>
                      <div class="form-group">
                        <label for="userjabatan">Jabatan</label>
                        <select class="form-control form-control-sm" id="userjabatan">
                          <option>admin</option>
                          <option>kasir</option>
                        </select>
                      </div>
                      <div class="form-group">
                        <label for="exampleFormControlSelect3">Status</label>
                        <select class="form-control form-control-sm" id="userstatus">
                          <option>Aktif</option>
                          <option>Tidak Aktif</option>
                        </select>
                      </div>
                    </form>                    
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-success" onclick="add_user();">Save changes</button>
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
        $('#dataTable').DataTable();
      } );

      function add_user(){
        //console.log(document.getElementById('username').value);
        var input_username = document.getElementById('username').value;
        var input_password = document.getElementById('userpassword').value;
        var input_jabatan = document.getElementById('userjabatan').value;
        var input_status = document.getElementById('userstatus').value;

        //console.log(input_status);
        var data = [];
        if (input_username && input_password) {
          data.push(input_username);
          data.push(input_password);
          data.push(input_jabatan);
          //data.push(input_outvar);
          xhr.open('POST', 'https://ghinamart.com/label/back-end/insert-user.php?q=' + data, false); xhr.send();
          location.reload();
        }
      }

    </script>

