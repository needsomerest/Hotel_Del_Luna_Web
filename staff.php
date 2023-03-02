<!DOCTYPE html>
<html lang="ENG">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Staff</title>
        <link rel="icon" href="mn.png" type="image/x-icon">
        <link rel="stylesheet" href="css\bootstrap.min.css">
    </head>
    <body>
      <nav class ="navbar fixed-top navbar-expand-md navbar-dark"
      style="background-color: rgba(0, 0, 0);">
     <div class="container">
         <a href="home.php" class="navbar-brand">
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
         <div class="collapse navbar-collapse mynav" id="toggleMobileMenu">
             <ul class="navbar-nav ms-auto text-center">
                 <li class="nav-item active">
                     <a class="nav-link" href="addhotelhome.php" style="margin-right: 20px;">HOTEL</a>
                 </li>
                 <li class="nav-item active">
                     <a class="nav-link" href="promotiondetail.php" style="margin-right: 20px;">PROMOTIONS</a>
                 </li>
                 <li class="nav-item active dropdown">
                    <a class="nav-link" href="staff.php"
                    style="margin-right: 20px;font-weight: bold; color:  #B897F3 !important;"
                    >
                    STAFF</a>
                </li>
                </li>
             </ul>
         </div>
    </div> 
 </nav>  
   <br></br>
   <div class="container">
  <br></br>
  
 <?php
  require('dbconnect.php');

  $sql = "
    SELECT *
    FROM staff_detail;
    ";

  $objQuery = mysqli_query($con, $sql) or die("Error Query [" . $sql . "]");
  ?>
 <div class="row justify-content-center">
     <div class="col-12 col-sm-12">
     <h3 align = 'center'>Staff Information</h3>
     <br></br>
   <table style="width:100%" border='1' cellspacing='0'>
    <tr>
      <th>StaffID</th>
      <th>Branch</th>
      <th>Frist Name</th>
      <th>Last Name</th>
      <th>Sex</th>
      <th>DOB</th>
      <th>Position</th>
      <th>Tel.</th>
      <th>Salary</th>
      <th>Delete</th>
      <th>Update</th>
    
    </tr>
    <?php
    $i = 1;
    while ($objResult = mysqli_fetch_array($objQuery)) {
    ?>
      <tr>
        <td><?php echo $objResult["StaffID"]; ?></td>
        <td><?php echo $objResult["BranchNo"]; ?></td>
        <td><?php echo $objResult["FirstName"]; ?></td>
        <td><?php echo $objResult["LastName"]; ?></td>
        <td><?php echo $objResult["Sex"]; ?></td>
        <td><?php echo $objResult["DateOfBirth"]; ?></td>
        <td><?php echo $objResult["Position"]; ?></td>
        <td><?php echo $objResult["Tel"]; ?></td>
        <td><?php echo $objResult["Salary"]; ?></td>
        <td><a href="deletestaff.php?StaffID=<?php echo $objResult["StaffID"]; ?>">Delete</a></td>
        <td><a href="updatestaff.php?StaffID=<?php echo $objResult["StaffID"]; ?>">Update</a></td>
      </tr>
    <?php
      $i++;
    }
    ?>
  </table>
  <div class="row">
<div class="col-lg-2">
    <br></br>
<button type="submit" class="btn btn-primary" value="back"><a href="signupstaff.php" >ADD STAFF</a></button>
</div>
<div class="col-lg-2">
<br></br>
<button type="submit" class="btn btn-primary" value="back"><a href="signupmng.php" >ADD MANAGER</a></button>
</div>
</div>
</div>
</div>
  <?php
  mysqli_close($con); // ปิดฐานข้อมูล
  ?>
      <style>
 a {
  color: black;
  text-decoration: none;
}
   .btn{
  background-color: #B897F3; /* Green */
  border: none;
  color: black;
  padding: 12px 30px;
  text-align: right;
  text-decoration: none;
  display: inline-block;
  font-size: 15px;
 }
           td{
    font-size: 15px;
 }
 .container h3{
  padding: 8px;
  border-radius: 8px;
  background-color: lightgrey;
  color : #483D8B;
 }
 tr:nth-child(even) {
     background-color: #B897F3;
     }
 th {
    font-size: 15px;
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
            body{margin-top:20px;
        }
      </style>
       <script src="js/bootstrap.min.js"></script>
    </body>
</html>