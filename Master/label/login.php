

<?php include 'headerAuth.php' ?>

<div class="container-scroller">
  <div class="container-fluid page-body-wrapper full-page-wrapper">
    <div class="content-wrapper d-flex align-items-center auth px-0">
      <div class="row w-100 mx-0">
        <div class="col-lg-4 mx-auto">
          <div class="auth-form-light text-left py-5 px-4 px-sm-5">
            <div class="brand-logo" style="text-align:center;">
              <img src="https://ghinamart.com/assets/img/gm.png" alt="logo" style="width:80%;">
            </div>
            <h4>Hello! let's get started</h4>
            <h6 class="font-weight-light">Sign in to continue.</h6>
            <form class="pt-3">
              <div class="form-group">
                <input type="email" class="form-control form-control-lg" id="username" placeholder="Username">
              </div>
              <div class="form-group">
                <input type="password" class="form-control form-control-lg" id="userpassword" placeholder="Password">
              </div>
              <div class="mt-3">
                <a class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" onclick='masuk();' id='submit'>SIGN IN</a>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
    <!-- content-wrapper ends -->
  </div>
  <!-- page-body-wrapper ends -->
</div>
<!-- container-scroller -->
<script type="text/javascript">
  var xhr = new XMLHttpRequest();

  document.getElementById('userpassword').addEventListener('keyup', function(event) {
    if (event.keyCode === 13) {
      event.preventDefault();
      document.getElementById('submit').click();
    }
  });

  function masuk(){
    var input_username = document.getElementById('username').value;
    var input_password = document.getElementById('userpassword').value;
        //var input_outvar = document.getElementById('useroutlet').value;
        var data = [];
        if (input_username && input_password) {
          data.push(input_username);
          data.push(input_password);
          //data.push(input_outvar);
          xhr.open('POST', 'https://ghinamart.com/label/back-end/auth-user.php?q=' + data, false); xhr.send();
          var myObj = JSON.parse(xhr.responseText);
          if (myObj.status) {
            if (myObj.status=='1') {
              localStorage.setItem('user-login', input_username);
              localStorage.setItem('user-jabatan', myObj.userjabatan);
//              $_SESSION['jabatan-user'] = myObj.userjabatan;
              //localStorage.setItem('outlet-pure', input_outvar);
              switch (myObj.userjabatan) {
                case 'root' : location.href = 'home.php';
                break
                case 'admin' : location.href = 'home.php';
                break
                case 'kasir' : location.href = 'home.php';
                break
                default : location.href='home.php';
              }
              
            } else if (myObj.status=='0'){
              alertify.delay(1000).error('User Anda Belum Aktif!!!');
            }
          } else {
            //alertify.delay(1000).error('Kombinasi Salah!!!');
            location.href='home.php';
          }
        } else {
          alertify.delay(1000).error('Inputan Tidak Boleh Kosong!!!');
        }
      }
    </script>

    <?php include 'footer.php' ?>
