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
</head>

<body>
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
                <div class="box10">PromotionsCode!!!</div>

                <p1 id="box11">GHNBJL</p1>

                <form action="promotions5.php" method="POST">
                    <div class="box16">
                        <input type="submit" value="<< กลับไปยังก่อนหน้า" class="btn btn-success">
                    </div>
                </form>

                <p2 id="box17">*หมายเหตุ : 1 โค้ด/ 20 บิล</p2>
            </div>

        </div>
    </div>
    </div>

</body>

</html>

<style>
body {
    background-color: whitesmoke;
    font-family: 'Barlow', sans-serif;
    transition: transform .2s;
}

#bg1 {
    width: 100%;
}

.color_btn {
    background-color: #B897F3;
    color: black;
    font-style: normal;
    font-weight: normal;
    font-size: 24px;
    line-height: 28px;
    text-align: center;
    margin: 3px;
    height: 50px;
}

.box10 {
    color: black;
    font-style: normal;
    font-weight: bolder;
    font-size: 34px;
    width: 350px;
    height: 300px;
    padding: 30px 10px 10px 10px;
    background-color: #fbdd8e;
    position: relative;
    bottom: -10px;
    left: 400px;
    line-height: 28px;
    text-align: center;
    border-radius: 5px;
    margin: 3px;
    box-shadow: 4px 8px 16px 4px rgba(0, 0, 0, 0.5);
}

#box11 {
    color: black;
    font-style: normal;
    font-weight: bolder;
    font-size: 80px;
    padding: 30px 25px 10px 0px;
    position: relative;
    bottom: 210px;
    left: 420px;

    text-align: center;


}

.box16 {
    position: relative;
    bottom: 200px;
    left: 500px;
}

#box17 {
    color: red;
    font-style: normal;
    font-weight: bold;
    font-size: 16px;
    padding: 30px 25px 10px 0px;
    position: relative;
    bottom: 120px;
    left: 480px;
    text-align: center;


}
</style>