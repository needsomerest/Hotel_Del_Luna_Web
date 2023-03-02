<?php
require_once('dbconnect.php');
?>
<!DOCTYPE html>
<html>
<head>
    <title>Booking | Hotel Del Luna</title>    
    <link rel="icon" href="mn.png" type="image/x-icon">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
</head>
<style>
 body{
            background-color:whitesmoke;
            font-family:'Barlow',sans-serif !important;
            transition: transform .2s;
        }
        .mynav a{
            color : white !important ;
        }
        .mynav a:hover{
            color : #B897F3 !important;
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

.bloc_left_price {
    color: #c01508;
    text-align: center;
    font-weight: bold;
    font-size: 150%;
}
.category_block li:hover {
    background-color: #007bff;
}
.category_block li:hover a {
    color: #ffffff;
}
.category_block li a {
    color: #343a40;
}
.add_to_cart_block .price {
    color: #c01508;
    text-align: center;
    font-weight: bold;
    font-size: 200%;
    margin-bottom: 0;
}
.add_to_cart_block .price_discounted {
    color: #343a40;
    text-align: center;
    text-decoration: line-through;
    font-size: 140%;
}
.product_rassurance {
    padding: 10px;
    margin-top: 15px;
    background: #ffffff;
    border: 1px solid #6c757d;
    color: #6c757d;
}
.product_rassurance .list-inline {
    margin-bottom: 0;
    text-transform: uppercase;
    text-align: center;
}
.product_rassurance .list-inline li:hover {
    color: #343a40;
}
.reviews_product .fa-star {
    color: gold;
}
.pagination {
    margin-top: 20px;
}
footer {
    background: #343a40;
    padding: 40px;
}
footer a {
    color: #f8f9fa!important
}

</style>
<body>
 <!---------Top Nav --------->
 <nav class="navbar fixed-top navbar-expand-md navbar-dark" style="background-color: rgba(0, 0, 0);">
        <div class="container">
            <a href="index.php" class="navbar-brand">
                <img src="logo.png" alt="Delluna Logo" width="30" height="30" class="d-in-line-block align-top" />
                <span class="navbar-brand mb=0 h1" style="font-weight:bold; color: #B897F3;"> DEL LUNA</span>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#toggleMobileMenu"
                aria-controls="toggleMobileMenu" aria-expanded="false" aria-lable="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse mynav" id="toggleMobileMenu">
                <ul class="navbar-nav ms-auto text-center">
                    <li class="nav-item active">
                        <a class="nav-link" href="home.php"
                            style="margin-right: 20px;">OUR HOTELS</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="promotions5.php" style="margin-right: 20px;">PROMOTIONS</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="food.php" style="margin-right: 20px;">SERVICES</a>
                    </li>
                    <li class="nav-item active dropdown">
                        <a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-bs-toggle="dropdown"
                            aria-expanded="false" style="margin-right: 20px;" href="#">
                            BRANCHES</a>

                        <ul class="dropdown-menu dropnav" aria-labelledby="navbarDropdown">
                            <li><a href="bangkok.php" class="dropdown-item">BANGKOK</a></li>
                            <li><a href="chiangmai.php" class="dropdown-item">CHIANG-MAI</a></li>
                            <li><a href="pattaya.php" class="dropdown-item">PATTAYA</a></li>
                            <li><a href="phuket.php" class="dropdown-item">PHUKET</a></li>
                        </ul>
                    </li>
                    <li class="nav-item active dropdown">
                        <a class="nav-link" href="bill_payment.php" style="margin-right: 20px;font-weight: bold; color:  #B897F3 !important;">MY BOOKING</a>

                    <li class="nav-item active dropdown">
                        <a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-bs-toggle="dropdown"
                            aria-expanded="false">
                            LOGIN</a>

                        <ul class="dropdown-menu dropnav" aria-labelledby="navbarDropdown">
                            <li><a href="memlogin.php" class="dropdown-item">CUSTUMERS LOGIN</a></li>
                            <li><a href="stafflogin.php" class="dropdown-item">STAFF LOGIN</a></li>
                        </ul>
                    </li>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<div class="container mt-5 d-flex justify-content-center">

<div class="container mb-4">
    <div class="row">
        <div class="col-12">
            <div class="table-responsive">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col" class= "text-center">Branch Name</th>
                            <th scope="col" class= "text-center">Room Detail</th>
                            <th scope="col" class= "text-center">RoomID</th>
                            <th scope="col" class= "text-center">Date</th>
                            <th></th>
                            <th scope="col" class="text-center">Price</th>
                            <th scope="col" class="text-center">Status</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                    <thrad> 
                    <thrad> 
                    <br></br>
                    <lable><p class = "text-center"><h3>History</h3></p></lable>
                    <div class="container">
                    <form action="" method="GET">
                    <p class= "text-right"  ><input type="number" placeholder="Customer ID" name="search">&nbsp;
                        <input type="submit" value="Search" name="btn" class="btn btn-sm btn-primary"> </p>
    </form>
            </div></thrad>
            <?php 
            $sql = "SELECT * FROM booking a 
            INNER JOIN hotel_detail b ON a.BranchNo = b.BranchNo 
            INNER JOIN room_detail c ON a.roomID = c.RoomID AND a.BranchNo = c.BranchNo 
            WHERE a.stus = 1 ORDER BY `a`.`BookingNo` ASC";
            if(isset($_GET['search']) ) {
                $name = mysqli_real_escape_string($con, htmlspecialchars($_GET['search']));
                $sql = "SELECT * FROM booking a INNER JOIN hotel_detail b ON a.BranchNo = b.BranchNo 
                INNER JOIN room_detail c ON a.roomID = c.RoomID AND a.BranchNo = c.BranchNo 
                WHERE a.stus = 1 AND customerID ='$name' ORDER BY `a`.`BookingNo` ASC";
            }
            $result_booking = mysqli_query($con,$sql); 
                            while($record=mysqli_fetch_array($result_booking)){
                      ?>
                        <tr>
                            <td><p class="text-center"><?php echo "".$record['BookingNo'];?></p></td>
                            <td><p class="text-center"><?php echo "".$record['BranchName'];?></p></td>
                            <td>
                            <?php echo "".$record['RoomID'];?>
                            <td>
                             <?php echo "Check-In : ".$record['CheckIn'];?>
                            <br></br> <?php echo "Check-Out : ".$record['CheckOut'];?></td>
                            <td></td>
                            <td><p class="text-left"><?php echo "".$record['Price'];?></p></td>
                            <td><p class="text-center text-uppercase text-secondary"><?php if($record['stus'] == 0){ echo "procress";} else{echo "complete";}?></p></td>
                            <td>
                        <!-- Button trigger modal -->
                        <a href="delete.php?id=<?php echo $record['BookingNo'];?>" class = "btn btn-danger">Delete</a>
                        </td>
                        <?php } ?>
                        </tr>
                        <tr>
                        <td>
                        <br></br>
                        <br></br>
                        </td>
                        <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <tr>
                        </tr>
                        <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="col mb-2">
            <div class="row">
            <div class="container bg-light">
                <div class="col-md-12 text-center">
                <a href="bill_payment.php"><button class="btn btn-lg btn-block btn-success ">Back</button></a>
                </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>

<script src="js/bootstrap.min.js"></script>
</body>
</html>
