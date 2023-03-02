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
	UPDATE Staff_Detail
	SET  BranchNo = '$BranchNo ', 
	FirstName = '$FirstName ', 
	LastName = '$LastName ', 
	Sex = '$Sex', 
	DateOfBirth = '$DateOfBirth', 
	Position = '$Position',
    Tel = '$Tel' ,
    Salary = '$Salary' 
	WHERE StaffID = '$StaffID'; ";


$objQuery = mysqli_query($con, $sql);

if ($objQuery) {
    echo '<p>Register successful</p> ';
    echo '<a href="staff.php">Back to staff information</a> ';
} else {
    echo "Error : Input";
}

mysqli_close($con); // ปิดฐานข้อมูล
?>