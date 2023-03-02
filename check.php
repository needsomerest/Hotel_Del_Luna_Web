<?php
session_start();
require('dbconnect.php');
$a = $_POST['customerid'];
$b = $_POST['password'];
$strSQL = "SELECT * 
FROM customer_detail 
WHERE CustomerID = '$a' and pword = '$b'";
$objQuery = mysqli_query($con,$strSQL);
$objResult = mysqli_fetch_array($objQuery);
if(!$objResult)
{
echo "Username and Password Incorrect!";
}
else
{
    header("location:home.php");
}
mysqli_close($con);
?>