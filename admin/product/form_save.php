<?php
if(!empty($_POST)) {
	$id = getPost('id');
	$title = getPost('title');
	$author = getPost('author');
	$price = getPost('price');
	$discount = getPost('discount');
	$num_product = getPost('num_product');
	
	$thumbnail = getPost('thumbnail');

	$description = getPost('description');
	$category_id = getPost('category_id');
	$created_at = $updated_at = date('Y-m-d H:s:i');

	if($id > 0) {
		//update
		if($thumbnail != '') {
			$sql = "update Product set thumbnail = '$thumbnail', title = '$title', author = '$author', price = $price, discount = $discount, num_product = $num_product, description = '$description', updated_at = '$updated_at', category_id = '$category_id' where id = $id";
		} else {
			$sql = "update Product set title = '$title', author = '$author', price = $price, discount = $discount, num_product = $num_product, description = '$description', updated_at = '$updated_at', category_id = '$category_id' where id = $id";
		}
		
		execute($sql);

		header('Location: index.php');
		die();
	} else {
		//insert
		$sql = "insert into Product(thumbnail, title, author, price, discount, num_product, description, updated_at, created_at, deleted, category_id) values ('$thumbnail', '$title', '$author', '$price', '$discount', '$num_product', '$description', '$updated_at', '$created_at', 0, $category_id)";
		execute($sql);

		header('Location: index.php');
		die();
	}
}