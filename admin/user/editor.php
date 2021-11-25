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

    $id = $msg = $fullname = $email = $phone_number = $address = $role_id = '';
	require_once('form_save.php');

	$id = getGet('id');
	if($id != '' && $id > 0) {
		$sql = "select * from User where id = '$id'";
		$userItem = executeResult($sql, true);
		if($userItem != null) {
			$fullname = $userItem['fullname'];
			$email = $userItem['email'];
			$phone_number = $userItem['phone_number'];
			$address = $userItem['address'];
			$role_id = $userItem['role_id'];
		} else {
			$id = 0;
		}
	} else {
		$id = 0;
	}

	$sql = "select * from Role";
	$roleItems = executeResult($sql);
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
                    <a href="<?=$baseUrl?>product">
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
                    <a class="active" href="<?=$baseUrl?>user">
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
                    Add/Edit User
                </div>
                <div class="main">
                    <div class="box">
                        <form method="post" onsubmit="return validateForm();">
                            <div class="form-group">
                                <label for="usr">Fullname:</label>
                                <input required="true" type="text" class="form-control" id="usr" name="fullname"
                                    value="<?=$fullname?>">
                                <input type="text" name="id" value="<?=$id?>" hidden="true">
                            </div>
                            <div class="form-group">
                                <label for="usr">Role:</label>
                                <select class="form-control" name="role_id" id="role_id" required="true">
                                    <option value="">-- List --</option>
                                    <?php
                                        foreach($roleItems as $role) {
                                            if($role['id'] == $role_id) {
                                                echo '<option selected value="'.$role['id'].'">'.$role['name'].'</option>';
                                            } else {
                                                echo '<option value="'.$role['id'].'">'.$role['name'].'</option>';
                                            }
                                        }
					            	?>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="email">Email:</label>
                                <?php
                                if ($email == '' || $email == null) {
                                    echo '
                                        <input required="true" type="email" class="form-control" id="email" name="email"
                                        value="'.$email.'">
                                    ';
                                } else {
                                    echo '
                                        <input required="true" type="email" readonly class="form-control" id="email" name="email"
                                        value="'.$email.'">
                                    ';
                                }
                                ?>
                            </div>
                            <div class="form-group">
                                <label for="phone_number">Phone Number:</label>
                                <input type="tel" class="form-control" id="phone_number"  name="phone_number"
                                    value="<?=$phone_number?>">
                            </div>
                            <div class="form-group">
                                <label for="address">Address:</label>
                                <input type="text" class="form-control" id="address" name="address"
                                    value="<?=$address?>">
                            </div>
                            <div class="form-group">
                                <label for="pwd">Password:</label>
                                <input <?=($id > 0?'':'required="true"')?> type="password" class="form-control" id="pwd"
                                    name="password" minlength="6">
                            </div>
                            <div class="form-group">
                                <label for="confirmation_pwd">Confirmation Password:</label>
                                <input <?=($id > 0?'':'required="true"')?> type="password" class="form-control"
                                    id="confirmation_pwd" minlength="6">
                            </div>
                            <div class="button">
                                <button class="btn btn-success">Save</button>
                                <div class="cancel">
                                    <a href="<?=$baseUrl?>user">Cancel</a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
    function validateForm() {
        $pwd = $('#pwd').val();
        $confirmPwd = $('#confirmation_pwd').val();
        if ($pwd != $confirmPwd) {
            alert("Those passwords didn't match. Try again.")
            return false
        }
        return true
    }
    </script>
</body>

</html>