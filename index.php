<?php 
require_once('layouts/header.php');

$sql = "select Product.*, Category.name as category_name from Product left join Category on Product.category_id = Category.id where Product.deleted = '0' order by Product.updated_at desc limit 0,12";
$bestSelling = executeResult($sql);
?>

<!-- banner bootstrap -->

<div class="banner">
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img class="d-block w-100" src="assets/image/slider-image-1-1920x700.jpg" alt="First slide" />
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" src="assets/image/slider-image-2-1920x700.jpg" alt="Second slide" />
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" src="assets/image/slider-image-3-1920x700.jpg" alt="Third slide" />
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
</div>

<!-- end banner -->

<!-- main -->

<div class="main">
    <div class="title">Bestselling and popular</div>
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
                  <span class="info__price">£'.$item['discount'].'</span>
              </div>
            </a>
          ';
        }
      ?>
    </div>
</div>

<?php
      $count = 0;
      foreach($menuItems as $item) {
        $sql = "select Product.*, Category.name as category_name from Product left join Category on Product.category_id = Category.id where Product.category_id = ".$item['id']." order by Product.updated_at desc limit 0,6";

        $items = executeResult($sql);
        if($items == null || count($items) < 4) continue;
      ?>
          <div class="main">
              <div class="title"><?=$item['name']?></div>
              <div class="product">
                  <?php
                      foreach($items as $pitem) {
                        echo '
                          <a href="detail.php?id='.$pitem['id'].'" class="item">
                            <div class="book">
                                <img src="'.$pitem['thumbnail'].'" alt="" />
                            </div>
                            <div class="info">
                                <span class="info__title">'.$pitem['title'].'</span>
                                <span class="info__author">'.$pitem['author'].'</span>
                                <span class="info__price">£'.$pitem['discount'].'</span>
                            </div>
                          </a>
                        ';
                      }
                  ?>
              </div>
      </div>
<?php
      }
      ?>

<!-- end main -->

<?php
require_once('layouts/footer.php');
?>