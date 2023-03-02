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
    <link rel="stylesheet" href="bootstrap-5.0.0-dist/bootstrap-5.0.0-dist/css/bootstrap.min.css">
</head>
<style>
body {
    background-color: whitesmoke !important;
    font-family: 'Barlow', sans-serif !important;
    transition: transform .2s;
}

.mynav a {
    color: white !important;
}

.mynav a:hover {
    color: #b897f3 !important;
    border-bottom: 3px solid #B897F3;
}

.dropnav a {
    color: black !important;
}

.dropnav a:hover {
    color: black !important;
    background-color: rgba(193, 154, 223, 0.4);
    border: none;
}
</style>

<body>

    <!---------Top Nav --------->
    <nav class="navbar fixed-top navbar-expand-md navbar-dark" style="background-color: rgba(0, 0, 0);">
        <div class="container">
            <a href="#" class="navbar-brand">
                <a href="home.php"><img src="txt.png" alt="Delluna Logo" width="auto" height="30"
                        class="d-in-line-block align-top" /></a>
                <span class="navbar-brand mb=0 h1" style="font-weight:bold; color: #B897F3;"></span>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#toggleMobileMenu"
                aria-controls="toggleMobileMenu" aria-expanded="false" aria-lable="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
    </nav>

    <div class="container">

        <h2 style="margin-bottom: 30px; font-size: 32px; font-weight:bold;">Select your room</h2>

        <?php      
  require('dbconnect.php');
  $b        = $_REQUEST['branch']; //branch
  $date1    = $_REQUEST['dchkin']; //checkin
  $date2    = $_REQUEST['dchkout']; //checkout
  $nroom    = $_REQUEST['nroom'];
  $nadult   = $_REQUEST['nadult'];
  $nchild   = $_REQUEST['nchild'];?>

        <form role="form" action="testbooking.php" method="post">

            <div class="form-group form-inline">
                <div class="panel-body">
                    <label style="font-size: 18px; margin-right: 45px;">CustomerID</label>
                    <input class="form-control" type="text" required="required" placeholder="CustomerID"
                        style="font-size: 18px;" name="customerID">
                    <div class="invalid-feedback">Please enter CustomerID!</div>
                </div>
                <div class="panel-body">
                    <label style="font-size: 18px; margin-right: 10px;">Promotion Code</label>
                    <input class="form-control" type="text" placeholder="XXXXXX" style="font-size: 18px;"
                        name="promotioncode">
                </div>
                <div class="panel panel-body">
                    <label for="reg-fn" style="margin-right:10px;">Branch</label>
                    <div class="form-group">
                        <select class="form-control" name="branch">
                            <option value="D0000">----</option>
                            <option value="D0001">BANGKOK</option>
                            <option value="D0002">CHIANG-MAI</option>
                            <option value="D0003">PATTAYA</option>
                            <option value="D0004">PHUKET</option>
                        </select>
                    </div>

                    <label for="reg-fn" style="margin-left:20px; margin-right:10px;">Check-in</label>
                    <div class="form-group">
                        <input class="form-control" type="date" required="required" placeholder="Check in"
                            name="dchkin">
                    </div>

                    <label for="reg-fn" style="margin-left:20px; margin-right:10px;">Check-out</label>
                    <div class="form-group">
                        <input class="form-control" type="date" required="required" placeholder="Check out"
                            name="dchkout">
                    </div>
                </div>
            </div>



            <?php
  

  $sql = "SELECT DISTINCT r.RoomID,r.Roomtype
