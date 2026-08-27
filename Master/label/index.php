<?php
	header('Access-Control-Allow-Origin: *');
	header('Access-Control-Max-Age: 1000');
	date_default_timezone_set('Asia/Jakarta');
?>
<!DOCTYPE html>
<html>
	<head>
		<meta charset='utf-8' />
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <meta name='viewport' content='width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui'>
		<meta http-Equiv='Cache-Control' Content='no-cache' />
		<meta http-Equiv='Pragma' Content='no-cache' />
		<meta http-Equiv='Expires' Content='0' />
		<script>
			function init(){
				if (localStorage.getItem("user-login")) {
					location.href='home.php';
				} else {
					location.href='login.php';
				}
			}
			document.addEventListener('DOMContentLoaded', init);
		</script>
	</head>
	<body></body>
</html>
