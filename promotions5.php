<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
        integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous">
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js"
        integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous">
    </script>
    <title>Promotions</title>
    <link rel="icon" href="mn.png" type="image/x-icon">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel_Del_Luna</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>

<body>
    <script src="js/bootstrap.min.js"></script>

    <!---------Top Nav --------->
    <nav class="navbar fixed-top navbar-expand-md navbar-dark" style="background-color: rgba(0, 0, 0);">
        <div class="container">
            <a href="index.php" class="navbar-brand">
                <img src="logo.png" alt="Delluna Logo" width="30" height="30" class="d-in-line-block align-top" />
                <span class="navbar-brand mb=0 h1" style="font-weight:bold; color: #B897F3;"> DEL LUNA</span>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#toggleMobileMenu"
                aria-controls="toggleMobileMenu" aria-expanded="false" aria-lable="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse mynav" id="toggleMobileMenu">
                <ul class="navbar-nav ms-auto text-center">
                    <li class="nav-item active">
                        <a class="nav-link" href="home.php" style="margin-right: 20px;">OUR HOTELS</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="promotions5.php"
                            style="margin-right: 20px;font-weight: bold; color:  #B897F3 !important;"">PROMOTIONS</a>
                    </li>
                    <li class=" nav-item active">
                            <a class="nav-link" href="food.php" style="margin-right: 20px;">SERVICES</a>
                    </li>
                    <li class="nav-item active dropdown">
                        <a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-bs-toggle="dropdown"
                            aria-expanded="false" style="margin-right: 20px;" href="#">
                            BRANCHES</a>

                        <ul class="dropdown-menu dropnav" aria-labelledby="navbarDropdown">
                            <li><a href="bangkok.php" class="dropdown-item">BANGKOK</a></li>
                            <li><a href="chiangmai.php" class="dropdown-item">CHIANG-MAI</a></li>
                            <li><a href="pattaya.php" class="dropdown-item">PATTAYA</a></li>
                            <li><a href="phuket.php" class="dropdown-item">PHUKET</a></li>
                        </ul>
                    </li>
                    <li class="nav-item active dropdown">
                        <a class="nav-link" href="bill_payment.php" style="margin-right: 20px;">MY BOOKING</a>

                    <li class="nav-item active dropdown">
                        <a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-bs-toggle="dropdown"
                            aria-expanded="false">
                            LOGIN</a>

                        <ul class="dropdown-menu dropnav" aria-labelledby="navbarDropdown">
                            <li><a href="memlogin.php" class="dropdown-item">CUSTUMERS LOGIN</a></li>
                            <li><a href="stafflogin.php" class="dropdown-item">STAFF LOGIN</a></li>
                        </ul>
                    </li>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <img id="bg1" src="./picture/bg1.png">


    <div class="container">
        <div class="row">
            <div class="col col-item">
                <p1 id="promotion4">รายละเอียดห้องพัก<br>
                    ประเภทห้อง<br>
                    จำนวนเข้าพักสูงสุด<br>
                    etc.<br></p1>
                <p2 id="promotion5">Total price per night<br></p2>
                <p3 id="promotion9">7,440 บาท<br>
                    2,035 บาท</p3>
                <span>ONLY 2 LEFT</span>
                <p4 id="box5">____</p4>
                <p5 id="box8">
                    <img src="./picture/room2.jpg" class="img-thumbnail" alt="..." width="200" height="200">
                </p5>
                <div class="box10">
                    Detail : New year 2021 festival Discount 2021 Bath<br>
                    for One Bedroom Garden View Suite.<br>
                    15-12-2020 to 07-01-2021
                </div>
                <form action="promotions1.php" method="POST">
                    <div class="box16">
                        <input type="submit" value="รับโค้ดส่วนลด >>" class="btn btn-success">
                    </div>
                </form>

            </div>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col col-item1">
                <p1 id="promotion4">รายละเอียดห้องพัก<br>
                    ประเภทห้อง<br>
                    จำนวนเข้าพักสูงสุด<br>
                    etc.<br></p1>
                <p2 id="promotion5">Total price per night<br></p2>
                <p3 id="promotion6">1,750 บาท<br>
                    700 บาท</p3>
                <div class="box4">60% OFF TODAY</div>
                <p4 id="box6">____</p4>
                <p5 id="box7">
                    <img src="./picture/room1.jpg" class="img-thumbnail" alt="..." width="200" height="200">
                </p5>
                <div class="box11">
                    Detail : Songkran festival 2020. Discount 500 Bath<br>
                    for every room.<br>
                    01-04-2020 to 14-04-2020
                </div>
                <form action="promotions2.php" method="POST">
                    <div class="box17">
                        <input type="submit" value="รับโค้ดส่วนลด >>" class="btn btn-success">
                    </div>
                </form>

            </div>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col col-item2">
                <div class="box2">
                    <p1 id="promotion1">ซัมเมอร์นี้<br>
                        ลดจัดหนัก!<br></p1>
                    <p2 id="promotion2">1 - 30 เม.ย. 2021<br></p2>
                    <p3 id="promotion3">60%</p3>
                </div>



            </div>
        </div>
    </div>

    <style>
    body {
        background-color: whitesmoke;
        font-family: 'Barlow', sans-serif;
        transition: transform .2s;
    }

    #bg1 {
        width: 100%;
    }

    .col-item {
        background-color: #d6bbff;
        padding: 30px 140px 40px 240px;
        width: 600px;
        height: 300px;

        position: absolute;
        top: 500px;
        left: 200px;
        box-shadow: 4px 8px 16px 4px rgba(0, 0, 0, 0.5);
    }

    #promotion4 {
        color: black;
        font-size: 14px;
        font-family: Roboto;
        font-style: normal;
        font-weight: bold;
        text-align: center;
    }

    #promotion5 {
        color: black;
        font-size: 16px;
        font-family: Roboto;
        font-style: normal;
        font-weight: normal;
        position: relative;
        bottom: 80px;
        left: 200px;
        text-align: center;
    }

    #promotion9 {
        color: black;
        font-size: 20px;
        font-family: Roboto;
        font-style: normal;
        font-weight: bold;
        position: relative;
        bottom: 80px;
        left: 220px;
        text-align: center;
    }

    span {
        padding: 5px 5px;
        color: black;
        font-size: 14px;
        font-family: Roboto;
        font-style: normal;
        font-weight: bold;
        background-color: red;
        position: relative;
        bottom: 170px;
        left: 120px;
    }

    #box5 {
        width: 115px;
        height: 15px;
        padding: 5px 5px;
        color: red;
        font-size: 50px;
        font-family: Roboto;
        font-style: normal;
        font-weight: bolder;

        position: relative;
        bottom: 186px;
        left: 211px;
    }

    #box8 {


        position: relative;
        bottom: 250px;
        right: 220px;
    }

    .box10 {
        color: black;
        font-style: normal;
        font-weight: normal;
        font-size: 12px;
        width: 300px;
        height: 90px;
        padding: 20px 10px 10px 20px;
        background-color: #fbdd8e;
        position: relative;
        bottom: 230px;
        left: -5px;

    }

    .box16 {
        position: relative;
        bottom: 290px;
        right: 140px;
    }

    .col-item1 {
        background-color: #d6bbff;
        padding: 30px 140px 40px 240px;
        width: 600px;
        height: 300px;

        position: absolute;
        top: 900px;
        left: 200px;
        box-shadow: 4px 8px 16px 4px rgba(0, 0, 0, 0.5);
    }

    #promotion4 {
        color: black;
        font-size: 14px;
        font-family: Roboto;
        font-style: normal;
        font-weight: bold;
        text-align: center;
    }

    #promotion5 {
        color: black;
        font-size: 16px;
        font-family: Roboto;
        font-style: normal;
        font-weight: normal;
        position: relative;
        bottom: 80px;
        left: 200px;
        text-align: center;
    }

    #promotion6 {
        color: black;
        font-size: 20px;
        font-family: Roboto;
        font-style: normal;
        font-weight: bold;
        position: relative;
        bottom: 80px;
        left: 220px;
        text-align: center;
    }

    .box4 {
        width: 130px;
        height: 30px;
        padding: 5px 5px 5px 10px;
        color: black;
        font-size: 14px;
        font-family: Roboto;
        font-style: normal;
        font-weight: bold;
        background-color: red;
        position: relative;
        bottom: 200px;
        left: 200px;
    }

    #box6 {
        width: 115px;
        height: 15px;
        padding: 5px 5px;
        color: red;
        font-size: 50px;
        font-family: Roboto;
        font-style: normal;
        font-weight: bolder;

        position: relative;
        bottom: 215px;
        left: 211px;
    }

    #box7 {
        position: relative;
        bottom: 280px;
        right: 220px;
    }

    .box11 {
        color: black;
        font-style: normal;
        font-weight: normal;
        font-size: 12px;
        width: 300px;
        height: 90px;
        padding: 20px 10px 10px 20px;
        background-color: #fbdd8e;
        position: relative;
        bottom: 260px;
        left: -5px;

    }

    .box17 {
        position: relative;
        bottom: 320px;
        right: 140px;
    }

    .box2 {
        background-color: #d6bbff;
        padding: 30px 30px;
        position: absolute;
        top: 500px;
        left: 900px;
        box-shadow: 4px 8px 16px 4px rgba(0, 0, 0, 0.5);
        text-align: center;
    }

    #promotion1 {
        color: black;
        font-size: 25px;
        font-family: Roboto;
        font-style: normal;
        font-weight: bold;

    }

    #promotion2 {
        color: black;
        font-size: 15px;
        font-family: Roboto;
        font-style: normal;

    }

    #promotion3 {
        color: red;
        font-size: 60px;
        font-family: Roboto;
        font-style: normal;
        font-weight: bolder;

    }
    </style>
</body>

</html>