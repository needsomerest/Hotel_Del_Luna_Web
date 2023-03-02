<?php
require('dbconnect.php');

$BranchNo            = $_REQUEST['bno'];
$BranchName          = $_REQUEST['bname'];
$Address             = $_REQUEST['add'];
$BranchTel           = $_REQUEST['btel']; 

$sql = "
INSERT INTO `Hotel_Detail` (`BranchNo`, `BranchName`, `Address`, `BranchTel`) 
VALUES ('$BranchNo', '$BranchName', '$Address','$BranchTel'); ";
$objQuery = mysqli_query($con, $sql);
$room = array("VIP","King Suit","One Bedroom Garden View Suit","Deluxe King Room","Deluxe Zen Double","Dulex Twin Room");
for($i=1;$i<100;$i++){
    if($i<10){
        $sql3 = "
    INSERT INTO `room_detail` (`BranchNo`, `RoomID`, `RoomType`)
    VALUES ('$BranchNo', 'R00$i', '$room[0]');
    ";
    mysqli_query($con, $sql3);
    }
    if($i<15&&$i>9){
        $sql3 = "
    INSERT INTO `room_detail` (`BranchNo`, `RoomID`, `RoomType`)
    VALUES ('$BranchNo', 'R0$i', '$room[0]');
    ";
    mysqli_query($con, $sql3);
    }
    if($i<31&&$i>14){
     $sql3 = "
    INSERT INTO `room_detail` (`BranchNo`, `RoomID`, `RoomType`)
    VALUES ('$BranchNo', 'R0$i', 'Standard');
    ";
    mysqli_query($con, $sql3);
    }
    if($i<45&&$i>30){
        $sql3 = "
       INSERT INTO `room_detail` (`BranchNo`, `RoomID`, `RoomType`)
       VALUES ('$BranchNo', 'R0$i', '$room[1]');
       ";
       mysqli_query($con, $sql3);
       }
       if($i<59&&$i>44){
       $sql3 = "
       INSERT INTO `room_detail` (`BranchNo`, `RoomID`, `RoomType`)
       VALUES ('$BranchNo', 'R0$i', '$room[2]');
       ";
       mysqli_query($con, $sql3);
       }
       if($i<73&&$i>58){
        $sql3 = "
        INSERT INTO `room_detail` (`BranchNo`, `RoomID`, `RoomType`)
        VALUES ('$BranchNo', 'R0$i', '$room[3]');
        ";
        mysqli_query($con, $sql3);
        }
        if($i<87&&$i>72){
            $sql3 = "
            INSERT INTO `room_detail` (`BranchNo`, `RoomID`, `RoomType`)
            VALUES ('$BranchNo', 'R0$i', '$room[4]');
            ";
            mysqli_query($con, $sql3);
            }
        if($i>86){
            $sql3 = "
            INSERT INTO `room_detail` (`BranchNo`, `RoomID`, `RoomType`)
            VALUES ('$BranchNo', 'R0$i', '$room[5]');
            ";
            mysqli_query($con, $sql3);
        }
}
$sql4 = "
INSERT INTO `room_detail` (`BranchNo`, `RoomID`, `RoomType`)
VALUES ('$BranchNo', 'R100', '$room[5]');
";
mysqli_query($con, $sql4);

if ($objQuery) {
    echo '<p>Add hotel detail successful</p> ';
    echo '<a href="addhotelhome.php">Back to hotel information</a> ';
} else {
    echo "Error : Input";
}

mysqli_close($con); // ปิดฐานข้อมูล
?>