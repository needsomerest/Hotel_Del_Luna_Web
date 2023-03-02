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

.button {
    position: absolute;
    width: 160px;
    height: 50px;
    left: 685px;
    top: 200px;
    background: #F56E03;
    border-radius: 10px;
    display: flex;
    justify-content: center;
    text-align: center;
    align-items: center;
    font-weight: bold;
    color: white;
    font-size: 18px;
    transition: transform .2s;
    text-decoration: none;
}

.button:hover {
    width: 180px;
    height: 60px;
    color: white;
    font-size: 20px;
    display: flex;
    justify-content: center;
    text-align: center;
    align-items: center;
    font-weight: bold;
    transform: scale(1.15);
    background-color: #5b3c91;
}
</style>

</head>

<body>
    <?php
require('dbconnect.php');
$b              = $_REQUEST['branch']; //branch
$date1          = $_REQUEST['dchkin']; //checkin
$date2          = $_REQUEST['dchkout']; //checkout
$CustomerID     = $_REQUEST['customerID'];
$PromotionCode  = $_REQUEST['promotioncode'];
$vipq           = $_REQUEST['nroom_vip'];
$zenq           = $_REQUEST['nroom_zen'];
$stdq           = $_REQUEST['nroom_std'];
$ksq            = $_REQUEST['nroom_king'];
$bgq            = $_REQUEST['nroom_one'];
$krq            = $_REQUEST['nroom_dlk'];
$trq            = $_REQUEST['nroom_twin'];
?>
    <!---------Top Nav --------->
    <nav class="navbar fixed-top navbar-expand-md navbar-dark" style="background-color: rgba(0, 0, 0);">
        <div class="container">
            <a href="index.php" class="navbar-brand">
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

        <h2 class="text-center" style="margin-bottom: 30px; font-size: 32px; font-weight:bold;">Booking Successfully!
        </h2>
        <a href="home.php" class="button button-hover" role="button"> Back to Home</a>
    </div>
    <?php
