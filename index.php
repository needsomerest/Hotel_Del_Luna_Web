<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Hotel Delluna</title>
    <link rel="icon" href="mn.png" type="image/x-icon">
    <link rel="stylesheet" href="css\bootstrap.min.css">
    <style>
        body{
            background-color: black;
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
        .button{
            position: absolute;
            width: 160px;
            height: 50px;
            left: 685px;
            top: 500px;
            background: #F56E03;
            box-shadow: 0px 0px 25px 5px rgba(0, 0, 0, 0.45);
            display: flex;
            justify-content: center;
            text-align:center;
            align-items: center;
            font-weight: bold;
            color:white;
            font-size: 18px;
            transition: transform .2s;
            text-decoration: none;
        }
        .button:hover{
            width: 180px;
            height: 60px;
            color:white;
            font-size: 20px;
            display: flex;
            justify-content: center;
            text-align:center;
            align-items: center;
            font-weight: bold;
            transform: scale(1.25);
            background-color : #5b3c91;
        }
        .img{
            max-width: 100%;
            max-height: 100%;
            display: block;
        }
    </style>
</head>
<body>

    <nav class ="navbar fixed-top navbar-expand-md navbar-dark"
         style="background-color: rgba(0, 0, 0, 0.7);">
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
            <div class="collapse navbar-collapse mynav" id="toggleMobileMenu">
                <ul class="navbar-nav ms-auto text-center">
                    <li class="nav-item active">
                        <a class="nav-link" href="#" style="margin-right: 20px;">ABOUT</a>
                    </li>
                    <li class="nav-item active dropdown">
                        <a class="nav-link dropdown-toggle" 
                        id="navbarDropdown" 
                        role="button" 
                        data-bs-toggle="dropdown"
                        aria-expanded="false"
                        style="margin-right: 20px;"
                        href="#">
                        CONTACT</a>
                        
                        <ul class="dropdown-menu dropnav"
                        aria-labelledby="navbarDropdown">
                            <li><a href="bangkok.php" class="dropdown-item">BANGKOK</a></li>
                            <li><a href="chiangmai.php" class="dropdown-item">CHIANG-MAI</a></li>
                            <li><a href="pattaya.php" class="dropdown-item">PATTAYA</a></li>
                            <li><a href="phuket.php" class="dropdown-item">PHUKET</a></li>
                        </ul>
                    </li>
                    <li class="nav-item active dropdown">
                        <a class="nav-link dropdown-toggle" 
                        id="navbarDropdown" 
                        role="button" 
                        data-bs-toggle="dropdown"
                        aria-expanded="false"
                        style="margin-right: 20px;font-weight: bold; color:  #B897F3 !important;"
                        href="#">
                        MY BOOKING</a>
                        
                        <ul class="dropdown-menu dropnav"
                        aria-labelledby="navbarDropdown">
                            <li><a href="login.php" class="dropdown-item">LOG IN</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
       </div> 
    </nav>
            <a class="button" href="home.php" role="button">BOOK A ROOM</a>

    <div class="img">
            <img class="img" src="bg.jpg">
            <img class="img" src="main1.jpg">
            <img class="img" src="main2.jpg">
            <img class="img" src="main3.jpg">  
    </div>

    <script src="js/bootstrap.min.js"></script>
</body>
</html>
