<?php /* *** No Copyright for Education (Free to Use and Edit) *** * /
PHP 7.1.1 | MySQL 5.7.17 | phpMyAdmin 4.6.6 | by appserv-win32-8.6.0.exe
Created by Mr.Earn SURIYACHAY | ComSci | KMUTNB | Bangkok | Apr 2018 */ ?>
<?php

$delete_ID  = $_REQUEST['StaffID'];
echo $delete_ID;
require('dbconnect.php');

$sql = "
    DELETE FROM staff_salary
    WHERE StaffID = $delete_ID;
    ";
$sql1 = "
    DELETE FROM staff_detail
    WHERE StaffID = $delete_ID;
    ";
$objQuery = mysqli_query($con, $sql);
$objQuery1 = mysqli_query($con, $sql1);
if ($objQuery&&$objQuery1) {
    echo "Record " . $delete_ID . " was Deleted.";
} else {
    echo "Error : Delete";
}

mysqli_close($con); // ปิดฐานข้อมูล
echo "<br><br>";
echo "--- END ---";
?>