$sql = "
SELECT DISTINCT r.RoomID,r.Roomtype
FROM room_detail r 
WHERE NOT EXISTS (SELECT b.* FROM booking b WHERE ((b.RoomID = r.RoomID AND r.BranchNo='$b') 
AND (b.CheckIn<='$date1' AND b.CheckOut>='$date1')) OR r.BranchNo!='$b')";
$objQuery = mysqli_query($con, $sql);
    $i = 1;
    $c='Start';
    $ch=$ch1=$ch2=$ch3=$ch4=$ch5=$ch5=$ch6=0;
    while ($objResult = mysqli_fetch_array($objQuery)) {
      $a=$objResult["Roomtype"];
      if($a!=$c){
      if($a=="VIP"){
        $c=$a;
      if($ch<$vipq){
      $d1=$objResult["RoomID"];
    if($PromotionCode!=NULL){
            $sql1 = "
    INSERT INTO Booking  (`CustomerID`, `CheckIn`, `CheckOut`, `PromotionCode`, `BranchNo`, `Price`, `RoomID`, `stus`)
    VALUES ('$CustomerID', '$date1', '$date2', '$PromotionCode', '$b',2050,'$d1',0);";
          }
    else{
      $sql1 = "
    INSERT INTO Booking  (`CustomerID`, `CheckIn`, `CheckOut`, `PromotionCode`, `BranchNo`, `Price`, `RoomID`, `stus`)
    VALUES ('$CustomerID', '$date1', '$date2', NULL, '$b',2050,'$d1',0);";
    }
    mysqli_query($con, $sql1);

          $c='Start';
          $ch=$ch+1;
        }
      }
     if($a=="Deluxe Zen Double"){
        $c=$a;
        if($ch1<$zenq){
          $d2=$objResult["RoomID"];
        if($PromotionCode!=NULL){
          $sql1 = "
        INSERT INTO Booking  (`CustomerID`, `CheckIn`, `CheckOut`, `PromotionCode`, `BranchNo`, `Price`, `RoomID`, `stus`)
        VALUES ('$CustomerID', '$date1', '$date2', '$PromotionCode', '$b',1050,'$d2',0);";
              }
        else{
          $sql1 = "
        INSERT INTO Booking  (`CustomerID`, `CheckIn`, `CheckOut`, `PromotionCode`, `BranchNo`, `Price`, `RoomID`, `stus`)
        VALUES ('$CustomerID', '$date1', '$date2', NULL, '$b',1050,'$d2',0);";
        }
        mysqli_query($con, $sql1);
        
              $c='Start';
              $ch1=$ch1+1;
        }
      }
      if($a=="Standard"){
        $c=$a;
        if($ch2<$stdq){
          $d3=$objResult["RoomID"];
        if($PromotionCode!=NULL){
          $sql1 = "
        INSERT INTO Booking  (`CustomerID`, `CheckIn`, `CheckOut`, `PromotionCode`, `BranchNo`, `Price`, `RoomID`, `stus`)
        VALUES ('$CustomerID', '$date1', '$date2', '$PromotionCode', '$b',900,'$d3',0);";
              }
        else{
          $sql1 = "
        INSERT INTO Booking  (`CustomerID`, `CheckIn`, `CheckOut`, `PromotionCode`, `BranchNo`, `Price`, `RoomID`, `stus`)
        VALUES ('$CustomerID', '$date1', '$date2', NULL, '$b',900,'$d3',0);";
        }
        mysqli_query($con, $sql1);
       
              $c='Start';
              $ch2=$ch2+1;
        }
      }
      if($a=="King Suit"){
        $c=$a;
        if($ch3<$ksq){
          $d4=$objResult["RoomID"];
        if($PromotionCode!=NULL){
          $sql1 = "
        INSERT INTO Booking  (`CustomerID`, `CheckIn`, `CheckOut`, `PromotionCode`, `BranchNo`, `Price`, `RoomID`, `stus`)
        VALUES ('$CustomerID', '$date1', '$date2', '$PromotionCode', '$b',3150,'$d4',0);";
              }
        else{
          $sql1 = "
        INSERT INTO Booking  (`CustomerID`, `CheckIn`, `CheckOut`, `PromotionCode`, `BranchNo`, `Price`, `RoomID`, `stus`)
        VALUES ('$CustomerID', '$date1', '$date2', NULL, '$b',3150,'$d4',0);";
        }
       mysqli_query($con, $sql1);
        
              $c='Start';
              $ch3=$ch3+1;
        }
      }
      if($a=="One Bedroom Garden View Suit"){
        $c=$a;
        if($ch4<$bgq){
          $d5=$objResult["RoomID"];
        if($PromotionCode!=NULL){
          $sql1 = "
        INSERT INTO Booking  (`CustomerID`, `CheckIn`, `CheckOut`, `PromotionCode`, `BranchNo`, `Price`, `RoomID`, `stus`)
        VALUES ('$CustomerID', '$date1', '$date2', '$PromotionCode', '$b',2750,'$d5',0);";
              }
        else{
          $sql1 = "
        INSERT INTO Booking  (`CustomerID`, `CheckIn`, `CheckOut`, `PromotionCode`, `BranchNo`, `Price`, `RoomID`, `stus`)
        VALUES ('$CustomerID', '$date1', '$date2', NULL, '$b',2750,'$d5',0);";
        }
        mysqli_query($con, $sql1);
       
              $c='Start';
              $ch4=$ch4+1;
        }
      }
      if($a=="Deluxe King Room"){
        $c=$a;
        if($ch5<$krq){
          $d6=$objResult["RoomID"];
        if($PromotionCode!=NULL){
          $sql1 = "
        INSERT INTO Booking  (`CustomerID`, `CheckIn`, `CheckOut`, `PromotionCode`, `BranchNo`, `Price`, `RoomID`, `stus`)
        VALUES ('$CustomerID', '$date1', '$date2', '$PromotionCode', '$b',1950,'$d6',0);";
              }
        else{
          $sql1 = "
        INSERT INTO Booking  (`CustomerID`, `CheckIn`, `CheckOut`, `PromotionCode`, `BranchNo`, `Price`, `RoomID`, `stus`)
        VALUES ('$CustomerID', '$date1', '$date2', NULL, '$b',1950,'$d6',0);";
        }
        mysqli_query($con, $sql1);
       
              $c='Start';
              $ch5=$ch5+1;
        }
      }
      if($a=="Dulex Twin Room"){
        $c=$a;
        if($ch6<$bgq){
          $d7=$objResult["RoomID"];
        if($PromotionCode!=NULL){
          $sql1 = "
        INSERT INTO Booking  (`CustomerID`, `CheckIn`, `CheckOut`, `PromotionCode`, `BranchNo`, `Price`, `RoomID`, `stus`)
        VALUES ('$CustomerID', '$date1', '$date2', '$PromotionCode', '$b',2250,'$d7',0);";
              }
        else{
          $sql1 = "
        INSERT INTO Booking  (`CustomerID`, `CheckIn`, `CheckOut`, `PromotionCode`, `BranchNo`, `Price`, `RoomID`, `stus`)
        VALUES ('$CustomerID', '$date1', '$date2', NULL, '$b',2250,'$d7',0);";
        }
        mysqli_query($con, $sql1);
        
              $c='Start';
              $ch6=$ch6+1;
        }
      }
      }
      $i++;
    }
mysqli_close($con); // ปิดฐานข้อมูล*/
?>
    <style>
    h1 {
        font-size: 30px;
    }
    </style>
    <script src="bootstrap-5.0.0-dist/bootstrap-5.0.0-dist/js/bootstrap.min.js"></script>
</body>

</html>