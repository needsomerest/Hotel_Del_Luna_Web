<?php
    require_once('dbconnect.php');
?>
<!DOCTYPE html>
<html>

<head>
    <title>Payment | Hotel Del Luna</title>
    <link rel="icon" href="mn.png" type="image/x-icon">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"
        integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
</head>
<style>
body {
    background-color: whitesmoke;
    font-family: 'Barlow', sans-serif !important;
    transition: transform .2s;
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
    background: #f5f5f5
}

.rounded {
    border-radius: 1rem
}

.nav-pills .nav-link {
    color: #555
}

.nav-pills .nav-link.active {
    color: white
}

input[type="radio"] {
    margin-right: 5px
}

.bold {
    font-weight: bold
}

body {
    background-color: #eee
}

.card {
    width: 340px;
    border-radius: 35px;
    background-color: #fff;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)
}

.total-amount {
    font-size: 22px;
    font-weight: 700;
    color: #383737
}

.amount-container {
    background-color: #e9eaeb;
    padding: 6px;
    padding-left: 15px;
    padding-right: 15px;
    border-radius: 8px
}

.amount-text {
    font-size: 20px;
    font-weight: 700;
    color: #673AB7
}

.dollar-sign {
    font-size: 20px;
    font-weight: 700;
    color: #000
}

.label-text {
    font-size: 16px;
    font-weight: 600;
    color: #b2b2b2
}

.credit-card-number {
    width: 290px;
    z-index: 28;
    border: 2px solid #ced4da;
    border-radius: 6px;
    font-weight: 600
}

.credit-card-number:focus {
    box-shadow: none;
    border: 2px solid #673AB7
}

.visa-icon {
    position: relative;
    top: 42px;
    right: 14px;
    z-index: 30
}

.expiry-class {
    width: 120px;
    border: 2px solid #ced4da;
    font-weight: 600;
    font-size: 12px;
    height: 48px
}

.expiry-class:focus {
    box-shadow: none;
    border: 2px solid #673AB7
}

.cvv-class {
    width: 120px;
    border: 2px solid #ced4da;
    font-weight: 600;
    font-size: 12px;
    height: 48px
}

.cvv-class:focus {
    box-shadow: none;
    border: 2px solid #673AB7
}

.payment-btn {
    background-color: #673AB7;
    padding: 15px;
    padding-left: 25px;
    padding-right: 25px;
    color: #fff;
    font-weight: 600;
    border-radius: 12px
}

.payment-btn:hover {
    box-shadow: none;
    color: #fff
}

.cancel-btn {
    background-color: #fff;
    color: #b2b2b2;
    padding: 0px;
    padding-top: 3px;
    padding-bottom: 3px;
    font-weight: 600;
    border-radius: 6px
}

.cancel-btn:hover {
    border: 2px solid #b2b2b2;
    color: #b2b2b2
}

.cancel-btn:focus {
    box-shadow: none
}

.label-text-cc-number {
    position: relative;
    top: 4px
}
</style>

<body>
    <script>
    (function() {
        $('[data-toggle="tooltip"]').tooltip()
    }) $
    </script>
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
                        <a class="nav-link" href="home.php"
                            style="margin-right: 20px;">OUR HOTELS</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="promotions5.php" style="margin-right: 20px;">PROMOTIONS</a>
                    </li>
                    <li class="nav-item active">
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
                        <a class="nav-link" href="bill_payment.php" style="margin-right: 20px;font-weight: bold; color:  #B897F3 !important;">MY BOOKING</a>

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
    <div class="container mt-5 d-flex justify-content-center">
        <div class="card p-4">
            <div class="d-flex justify-content-between align-items-center">
                <h5 class="total-amount">BILL PAYMENT</h5>
            </div>
            <form method="post" action="insert.php">
                <div class="pt-4"> <label class="d-flex justify-content-between"> <span
                            class="label-text label-text-cc-number">Customer ID</span></label><br>
                    <input type="text" name="customerID" placeholder="13 digits">
                    <br>
                    <div class="pt-4"> <label class="d-flex justify-content-between"> <span
                                class="label-text label-text-cc-number">Card Number</span></label><br>
                        <input type="text" name="Card_number" placeholder="13 digits">
                        <br>
                        <div class="pt-4"> <label class="d-flex justify-content-between"> <span
                                    class="label-text label-text-cc-number">Expiry</span></label><br>
                            <input type="text" name="Expiry" placeholder="YYYY-MM-DD">
                            <br>
                            <div class="pt-4"> <label class="d-flex justify-content-between"> <span
                                        class="label-text label-text-cc-number">CVV</span></label><br>
                                <input type="text" name="CCV" placeholder="XXX">
                                <br><br>
                                <div class="d-flex justify-content-between pt-2 align-items-center"> <a
                                        href="bill_payment.php"><button type="button"
                                            class="btn cancel-btn">Back</button></a>
                                    <button type="submit" value="submit" name="save"
                                        class="btn payment-btn">Payment</button></a>
                                </div>
            </form>


        </div>
    </div>
    </style>
    <script src="js/bootstrap.min.js"></script>
</body>

</html>