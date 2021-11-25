<?php
	session_start();

	$title = "Order Management";
	$baseUrl = "../";

	require_once($baseUrl."../utils/utility.php");
	require_once($baseUrl."../database/dbhelper.php");

    $user = getUserToken();
	if($user == null) {
		header("Location: ".$baseUrl."auth/login.php");
		die();
	}

    $sql = "select * from Orders order by status asc, order_date desc";
	$data = executeResult($sql);
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
                        <a href="<?=$baseUrl?>../auth/logout.php"><i class="far fa-sign-out"></i></a>
                    </div>
                </div>
                <div class="title">
                    Order
                </div>
                <div class="main">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Fullname</th>
                                <th>Email</th>
                                <th>Phone number</th>
                                <th>Address</th>
                                <th>Content</th>
                                <th>Total</th>
                                <th>Date created</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                                $index = 0;
                                foreach($data as $item) {
                                    echo '<tr>
                                                <th>'.(++$index).'</th>
                                                <td>'.$item['fullname'].'</a></td>
                                                <td>'.$item['phone_number'].'</a></td>
                                                <td>'.$item['email'].'</a></td>
                                                <td>'.$item['address'].'</td>
                                                <td>'.$item['note'].'</td>
                                                <td>'.$item['total_money'].'</td>
                                                <td>'.$item['order_date'].'</td>
                                                <td style="width: 50px">';
                                    if($item['status'] == 0) {
                                        echo '
                                            <div class="button-box">
                                                <button onclick="changeStatus('.$item['id'].', 1)" class="btn btn-edit">
                                                    <i class="fad fa-box-check"></i>
                                                </button>
                                                <button onclick="changeStatus('.$item['id'].', 2)"  class="btn btn-delete">
                                                    <i class="fad fa-ban"></i>
                                                </button>
                                                <a href="detail.php?id='.$item['id'].'">
                                                <button onclick="markRead('.$item['id'].')" class="btn btn-read">
                                                    <i class="fad fa-eye"></i>
                                                </button></a>
                                            </div>';
                                    } else if($item['status'] == 1) {
                                        echo '
                                            <div class="button-box">
                                                <label class="btn btn-edit">
                                                    <i class="fad fa-box-check"></i>
                                                </label>
                                                <a href="detail.php?id='.$item['id'].'">
                                                <button onclick="markRead('.$item['id'].')" class="btn btn-read">
                                                    <i class="fad fa-eye"></i>
                                                </button></a>
                                            </div>';
                                    } else {
                                        echo '
                                            <div class="button-box">
                                                <label class="btn btn-delete">
                                                    <i class="fad fa-ban"></i>
                                                </label>
                                                <a href="detail.php?id='.$item['id'].'">
                                                <button onclick="markRead('.$item['id'].')" class="btn btn-read">
                                                    <i class="fad fa-eye"></i>
                                                </button>
                                            </div>';
                                    }
                                    echo '</td>
                                            </tr>';
                                }
                            ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
    function changeStatus(id, status) {
        $.post('form_api.php', {
            'id': id,
            'status': status,
            'action': 'update_status'
        }, function(data) {
            location.reload()
        })
    }
    </script>

</body>

</html>