<?php 
require_once('layouts/header.php');

$user = getUserToken();
$userId = $user['id'];
if($user == null) {
    header("Location: auth/login.php");
    die();
}

$sql = "select * from User where id = $userId";
$currentUser = executeResult($sql, true);

?>


<div class="checkout-page">
    <div class="form-checkout">
        <div class="text">
            <span class="yourbasket">Your details</span>
        </div>
        <form method="post" onsubmit="return completeCheckout();">
            <div class="form-group">
                <label for="">Fullname: </label>
                <input required="true" type="text" id="usr" name="fullname" value="<?=$currentUser['fullname']?>" />
            </div>
            <div class="form-group">
                <label for="">Email: </label>
                <input required="true" type="email" id="email" name="email" value="<?=$currentUser['email']?>" />
            </div>
            <div class="form-group">
                <label for="">Phone Number: </label>
                <input required="true" type="tel" id="phone" name="phone" value="<?=$currentUser['phone_number']?>" />
            </div>
            <div class="form-group">
                <label for="">Address: </label>
                <input required="true" type="text" id="address" name="address" value="<?=$currentUser['address']?>" />
            </div>
            <div class="form-group">
                <label for="">Note: </label>
                <textarea  name="note" id="note"></textarea>
            </div>
            <a href="checkout.php" class="btn-checkout">
                <button>Complete Checkout</button>
            </a>
        </form>
    </div>
    <div class="order-list">
        <div class="text">
            <span class="yourbasket">Order summary</span>
            <a href="cart.php">
                <span class="edit">Edit</span>
            </a>
        </div>
        <?php
            if(!isset($_SESSION['cart'])) {
                $_SESSION['cart'] = [];
            }

            foreach($_SESSION['cart'] as $item) {
                echo '
                    <div class="element">
                        <div class="item">
                            <div class="item-box">
                                <img src="'.$item['thumbnail'].'" alt="" />
                                <div class="status">
                                    <div class="available">
                                        <i class="fas fa-check-circle"></i>
                                        <span>AVAILABLE</span>
                                    </div>
                                </div>
                            </div>
                            <div class="info">
                                <a href="detail.php?id='.$item['id'].'">
                                    <span class="title">'.$item['title'].'</span>
                                </a>
                                <span class="author">'.$item['author'].'</span>
                                <span class="quantity">Qty: '.$item['num'].'</span>
                                ';
                            if ($item['price'] == $item['discount']) {
                                echo '
                                    <span class="price">£'.$item['discount'].'</span>
                                ';
                            } else {
                                echo '
                                    <span class="price">£'.$item['price'].'</span>
                                    <span class="discount">£'.$item['discount'].'</span>
                                    <span class="save">Save £'.$item['price']-$item['discount'].'</span>
                                ';
                            }
                            echo '
                            </div>
                        </div>
                    </div>
                ';
            }
        ?>

        <?php
            $totalMoney = 0;
            foreach($_SESSION['cart'] as $item) {
                $totalMoney += $item['discount'] * $item['num'];
            }

            echo '
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
            ';
        ?>
    </div>
</div>

<script type="text/javascript">
function completeCheckout() {
    $.post('api/ajax_request.php', {
        'action': 'checkout',
        'fullname': $('[name=fullname]').val(),
        'email': $('[name=email]').val(),
        'phone_number': $('[name=phone]').val(),
        'address': $('[name=address]').val(),
        'note': $('[name=note]').val()
    }, function() {
        window.open('complete.php', '_self');
    })

    return false;
}
</script>

<?php
require_once('layouts/footer.php');
?>