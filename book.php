<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Booking</title>
    <link rel="icon" href="book.png" type="image/x-icon">
    <link rel="stylesheet" href="css\bootstrap.min.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="booking_1.css">
    <link rel="stylesheet" href="booking_2.css">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
    <style>
        body{
            background-color:whitesmoke !important;
            font-family:'Barlow',sans-serif !important;
            transition: transform .2s;
        }
        .mynav a{
            color : white !important ;
        }
        .mynav a:hover{
            color : #b897f3 !important;
            border-bottom: 3px solid #B897F3;
        }
        .dropnav a{
            color : black !important;
        }
        .dropnav a:hover{
            color : black !important;
            background-color:rgba(193, 154, 223, 0.4);
            border: none;
        }

    </style>
</head>
<body>

<!---------Top Nav --------->
<nav class ="navbar fixed-top navbar-expand-md navbar-dark"
style="background-color: rgba(0, 0, 0);">
<div class="container">
   <a href="#" class="navbar-brand">
       <a href="home.php"><img src="txt.png" alt="Delluna Logo" width="auto" height="30" class="d-in-line-block align-top"/></a>
       <span class="navbar-brand mb=0 h1" style="font-weight:bold; color: #B897F3;"></span>
      </a>
   <button
       class="navbar-toggler"
       type="button"
       data-bs-toggle="collapse"
       data-bs-target="#toggleMobileMenu"
       aria-controls="toggleMobileMenu"
       aria-expanded="false"
       aria-lable="Toggle navigation"
   >
       <span class="navbar-toggler-icon"></span>
   </button>
</nav>


