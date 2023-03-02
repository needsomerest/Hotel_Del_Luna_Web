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

    <div class="box9">Add hotel detail</div>

    <section class="row justify-content-center">
        <section class="col-6 col-sm-6 col-md-6">
            <section class="form-container">
                <form class="row g-5" action="confirmhotel.php" method="POST">

                    <div class="col-auto">
                        <label for="bno" class="form-label">Branch No :</label>
                        <input type="text" name="bno" class="form-control" id="bno">
                    </div>
                    <div class="col-auto">
                        <label for="bname" class="form-label">Branch Name :</label>
                        <input type="text" name="bname" class="form-control" id="bname">
                    </div>
                    <div class="col-auto">
                        <label for="add" class="form-label">Address :</label>
                        <input type="text" name="add" class="form-control" id="add">
                    </div>
                    <div class="col-auto">
                        <label for="btel" class="form-labeln">Branch Tel :</label>
                        <input type="tel" name="btel" class="form-control" id="btel" placeholder="(000) 000-00"
                            pattern="[0-9]{3}-[0-9]{3}-[0-9]{2}">
                        <small id="stel" class="form-text text-muted">Please enter a valid phone number.</small>
                    </div>

                    <div class="box16">
                        <input type="submit" value="Submit" class="btn btn-success">
                    </div>

                </form>
            </section>
        </section>
    </section>
</body>

</html>

<style>
body{
            background-color:whitesmoke;
            font-family:'Barlow',sans-serif;
            transition: transform .2s;
        }

#bg1 {
    width: 100%;
}

.box9 {
    background-color: #5F4A6F;
    color: white;
    padding: 10px 10px;
    font-style: normal;
    font-weight: normal;
    font-size: 24px;
    line-height: 28px;
    text-align: center;
    border-radius: 5px;
    margin: 3px;
    height: 50px;
    width: 300px;
    position: relative;
    top: 40px;
    left: 90px;
    box-shadow: 4px 8px 16px 4px rgba(0, 0, 0, 0.3);
}

.box10 {
    background-color: #5F4A6F;
    color: white;
    padding: 10px 10px;
    font-style: normal;
    font-weight: normal;
    font-size: 24px;
    line-height: 28px;
    text-align: center;
    border-radius: 5px;
    margin: 3px;
    height: 50px;
    width: 300px;
    position: relative;
    top: 190px;
    left: 90px;
    box-shadow: 0px 0px 25px 5px rgba(0, 0, 0, 0.45);
}

.box11 {
    background-color: #5F4A6F;
    color: white;
    padding: 10px 10px;
    font-style: normal;
    font-weight: normal;
    font-size: 24px;
    line-height: 28px;
    text-align: center;
    border-radius: 5px;
    margin: 3px;
    height: 50px;
    width: 300px;
    position: relative;
    top: 300px;
    left: 90px;
    box-shadow: 0px 0px 25px 5px rgba(0, 0, 0, 0.45);
}

.form-container {
    position: relative;
    top: 15vh;
    left: 10vh;
    background: #fff;

    padding: 30px;
    border-radius: 10px;
    box-shadow: 0px 0px 25px 5px rgba(0, 0, 0, 0.1);

}

.form-container1 {
    position: relative;
    top: 35vh;
    left: 10vh;
    background: #fff;

    padding: 30px;
    border-radius: 10px;
    box-shadow: 0px 0px 25px 5px rgba(0, 0, 0, 0.45);


}

.form-container2 {
    position: relative;
    top: 55vh;
    left: 10vh;
    background: #fff;

    padding: 30px;
    border-radius: 10px;
    box-shadow: 0px 0px 10px 5px rgba(10, 0, 0, 0.45);


}

.box16 {

    position: relative;
    bottom: 0px;
    left: 0px;
}
</style>