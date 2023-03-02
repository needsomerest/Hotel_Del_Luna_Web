<?php
require('dbconnect.php');

$PromotionCode           = $_REQUEST['PromotionCode'];
$LimitedQuantity          = $_REQUEST['LimitedQuantity'];
$StartDate         = $_REQUEST['StartDate'];
$ExpireDate          = $_REQUEST['ExpireDate'];
$Discount               = $_REQUEST['Discount'];
$SeasonalRate        = $_REQUEST['SeasonalRate'];
$Detail              = $_REQUEST['Detail'];

$sql = "
    INSERT INTO promotion (`PromotionCode`, `LimitedQuantity`, `StartDate`, `ExpireDate`, `Discount`, `SeasonalRate`, `Detail`) 
    VALUES ('$PromotionCode','$LimitedQuantity','$StartDate','$ExpireDate','$Discount','$SeasonalRate ','$Detail');
    ";

$objQuery = mysqli_query($con, $sql);

if ($objQuery) {
    echo '<p>Register successful</p> ';
    echo '<a href="promotiondetail.php">Back to promotion information</a> ';
} else {
    echo "Error : Input";
}

mysqli_close($con); // ปิดฐานข้อมูล
?>