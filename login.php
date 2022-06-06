
<?php

	session_start();
	error_reporting(E_ALL ^ (E_NOTICE | E_WARNING));
	$koneksi = new mysqli("localhost","root","","barang");

	
	?>	

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>e-Inventory | PT. Sentosa Ultra Gasindo</title>
	<link rel="shortcut icon" href="./img/favicon.ico" type="image/x-icon">
	
	

	<!-- Bootstrap -->
	
	
	
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<style>
		
		body {
	          
	      	  background: url(img/bg2.jpg) no-repeat fixed;
	          background-size: cover;
		  background-animation: fade;
		  background-animation-duration: 1s;
		  background-attachment: fixed;
		  background-position: 0px -150px;
	        }
		.row {
			margin:100px auto;
			width:270px;
			text-align:center;
			text-color:#bluelight;
		}
		.login {
			background-color:#FFFFFF;
			padding-left:30px;
			padding-right:30px;
			padding-top:0px;
			margin-top:30px;
		}
		
		img {
			width:100px;
			height:20px;
			margin-top:-35px;	
		}
		
		
		.judul{
			padding:0px;
			color:green;
			font-size:50px;
			margin-top:-20px;
			font-style:bold;
			font-family: Rockwell;
		}
		.judul1{
			color:red;
			font-size:29px;
			margin:0px;
			font-style:bold;
			font-style:italic;
			font-family: Rockwell;
		}
		.dukung{
			color:bluelight;
			font-size:14px;
			font-style:italic;
			align:left;
		}h3{
			
			font-size:34px;
			margin-top:-15px;
			font-style:bold;
			font-family:ALGERIAN;
			color:black;
		}
		
		.btn-block.round{
			
			border-radius:29px;
		}
		

	</style>


	<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	
	

	<![endif]-->




</head>
<body>
	
	 
	
	<div class="container-fluid">
		<div class="row">
		<div class="center">
		<div class="login">
			
				
				<form role="form" action="" method="post">
				<p><span class="judul">e</span>
				    <span class="judul1">INVENTORY </span>
				</p>
				<br>
				<div class="text-center">
										<img src="img/teacher4.png" alt="" class="img-fluid rounded-circle" width="100" height="100" />
									</div>
				<br>
				<h3>LOGIN USER</h3>
				<br>

				
					<div class="mb-3">
					
					 	
						<input type="text" name="username"  class="form-control" placeholder="Masukan Username" required autofocus />
					</div>
					<div class="mb-3">
						
						<input type="password" name="password" class="form-control" placeholder="Masukan Password" required autofocus />
					</div>
					<div class="mb-3">
						<select name="level" class="form-control" required>
							<option value="">Level User</option>
							<option value="superadmin">Super Admin</option>
							<option value="admin">Admin</option>
							<option value="petugas">Petugas</option>
						
						</select>
					</div>
					<div class="form-group">
						<input type="submit" name="login" class="btn btn-warning btn-block round" value="Masuk" />
					</div>
					<p><span class="dukung">Support By</span></p>
					<a href="https://www.sentragas.com/" target="_blank" ><img src="img/SG.png" margin='100px' title='PT. SENTOSA ULTRA GASINDO'><a href="https://www.airproducts.co.id/" target="_blank" ><img src="img/air.png" margin top='100px' title='AIR PRODUCT'></a></a>
				</form>
				
			</div>
		
		</div>
	</div>

  







	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>




</body>
</html>

	<?php
	
					$username = $_POST['username'];
					$password = md5($_POST['password']);
					$login = $_POST['login'];
					$level = $_POST['level'];
					
					if ($login) {
						$sql = $koneksi->query("select * from users where username='$username' and password='$password'");
						$ketemu = $sql->num_rows;
						$data = $sql->fetch_assoc();
						
						if ($ketemu >=1) {
							session_start();
							
							if ($data['level'] == superadmin && $level == superadmin) {
								$_SESSION['superadmin'] =$data[id];
								
								header("location:index3.php");
							}
							else if ($data['level'] == admin && $level == admin) {
								$_SESSION['admin'] =$data[id];
								
								header("location:index.php");
							}
							else if ($data['level'] == petugas && $level == petugas) {
								$_SESSION['petugas'] =$data[id];
								
								header("location:index2.php");
							}
						}
						else {
							?>
							<script type="text/javascript">
							alert("Login Gagal...! Silahkan Periksa Kembali Username dan Passwordnya!");
							window.location.href="?page=login&aksi=login";
							</script>
							
						<?php
							
						}
					}
					

				?>
			