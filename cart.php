<?php 
require_once('layouts/header.php');

$sql = "select Product.*, Category.name as category_name from Product left join Category on Product.category_id = Category.id where Product.deleted = '0' order by Product.updated_at desc limit 0,12";
$bestSelling = executeResult($sql);
?>

<!-- main pages cart -->

<?php
    if(!isset($_SESSION['cart'])) {
        $_SESSION['cart'] = [];
    }

    $totalMoney = 0;
	foreach($_SESSION['cart'] as $item) {
		$totalMoney += $item['discount'] * $item['num'];
	}

    if ($count == 0) {
        echo '
            <div class="cart-page">
                <div class="top">
                    <div class="box">
                        <div class="text">
                            <span class="yourbasket">Shopping Basket</span>
                            <span class="youhave">Your basket is empty.</span>
                        </div>
                        <a href="category.php?id=7" class="btn-checkout">
                            <button>Continue shopping</button>
                        </a>
                    </div>
                </div>
            </div>
        ';
    } else {
        echo '
            <div class="cart-page">
                <div class="top">
                    <div class="box">
                        <div class="text">
                            <span class="yourbasket">Your basket</span>
                            <span class="youhave">You have '.$count.' items in your basket</span>
                        </div>
                        <a href="checkout.php" class="btn-checkout">
                            <button>Checkout</button>
                        </a>
                    </div>
                    <div class="element">
                        <span class="item">Item</span>
                        <span class="quantity">Quantity</span>
                        <span class="discount">Price</span>
                        <span class="subtotal">Sub-total</span>
                    </div>
                </div>
            ';

            foreach($_SESSION['cart'] as $item) {
                echo '
                    <div class="main">
                        <div class="element">
                            <div class="item">
                                <img src="'.$item['thumbnail'].'" alt="" />
                                <div class="info">
                                    <a href="detail.php?id='.$item['id'].'">
                                        <span class="title">'.$item['title'].'</span>
                                    </a>
                                    <span class="author">'.$item['author'].'</span>
                                    <div class="status">
                                        <div class="available">
                                            <i class="fas fa-check-circle"></i>
                                            <span>AVAILABLE</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="quantity">
                                <input type="number" id="num_'.$item['id'].'" value="'.$item['num'].'" onchange="fixCartNum('.$item['id'].')" />
                            </div>
                            ';
                        if ($item['price'] == $item['discount']) {
                            echo '
                            <div class="price-box">
                                <span class="discount">£'.$item['discount'].'</span>
                            </div>
                            ';
                        } else {
                            echo '
                                <div class="price-box">
                                    <span class="price">£'.$item['price'].'</span>
                                    <span class="discount">£'.$item['discount'].'</span>
                                    <span class="save">Save £'.$item['price']-$item['discount'].'</span>
                                </div>
                            ';
                        }
                        echo '
                            <span class="subtotal">£'.$item['discount'] * $item['num'].'</span>
                            <span class="close" onclick="updateCart('.$item['id'].', 0)"><i class="far fa-times"></i></span>
                        </div>
                    </div>
                    ';
                } 
                echo '
                    <div class="bottom">
                        <div class="bottom-box">
                            <div class="button-group">
                                <button class="btn-empty" onclick="emptyCard()">Empty basket</button>
                                <button class="btn-update" onclick="updateCart('.$item['id'].', '.$item['num'].')">Update basket</button>
                            </div>
                            <div class="checkout-card">
                                <div class="checkout-info">
                                    <div class="info">
                                        <span>Sub-total: </span>
                                        <span>£'.$totalMoney.'</span>
                                    </div>
                                    <div class="info">
                                        <span>Delivery: </span>
                                        <span>Included</span>
                                    </div>
                                    <div class="info info-total">
                                        <span>Total: </span>
                                        <span>£'.$totalMoney.'</span>
                                    </div>
                                </div>
                                <a href="checkout.php" class="btn-checkout">
                                    <button>Checkout</button>
                                </a>
                            </div>
                        </div>
                    </div>
                ';
            echo '
                </div>
            ';
    }
?>

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

<script type="text/javascript">
function addMoreCart(id, delta) {
    num = parseInt($('#num_' + id).val())
    num += delta
    $('#num_' + id).val(num)

    updateCart(id, num)
}

function fixCartNum(id) {
    $('#num_' + id).val(Math.abs($('#num_' + id).val()))

    updateCart(id, $('#num_' + id).val())
}

function updateCart(productId, num) {
    $.post('api/ajax_request.php', {
        'action': 'update_cart',
        'id': productId,
        'num': num
    }, function(data) {
        location.reload()
    })
}

function emptyCard() {
    $.post('api/ajax_request.php', {
        'action': 'empty_cart',
    }, function(data) {
        location.reload()
    })
}

</script>
<?php
require_once('layouts/footer.php');
?>