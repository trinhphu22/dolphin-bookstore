<?php
	session_start();

	$title = "Order Information";
	$baseUrl = "../";

	require_once($baseUrl."../utils/utility.php");
	require_once($baseUrl."../database/dbhelper.php");

    $user = getUserToken();
	if($user == null) {
		header("Location: ".$baseUrl."auth/login.php");
		die();
	}

	$orderId = getGet('id');

	$sql = "select Order_Details.*, Product.title, Product.thumbnail from Order_Details left join Product on Product.id = Order_Details.product_id where Order_Details.order_id = $orderId";
	$data = executeResult($sql);

	$sql = "select * from Orders where id = $orderId";
	$orderItem = executeResult($sql, true);
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?=$title?></title>
    <link rel="icon" type="image/png" href="<?=$baseUrl?>../assets/image/Dolphin.png" />
    <link rel="stylesheet" href="<?=$baseUrl?>../assets/css/dashboard.css">
    <link rel="stylesheet" href="<?=$baseUrl?>../assets/fontawesome-pro-5.15.3-web/css/all.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>

<body>
    <div class="container">
        <div class="left">
            <div class="logo">
                <img src="<?=$baseUrl?>../assets/image/Logo.png" alt="">
            </div>
            <div class="list">
                <div class="item">
                    <a href="<?=$baseUrl?>">
                        <i class="far fa-columns"></i>
                        Dashboard
                    </a>
                </div>
                <div class="item">
                    <a href="<?=$baseUrl?>category">
                        <i class="fad fa-layer-group"></i>
                        Categories
                    </a>
                </div>
                <div class="item">
                    <a href="<?=$baseUrl?>product">
                        <i class="fab fa-buffer"></i>
                        Product
                    </a>
                </div>
                <div class="item">
                    <a class="active" href="<?=$baseUrl?>order">
                        <i class="far fa-hashtag"></i>
                        Order
                    </a>
                </div>
                <div class="item">
                    <a href="<?=$baseUrl?>feedback">
                        <i class="far fa-question-circle"></i>
                        Feedback
                    </a>
                </div>
                <div class="item">
                    <a href="<?=$baseUrl?>user">
                        <i class="far fa-users"></i>
                        Users
                    </a>
                </div>
            </div>
        </div>
        <div class="right">
            <div class="card">
                <div class="header">
                    <img src="<?=$baseUrl?>../assets/image/Avatar.jpeg" alt="">
                    <div class="logout">
                        <a href="<?=$baseUrl?>auth/logout.php"><i class="far fa-sign-out"></i></a>
                    </div>
                </div>
                <div class="title">
                    Order details
                </div>
                <div class="main">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Book</th>
                                <th>Title</th>
                                <th>Price</th>
                                <th>Number</th>
                                <th>Total</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $index = 0;
                            foreach($data as $item) {
                                echo '<tr>
                                            <th>'.(++$index).'</th>
                                            <td><img src="'.fixUrl($item['thumbnail']).'" style="height: 120px"/></td>
                                            <td>'.$item['title'].'</td>
                                            <td>'.$item['price'].'</td>
                                            <td>'.$item['num'].'</td>
                                            <td>'.$item['total_money'].'</td>
                                        </tr>';
                            }
                        ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

</body>

</html>