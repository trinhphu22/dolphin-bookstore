<?php 
require_once('layouts/header.php');

$productId = getGet('id');
$sql = "select Product.*, Category.name as category_name from Product left join Category on Product.category_id = Category.id where Product.id = $productId";
$product = executeResult($sql, true);

$category_id = $product['category_id'];
$sql = "select Product.*, Category.name as category_name from Product left join Category on Product.category_id = Category.id where Product.category_id = $category_id order by Product.updated_at desc limit 0,12";

$lastestItems = executeResult($sql);

$sql = "select Product.*, Category.name as category_name from Product left join Category on Product.category_id = Category.id order by Product.updated_at desc limit 0,12";
$bestSelling = executeResult($sql);
?>

<!-- main pages detail -->


<div class="path">
    <ul>
        <li><a href="index.php">Home</a></li>
        <span><i class="fad fa-angle-right"></i></span>
        <li><a href="category.php?id=<?=$product['category_id']?>"><?=$product['category_name']?></a></li>
        <span><i class="fad fa-angle-right"></i></span>
        <li><a href="detail.php?id=<?=$productId?>"><?=$product['title']?></a></li>
    </ul>
</div>

<div class="detail">
    <div class="image">
        <div class="image-preview">
            <img src="<?=$product['thumbnail']?>" alt="" />
        </div>
        <img src="<?=$product['thumbnail']?>" alt="" />
    </div>
    <div class="content">
        <span class="title"><?=$product['title']?></span>
        <div class="author"><a><?=$product['author']?></a><span>(Author)</span></div>

        <?php

        if ($product['price'] == $product['discount']) {
            echo '
                <div class="saleprice">
                    <span class="discount">£'.$product['discount'].'</span>
                </div>
            ';
        } else {
            echo '
                <div class="saleprice">
                    <span class="price">£'.$product['price'].'</span>
                    <span class="discount">£'.$product['discount'].'</span>
                </div>
                <span class="save">Save £'.$product['price']-$product['discount'].'</span>
            ';
        }

        ?>
        <div class="add-basket">
            <button class="btn-add" onclick="addCart(<?=$product['id']?>, 1)">
                <i class="far fa-shopping-cart"></i>Add to basket
            </button>
            <a href="./cart.php">
                <button class="btn-buy" onclick="buyNow(<?=$product['id']?>, 1)">
                    Buy now
                </button>
            </a>
        </div>
        <div class="status">
            <?php
            if ($product['num_product'] > 0 ) {
                echo '
                    <div class="available">
                        <i class="fas fa-check-circle"></i>
                        <span>AVAILABLE</span>
                    </div>
                ';
            } else {
                echo '
                    <div class="unavailable">
                        <i class="fas fa-times-circle"></i>
                        <span>UNAVAILABLE</span>
                    </div>
                ';
            }
            ?>
        </div>
        <div class="delivery">
            <i class="fas fa-shipping-fast"></i>Includes delivery to Viet Nam
        </div>
        <div class="description">
            <span class="introduce"><i class="fad fa-pen"></i>Description</span>
            <p>
                &emsp; <?=$product['description']?>
            </p>
        </div>
    </div>
</div>

<div class="recommend">
    <div class="title">Related products</div>
    <div class="product">
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
              </div>
            </a>
          ';
        }
      ?>
    </div>
</div>

<div class="recommend">
    <div class="title">Featured products</div>
    <div class="product">
        <?php
            foreach($bestSelling as $item) {
            echo '
                <a href="detail.php?id='.$item['id'].'" class="item">
                <div class="book">
                    <img src="'.$item['thumbnail'].'" alt="" />
                </div>
                <div class="info">
                    <span class="info__title">'.$item['title'].'</span>
                    <span class="info__author">'.$item['author'].'</span>
                </div>
                </a>
            ';
            }
        ?>
    </div>
</div>


<?php
    require_once('layouts/footer.php');
?>