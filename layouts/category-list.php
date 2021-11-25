<?php
	session_start();
    require_once('header.php');


	$sql = "select * from Category";
	$menuItems = executeResult($sql);

    foreach($menuItems as $item) {
        echo '
            <li><a href="category.php?id='.$item['id'].'">'.$item['name'].'</a></li>
        ';
    }
?>