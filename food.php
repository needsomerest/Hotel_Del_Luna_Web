<!DOCTYPE html>
<html lang="ENG">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Services</title>
    <link rel="icon" href="mn.png" type="image/x-icon">
    <link rel="stylesheet" href="css\bootstrap.min.css">
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
                        <a class="nav-link" href="promotions5.php" style="margin-right: 20px;">PROMOTIONS</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="food.php"
                            style="margin-right: 20px;font-weight: bold; color:  #B897F3 !important;">SERVICES</a>
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
    <br></br>
    <br></br>
    <div class="container">
        <form action="sv.php" method="POST">
            <label class="bktext"><b>Booking No. </b></label>
            <input class="bk" type="text" name="booking" required autofocus>
            <br></br>
            <br></br>
            <div class="food-menu-card">
                <div>
                    <!-- Nav tabs -->

                    <ul class="nav  tabs-menu-nav justify-content-center mb30" role="tablist">
                        <li class="nav-item" role="presentation">
                            <h1>SET MENU</h1>
                        </li>
                    </ul>
                    <p class="text-white-gray" align='center'>Dear customers, you can choose 1 set / bill service.</p>
                    <br></br>
                    <select class="form-select" aria-label="Disabled select example" name="foodform">
                        <option selected value="BF0">SELECT MENU</option>
                        <option value="BF1">SET A</option>
                        <option value="BF2">SET B</option>
                        <option value="BF3">SET C</option>
                        <option value="BF4">SET D</option>
                        <option value="BF5">SET E</option>
                    </select>
                    <br></br>

                    <br></br>
                    <!-- Tab panes -->
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane fade active show" id="SET MENU">
                            <div class="row">
                                <div class="col-md-12 mb20">
                                    <article class="media">
                                        <!-- Article Image -->
                                        <img class="img-fluid mr-4" width="80" src="11.jpg" alt="">
                                        <img class="img-fluid mr-4" width="80" src="12.jpg" alt="">
                                        <!--Image -->
                                        <!--Content -->
                                        <div class="media-body align-self-center g-pl-10">
                                            <div class="d-flex justify-content-between mb10">
                                                <h3 class="align-self-center text-capitalize mb0 h6 text-white font400">
                                                    SET A</h3>
                                                <div class="align-self-center">
                                                    <strong class="text-white font700">499 Bath</strong>
                                                </div>
                                            </div>
                                            <p class="mb-0">Breakfast Burrito + Almond Cookies</p>
                                        </div>
                                        <!--/Content -->
                                    </article>
                                    <!--/Article -->
                                    <article class="media">
                                        <!-- Article Image -->
                                        <img class="img-fluid mr-4" width="80" src="21.jpg" alt="">
                                        <img class="img-fluid mr-4" width="80" src="22.jpg" alt="">
                                        </a>
                                        <!--Image -->
                                        <!--Content -->
                                        <div class="media-body align-self-center g-pl-10">
                                            <div class="d-flex justify-content-between mb10">
                                                <h3 class="align-self-center text-capitalize mb0 h6 text-white font400">
                                                    SET B</h3>

                                                <div class="align-self-center">
                                                    <strong class="text-white font700">499 Bath</strong>
                                                </div>
                                            </div>

                                            <p class="mb-0">Scrambled Eggs + Maple cake</p>
                                        </div>
                                        <!--/Content -->
                                    </article>
                                    <!--/Article -->
                                    <article class="media">
                                        <!-- Article Image -->
                                        <img class="img-fluid mr-4" width="80" src="31.jpg" alt="">
                                        <img class="img-fluid mr-4" width="80" src="32.jpg" alt="">
                                        </a>
                                        <!--Image -->
                                        <!--Content -->
                                        <div class="media-body align-self-center g-pl-10">
                                            <div class="d-flex justify-content-between mb10">
                                                <h3 class="align-self-center text-capitalize mb0 h6 text-white font400">
                                                    SET C</h3>
                                                <div class="align-self-center">
                                                    <strong class="text-white font700">499 Bath</strong>
                                                </div>
                                            </div>

                                            <p class="mb-0">Huevos Rancheros + Muffin</p>
                                        </div>
                                        <!--/Content -->
                                    </article>
                                    <!--/Article -->
                                    <article class="media">
                                        <!-- Article Image -->
                                        <img class="img-fluid mr-4" width="80" src="41.jpg" alt="">
                                        <img class="img-fluid mr-4" width="80" src="42.jpg" alt="">
                                        </a>
                                        <!--Image -->
                                        <!--Content -->
                                        <div class="media-body align-self-center g-pl-10">
                                            <div class="d-flex justify-content-between mb10">
                                                <h3 class="align-self-center text-capitalize mb0 h6 text-white font400">
                                                    SET D</h3>

                                                <div class="align-self-center">
                                                    <strong class="text-white font700">499 Bath</strong>
                                                </div>
                                            </div>

                                            <p class="mb-0">Bacon salad + Honey Pancakes</p>
                                        </div>
                                        <!--/Content -->
                                    </article>
                                    <!--/Article -->
                                    <article class="media">
                                        <!-- Article Image -->
                                        <img class="img-fluid mr-4" width="80" src="51.jpg" alt="">
                                        <img class="img-fluid mr-4" width="80" src="52.jpg" alt="">
                                        </a>
                                        <!--Image -->
                                        <!--Content -->
                                        <div class="media-body align-self-center g-pl-10">
                                            <div class="d-flex justify-content-between mb10">
                                                <h3 class="align-self-center text-capitalize mb0 h6 text-white font400">
                                                    SET E</h3>

                                                <div class="align-self-center">
                                                    <strong class="text-white font700">499 Bath</strong>
                                                </div>
                                            </div>

                                            <p class="mb-0">Stuffed Omelet + Soft cake</p>
                                        </div>
                                        <!--/Content -->
                                    </article>
                                    <!--/Article -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </div>
    </div>
    <br></br>
    <br></br>

    <div class="container py-7">
        <h2 align='center'>ROUTE MAP</h2>
        <!-- Days -->
        <br></br>
        <div class="row">
            <div class="col-lg-3 mb-3" id="BANGKOK">
                <h4 class="mt-0 mb-3 text-dark op-8 font-weight-bold">
                    BANGKOK
                </h4>
                <ul class="list-timeline list-timeline-primary">
                    <li class="list-timeline-item p-0 pb-3 pb-lg-4 d-flex flex-wrap flex-column">
                        <p class="my-0 text-dark flex-fw text-sm text-uppercase">Hotel</p>
                    </li>
                    <li class="list-timeline-item p-0 pb-3 pb-lg-4 d-flex flex-wrap flex-column">
                        <p class="my-0 text-dark flex-fw text-sm text-uppercase">Bangkok Art and Culture Centre</p>
                    </li>
                    <li class="list-timeline-item p-0 pb-3 pb-lg-4 d-flex flex-wrap flex-column">
                        <p class="my-0 text-dark flex-fw text-sm text-uppercase">Madame Tussauds</p>
                    </li>
                    <li class="list-timeline-item p-0 pb-3 pb-lg-4 d-flex flex-wrap flex-column">
                        <p class="my-0 text-dark flex-fw text-sm text-uppercase">Siam</p>
                    </li>
                    <li class="list-timeline-item p-0 pb-3 pb-lg-4 d-flex flex-wrap flex-column">
                        <p class="my-0 text-dark flex-fw text-sm text-uppercase">SEA LIFE Bangkok Ocean World</p>
                    </li>
                    <li class="list-timeline-item p-0 pb-3 pb-lg-4 d-flex flex-wrap flex-column">
                        <p class="my-0 text-dark flex-fw text-sm text-uppercase">central world</p>
                    </li>
                    <li class="list-timeline-item p-0 pb-3 d-flex flex-wrap flex-column">
                        <p class="my-0 text-dark flex-fw text-sm text-uppercase">pratunam market</p>
                    </li>
                </ul>
            </div>
            <div class="col-lg-3 mb-3" id="CHIANG-MAI">
                <h4 class="mt-0 mb-3 text-dark op-8 font-weight-bold">
                    CHIANG-MAI
                </h4>
                <ul class="list-timeline list-timeline-primary">
                    <li class="list-timeline-item p-0 pb-3 pb-lg-4 d-flex flex-wrap flex-column">
                        <p class="my-0 text-dark flex-fw text-sm text-uppercase">Hotel</p>
                    </li>
                    <li class="list-timeline-item p-0 pb-3 pb-lg-4 d-flex flex-wrap flex-column">
                        <p class="my-0 text-dark flex-fw text-sm text-uppercase">Tha Phae Gate</p>
                    </li>
                    <li class="list-timeline-item p-0 pb-3 pb-lg-4 d-flex flex-wrap flex-column">
                        <p class="my-0 text-dark flex-fw text-sm text-uppercase">chiang mai old city</p>
                    </li>
                    <li class="list-timeline-item p-0 pb-3 pb-lg-4 d-flex flex-wrap flex-column">
                        <p class="my-0 text-dark flex-fw text-sm text-uppercase">Wat Chedi Luang</p>
                    </li>
                    <li class="list-timeline-item p-0 pb-3 pb-lg-4 d-flex flex-wrap flex-column">
                        <p class="my-0 text-dark flex-fw text-sm text-uppercase">Wat Phra Singh</p>
                    </li>
                    <li class="list-timeline-item p-0 pb-3 pb-lg-4 d-flex flex-wrap flex-column">
                        <p class="my-0 text-dark flex-fw text-sm text-uppercase">Wat Lok Molee</p>
                    </li>
                    <li class="list-timeline-item p-0 pb-3 d-flex flex-wrap flex-column">
                        <p class="my-0 text-dark flex-fw text-sm text-uppercase">Wat Chiang Man</p>
                    </li>
                </ul>
            </div>
            <div class="col-lg-3 mb-3" id="PATTAYA">
                <h4 class="mt-0 mb-3 text-dark op-8 font-weight-bold">
                    PATTAYA
                </h4>
                <ul class="list-timeline list-timeline-primary">
                    <li class="list-timeline-item p-0 pb-3 pb-lg-4 d-flex flex-wrap flex-column">
                        <p class="my-0 text-dark flex-fw text-sm text-uppercase">hotel</p>
                    </li>
                    <li class="list-timeline-item p-0 pb-3 pb-lg-4 d-flex flex-wrap flex-column">
                        <p class="my-0 text-dark flex-fw text-sm text-uppercase">Pattaya beach</p>
                    </li>
                    <li class="list-timeline-item p-0 pb-3 pb-lg-4 d-flex flex-wrap flex-column">
                        <p class="my-0 text-dark flex-fw text-sm text-uppercase">Jomtien beach</p>
                    </li>
                    <li class="list-timeline-item p-0 pb-3 pb-lg-4 d-flex flex-wrap flex-column">
                        <p class="my-0 text-dark flex-fw text-sm text-uppercase">Pattaya Walking Street</p>
                    </li>
                    <li class="list-timeline-item p-0 pb-3 pb-lg-4 d-flex flex-wrap flex-column">
                        <p class="my-0 text-dark flex-fw text-sm text-uppercase">Khao Phra Tamnak</p>
                    </li>
                    <li class="list-timeline-item p-0 pb-3 pb-lg-4 d-flex flex-wrap flex-column">
                        <p class="my-0 text-dark flex-fw text-sm text-uppercase">Sanctuary of Truth</p>
                    </li>
                    <li class="list-timeline-item p-0 pb-3 d-flex flex-wrap flex-column">
                        <p class="my-0 text-dark flex-fw text-sm text-uppercase">Mimosa Pattaya</p>
                    </li>
                </ul>
            </div>
            <div class="col-lg-3 mb-3" id="PHUKET">
                <h4 class="mt-0 mb-3 text-dark op-8 font-weight-bold">
                    PHUKET
                </h4>
                <ul class="list-timeline list-timeline-primary">
                    <li class="list-timeline-item p-0 pb-3 pb-lg-4 d-flex flex-wrap flex-column">
                        <p class="my-0 text-dark flex-fw text-sm text-uppercase">hotel</p>
                    </li>
                    <li class="list-timeline-item p-0 pb-3 pb-lg-4 d-flex flex-wrap flex-column">
                        <p class="my-0 text-dark flex-fw text-sm text-uppercase">Big Buddha</p>
                    </li>
                    <li class="list-timeline-item p-0 pb-3 pb-lg-4 d-flex flex-wrap flex-column">
                        <p class="my-0 text-dark flex-fw text-sm text-uppercase">Chaithararam Temple</p>
                    </li>
                    <li class="list-timeline-item p-0 pb-3 pb-lg-4 d-flex flex-wrap flex-column">
                        <p class="my-0 text-dark flex-fw text-sm text-uppercase">Phuket Old town</p>
                    </li>
                    <li class="list-timeline-item p-0 pb-3 pb-lg-4 d-flex flex-wrap flex-column">
                        <p class="my-0 text-dark flex-fw text-sm text-uppercase">Karon View point</p>
                    </li>
                    <li class="list-timeline-item p-0 pb-3 pb-lg-4 d-flex flex-wrap flex-column">
                        <p class="my-0 text-dark flex-fw text-sm text-uppercase">Kaokard Viewpoint Tower</p>
                    </li>
                    <li class="list-timeline-item p-0 pb-3 d-flex flex-wrap flex-column">
                        <p class="my-0 text-dark flex-fw text-sm text-uppercase">Phrom Thep Cape</p>
                    </li>
                </ul>
            </div>
        </div>
        <br></br>
        <h3>RESERVE SHUTTLE BUS</h3>
        <p class="text-white-gray">Dear customers, You must only board the origin or destination vehicle.</p>
        <br></br>
        <div class="row">
            <div class="col-lg-3">
                <select class="form-select" aria-label="Disabled select example" name="barnch">
                    <option selected value="b0">SELECT YOUR BRANCH</option>
                    <option value="busBK">BANGKOK</option>
                    <option value="busCM">CHIANG-MAI</option>
                    <option value="busPTY">PATTAYA</option>
                    <option value="busPK">PHUKET</option>
                </select>
                <br></br>
            </div>
            <div class="col-lg-3">
                <select class="form-select" aria-label="Disabled select example" name="departure">
                    <option selected value="dog">SELECT DEPARTURE</option>
                    <option value="dHT">HOTEL</option>
                    <option value="dBK">PRATUNAM MARKET</option>
                    <option value="dCM">WAT CHIANG MAN</option>
                    <option value="dPTY">MIMOSA PATTAYA</option>
                    <option value="dPK">PHROM THEP CAPE</option>
                </select>
                <br></br>
            </div>
            <div class="col-lg-3">
                <select class="form-select" aria-label="Disabled select example" name="timestb">
                    <option selected value="t0">SELECT TIME</option>
                    <option value="0">10 : 00</option>
                    <option value="1">12 : 00</option>
                    <option value="2">14 : 00</option>
                </select>
                <br></br>
            </div>
            <div class="col-lg-3">
                <label for="person">Person :</label>
                <input type="number" class="person" id="person" name="person" min="1" max="6"><br><br>
            </div>
        </div>
    </div>
    <br></br>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12 col-sm-8 col-lg-6">
                <!-- Section Heading-->
                <div class="section_heading text-center wow fadeInUp" data-wow-delay="0.2s"
                    style="visibility: visible; animation-delay: 0.2s; animation-name: fadeInUp;">
                    <h3>LAUNDRY SERVICE</h3>
                    <p>Clean Laundry, Peace of Mind!</p>
                    <div class="line"></div>
                    <br></br>
                </div>
            </div>
        </div>
        <div class="row">
            <!-- Single Advisor-->
            <div class="col-12 col-sm-6 col-lg-4">
                <div class="single_advisor_profile wow fadeInUp" data-wow-delay="0.2s"
                    style="visibility: visible; animation-delay: 0.2s; animation-name: fadeInUp;">
                    <!-- Team Thumb-->
                    <div class="advisor_thumb"><img src="ld11.jpg" width="400" alt="">
                        <!-- Social Info-->
                        <div class="social-info">
                            <h5>50 ฿</h5>
                        </div>
                    </div>
                    <!-- Team Details-->
                    <div class="single_advisor_details_info">
                        <h6>WASHING</h6>
                    </div>
                </div>
            </div>
            <!-- Single Advisor-->
            <div class="col-12 col-sm-6 col-lg-4">
                <div class="single_advisor_profile wow fadeInUp" data-wow-delay="0.4s"
                    style="visibility: visible; animation-delay: 0.4s; animation-name: fadeInUp;">
                    <!-- Team Thumb-->
                    <div class="advisor_thumb"><img src="ld.jpg" width="400" alt="">
                        <!-- Social Info-->
                        <!--<div class="social-info"><a href="#"><i class="fa fa-facebook"></i></a><a href="#"><i class="fa fa-twitter"></i></a><a href="#"><i class="fa fa-linkedin"></i></a></div>
             -->
                        <div class="social-info">
                            <h5>100 ฿</h5>
                        </div>
                    </div>
                    <!-- Team Details-->
                    <div class="single_advisor_details_info">
                        <h6>DRYING</h6>
                    </div>
                </div>
            </div>
            <!-- Single Advisor-->
            <div class="col-12 col-sm-6 col-lg-4">
                <div class="single_advisor_profile wow fadeInUp" data-wow-delay="0.5s"
                    style="visibility: visible; animation-delay: 0.5s; animation-name: fadeInUp;">
                    <!-- Team Thumb-->
                    <div class="advisor_thumb"><img src="ldd22.jpg" width="400" alt="">
                        <!-- Social Info-->
                        <div class="social-info">
                            <h5>150 ฿</h5>
                        </div>
                    </div>
                    <!-- Team Details-->
                    <div class="single_advisor_details_info">
                        <h6>IRONING</h6>
                    </div>
                </div>
            </div>
            <h3>LAUNDRY ORDER</h3>
            <p class="text-white-gray">Dear customers, You can choose 1 type / bill service.</p>
            <br></br>
            <div class="row">
                <div class="col-lg-4">
                    <select class="form-select" aria-label="Disabled select example" name="ldtype">
                        <option selected value="LD0">SELECT LAUNDRY</option>
                        <option value="LD1">WASHING</option>
                        <option value="LD2">DRYING</option>
                        <option value="LD3">IRONING</option>
                    </select>
                </div>
                <div class="col-lg-4">
                    <label for="quantity">Quantity :</label>
                    <input type="number" class="qld" id="quantity" name="quantity_ld" min="1"><br><br>
                </div>
                <div class="col-lg-4">
                    <button type="submit" class="btn btn-primary" value="submit_ld">SUBMIT</button>
                </div>
            </div>
            <br></br>
        </div>
        </form>
    </div>
    <br></br>
    <br></br>
    <style>
    body {
        background-color: whitesmoke;
        font-family: 'Barlow', sans-serif;
        transition: transform .2s;
    }

    .bk {
        padding: 5px;
        color: black;
    }

    .person {
        padding: 5px;
        color: black;
    }

    .qld {
        padding: 5px;
        color: black;
    }

    .btn {
        background-color: #B897F3;
        /* Green */
        border: none;
        color: black;
        padding: 12px 30px;
        text-align: right;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        float: right;
    }

    .mynav a {
        color: white !important;
    }

    .mynav a:hover {
        color: #B897F3 !important;
        border-bottom: 3px solid #B897F3;
    }

    .dropnav a {
        color: black !important;
    }

    .dropnav a:hover {
        color: black !important;
        background-color: rgba(193, 154, 223, 0.4);
        border: none;
    }

    body {
        background-color: whitesmoke;
    }

    body {
        margin-top: 20px;
    }

    body {
        margin-top: 20px;
    }

    /*
Foods menu
*/
    .container h2 {
        padding: 20px;
        border-radius: 8px;
        background-color: lightgrey;
        color: #483D8B;
    }

    .list-timeline {
        margin: 0;
        padding: 5px 0;
        position: relative;
    }

    .list-timeline:before {
        width: 2px;
        position: absolute;
        left: 5px;
        top: 0;
        bottom: 0;
        height: 100%;
        content: '';
    }

    .list-timeline .list-timeline-item {
        margin: 0;
        padding: 0;
        padding-left: 24px !important;
        position: relative;
    }

    .list-timeline .list-timeline-item:before {
        width: 12px;
        height: 12px;
        background: #fff;
        border: 2px solid #483D8B;
        position: absolute;
        left: 0;
        top: 4px;
        content: '';
        border-radius: 100%;
        -webkit-transition: all .3 ease-in-out;
        transition: all .3 ease-in-out;
    }

    .list-timeline .list-timeline-item[data-toggle=collapse] {
        cursor: pointer;
    }

    .list-timeline .list-timeline-item.active:before,
    .list-timeline .list-timeline-item.show:before {
        background: #483D8B;
    }

    .list-timeline.list-timeline-light .list-timeline-item.active:before,
    .list-timeline.list-timeline-light .list-timeline-item.show:before,
    .list-timeline.list-timeline-light:before {
        background: #483D8B;
    }

    .list-timeline .list-timeline-item.list-timeline-item-marker-middle:before {
        top: 50%;
        margin-top: -6px;
    }

    .list-timeline.list-timeline-light .list-timeline-item:before {
        border-color: #483D8B;
    }

    .list-timeline.list-timeline-grey .list-timeline-item.active:before,
    .list-timeline.list-timeline-grey .list-timeline-item.show:before,
    .list-timeline.list-timeline-grey:before {
        background: #483D8B;
    }

    .list-timeline.list-timeline-grey .list-timeline-item:before {
        border-color: #483D8B;
    }

    .list-timeline.list-timeline-grey-dark .list-timeline-item.active:before,
    .list-timeline.list-timeline-grey-dark .list-timeline-item.show:before,
    .list-timeline.list-timeline-grey-dark:before {
        background: #483D8B;
    }

    .list-timeline.list-timeline-grey-dark .list-timeline-item:before {
        border-color: #483D8B;
    }

    .list-timeline.list-timeline-primary .list-timeline-item.active:before,
    .list-timeline.list-timeline-primary .list-timeline-item.show:before,
    .list-timeline.list-timeline-primary:before {
        background: #483D8B;
    }

    .list-timeline.list-timeline-primary .list-timeline-item:before {
        border-color: #483D8B;
    }

    .list-timeline.list-timeline-primary-dark .list-timeline-item.active:before,
    .list-timeline.list-timeline-primary-dark .list-timeline-item.show:before,
    .list-timeline.list-timeline-primary-dark:before {
        background: #483D8B;
    }

    .list-timeline.list-timeline-primary-dark .list-timeline-item:before {
        border-color: #483D8B;
    }

    .list-timeline.list-timeline-primary-faded .list-timeline-item.active:before,
    .list-timeline.list-timeline-primary-faded .list-timeline-item.show:before,
    .list-timeline.list-timeline-primary-faded:before {
        background: #483D8B;
    }

    .list-timeline.list-timeline-primary-faded .list-timeline-item:before {
        border-color: #483D8B;
    }

    .list-timeline.list-timeline-info .list-timeline-item.active:before,
    .list-timeline.list-timeline-info .list-timeline-item.show:before,
    .list-timeline.list-timeline-info:before {
        background: #483D8B;
    }

    .list-timeline.list-timeline-info .list-timeline-item:before {
        border-color: #483D8B;
    }

    .list-timeline.list-timeline-success .list-timeline-item.active:before,
    .list-timeline.list-timeline-success .list-timeline-item.show:before,
    .list-timeline.list-timeline-success:before {
        background: #483D8B;
    }

    .list-timeline.list-timeline-success .list-timeline-item:before {
        border-color: #483D8B;
    }

    .list-timeline.list-timeline-warning .list-timeline-item.active:before,
    .list-timeline.list-timeline-warning .list-timeline-item.show:before,
    .list-timeline.list-timeline-warning:before {
        background: #483D8B;
    }

    .list-timeline.list-timeline-warning .list-timeline-item:before {
        border-color: #483D8B;
    }

    .list-timeline.list-timeline-danger .list-timeline-item.active:before,
    .list-timeline.list-timeline-danger .list-timeline-item.show:before,
    .list-timeline.list-timeline-danger:before {
        background: #483D8B;
    }

    .list-timeline.list-timeline-danger .list-timeline-item:before {
        border-color: #483D8B;
    }

    .list-timeline.list-timeline-dark .list-timeline-item.active:before,
    .list-timeline.list-timeline-dark .list-timeline-item.show:before,
    .list-timeline.list-timeline-dark:before {
        background: #483D8B;
    }

    .list-timeline.list-timeline-dark .list-timeline-item:before {
        border-color: #483D8B;
    }

    .list-timeline.list-timeline-secondary .list-timeline-item.active:before,
    .list-timeline.list-timeline-secondary .list-timeline-item.show:before,
    .list-timeline.list-timeline-secondary:before {
        background: #483D8B;
    }

    .list-timeline.list-timeline-secondary .list-timeline-item:before {
        border-color: #483D8B;
    }

    .list-timeline.list-timeline-black .list-timeline-item.active:before,
    .list-timeline.list-timeline-black .list-timeline-item.show:before,
    .list-timeline.list-timeline-black:before {
        background: #000;
    }

    .list-timeline.list-timeline-black .list-timeline-item:before {
        border-color: #000;
    }

    .list-timeline.list-timeline-white .list-timeline-item.active:before,
    .list-timeline.list-timeline-white .list-timeline-item.show:before,
    .list-timeline.list-timeline-white:before {
        background: #fff;
    }

    .list-timeline.list-timeline-white .list-timeline-item:before {
        border-color: #fff;
    }

    .list-timeline.list-timeline-green .list-timeline-item.active:before,
    .list-timeline.list-timeline-green .list-timeline-item.show:before,
    .list-timeline.list-timeline-green:before {
        background: #483D8B;
    }

    .list-timeline.list-timeline-green .list-timeline-item:before {
        border-color: #483D8B;
    }

    .list-timeline.list-timeline-red .list-timeline-item.active:before,
    .list-timeline.list-timeline-red .list-timeline-item.show:before,
    .list-timeline.list-timeline-red:before {
        background: #483D8B;
    }

    .list-timeline.list-timeline-red .list-timeline-item:before {
        border-color: #483D8B;
    }

    .list-timeline.list-timeline-blue .list-timeline-item.active:before,
    .list-timeline.list-timeline-blue .list-timeline-item.show:before,
    .list-timeline.list-timeline-blue:before {
        background: #483D8B;
    }

    .list-timeline.list-timeline-blue .list-timeline-item:before {
        border-color: #483D8B;
    }

    .list-timeline.list-timeline-purple .list-timeline-item.active:before,
    .list-timeline.list-timeline-purple .list-timeline-item.show:before,
    .list-timeline.list-timeline-purple:before {
        background: #483D8B;
    }

    .list-timeline.list-timeline-purple .list-timeline-item:before {
        border-color: #483D8B;
    }

    .list-timeline.list-timeline-pink .list-timeline-item.active:before,
    .list-timeline.list-timeline-pink .list-timeline-item.show:before,
    .list-timeline.list-timeline-pink:before {
        background: #483D8B;
    }

    .list-timeline.list-timeline-pink .list-timeline-item:before {
        border-color: #483D8B;
    }

    .list-timeline.list-timeline-orange .list-timeline-item.active:before,
    .list-timeline.list-timeline-orange .list-timeline-item.show:before,
    .list-timeline.list-timeline-orange:before {
        background: #483D8B;
    }

    .list-timeline.list-timeline-orange .list-timeline-item:before {
        border-color: #483D8B;
    }

    .list-timeline.list-timeline-lime .list-timeline-item.active:before,
    .list-timeline.list-timeline-lime .list-timeline-item.show:before,
    .list-timeline.list-timeline-lime:before {
        background: #483D8B;
    }

    .list-timeline.list-timeline-lime .list-timeline-item:before {
        border-color: #483D8B;
    }

    .list-timeline.list-timeline-blue-dark .list-timeline-item.active:before,
    .list-timeline.list-timeline-blue-dark .list-timeline-item.show:before,
    .list-timeline.list-timeline-blue-dark:before {
        background: #483D8B;
    }

    .list-timeline.list-timeline-blue-dark .list-timeline-item:before {
        border-color: #483D8B;
    }

    .list-timeline.list-timeline-red-dark .list-timeline-item.active:before,
    .list-timeline.list-timeline-red-dark .list-timeline-item.show:before,
    .list-timeline.list-timeline-red-dark:before {
        background: #483D8B;
    }

    .list-timeline.list-timeline-red-dark .list-timeline-item:before {
        border-color: #483D8B;
    }

    .list-timeline.list-timeline-brown .list-timeline-item.active:before,
    .list-timeline.list-timeline-brown .list-timeline-item.show:before,
    .list-timeline.list-timeline-brown:before {
        background: #483D8B;
    }

    .list-timeline.list-timeline-brown .list-timeline-item:before {
        border-color: #483D8B;
    }

    .list-timeline.list-timeline-cyan-dark .list-timeline-item.active:before,
    .list-timeline.list-timeline-cyan-dark .list-timeline-item.show:before,
    .list-timeline.list-timeline-cyan-dark:before {
        background: #008b8b
    }

    .list-timeline.list-timeline-cyan-dark .list-timeline-item:before {
        border-color: #008b8b
    }

    .list-timeline.list-timeline-yellow .list-timeline-item.active:before,
    .list-timeline.list-timeline-yellow .list-timeline-item.show:before,
    .list-timeline.list-timeline-yellow:before {
        background: #D4AC0D
    }

    .list-timeline.list-timeline-yellow .list-timeline-item:before {
        border-color: #D4AC0D
    }

    .list-timeline.list-timeline-slate .list-timeline-item.active:before,
    .list-timeline.list-timeline-slate .list-timeline-item.show:before,
    .list-timeline.list-timeline-slate:before {
        background: #5D6D7E
    }

    .list-timeline.list-timeline-slate .list-timeline-item:before {
        border-color: #5D6D7E
    }

    .list-timeline.list-timeline-olive .list-timeline-item.active:before,
    .list-timeline.list-timeline-olive .list-timeline-item.show:before,
    .list-timeline.list-timeline-olive:before {
        background: olive
    }

    .list-timeline.list-timeline-olive .list-timeline-item:before {
        border-color: olive
    }

    .list-timeline.list-timeline-teal .list-timeline-item.active:before,
    .list-timeline.list-timeline-teal .list-timeline-item.show:before,
    .list-timeline.list-timeline-teal:before {
        background: teal
    }

    .list-timeline.list-timeline-teal .list-timeline-item:before {
        border-color: teal
    }

    .list-timeline.list-timeline-green-bright .list-timeline-item.active:before,
    .list-timeline.list-timeline-green-bright .list-timeline-item.show:before,
    .list-timeline.list-timeline-green-bright:before {
        background: #2ECC71
    }

    .list-timeline.list-timeline-green-bright .list-timeline-item:before {
        border-color: #2ECC71
    }

    .single_advisor_profile {
        position: relative;
        margin-bottom: 50px;
        -webkit-transition-duration: 500ms;
        transition-duration: 500ms;
        z-index: 1;
        border-radius: 15px;
        -webkit-box-shadow: 0 0.25rem 1rem 0 rgba(47, 91, 234, 0.125);
        box-shadow: 0 0.25rem 1rem 0 rgba(47, 91, 234, 0.125);
    }

    .single_advisor_profile .advisor_thumb {
        position: relative;
        z-index: 1;
        border-radius: 15px 15px 0 0;
        height: 380px;
        margin: 0 auto;
        padding: 30px 30px 0 30px;
        background-color: #B897F3;
        overflow: hidden;
    }

    .single_advisor_profile .advisor_thumb::after {
        -webkit-transition-duration: 500ms;
        transition-duration: 500ms;
        position: absolute;
        width: 150%;
        height: 80px;
        bottom: -45px;
        left: -25%;
        content: "";
        background-color: #ffffff;
        -webkit-transform: rotate(-15deg);
        transform: rotate(-15deg);
    }

    @media only screen and (max-width: 575px) {
        .single_advisor_profile .advisor_thumb::after {
            height: 160px;
            bottom: -90px;
        }
    }

    .single_advisor_profile .advisor_thumb .social-info {
        position: absolute;
        z-index: 1;
        width: 100%;
        bottom: 0;
        right: 30px;
        text-align: right;
    }

    .single_advisor_profile .advisor_thumb .social-info h5 {
        font-size: 16px;
        color: #020710;
    }

    .single_advisor_profile .advisor_thumb .social-info h5:hover,
    .single_advisor_profile .advisor_thumb .social-info h5:focus {
        color: #3f43fd;
    }

    .single_advisor_profile .advisor_thumb .social-info h5:last-child {
        padding-right: 0;
    }

    .single_advisor_profile .single_advisor_details_info {
        position: relative;
        z-index: 1;
        padding: 30px;
        text-align: right;
        -webkit-transition-duration: 500ms;
        transition-duration: 500ms;
        border-radius: 0 0 15px 15px;
        background-color: #ffffff;

    }

    .single_advisor_profile .single_advisor_details_info::after {
        -webkit-transition-duration: 500ms;
        transition-duration: 500ms;
        position: absolute;
        z-index: 1;
        width: 50px;
        height: 3px;
        background-color: #B897F3;
        content: "";
        top: 12px;
        right: 30px;
        font-weight: bold;
    }

    .single_advisor_profile .single_advisor_details_info h6 {
        margin-bottom: 0.25rem;
        -webkit-transition-duration: 500ms;
        transition-duration: 500ms;
        font-weight: bold;
    }

    @media only screen and (min-width: 768px) and (max-width: 991px) {
        .single_advisor_profile .single_advisor_details_info h6 {
            font-size: 16px;
            font-weight: bold;
        }
    }

    .single_advisor_profile:hover .advisor_thumb::after,
    .single_advisor_profile:focus .advisor_thumb::after {
        background-color: #483D8B;
    }

    .single_advisor_profile:hover .advisor_thumb .social-info h5,
    .single_advisor_profile:focus .advisor_thumb .social-info h5 {
        color: #ffffff;
    }

    .single_advisor_profile:hover .advisor_thumb .social-info h5:hover,
    .single_advisor_profile:hover .advisor_thumb .social-info h5:focus,
    .single_advisor_profile:focus .advisor_thumb .social-info h5:hover,
    .single_advisor_profile:focus .advisor_thumb .social-info h5:focus {
        color: #ffffff;
    }

    .single_advisor_profile:hover .single_advisor_details_info,
    .single_advisor_profile:focus .single_advisor_details_info {
        background-color: #483D8B;
        font-weight: bold;
    }

    .single_advisor_profile:hover .single_advisor_details_info::after,
    .single_advisor_profile:focus .single_advisor_details_info::after {
        background-color: #ffffff;
        font-weight: bold;
    }

    .single_advisor_profile:hover .single_advisor_details_info h6,
    .single_advisor_profile:focus .single_advisor_details_info h6 {
        color: #ffffff;
        font-weight: bold;
    }

    .food-menu-card {
        padding: 30px 20px;
        background-color: black;
        border-radius: 8px;
    }

    .food-menu-card .media {
        margin-bottom: 30px;
    }

    .food-menu-card .media .img-fluid {
        border-radius: 3px;
        width: 150px;
    }

    .food-menu-card .media .d-flex {
        position: relative;
    }

    .food-menu-card .media .d-flex:before {
        content: "";
        position: absolute;
        left: auto;
        right: 0;
        width: 100%;
        height: 1px;
        background-color: rgba(255, 255, 255, 0.2);
        top: 50%;
    }

    .food-menu-card .media h3 {
        position: relative;
        display: inline-block;
        margin-bottom: 0;
        background-color: #000;
        z-index: 2;
    }

    .food-menu-card .media strong {
        background-color: #000;
        display: block;
        padding-left: 15px;
        z-index: 2;
        position: relative;
    }

    .tabs-menu-nav>li>h1 {
        color: #fff;
        display: block;
        font-size: 20px;
        border-bottom: 3px solid transparent;
        opacity: 0.5;
        opacity: 1;
        border-bottom-color: #B897F3;
    }

    .media-body,
    p {
        color: #999;
    }
    </style>
    <script src="js/bootstrap.min.js"></script>
</body>

</html>