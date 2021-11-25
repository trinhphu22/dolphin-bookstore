<?php 
require_once('layouts/header.php');

$category_id = getGet('id');

$sql = "select * from Category where id = $category_id";
$menuItems = executeResult($sql);

if($category_id == null || $category_id == '') {
	$sql = "select Product.*, Category.name as category_name from Product left join Category on Product.category_id = Category.id order by Product.updated_at desc limit 0,12";
} else {
	$sql = "select Product.*, Category.name as category_name from Product left join Category on Product.category_id = Category.id where Product.category_id = $category_id order by Product.updated_at desc limit 0,12";
}

$lastestItems = executeResult($sql);
?>

<!-- main pages category -->

<div class="category">
    <div class="banner">
        <img src="assets/image/banner1.jpeg" alt="">
    </div>

    <?php
    foreach($menuItems as $item) {
        echo '
            <div class="title">'.$item['name'].'</div>
        ';
    }
    ?>
    <div class="main">
        <div class="main__list">
            <div class="list-title">Genre</div>
            <div class="list-category">
                <ul>
                    <?php
                        require_once('layouts/category-list.php');
                    ?>
                </ul>
            </div>
        </div>
        <div class="main__product">
            <?php
                foreach($lastestItems as $item) {
                    echo '
                        <a href="detail.php?id='.$item['id'].'" class="item">
                            <div class="book">
                                <img src="'.$item['thumbnail'].'" alt="" />
                            </div>
                            <div class="info">
                                <span class="info__title">'.$item['title'].'</span>
                                <span class="info__author">'.$item['author'].'</span>
                                <span class="info__price">£'.$item['discount'].'</span>
                            </div>
                        </a>
                    ';
                }
            ?>
        </div>

    </div>

    <!-- end main pages category -->

    <?php
    require_once('layouts/footer.php');
?>