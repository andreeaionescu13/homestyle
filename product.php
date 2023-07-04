<?php

session_start();

require_once 'config.php';
require_once 'inc/helpers.php';

$product_id = $_GET['id'];

$product = get_product($product_id);
//exit(print_r($product));
?>
<link rel="stylesheet" href="style.css">

	<?php require_once 'header.php' ?>

	<header id="fh5co-header" class="fh5co-cover fh5co-cover-sm" role="banner" style="background-image:url(images/img_bg_2.jpg);">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center">
					<div class="display-t">
						<div class="display-tc animate-box" data-animate-effect="fadeIn">
							<h1>Product Details</h1>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	
	<div id="fh5co-product">
		<div class="container">
			<div class="row">
				<div class="col-md-10 col-md-offset-1 animate-box">
				<div class="item">
					<div class="active text-center">
						<img src="<?php echo get_image_path($product['Image']) ?>" alt="<?php echo $product['Image'] ?>" height="800px">
					</div>
				</div>
					<div class="row animate-box">
						<div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
							<h1>  </h1>
							<h2>Our Collection</h2>
							<p>
								<button class="btn btn-primary btn-outline btn-lg" onclick="add_to_cart()">Add to Cart</button>
								<!--<button class="btn btn-primary btn-purchase" type="button">PURCHASE</button>-->
							</p>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-10 col-md-offset-1">
					<div class="fh5co-tabs animate-box">
							<ul class="fh5co-tab-nav">
								<li class="active"><a href="#" data-tab="1"><span class="icon visible-xs"><i class="icon-file"></i></span><span class="hidden-xs">Product Details</span></a></li>
								<li><a href="#" data-tab="2"><span class="icon visible-xs"><i class="icon-bar-graph"></i></span><span class="hidden-xs">Specification</span></a></li>
								<li><a href="#" data-tab="3"><span class="icon visible-xs"><i class="icon-star"></i></span><span class="hidden-xs">Feedback &amp; Ratings</span></a></li>
							</ul>

						<!-- Tabs -->
						<div class="fh5co-tab-content-wrap">

							<div class="fh5co-tab-content tab-content active" data-tab-content="1">
								<div class="col-md-10 col-md-offset-1">
									<span class="price">&pound<?php echo $product['Price'] ?></span>
									<h2><?php echo $product['ProductName'] ?></h2>
									<p><?php echo $product['Description'] ?></p>


									<div class="row">
										<div class="col-md-6">
											<h2 class="uppercase">Material</h2>
											<p>Wood </p>
										</div>
										<div class="col-md-6">
											<h2 class="uppercase">Colour</h2>
											<p>White</p>
										</div>
									</div>

								</div>
							</div>

							<div class="fh5co-tab-content tab-content" data-tab-content="2">
								<div class="col-md-10 col-md-offset-1">
									<h3>Product Specification</h3>
									<ul>
										<li>Wood</li>
										<li>Manually sculptured</li>
										<li>Details manually added</li>
										<li>Vintage style</li>
									</ul>
								</div>
							</div>

							<div class="fh5co-tab-content tab-content" data-tab-content="3">
								<div class="col-md-10 col-md-offset-1">
									<h3>Happy Buyers</h3>
									<div class="feed">
										<div>
											<blockquote>
												<p>Paragraph placeat quis fugiat provident veritatis quia iure a debitis adipisci dignissimos consectetur magni quas eius nobis reprehenderit soluta eligendi quo reiciendis fugit? Veritatis tenetur odio delectus quibusdam officiis est.</p>
											</blockquote>
											<h3>&mdash; Louie Knight</h3>
											<span class="rate">
												<i class="icon-star2"></i>
												<i class="icon-star2"></i>
												<i class="icon-star2"></i>
												<i class="icon-star2"></i>
												<i class="icon-star2"></i>
											</span>
										</div>
										<div>
											<blockquote>
												<p>Paragraph placeat quis fugiat provident veritatis quia iure a debitis adipisci dignissimos consectetur magni quas eius nobis reprehenderit soluta eligendi quo reiciendis fugit? Veritatis tenetur odio delectus quibusdam officiis est.</p>
											</blockquote>
											<h3>&mdash; Joefrey Gwapo</h3>
											<span class="rate">
												<i class="icon-star2"></i>
												<i class="icon-star2"></i>
												<i class="icon-star2"></i>
												<i class="icon-star2"></i>
												<i class="icon-star2"></i>
											</span>
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
<!-- /////////////////////////////////////////////////////////////////////////////////////////////////-->

	<div id="fh5co-started">
		<div class="container">
			<div class="row animate-box">
				<div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
					<h2>Newsletter</h2>
					<p>Just stay tune for our latest Product. Now you can subscribe</p>
				</div>
			</div>
			<div class="row animate-box">
				<div class="col-md-8 col-md-offset-2">
					<form class="form-inline">
						<div class="col-md-6 col-sm-6">
							<div class="form-group">
								<label for="email" class="sr-only">Email</label>
								<input type="email" class="form-control" id="email" placeholder="Email">
							</div>
						</div>
						<div class="col-md-6 col-sm-6">
							<button type="submit" class="btn btn-default btn-block">Subscribe</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
<!-- /////////////////////////////////////////////////////////////////////////////////////////////////-->
<?php require_once 'footer.php' ?>
	</body>
</html>


<?php
if ( isset($_GET['action']) && $_GET['action'] == 'add_to_cart' ) {
	$product_id = $_GET['id'];

	$is_product_added = false;

	if ( $_SESSION['cart']['items'] ) {
		foreach ($_SESSION['cart']['items'] as $index => $item) {
			if ( $item['product_id'] == $product_id ) {
				$_SESSION['cart']['items'][$index]['qty']++;

				$is_product_added = true;
			}
		}
	}

	if ( !$is_product_added) {
		$_SESSION['cart']['items'][] = [
			'product_id' => $product_id,
			'price' => $product['Price'],
			'qty' => 1
		];
	}

	$total = 0;
	foreach ($_SESSION['cart']['items'] as $item) {
		$total += $item['price'] * $item['qty'];
	}

	$_SESSION['cart']['total'] = $total;

	$_SESSION['messages'][] = 'Product successfully added to cart!';

	header("Location: " . BASE_URL . "/product.php?id={$product_id}");
	exit();
}

if ( isset($_GET['action']) && $_GET['action'] = 'checkout' ) {
	global $link;

	if ( !is_user_logged_in() ) {
		header("Location: " . BASE_URL . "/login.php");
		exit();
	}

	$customer_id = get_logged_in_user_id();
	$status = 'pending';
	$order_total = $_SESSION['cart']['total'];
	$order_id = null;

	$sql = "INSERT INTO `shop_order` (CustomerID, TotalPrice, Status) VALUES (?, ?, ?)";

	$stmt = $link->prepare($sql);
	$stmt->bind_param("ids", $customer_id, $order_total, $status);
	$stmt->execute();

	$order_id = $link->insert_id;

	if ( $order_id ) {
		foreach ($_SESSION['cart']['items'] as $index => $item) {
			if ( !$item['product_id'] || !$item['qty'] ) {
				continue;
			}

			$sql = "INSERT INTO `order_items` (OrderID, ProductID, Quantity) VALUES (?, ?, ?)";

			$stmt = $link->prepare($sql);
			$stmt->bind_param("iii", $order_id, $item['product_id'], $item['qty']);
			$stmt->execute();
		}
	}

	$_SESSION['cart'] = [];

	$_SESSION['messages'][] = 'Order #' . $order_id . ' successfully registered!';

	header("Location: " . BASE_URL . "/shop.php");
	exit();
}

?>