<?php
	session_start();
	require_once('utils/utility.php');
	require_once('database/dbhelper.php');

	$sql = "select * from Category";
	$menuItems = executeResult($sql);

    $user = getUserToken();
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Dolphin Books</title>
    <link rel="icon" href="assets/image/Dolphin.png" />
    <link rel="stylesheet" href="assets/fontawesome-pro-5.15.3-web/css/all.min.css" />

    <!-- Font -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />

    <link
        href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400;0,500;0,600;0,700;1,400;1,500;1,600;1,700&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;1,100;1,300;1,400;1,500&display=swap"
        rel="stylesheet">

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" />

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/spanopper.js/1.16.0/umd/spanopper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

    <!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.1/font/bootstrap-icons.css"> -->

    <link rel="stylesheet" href="assets/css/home.css" />
</head>

<body>
    <div class="container">
        <!-- Header -->

        <?php
            if(!isset($_SESSION['cart'])) {
                $_SESSION['cart'] = [];
            }
            $count = 0;
            // var_dump($_SESSION['cart']);
            foreach($_SESSION['cart'] as $item) {
                $count += $item['num'];
            }
        ?>

        <div class="header">
            <div class="left">
                <div class="list">
                    <a href=".">Home</a>
                    <a href="category.php?id=7">Category</a>
                    <a href="contact.php">Contact</a>
                    <a href="">About</a>
                </div>
            </div>
            <div class="center">
                <a href="index.php">
                    <img src="assets/image/Logo.png" alt="logo" />
                </a>
            </div>
            <div class="right">
                <div class="list-right">
                    <div class="search">
                        <input type="text" placeholder="Search book or author..." class="form-control" />
                        <i class="far fa-search"></i>
                    </div>
                    <div class="cart">
                        <a href="cart.php">
                            <i class="far fa-shopping-cart"></i>
                        </a>
                        <div class="cart-count"><?=$count?></div>
                    </div>

                    <?php 
                    
                    if($user == null) {
                        echo '
                            <div class="signin">
                                <a href="auth/login.php">Sign In</a>
                            </div>
                        ';
                    } else {
                        echo '
                            <div class="signin">
                                <a href="auth/logout.php">Log out</a>
                            </div>
                        ';
                    }

                    ?>

                </div>
            </div>
        </div>

        <!-- end Header -->