<!--Form-->
<div class="container">
    
    <h2 style="margin-bottom: 50px; font-size: 32px; font-weight:bold;">Select your room</h2>
    <form role="form" action="testbooking.php" method="post">

        <div class="form-group form-inline">
            <div class="panel-body">
                <label for="bk-id" style="font-size: 18px; margin-right: 10px;">CustomerID</label>
                <input class="form-control" type="text" required="required" placeholder="CustomerID" style="font-size: 18px;" name="customerID">
                <div class="invalid-feedback">Please enter CustomerID!</div>
                </div>
        </div>
        
            <div class="panel-group" id="accordion" role="tablist">
                <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                    <div class="panel-body">
                        <div class="panel panel-default">
                            <div class="panel-heading" style="background-color: #ffd76a !important ; font-weight: bold !important; font-size:22px !important;">Standard</div>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label class="control-label">Select number of room</label>
                                            <select class="form-control" name="nroom_std" required="required">
                                                <option>0</option>
                                                <option>1</option>
                                                <option>2</option>
                                                <option>3</option>
                                                <option>4</option>
                                            </select>
                                        </div>
                                        <h5 style="font-weight: bold;">Price<pre> 900.00 ฿/night</pre></h5>
                                    </div>
                                    <div class="col-md-2">
                                        <img src="std.jpg" style="width: 300px;">
                                    </div>
                                    <div class="col-md-2">
                                        <img src="std.png" style="height: 200px; margin-left: 130px;">
                                    </div>
                                    <div class="col-md-2">
                                        <img src="stdd.png" style="height: 200px; margin-left: 270px;">
                                    </div>
                                </div>
                                <button class="btn btn-default pull-left btn-book" type="submit">Book</button>
                            </div>
                        </div>
                                    
                        <div class="panel panel-default">
                            <div class="panel-heading" style="background-color: #ffd76a !important ;font-weight: bold !important; font-size:22px !important;">Deluxe Zen Room</div>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label class="control-label">Select number of room</label>
                                            <select class="form-control" name="nroom_zen" required="required">
                                                <option>0</option>
                                                <option>1</option>
                                                <option>2</option>
                                                <option>3</option>
                                                <option>4</option>
                                            </select>
                                        </div>
                                        <h5 style="font-weight: bold;">Price<pre> 1,050.00 ฿/night</pre></h5>
                                    </div>
                                    <div class="col-md-2">
                                        <img src="zen-1.jpg" style="width: 300px;">
                                    </div>
                                    <div class="col-md-2">
                                        <img src="zen-1.png" style="height: 200px; margin-left: 130px;">
                                    </div>
                                    <div class="col-md-2">
                                        <img src="stdd.png" style="height: 200px; margin-left: 270px;">
                                    </div>
                                </div>
                                <button class="btn btn-default pull-left btn-book" type="submit">Book</button>
                            </div>
                        </div>
        
                        <div class="panel panel-default">
                            <div class="panel-heading" style="background-color: #ffd76a !important ;font-weight: bold !important; font-size:22px !important;">Deluxe King Double</div>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label class="control-label">Select number of room</label>
                                            <select class="form-control" name="nroom_dlk" required="required">
                                                <option>0</option>
                                                <option>1</option>
                                                <option>2</option>
                                                <option>3</option>
                                                <option>4</option>
                                            </select>
                                        </div>
                                        <h5 style="font-weight: bold;">Price<pre> 1,950.00 ฿/night</pre></h5>
                                    </div>
                                    <div class="col-md-2">
                                        <img src="king.jpg" style="width: 300px;">
                                    </div>
                                    <div class="col-md-2">
                                        <img src="king-1.png" style="height: 200px; margin-left: 130px;">
                                    </div>
                                    <div class="col-md-2">
                                        <img src="stdd.png" style="height: 200px; margin-left: 270px;">
                                    </div>
                                </div>
                                <button class="btn btn-default pull-left btn-book" type="submit">Book</button>
                            </div>
                        </div>

                        <div class="panel panel-default">
                            <div class="panel-heading" style="background-color: #ffd76a !important ;font-weight: bold !important; font-size:22px !important;">Duluex Twin Room</div>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label class="control-label">Select number of room</label>
                                            <select class="form-control" name="nroom_twin" required="required">
                                                <option>0</option>
                                                <option>1</option>
                                                <option>2</option>
                                                <option>3</option>
                                                <option>4</option>
                                            </select>
                                        </div>
                                        <h5 style="font-weight: bold;">Price<pre> 2,250.00 ฿/night</pre></h5>
                                    </div>
                                    <div class="col-md-2">
                                        <img src="twin.jpg" style="width: 300px;">
                                    </div>
                                    <div class="col-md-2">
                                        <img src="twin-1.png" style="height: 200px; margin-left: 130px;">
                                    </div>
                                    <div class="col-md-2">
                                        <img src="stdd.png" style="height: 200px; margin-left: 270px;">
                                    </div>
                                </div>
                                <button class="btn btn-default pull-left btn-book" type="submit">Book</button>
                            </div>
                        </div>

                        <div class="panel panel-default">
                            <div class="panel-heading" style="background-color: #ffd76a !important ;font-weight: bold !important; font-size:22px !important;">King Suit</div>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label class="control-label">Select number of room</label>
                                            <select class="form-control" name="nroom_king" required="required">
                                                <option>0</option>
                                                <option>1</option>
                                                <option>2</option>
                                                <option>3</option>
                                                <option>4</option>
                                            </select>
                                        </div>
                                        <h5 style="font-weight: bold;">Price<pre> 3,150.00 ฿/night</pre></h5>
                                    </div>
                                    <div class="col-md-2">
                                        <img src="king-suit.jpg" style="width: 300px;">
                                    </div>
                                    <div class="col-md-2">
                                        <img src="king-suit-1.png" style="height: 200px; margin-left: 130px;">
                                    </div>
                                    <div class="col-md-2">
                                        <img src="stdd.png" style="height: 200px; margin-left: 270px;">
                                    </div>
                                </div>
                                <button class="btn btn-default pull-left btn-book" type="submit">Book</button>
                            </div>
                        </div>

                        <div class="panel panel-default">
                            <div class="panel-heading" style="background-color: #ffd76a !important ;font-weight: bold !important; font-size:22px !important;">One Bedroom Garden View Suit</div>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label class="control-label">Select number of room</label>
                                            <select class="form-control" name="nroom_gard" required="required">
                                                <option>0</option>
                                                <option>1</option>
                                                <option>2</option>
                                                <option>3</option>
                                                <option>4</option>
                                            </select>
                                        </div>
                                        <h5 style="font-weight: bold;">Price<pre> 2,750.00 ฿/night</pre></h5>
                                    </div>
                                    <div class="col-md-2">
                                        <img src="one-bed.jpg" style="width: 300px;">
                                    </div>
                                    <div class="col-md-2">
                                        <img src="one-bed-1.png" style="height: 200px; margin-left: 130px;">
                                    </div>
                                    <div class="col-md-2">
                                        <img src="stdd.png" style="height: 200px; margin-left: 270px;">
                                    </div>
                                </div>
                                <button class="btn btn-default pull-left btn-book" type="submit">Book</button>
                            </div>
                        </div>

                        <div class="panel panel-default">
                            <div class="panel-heading" style="background-color: #ffd76a !important ;font-weight: bold !important; font-size:22px !important;">VIP</div>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label class="control-label">Select number of room</label>
                                            <input type="number" required="required" class="form-control" placeholder="0">
                                        </div>
                                        <h5 style="font-weight: bold;">Price<pre> 2,050.00 ฿/night</pre></h5>
                                    </div>
                                    <div class="col-md-2">
                                        <img src="vip.jpg" style="width: 300px;">
                                    </div>
                                    <div class="col-md-2">
                                        <img src="vip-1.png" style="height: 200px; margin-left: 130px;">
                                    </div>
                                    <div class="col-md-2">
                                        <img src="stdd.png" style="height: 200px; margin-left: 270px;">
                                    </div>
                                </div>
                                <button class="btn btn-default pull-left btn-book" type="submit">Book</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </div>
     
    </form>

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

</body>
</html>