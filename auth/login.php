<?php
	session_start();

	require_once("../utils/utility.php");
	require_once("../database/dbhelper.php");
	require_once("handle_login.php");

    $user = getUserToken();
	if($user != null) {
		header('Location: ../index.php');
		die();
	}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="icon" type="image/png" href="../assets/image/Dolphin.png" />
    <link rel="stylesheet" href="../assets/css/login.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>

<body>
    <div class="container">
        <div class="box">
            <div class="title">Login</div>
            <form method="post">
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input required="true" type="email" class="form-control" id="email" name="email"
                        value="<?=$email?>">
                </div>
                <div class="form-group">
                    <label for="pwd">Password:</label>
                    <input required="true" type="password" class="form-control" id="pwd" name="password" minlength="6">
                </div>
                <div class="message">
                    <p><?=$msg?></p>
                </div>
                <div class="button">
                    <button class="btn btn-success">Login</button>
                </div>
                <p>
                    <a href="register.php">Register a new account</a>
                </p>
            </form>
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