<?php
	session_start();

	$title = "User Editing";
	$baseUrl = "../";

	require_once($baseUrl."../utils/utility.php");
	require_once($baseUrl."../database/dbhelper.php");

    $user = getUserToken();
	if($user == null) {
		header("Location: ".$baseUrl."auth/login.php");
		die();
	}

	$id = $thumbnail = $title = $price = $discount = $num_product = $category_id = $description = '';
	require_once('form_save.php');

	$id = getGet('id');
	if($id != '' && $id > 0) {
		$sql = "select * from Product where id = '$id' and deleted = 0";
		$userItem = executeResult($sql, true);
		if($userItem != null) {
			$thumbnail = $userItem['thumbnail'];
			$title = $userItem['title'];
			$author = $userItem['author'];
			$price = $userItem['price'];
			$discount = $userItem['discount'];
			$num_product = $userItem['num_product'];
			$category_id = $userItem['category_id'];
			$description = $userItem['description'];
		} else {
			$id = 0;
		}
	} else {
		$id = 0;
	}

	$sql = "select * from Category";
	$categoryItems = executeResult($sql);
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
                        <i class="fas fa-columns"></i>
                        Dashboard
                    </a>
                </div>
                <div class="item">
                    <a href="<?=$baseUrl?>category">
                        <i class="fas fa-layer-group"></i>
                        Categories
                    </a>
                </div>
                <div class="item">
                    <a class="active" href="<?=$baseUrl?>product">
                        <i class="fab fa-buffer"></i>
                        Products
                    </a>
                </div>
                <div class="item">
                    <a href="<?=$baseUrl?>order">
                        <i class="fas fa-hashtag"></i>
                        Orders
                    </a>
                </div>
                <div class="item">
                    <a href="<?=$baseUrl?>feedback">
                        <i class="fas fa-question-circle"></i>
                        Feedbacks
                    </a>
                </div>
                <div class="item">
                    <a href="<?=$baseUrl?>user">
                        <i class="fas fa-users"></i>
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
                    Add/Edit Product
                </div>
                <div class="main">
                    <div class="box">
                        <form method="post" enctype="multipart/form-data">
                            <div class="form-group">
                                <label for="usr">Title:</label>
                                <input required="true" type="text" class="form-control" id="usr" name="title"
                                    value="<?=$title?>">
                                <input type="text" name="id" value="<?=$id?>" hidden="true">
                            </div>
                            <div class="form-group">
                                <label for="author">Author:</label>
                                <input required="true" type="text" class="form-control" id="author" name="author"
                                    value="<?=$author?>">
                            </div>
                            <div class="form-group">
                                <label for="pwd">Descriptions:</label>
                                <textarea class="form-control" rows="10" name="description"
                                    id="description"><?=$description?></textarea>
                            </div>
                            <div class="form-group">
                                <label for="thumbnail">Thumbnail:</label>
                                <input type="text" class="form-control" id="thumbnail" name="thumbnail"
                                    onchange="updateThumbnail()">
                                <img class="book_img" id="thumbnail_img" src="<?=fixUrl($thumbnail)?>">
                            </div>
                            <div class="form-group">
                                <label for="usr">Category:</label>
                                <select class="form-control" name="category_id" id="category_id" required="true">
                                    <option value="">-- List --</option>
                                    <?php
						  		foreach($categoryItems as $item) {
						  			if($item['id'] == $category_id) {
						  				echo '<option selected value="'.$item['id'].'">'.$item['name'].'</option>';
						  			} else {
						  				echo '<option value="'.$item['id'].'">'.$item['name'].'</option>';
						  			}
						  		}
						  	?>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="price">Price:</label>
                                <input required="true" type="text" class="form-control" id="price" name="price"
                                    value="<?=$price?>">
                            </div>
                            <div class="form-group">
                                <label for="discount">Discount:</label>
                                <input required="true" type="text" class="form-control" id="discount" name="discount"
                                    value="<?=$discount?>">
                            </div>
                            <div class="form-group">
                                <label for="price">Number:</label>
                                <input required="true" type="number" class="form-control" id="num_product"
                                    name="num_product" value="<?=$num_product?>">
                            </div>
                            <div class="button">
                                <button class="btn btn-success">Save</button>
                                <div class="cancel">
                                    <a href="<?=$baseUrl?>product">Cancel</a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
    function updateThumbnail() {
        $('#thumbnail_img').attr('src', $('#thumbnail').val())
    }
    </script>
</body>

</html>