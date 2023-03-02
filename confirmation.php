<?php
require('dbconnect.php');

$FirstName          = $_REQUEST['firstname'];
$LastName           = $_REQUEST['lastname'];
$CustomerID         = $_REQUEST['idcard'];
$PassportNumber     = $_REQUEST['passportno'];
$Customer_Type      = $_REQUEST['customertype'];
$DateOfBirth        = $_REQUEST['dateofbirth'];
$CustomerTel        = $_REQUEST['phoneno'];
$Email              = $_REQUEST['email'];
$pword              = $_REQUEST['cfpassword'];

$sql = "
    INSERT INTO customer_detail
    VALUES ('$CustomerID','$pword','$PassportNumber','$Customer_Type','$FirstName','$LastName','$DateOfBirth','$Email','$CustomerTel');
    ";

$objQuery = mysqli_query($con, $sql);

if ($objQuery) {
    echo '<p>Register successful</p> ';
    echo '<a href="home.html">Back to home</a> ';
} else {
    echo "Error : Input";
}

mysqli_close($con); // ปิดฐานข้อมูล
?>