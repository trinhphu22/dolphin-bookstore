<?php
$fullname = $email = $msg = '';

if(!empty($_POST)) {
	$email = getPost('email');
	$pwd = getPost('password');
	$pwd = getSecurityMD5($pwd);

	$sql = "select * from User where email = '$email' and password = '$pwd' and role_id = 2 and deleted = 0";
	$sqlAdmin = "select * from User where email = '$email' and password = '$pwd' and role_id = 1 and deleted = 0";
	$userExist = executeResult($sql, true);
	$adminExist = executeResult($sqlAdmin, true);


	 if ($userExist != null) {
		$token = getSecurityMD5($userExist['email'].time());
		setcookie('token', $token, time() + 7 * 24 * 60 * 60, '/');
		$created_at = date('Y-m-d H:i:s');

		$_SESSION['user'] = $userExist;

		$userId = $userExist['id'];
		$sql = "insert into Tokens (user_id, token, created_at) values ('$userId', '$token', '$created_at')";
		execute($sql);

		header('Location: ../');
		die();
	} else if ($adminExist != null) {
		$token = getSecurityMD5($userExist['email'].time());
		setcookie('token', $token, time() + 7 * 24 * 60 * 60, '/');
		$created_at = date('Y-m-d H:i:s');

		$_SESSION['user'] = $userExist;

		$adminId = $adminExist['id'];
		$sqlAdmin = "insert into Tokens (user_id, token, created_at) values ('$adminId', '$token', '$created_at')";
		execute($sqlAdmin);

		header('Location: ../admin/');
		die();
	} else {
		$msg = "Email or password is invalid, please check again!!!";
	}
}