FROM room_detail r 
WHERE NOT EXISTS (SELECT b.* FROM booking b WHERE ((b.RoomID = r.RoomID AND r.BranchNo='$b') 
AND (b.CheckIn<='$date1' AND b.CheckOut>='$date1')) OR r.BranchNo!='$b')";

  $objQuery = mysqli_query($con, $sql);
  $i = 1;
  $c = 'Start';
  while ($objResult = mysqli_fetch_array($objQuery)) {
    $a = $objResult["Roomtype"];
    if ($a != $c) {
      if ($a == "VIP") {
        $c = $a;
       ?>
            <div class="panel panel-default">
                <div class="panel-heading"
                    style="background-color: #ffd76a !important ;font-weight: bold !important; font-size:22px !important;">
                    VIP
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-2">
                            <div class="form-group">
                                <label class="control-label">Select number of room</label>
                                <input type="number" class="form-control" placeholder="0" name="nroom_vip" min="0">
                            </div>
                            <h5 style="font-weight: bold;">Price
                                <pre> 2,050.00 ฿/night</pre>
                            </h5>
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
                </div>
            </div>
            <?php
      }
      if ($a == "Deluxe Zen Double") {
        $c = $a;
        ?>
            <div class="panel panel-default">
                <div class="panel-heading"
                    style="background-color: #ffd76a !important ;font-weight: bold !important; font-size:22px !important;">
                    Deluxe Zen Room</div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-2">
                            <div class="form-group">
                                <label class="control-label">Select number of room</label>
                                <input type="number" class="form-control" placeholder="0" name="nroom_zen" min="0">
                            </div>
                            <h5 style="font-weight: bold;">Price
                                <pre> 1,050.00 ฿/night</pre>
                            </h5>
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
                </div>
            </div>
            <?php
      }
      if ($a == "Standard") {
        $c = $a;
        ?>
            <div class="panel panel-default">
                <div class="panel-heading"
                    style="background-color: #ffd76a !important ; font-weight: bold !important; font-size:22px !important;">
                    Standard</div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-2">
                            <div class="form-group">
                                <label class="control-label">Select number of room</label>
                                <input type="number" class="form-control" placeholder="0" name="nroom_std" min="0">
                            </div>
                            <h5 style="font-weight: bold;">Price
                                <pre> 900.00 ฿/night</pre>
                            </h5>
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
                </div>
            </div>
            <?php
      }
      if ($a == "King Suit") {
        $c = $a;
        ?>
            <div class="panel panel-default">
                <div class="panel-heading"
                    style="background-color: #ffd76a !important ;font-weight: bold !important; font-size:22px !important;">
                    King
                    Suit</div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-2">
                            <div class="form-group">
                                <label class="control-label">Select number of room</label>
                                <input type="number" class="form-control" placeholder="0" name="nroom_king" min="0">
                            </div>
                            <h5 style="font-weight: bold;">Price
                                <pre> 3,150.00 ฿/night</pre>
                            </h5>
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
                </div>
            </div>
            <?php
      }
      if ($a == "One Bedroom Garden View Suit") {
        $c = $a;
        ?>
            <div class="panel panel-default">
                <div class="panel-heading"
                    style="background-color: #ffd76a !important ;font-weight: bold !important; font-size:22px !important;">
                    One
                    Bedroom Garden View Suit</div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-2">
                            <div class="form-group">
                                <label class="control-label">Select number of room</label>
                                <input type="number" class="form-control" placeholder="0" name="nroom_one" min="0">
                            </div>
                            <h5 style="font-weight: bold;">Price
                                <pre> 2,750.00 ฿/night</pre>
                            </h5>
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
                </div>
            </div>
            <?php
      }
      if ($a == "Deluxe King Room") {
        $c = $a;
        ?>
            <div class="panel panel-default">
                <div class="panel-heading"
                    style="background-color: #ffd76a !important ;font-weight: bold !important; font-size:22px !important;">
                    Deluxe King Room</div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-2">
                            <div class="form-group">
                                <label class="control-label">Select number of room</label>
                                <input type="number" class="form-control" placeholder="0" name="nroom_dlk" min="0">
                            </div>
                            <h5 style="font-weight: bold;">Price
                                <pre> 1,950.00 ฿/night</pre>
                            </h5>
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
                </div>
            </div>
            <?php
      }
      if ($a == "Dulex Twin Room") {
        $c = $a;
        ?>
            <div class="panel panel-default">
                <div class="panel-heading"
                    style="background-color: #ffd76a !important ;font-weight: bold !important; font-size:22px !important;">
                    Dulex Twin Room</div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-2">
                            <div class="form-group">
                                <label class="control-label">Select number of room</label>
                                <input type="number" class="form-control" placeholder="0" name="nroom_twin" min="0">
                            </div>
                            <h5 style="font-weight: bold;">Price
                                <pre> 2,250.00 ฿/night</pre>
                            </h5>
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
                </div>
            </div>
            <?php
      }
    }
    $i++;
  }
  mysqli_close($con); // ปิดฐานข้อมูล*/
  ?>
            <button class="btn btn-danger pull-left btn-lg btn-block" type="submit"
                style="font-weight: bold !important;">Booking Now!</button>
        </form>
    </div>
    <style>
    h1 {
        font-size: 30px;
    }
    </style>
    <script src="bootstrap-5.0.0-dist/bootstrap-5.0.0-dist/js/bootstrap.min.js"></script>

    <script>
    (function() {
        'use strict'
        const forms = document.querySelectorAll('.requires-validation')
        Array.from(forms)
            .forEach(function(form) {
                form.addEventListener('submit', function(event) {
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