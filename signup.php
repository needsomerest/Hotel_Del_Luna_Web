<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Sign up</title>
<link rel="icon" href="signup.png" type="image/x-icon">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<style>
body {
    background-color: #5c3476;
	font-family: 'Barlow',sans-serif;
}

/*----  Modal login  ----*/
.modal-login {		
	color: #636363;
	width: 500px;
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
	background: #ffd76a;
	border-color: #ffd76a;
	text-align: center;
	justify-content: center;
	margin: 0 -20px -20px;
	border-bottom-right-radius: 10px;
	border-bottom-left-radius: 10px;
	font-size: 16px;
}
.modal-login .modal-footer a {
	color: rgb(0, 0, 0);
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
	background: #b897f3;
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
.form-control{
    color :rgb(131, 103, 158);
}
</style>
</head>
<body>
<!--Modal-->
	<div class="modal-dialog modal-login shadow-lg">
		<div class="modal-content">
			<div class="modal-header">
				<div class="avatar">
					<img src="mn.png" alt="Avatar">
				</div>				
				<h4 class="modal-title">Register</h4>	
			</div>
            <div class="text-center" style="color:#b897f3; font-size: 16px;">Create your account. It's free and only takes a minute.</div>
            
			<div class="modal-body">
				<form action="confirmation.php" method="post">
					<form class="needs-validation" novalidate="">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="reg-fn">First Name</label>
                                    <input class="form-control" type="text" required="required" id="reg-fn" placeholder="First Name" name="firstname">
                                    <div class="invalid-feedback">Please enter your first name!</div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="reg-ln">Last Name</label>
                                    <input class="form-control" type="text" required="required" id="reg-ln" placeholder="Last Name" name="lastname">
                                    <div class="invalid-feedback">Please enter your last name!</div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="reg-fn">ID Card No.</label>
                                    <input class="form-control" type="text" required="required" id="reg-fn" placeholder="1 1001 01110 00 0" name="idcard">
                                    <div class="invalid-feedback">Please enter your ID Card No!</div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="reg-pn">Passport No.</label>
                                    <input class="form-control" type="text" required="required" id="reg-fn" placeholder="C00012345" name="passportno">
                                    <div class="invalid-feedback">Please enter your Passport No!</div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="reg-dob">Date of Birth</label>
                                    <input class="form-control" type="date" required="required" id="reg-dob" name="dateofbirth" placeholder="yyyy-mm-dd">
                                    <div class="invalid-feedback">Please enter your Date of Birth!</div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="reg-phone">Phone Number</label>
                                    <input class="form-control" type="tel" required="required" id="reg-phone" placeholder="081 142 3414" name="phoneno">
                                    <div class="invalid-feedback">Please enter your phone number!</div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="reg-type">Customer Type</label>
                                    <select class="form-control" id="reg-type" name="customertype">
                                        <option>General</option>
                                        <option>VIP</option>
                                      </select>
                                    <div class="invalid-feedback">Please enter your type!</div>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="reg-email">E-mail </label>
                                    <input class="form-control" type="email" required="required" id="reg-email" placeholder="E-mail" name="email">
                                    <div class="invalid-feedback">Please enter valid email address!</div>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="reg-password">Password</label>
                                    <input class="form-control" type="password" required="required" id="reg-password" placeholder="Must be only 8 characters or numbers">
                                    <div class="invalid-feedback">Please enter password!</div>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="reg-password-confirm">Confirm Password</label>
                                    <input class="form-control" type="password" required="required" id="reg-password-confirm" placeholder="Confirm Password" name="cfpassword">
                                    <div class="invalid-feedback">Passwords do not match!</div>
                                </div>
                            </div>

                        </div>
                        <div class="form-group">
                            <button type="submit" style="margin-top: 16px ;" class="btn btn-primary btn-lg btn-block login-btn">Sign up</button>
                        </div>
                    </form>
				</form>
			</div>
			<div class="modal-footer">
				<p style="color:#292929">Already a member?</p><a href="memlogin.php">Log in</a>
			</div>
		</div>
	</div>
</div> 

<script>
    (function () {
'use strict'
const forms = document.querySelectorAll('.requires-validation')
Array.from(forms)
  .forEach(function (form) {
    form.addEventListener('submit', function (event) {
      if (!form.checkValidity()) {
        event.preventDefault()
        event.stopPropagation()
      }

      form.classList.add('was-validated')
    }, false)
  })
})()

</script>
<script src="js/bootstrap.min.js"></script>    

</body>
</html>