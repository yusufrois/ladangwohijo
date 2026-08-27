<script>var user_jabatan = localStorage.getItem("user-jabatan");</script>
<div class="container-fluid page-body-wrapper">
  <!-- partial -->
  <!-- partial:partials/_sidebar.html -->
  <nav class="sidebar sidebar-offcanvas" id="sidebar">
    <ul class="nav">
      <li class="nav-item">
        <a class="nav-link" href="index.php">
          <i class="icon-grid menu-icon"></i>
          <span class="menu-title">Dashboard</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" data-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="auth">
          <i class="icon-head menu-icon"></i>
          <span class="menu-title">User Pages</span>
          <i class="menu-arrow"></i>
        </a>
        <div class="collapse" id="auth">
          <ul class="nav flex-column sub-menu">
           <li class="nav-item"> <a class="nav-link" href="UserMangement.php"> Management User </a></li>
         </ul>
       </div>
     </li>

    <li class="nav-item">
      <a class="nav-link" data-toggle="collapse" href="#produk" aria-expanded="false" aria-controls="auth">
        <i class="icon-briefcase menu-icon"></i>
        <span class="menu-title">Master Produk</span>
        <i class="menu-arrow"></i>
      </a>
      <div class="collapse" id="produk">
        <ul class="nav flex-column sub-menu">
          <li class="nav-item"> <a class="nav-link" href="MasterKategori.php"> Master Kategori  </a></li>
          <li class="nav-item"> <a class="nav-link" href="MasterBarang.php"> Master Barang </a></li>
        </ul>
      </div>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="collapse" href="#cetak" aria-expanded="false" aria-controls="auth">
        <i class="icon-printer menu-icon"></i>
        <span class="menu-title">Print</span>
        <i class="menu-arrow"></i>
      </a>
      <div class="collapse" id="cetak">
        <ul class="nav flex-column sub-menu">
          <li class="nav-item"> <a class="nav-link" href="Cetaklabel.php"> Print Label Harga  </a></li>
          <li class="nav-item"> <a class="nav-link" href="CetakBarcode.php"> Print Barcode </a></li>
        </ul>
      </div>
    </li>
  </ul>
</nav>