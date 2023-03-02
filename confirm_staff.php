<?php
require('dbconnect.php');

$StaffID            = $_REQUEST['StaffID'];
$BranchNo           = $_REQUEST['BranchNo'];
$FirstName          = $_REQUEST['FirstName'];
$LastName           = $_REQUEST['LastName'];
$Sex                = $_REQUEST['Sex'];
$DateOfBirth        = $_REQUEST['dateofbirth'];
$Tel               = $_REQUEST['Tel'];
$Position          = $_REQUEST['Position'];
$Salary           = $_REQUEST['Salary'];

$sql = "
    INSERT INTO Staff_Detail
    (`StaffID`, `BranchNo`, `FirstName`, `LastName`, `Sex`, `DateOfBirth`, `Position`, `Tel`, `Salary`)
    VALUES ('$StaffID ','$BranchNo','$FirstName','$LastName','$Sex','$DateOfBirth','$Position','$Tel','$Salary');
    ";

$objQuery = mysqli_query($con, $sql);

if ($objQuery) {
    echo '<p>Register successful</p> ';
    echo '<a href="staff.php">Back to staff information</a> ';
} else {
    echo "Error : Input";
}

mysqli_close($con); // ปิดฐานข้อมูล
?>