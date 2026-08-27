<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Max-Age: 1000');
include 'koneksi.php';
date_default_timezone_set('Asia/Jakarta');
$sql = "SELECT user_name,status, jabatan FROM tb_user";
$index = 0;
if($result=mysqli_query($con,$sql)){
	while ($row=mysqli_fetch_assoc($result)) {
		# code...
		?>
		<tr>
			<td><?php echo $row['user_name']; ?></td>
			<td><?php echo $row['jabatan']; ?></td>
			<td><?php if($row['status'] =='1'){echo 'aktif';}else{echo "banned";} ?></td>
		</tr>
		<?php
		$index ++;
	}

}
?>