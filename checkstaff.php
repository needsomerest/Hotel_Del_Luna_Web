<?php
session_start();
require('dbconnect.php');
$a = $_POST['staffid'];
$b = $_POST['password'];
$strSQL = "SELECT * 
FROM staff_detail
WHERE StaffID = '$a' and pword = '$b' and (position ='Manager' or position ='Director')";
$objQuery = mysqli_query($con,$strSQL);
$objResult = mysqli_fetch_array($objQuery);
if(!$objResult)
{
echo "Username and Password Incorrect!";
}
else
{
    header("location:staff.php");
}
mysqli_close($con);
?>