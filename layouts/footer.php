<div class="footer">
    <div class="alt">
        <a href="index.php" class="logo">
            <img src="assets/image/Logo.png" alt="" />
        </a>
        <div class="element">
            <div class="title">About us</div>
            <ul>
                <li><a href="">Our company</a></li>
                <li><a href="">Work with us</a></li>
                <li><a href="">Getting published</a></li>
                <li><a href="">Careers</a></li>
                <li><a href="">Publishing houses</a></li>
                <li><a href="">Creative Responsibility</a></li>
                <li><a href="">Contact us</a></li>
                <li><a href="">Send website feedback</a></li>
            </ul>
        </div>
        <div class="element">
            <div class="title">Useful links</div>
            <ul>
                <li><a href="">Privacy policy</a></li>
                <li><a href="">Cookies policy</a></li>
                <li><a href="">Modern slavery statement</a></li>
                <li><a href="">Accessibility</a></li>
                <li><a href="">Product recalls</a></li>
                <li><a href="">Terms & conditions</a></li>
                <li><a href="">Help & FAQs</a></li>
                <li><a href="">Pay gap reporting</a></li>
                <li><a href="">Industry commitment to professional behaviour</a></li>
                <li><a href="">Permissions</a></li>

            </ul>
        </div>
        <div class="icons">
            <div class="title">Follow us</div>
            <ul class="icon">
                <li><a href=""><i class="fab fa-facebook-f"></i></a></li>
                <li><a href=""><i class="fab fa-instagram"></i></a></li>
                <li><a href=""><i class="fab fa-twitter"></i></a></li>
                <li><a href=""><i class="fab fa-youtube"></i></a></li>
            </ul>
        </div>
    </div>
    <div class="copyright">Copyright © 2021 Company Name</div>
</div>
</div>

<!-- Script -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/jquery.scrolly.min.js"></script>
<script src="assets/js/jquery.scrollex.min.js"></script>
<script src="assets/js/main.js"></script>

<script type="text/javascript">
	function addCart(productId, num) {
		$.post('api/ajax_request.php', {
			'action': 'cart',
			'id': productId,
			'num': num
		}, function(data) {
			location.reload()
		})
	}

    function buyNow(productId, num) {
		$.post('api/ajax_request.php', {
			'action': 'cart',
			'id': productId,
			'num': num
		}, function(data) {
			// location.reload()
		})
	}
</script>
</body>

</html>