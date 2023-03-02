<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Login</title>
<link rel="icon" href="login.png" type="image/x-icon">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<style>
body {
    background-color: #9a7bcf;
	font-family: 'Barlow',sans-serif;
}

/*----  Modal login  ----*/
.modal-login {		
	color: #636363;
	width: 350px;
	border-radius: 10px;
}
.modal-login .modal-content {
	padding: 20px;
	border-radius: 10px;
	border: none;
}
.modal-login .modal-header {
	border-bottom: none;   
	position: relative;
	justify-content: center;
}
.modal-login h4 {
	text-align: center;
	font-size: 26px;
	margin: 30px 0 -15px;
}
.modal-login .form-control:focus {
	border-color: #b897f3;
}
.modal-login .form-control, .modal-login .btn {
	min-height: 40px;
	border-radius: 5px; 
}
.modal-login .close {
	position: absolute;
	top: -5px;
	right: -5px;
}	
.modal-login .modal-footer {
	background: #5c3476;
	border-color: #5c3476;
	text-align: center;
	justify-content: center;
	margin: 0 -20px -20px;
	border-bottom-right-radius: 10px;
	border-bottom-left-radius: 10px;
	font-size: 16px;
}
.modal-login .modal-footer a {
	color: blanchedalmond;
}		
.modal-login .avatar {
	position: absolute;
	margin: 0 auto;
	left: 0;
	right: 0;
	top: -70px;
	width: 95px;
	height: 95px;
	border-radius: 50%;
	z-index: 9;
	background: #ffd76a;
	padding: 15px;
	box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.1);
}
.modal-login .avatar img {
	width: 100%;
}
.modal-login.modal-dialog {
	margin-top: 80px;
}
.modal-login .btn, .modal-login .btn:active {
	color: #fff;
	border-radius: 4px;
	background: #b897f3 !important;
	text-decoration: none;
	transition: all 0.4s;
	line-height: normal;
	border: none;
	font-weight: bold;
}
.modal-login .btn:hover, .modal-login .btn:focus {
	background: #b897f3 !important;
	outline: none;
}
.trigger-btn {
	display: inline-block;
	margin: 100px auto;
}
</style>
</head>
<body>
<!--Modal-->
	<div class="modal-dialog modal-login shadow-lg">
		<div class="modal-content">
			<div class="modal-header">
				<div class="avatar">
					<img src="login.png" alt="Avatar">
				</div>				
				<h4 class="modal-title">Member Login</h4>	
			</div>
			<div class="modal-body">
				<form action="/examples/actions/confirmation.php" method="post">
					<div class="form-group">
						<label for="login-id">CustomerID</label>
						<input type="text" class="form-control" name="customerid" placeholder="CustomerID" required="required">		
					</div>
					<div class="form-group">
						<label for="login-password">Password</label>
						<input type="password" style="margin-bottom: 10px;" class="form-control" name="password" placeholder="Password" required="required">	
					</div>        
					<div class="text-right">
						<a href="#" style="color:rgb(150, 137, 160); font-size: 12px;">Forgot Password?</a>
					</div>
					<div class="form-group">
						<button type="submit" style="margin-top: 16px ;" class="btn btn-primary btn-lg btn-block login-btn">Login</button>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<p style="color:#ffd76a">Not a member?</p><a href="signup.php"> Join now!</a>
			</div>
		</div>
	</div>
</div> 
<script src="js/bootstrap.min.js"></script>    
</body>
</html>