<%--
    Document   : checkout
    Created on : 18 Mar 2013, 8:52:57 PM
    Author     : Student
--%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Online farming system</title>
	<link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<body>
	<div id="background">
		<div id="page">
			<div id="header">
				<div id="logo">
					<a href="index.jsp"><img src="images/logo.png" alt="LOGO"></a>
				</div>
				<div id="navigation">
					<ul id="primary">
						<li class="selected">
							<a href="index.jsp">Home</a>
						</li>
						<!--li>
							<a href="new.html">New Arrivals</a>
						</li>
						<li>
							<a href="mens.html">Mens</a>
						</li>
						<li>
							<a href="womens.html">Womens</a>
						</li>
						<li>
							<a href="faq.html">Faq</a>
						</li-->
						<li class="highlight">
							<a href="sale.jsp">Sale Items</a>
						</li>
					</ul>
					<ul id="secondary">
						<li>
							<a href="checkout.jsp">Cart</a>
						</li>
						<li>
							<a href="index.jsp">Login</a> | <a href="index.jsp">Signup</a>
						</li>
					</ul>
				</div>
			</div>
			<div id="contents">
				<div id="adbox">
					<div id="search">
						<h3>Quick Search</h3>
						<p>
							Information
						</p>
						<form action="index.jsp" method="post">
							<ul>
								<li>
									<select id="Item Name">
										<option>Search by Item Name</option>
									</select>
								</li>
								<li>
									<select id="vegetables">
										<option>Search by Vegetable</option>
									</select>
								</li>
								<li>
									<select id="LiveStock">
										<option>Search by LiveStock</option>
									</select>
								</li>
								<li>
									<select id="Code">
										<option>Search by Code</option>
									</select>
								</li>
							</ul>
							<input type="submit" value="Find Items!" class="button">
						</form>
					</div>
					<img src="images/kale.jpg" height="355" width="618" alt="Promo"> <a href="index.jsp" class="button"></a> <span></span>
				</div>
				<div id="main">
					<div id="featured">
						<h4><span>Featured Items</span></h4>
						<ul class="items">
							<li>
                                                            <a href="product.do"> <img src="images/lemongrass.jpg" alt="Img" width="200" height="200"> <span>R19.50</span> Lemon grass </a>
							</li>
							<li>
								<a href="product.do"> <img src="images/cabbege.jpg" alt="Img" width="200" height="200"> <span>R100.00</span> Cabbage </a>
							</li>
							<li>
								<a href="product.do"> <img src="images/cauliflower.jpg" alt="Img" width="200" height="200"> <span>R65.00</span> Cauliflowers </a>
							</li>
							<li>
								<a href="product.do"> <img src="images/asparagus.jpg" alt="Img" width="200" height="200"> <span>R80.00</span> asparagus </a>
							</li>
						</ul>
					</div>
					<div id="sale">
						<h4><span>Sale Items</span></h4>
						<ul class="items">
							<li>
                                                            <a href="product.do"> <img src="images/imagesApplesS1.jpg" alt="Img" width="200" height="200"> <span>R80.00</span>Apples </a>
							</li>
							<li>
								<a href="product.do"> <img src="images/Beans.jpg" alt="Img" width="200" height="200"> <span>R58.50</span> Beans </a>
							</li>
							<li>
								<a href="product.do"> <img src="images/imagesCA94UXKG.jpg" alt="Img" width="200" height="200"> <span>R600.00</span> Eggs </a>
							</li>
							<li>
								<a href="product.do"> <img src="images/Livestock.jpg" alt="Img" width="200" height="200"> <span>R500.00 to R3000</span> LiveStock  </a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div id="footer">
				<div class="background">
					<div id="connect">
						<h5>Get Social With us!</h5>
						<ul>
							<li>
								<a href="http://freewebsitetemplates.com/go/facebook/" target="_blank" class="facebook"></a>
							</li>
							<li>
								<a href="http://freewebsitetemplates.com/go/twitter/" target="_blank" class="twitter"></a>
							</li>
							<li>
								<a href="http://www.freewebsitetemplates.com/go/googleplus/" target="_blank" class="linkin"></a>
							</li>
						</ul>
					</div>
					<ul class="navigation">
						<li>
							<h5>LiveStock</h5>
							<a href="livestock.jsp">Cattle</a> <a href="livestock.jsp">turkey</a> <a href="livestock.jsp">Sheep</a> <a href="livestock.jsp">Goat</a>
						</li>
						<li>
							<h5>Vegetables</h5>
							<a href="sale.jsp">Lemon grass</a> <a href="sale.jsp">Cabbage</a> <a href="sale.jsp">Tomato</a> <a href="sale.jsp">Spinach</a>
						</li>

						<li class="latest">
							<h5>On Sale Items</h5>
							<a href="sale.jsp">Water melon</a> <a href="sale.jsp">Wheat</a> <a href="sale.jsp">White Beans</a> <a href="sale.jsp">Strawberry</a>
						</li>
					</ul>
					<p class="footnote">
						&copy; Copyright &copy; 2013. <a href="index.jsp">Online Farming System</a> all rights reserved.
					</p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>