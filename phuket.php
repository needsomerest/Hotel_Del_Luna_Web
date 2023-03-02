<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Phuket</title>
    <link rel="icon" href="mn.png" type="image/x-icon">
    <link rel="stylesheet" href="css\bootstrap.min.css">
    <link rel="stylesheet" href="booking_1.css">
    <style>
    body {
        background-color: whitesmoke;
        font-family: 'Barlow', sans-serif;
        transition: transform .2s;
    }

    .mynav a {
        color: white !important;
    }

    .mynav a:hover {
        color: #b897f3 !important;
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

    .img {
        width: 200%;
        height: auto;

    }

    .banner_area .bg-parallax {
        background: url("pk-2.jpg") no-repeat scroll center 0/cover;
        opacity: 0.70;
    }
    </style>
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
                        <a class="nav-link" href="food.php" style="margin-right: 20px;">SERVICES</a>
                    </li>
                    <li class="nav-item active dropdown">
                        <a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-bs-toggle="dropdown"
                            aria-expanded="false"
                            style="margin-right: 20px;font-weight: bold; color:  #B897F3 !important;" href="#">
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

    <!---------Main site --------->
    <section class="banner_area">
        <div class="booking_table d_flex align-items-center">
            <div class="overlay bg-parallax" data-stellar-ratio="0.9" data-stellar-vertical-offset="0"
                data-background=""></div>
            <div class="container">
                <div class="banner_content text-center">
                    <h6>Spice up your life</h6>
                    <h2>Phuket</h2>
                    <p>Living like on the moon with Delluna,<br>conjure up relaxation like magic.</p>
                </div>
            </div>
        </div>

        <div class="hotel_booking_area position">
            <div class="container">
                <div class="hotel_booking_table shadow-lg">
                    <div class="col-md-3">
                        <h2>Book<br> Your Room</h2>
                    </div>
                    <form action="bookthebook.php" method="post">
                        <div class="row row-cols-auto">
                            <div class="col">
                                <label for="bk-branch">Branch</label>
                                <div class="book_tabel_item">
                                    <div class="form-group">
                                        <select class="form-control" name="branch">
                                            <option value="D0000">----</option>
                                            <option value="D0001">BANGKOK</option>
                                            <option value="D0002">CHIANG-MAI</option>
                                            <option value="D0003">PATTAYA</option>
                                            <option value="D0004">PHUKET</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col">
                                <label for="bk-checkin">Check in</label>
                                <div class="book_tabel_item">
                                    <div class="form-group">
                                        <input class="form-control" type="date" required="required"
                                            placeholder="Check in" name="dchkin">
                                    </div>
                                </div>
                            </div>
                            <div class="col">
                                <label for="bk-checkout">Check out</label>
                                <div class="book_tabel_item">
                                    <div class="form-group">
                                        <input class="form-control" type="date" required="required"
                                            placeholder="Check out" name="dchkout">
                                    </div>
                                </div>
                            </div>
                            <div class="col">
                                <label for="bk-room">Room</label>
                                <div class="book_tabel_item">
                                    <div class="form-group">
                                        <select class="form-control" name="nroom">
                                            <option>0</option>
                                            <option>1</option>
                                            <option>2</option>
                                            <option>3</option>
                                            <option>4</option>
                                            <option>5</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col">
                                <label for="bk-room">Adult</label>
                                <div class="book_tabel_item">
                                    <div class="form-group">
                                        <select class="form-control" name="nadult">
                                            <option>0</option>
                                            <option>1</option>
                                            <option>2</option>
                                            <option>3</option>
                                            <option>4</option>
                                            <option>5</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col">
                                <label for="bk-room">Child</label>
                                <div class="book_tabel_item">
                                    <div class="form-group">
                                        <select class="form-control" name="nchild">
                                            <option>0</option>
                                            <option>1</option>
                                            <option>2</option>
                                            <option>3</option>
                                            <option>4</option>
                                            <option>5</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col">
                                <label> </label>
                                <button class="book_now_btn button_hover" type="submit">Search</button>
                                <!--a class="book_now_btn button_hover" href="book.php">Search</!--a-->
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        </div>
    </section>


    <!-- Topic Cards -->

    <div id="cards_landscape_wrap-2">
        <div class="container">
            <h2 class="font-weight-bold" style="padding-top: 50px ; padding-bottom: none;font-weight: bold;">OUR HOTELS
            </h2>
            <div class="row">
                <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                    <a href="bangkok.php">
                        <div class="card-flyer">
                            <div class="text-box">
                                <div class="image-box">
                                    <img src="bk.png" alt="" />
                                </div>
                                <div class="text-container">
                                    <h6>BANGKOK</h6>
                                    <p>Lorem ipsum dolor sit ametolase adipisicing elit. Doloremque esse similique
                                        ratione nesciunt!</p>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                    <a href="chiangmai.php">
                        <div class="card-flyer">
                            <div class="text-box">
                                <div class="image-box">
                                    <img src="cm.png" alt="" />
                                </div>
                                <div class="text-container">
                                    <h6>CHIANG-MAI</h6>
                                    <p>Lorem ipsum dolor cosecetur adipisicing elit. Culpa nam dolorem rem minima dicta
                                        amet.</p>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                    <a href="pattaya.php">
                        <div class="card-flyer">
                            <div class="text-box">
                                <div class="image-box">
                                    <img src="pt.png" alt="" />
                                </div>

                                <div class="text-container">
                                    <h6>PATTAYA</h6>
                                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Suscipit eius cupiditate
                                        porro dolor iusto?</p>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                    <a href="phuket.php">
                        <div class="card-flyer">
                            <div class="text-box">
                                <div class="image-box">
                                    <img src="pk.png" alt="" />
                                </div>
                                <div class="text-container">
                                    <h6>PHUKET</h6>
                                    <p>Lorem ipsum dolor sit ame tetur adipisicing elit. Nulla repudiandae et,
                                        temporibus modi magnam.</p>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>

    <script src="js/bootstrap.min.js"></script>
</body>

</html>