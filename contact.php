<?php 
require_once('layouts/header.php');
// var_dump($_POST);

$user = getUserToken();

if ($user) {
    $userId = $user['id'];
    
    $sql = "select * from User where id = $userId";
    $currentUser = executeResult($sql, true);
}


if(!empty($_POST)) {
	$fullname = getPost('fullname');
	$email = getPost('email');
	$phone_number = getPost('phone');
	$subject_name = getPost('subject_name');
	$note = getPost('note');
	$created_at = $updated_at = date('Y-m-d H:i:s');

	$sql = "insert into FeedBack(fullname, email, phone_number, subject_name, note, status, created_at, updated_at) values('$fullname', '$email', '$phone_number', '$subject_name', '$note', 0, '$created_at', '$updated_at')";
	// echo $sql;
	execute($sql);
}
?>

<div class="contact-page">
    <div class="contact-card">
        <div class="contact-form">
            <div class="title">Contact US</div>
            <form method="post">
                <div class="input-group">
                    <input required="true" type="text" id="usr" name="fullname" placeholder="Name" value="<?=$currentUser['fullname']?>">
                    <input required="true" type="email" id="email" name="email" placeholder="Email" value="<?=$currentUser['email']?>">
                </div>
                <input required="true" type="tel" id="phone" name="phone" placeholder="Phone" value="<?=$currentUser['phone_number']?>">
                <input required="true" type="text" id="subject_name" name="subject_name" placeholder="Subject">
                <textarea  name="note" id="note" placeholder="Notes"></textarea>
                <a href="index.php" class="btn-send">
                    <button>Send Message</button>
                </a>
            </form>
        </div>
        <div class="contact-info">
            <div class="__info">
                <div class="title">Contact Info</div>
                <span>
                    <i class="fad fa-envelope"></i>
                    <a href="">contact@company.com</a>
                </span>
                <span>
                    <i class="fad fa-phone-alt"></i>+84123456789
                </span>
                <span>
                    <i class="fad fa-map-pin"></i>No. 000, City, State ,Province
                </span>
            </div>
            <div class="__icons">
                <div class="title">Follow us</div>
                <ul class="icons-bar">
                    <li><a href="" class="icon"><i class="fab fa-facebook-f"></i></a></li>
                    <li><a href="" class="icon"><i class="fab fa-instagram"></i></a></li>
                    <li><a href="" class="icon"><i class="fab fa-twitter"></i></a></li>
                    <li><a href="" class="icon"><i class="fab fa-youtube"></i></a></li>
            </div>
        </div>
    </div>
</div>

<?php
require_once('layouts/footer.php');
?>