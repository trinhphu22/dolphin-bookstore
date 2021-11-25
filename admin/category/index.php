<?php
	session_start();

	$title = "Category Management";
	$baseUrl = "../";

	require_once($baseUrl."../utils/utility.php");
	require_once($baseUrl."../database/dbhelper.php");

    $user = getUserToken();
	if($user == null) {
		header("Location: ".$baseUrl."auth/login.php");
		die();
	}
    
	require_once('form_save.php');
	$id = $name = '';
	if(isset($_GET['id'])) {
		$id = getGet('id');
		$sql = "select * from Category where id = $id";
		$data = executeResult($sql, true);

		if($data != null) {
			$name = $data['name'];
		}
	}

	$sql = "select * from Category";
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
                    <a class="active" href="<?=$baseUrl?>category">
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
                    <a href="<?=$baseUrl?>order">
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
                    Categories
                </div>
                <div class="main">
                    <div class="box-small">
                        <form method="post" action="index.php" onsubmit="return validateForm();">
                            <div class="form-group">
                                <label for="usr" style="font-weight: bold;">Category:</label>
                                <input required="true" type="text" class="form-control" id="usr" name="name"
                                    value="<?=$name?>">
                                <input type="text" name="id" value="<?=$id?>" hidden="true">
                            </div>
                            <button class="add">Add</button>
                        </form>
                    </div>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Category</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                                $index = 0;
                                foreach($data as $item) {
                                    echo '<tr>
                                                <th>'.(++$index).'</th>
                                                <td>'.$item['name'].'</td>
                                                <td>
                                                    <a class="edit" href="?id='.$item['id'].'"><button class="btn btn-edit">
                                                        <i class="far fa-edit"></i>
                                                    </button></a>
                                                    <button onclick="deleteCategory('.$item['id'].')" class="btn btn-delete">
                                                        <i class="far fa-trash"></i>
                                                    </button>
                                                </td>
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
    function deleteCategory(id) {
        option = confirm("Are you sure you want to delete this product category?")
        if (!option) return;

        $.post('form_api.php', {
            'id': id,
            'action': 'delete'
        }, function(data) {
            if (data != null && data != '') {
                alert(data);
                return;
            }
            location.reload()
        })
    }
    </script>
</body>

</html>