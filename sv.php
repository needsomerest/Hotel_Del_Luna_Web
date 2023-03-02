<!DOCTYPE html>
<html lang="ENG">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Services</title>
        <link rel="icon" href="mn.png" type="image/x-icon">
        <link rel="stylesheet" href="css\bootstrap.min.css">
    </head>
    <body>
      <nav class ="navbar fixed-top navbar-expand-md navbar-dark"
      style="background-color: rgba(0, 0, 0);">
     <div class="container">
         <a href="#" class="navbar-brand">
             <img src="logo.png" alt="Delluna Logo" width="30" height="30"
             class="d-in-line-block align-top"/>
             <span class="navbar-brand mb=0 h1" style="font-weight:bold; color: #B897F3;"> DEL LUNA</span>
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
    </div> 
 </nav>   
 <br></br>
            <?php
            if(isset($_POST['booking'])){
            $bk = $_POST['booking'] ;
             }
            if(isset($_POST['foodform'])){
               $ff = $_POST['foodform'] ;
      
            }
            if(isset($_POST['barnch'])){
                $b = $_POST['barnch'] ;
     
             }
             if(isset($_POST['departure'])){
                $o = $_POST['departure'] ;
      
             }
             if(isset($_POST['timestb'])){
                $t = $_POST['timestb'] ;
             }
             if(isset($_POST['person'])){
                $ps = $_POST['person'] ;
             }
             if(isset($_POST['ldtype'])){
                $ldt = $_POST['ldtype'] ;
             }
             if(isset($_POST['quantity_ld'])){
                $qld = $_POST['quantity_ld'] ;
             }
            ?>  
  <div class="container">
  <br></br>
   <div class="row justify-content-center">
     <div class="col-12 col-sm-8">
     <h3 align = 'center'>MY BILL SERVICES</h3>
     <br></br>
     <h5 align = 'right'><?php echo "Booking No. " . $bk; ?></h5>
   <table style="width:100%" border='1' cellspacing='0'>
  <tr>
    <th>Order</th>
    <th>Amount</th>
    <th>Unit Price</th>
    <th>Total Price</th>
  </tr>
   <?php
   	$food = array("Food : Set A","Food : Set B","Food : Set C","Food : Set D","Food : Set E");
       $shuttlebus = array("BUS NO.01 : Go out hotel","BUS NO.02 : Go to hotel","BUS NO.03 : Go out hotel","BUS NO.04 : Go to hotel","BUS NO.05 : Go out hotel","BUS NO.06 : Go to hotel","BUS NO.07 : Go out hotel","BUS NO.08 : Go to hotel");
       $time = array("10 : 00","12 : 00","14 : 00");
       $laundry = array("Laundry : Washing","Laundry : Drying","Laundry : Ironing");
       $foodprice=499;
       $foodunit=1;
       $totalprice=0;
       $totalpriceld=0;
    if($ff!="BF0"){
       if($ff=="BF1"){
           $description=$food[0];
            $totalprice = $foodprice*$foodunit;
           echo("<td>$description</td>");
           echo("<td>$foodunit</td>");
           echo("<td>$foodprice</td>");
           echo("<td>$totalprice</td>");
       }
       if($ff=="BF2"){
        $totalprice = $foodprice*$foodunit;
        $description=$food[1];
        echo("<td>$description</td>");
        echo("<td>$foodunit</td>");
        echo("<td>$foodprice</td>");
        echo("<td>$totalprice</td>");
    }
    if($ff=="BF3"){
        $totalprice = $foodprice*$foodunit;
        $description=$food[2];
        echo("<td>$description</td>");
        echo("<td>$foodunit</td>");
        echo("<td>$foodprice</td>");
        echo("<td>$totalprice</td>");
    }
    if($ff=="BF4"){
        $totalprice = $foodprice*$foodunit;
        $description=$food[3];
        echo("<td>$description</td>");
        echo("<td>$foodunit</td>");
        echo("<td>$foodprice</td>");
        echo("<td>$totalprice</td>");
    }
    if($ff=="BF5"){
        $totalprice = $foodprice*$foodunit;
        $description=$food[4];
        echo("<td>$description</td>");
        echo("<td>$foodunit</td>");
        echo("<td>$foodprice</td>");
        echo("<td>$totalprice</td>");
    }
    require('dbconnect.php');
$sql = "
	INSERT INTO Breakfast
    (`Set_MenuNo`,`BookingNo`)
	VALUES ('$ff','$bk');
	";
mysqli_query($con, $sql);
mysqli_close($con); 
}
    echo("<tr>");
    if($b!="b0"){
        $timee = $time[$t]; 
        $bus=0;
        if($b=="busBK" && $o=="dBK" && $t=="0"){
            $bus="B01";
        }
        if($b=="busBK" && $o=="dBK" && $t=="1"){
            $bus="B02";
        }
        if($b=="busBK" && $o=="dBK" && $t=="2"){
            $bus="B03";
        }
        if($b=="busBK" && $o=="dHT" && $t=="0"){
            $bus="B04";
        }
        if($b=="busBK" && $o=="dHT" && $t=="1"){
            $bus="B05";
        }
        if($b=="busBK" && $o=="dHT" && $t=="2"){
            $bus="B06";
        }
        if($b=="busCM" && $o=="dCM" && $t=="0"){
            $bus="B07";
        }
        if($b=="busCM" && $o=="dCM" && $t=="1"){
            $bus="B08";
        }
        if($b=="busCM" && $o=="dCM" && $t=="2"){
            $bus="B09";
        }
        if($b=="busCM" && $o=="dHT" && $t=="0"){
            $bus="B10";
        }
        if($b=="busCM" && $o=="dHT" && $t=="1"){
            $bus="B11";
        }
        if($b=="busCM" && $o=="dHT" && $t=="2"){
            $bus="B12";
        }
        if($b=="busPTY" && $o=="dPTY" && $t=="0"){
            $bus="B13";
        }
        if($b=="busPTY" && $o=="dPTY" && $t=="1"){
            $bus="B14";
        }
        if($b=="busPTY" && $o=="dPTY" && $t=="2"){
            $bus="B15";
        }
        if($b=="busPTY" && $o=="dHT" && $t=="0"){
            $bus="B16";
        }
        if($b=="busPTY" && $o=="dHT" && $t=="1"){
            $bus="B17";
        }
        if($b=="busPTY" && $o=="dHT" && $t=="2"){
            $bus="B18";
        }
        if($b=="busPK" && $o=="dPK" && $t=="0"){
            $bus="B19";
        }
        if($b=="busPK" && $o=="dPK" && $t=="1"){
            $bus="B20";
        }
        if($b=="busPK" && $o=="dPK" && $t=="2"){
            $bus="B21";
        }
        if($b=="busPK" && $o=="dHT" && $t=="0"){
            $bus="B22";
        }
        if($b=="busPK" && $o=="dHT" && $t=="1"){
            $bus="B23";
        }
        if($b=="busPK" && $o=="dHT" && $t=="2"){
            $bus="B24";
        }
        require('dbconnect.php');
        $sql = "
            SELECT Status,SeatsTotal,ShuttleBusNo
            FROM shuttle_bus_detail
            WHERE ShuttleBusNo = '$bus';
            ";
        $objQuery = mysqli_query($con, $sql) or die("Error Query [" . $sql . "]");
        $objResult = mysqli_fetch_array($objQuery);
        //print_r($objResult);
        ?>
           <tr>
              <?php $a = $objResult["Status"]; ?>
              <?php $st = $objResult["SeatsTotal"]; ?>
              </tr>
           <?php
           if($st-$ps>=0){
              $st=$st-$ps;
           $sql1 = "
            UPDATE shuttle_bus_detail
            SET SeatsTotal = '$st'
           WHERE ShuttleBusNo = '$bus'";
           mysqli_query($con, $sql1);
           $sql3 = "
	            INSERT INTO Shuttle_Bus
                (`ShuttleBusNo`, `Time`,`Seats`,`BookingNo`)
	            VALUES ('$bus', '$timee',$ps,$bk);
	            ";
           mysqli_query($con, $sql3);
           }
           else{
              $sql2 = "
              UPDATE shuttle_bus_detail
              SET Status = 0
              WHERE ShuttleBusNo = '$bus'";
              mysqli_query($con, $sql2);
           }
   mysqli_close($con); // ปิดฐานข้อมูล
   if($st>0){
    if( $bus=="B01" ||  $bus=="B02" ||  $bus=="B03"){
    $description = $shuttlebus[0];
    }
    if( $bus=="B04" ||  $bus=="B05" ||  $bus=="B06"){
        $description = $shuttlebus[1];
    }
    if( $bus=="B07" ||  $bus=="B08" ||  $bus=="B09"){
        $description = $shuttlebus[2];
        }
    if( $bus=="B10" ||  $bus=="B11" ||  $bus=="B12"){
        $description = $shuttlebus[3];
        }
    if( $bus=="B13" ||  $bus=="B14" ||  $bus=="B15"){
        $description = $shuttlebus[4];
        }
    if( $bus=="B16" ||  $bus=="B17" ||  $bus=="B18"){
        $description = $shuttlebus[5];
     }
     if( $bus=="B19" ||  $bus=="B20" ||  $bus=="B21"){
        $description = $shuttlebus[6];
    }
     if( $bus=="B22" ||  $bus=="B23" ||  $bus=="B24"){
        $description = $shuttlebus[7];
     }
    echo("<td>$description ($timee)</td>");
    echo("<td>$ps</td>");
    echo("<td>0</td>");
    echo("<td>0</td>");
   }
   else{
       echo("<td>Full shuttle bus</td>");
       echo("<td>0</td>");
       echo("<td>0</td>");
       echo("<td>0</td>");
   }
   }
    echo("<tr>");
    if($ldt!="LD0"){
     require('dbconnect.php');
        $sql = "
            INSERT INTO Laundry
            (`LaundryNo`, `NumberofClotches`,`BookingNo`)
            VALUES ('$ldt','$qld','$bk');
            ";
        mysqli_query($con, $sql);
        mysqli_close($con); 
    if($ldt=="LD1"){
        $description=$laundry[0];
        $laundryprice=50;
        $totalpriceld=$qld*$laundryprice;
        echo("<td>$description</td>");
        echo("<td>$qld</td>");
        echo("<td>$laundryprice</td>");
        echo("<td>$totalpriceld</td>");
    }
    if($ldt=="LD2"){
        $description=$laundry[1];
        $laundryprice=100;
        $totalpriceld=$qld*$laundryprice;
        echo("<td>$description</td>");
        echo("<td>$qld</td>");
        echo("<td>$laundryprice</td>");
        echo("<td>$totalpriceld</td>");
    }
    if($ldt=="LD3"){
        $description=$laundry[2];
        $laundryprice=150;
        $totalpriceld=$qld*$laundryprice;
        echo("<td>$description</td>");
        echo("<td>$qld</td>");
        echo("<td>$laundryprice</td>");
        echo("<td>$totalpriceld</td>");
    }
}
    $total=$totalpriceld+$totalprice;
     echo("<tr>");
     echo("<td>Total Price</td>");
     echo("<td></td>");
     echo("<td></td>");
     echo("<td>$total</td>");
     
?>
</table>
</div>
</div>
<br></br>
<form method="post" action="food.php">
<div class="col-lg-4">
<button type="submit" class="btn btn-primary" value="back">Select service more</button>
</div>
</form>
</div>
</div>
 <style>
 .btn{
  background-color: #B897F3; /* Green */
  border: none;
  color: black;
  padding: 12px 30px;
  text-align: right;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  float: right;
 }
 td{
    font-size: 20px;
 }
 .container h3{
  padding: 20px;
  border-radius: 8px;
  background-color: lightgrey;
  color : #483D8B;
 }
 tr:nth-child(even) {
     background-color: #B897F3;
     }
 th {
    font-size: 20px;
  background-color: #483D8B;
  color: white;
}
 body{
            background-color:whitesmoke;
            font-family:'Barlow',sans-serif;
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
        body{
              background-color:whitesmoke;
            }
            body{margin-top:20px;}
            body{margin-top:20px;}

      </style>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>