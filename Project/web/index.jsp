<%-- 
    Document   : index
    Created on : 27 Feb 2013, 7:36:59 PM
    Author     : Student
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<!-- Online farming system -->
<html>
<head>
	<meta charset="UTF-8">
	<title>Online Farming System</title>
	<link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<script language="JavaScript1.1">
<!--
var image1=new Image()
image1.src="advertise/wheat-transparent-copy.jpg"
var image2=new Image()
image2.src="advertise/Cabbage.jpg"
var image3=new Image()
image3.src="advertise/sheep3-223x200.jpg"
var image4=new Image()
image4.src="advertise/beef_cattle.jpg"
var image5=new Image()
image5.src="advertise/Wine_grapes.jpg"
var image6=new Image()
image6.src="advertise/goat2.jpg"
var image7=new Image()
image7.src="advertise/gala-apples.jpg"
//-->
</script>

<script type="text/JavaScript">
<!--



function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}
//-->
</script>
<body>
	<div id="background">
		<div id="page">
			<div id="header">
				<div id="logo">
                                    <center><a href="index.jsp"><img src="images/logo.png" alt="LOGO"></a></center>
				</div>
				<div id="navigation">
					<ul id="primary">
						<li class="selected">
							<a href="index.jsp">Home</a>
						</li>
						<li>
						    <a href="product.do">Sale Items</a>	
						</li>
						<li>
							<a href="">Contact us</a>
						</li>
						<li >
							<a href="aboutUs.jsp">About us</a>
						</li>
					</ul>
					<ul id="secondary">
						<li >
							<a href="product.do" title="Login first">Cart</a>
						</li>
						<li>
							<a href="login.jsp">Login</a> | <a href="signup.jsp">Signup</a>
						</li>
					</ul>
				</div>
			</div>
			<div id="contents">
				<div id="adbox">
					<div id="search">
						<h3>Quick Login</h3>
						<p>
							Existing User:Login below
						</p>
						<form action="login.do" method="post">
							<ul>
								<li>
									Username:<input type="text" name="username" size="20" placeholder="Enter Username"/>
								</li>
								<li>
									Password:<input type="password" name="password" size="20" placeholder="Enter password" />
								</li>
									<p></p>
									<p></p>
									<p></p>
									<p>Not registered yet ?Click<a href="signup.jsp" color="red"> here</a> to Register</p>
								
							</ul>
							<input type="submit" value="Login" class="button" name="decision">
						</form>
					</div>
                                    <img src="images/wheat-transparent-copy.jpg" height="355" width="618" name="slide" alt="Promo"></div><span></span>
                                    <script>
			<!--
			//variable that will increment through the images
			var step=1
			function slideit(){
			//if browser does not support the image object, exit.
			if (!document.images)
			return
			document.images.slide.src=eval("image"+step+".src")
			if (step<7)
			step++
			else
			step=1
			//call function "slideit()" every 2.5 seconds
			setTimeout("slideit()",2500)
			}
			slideit()
			//-->
			</script>
				</div>
				<div id="main">
					<div id="featured">
						<h4><span>Featured Items</span></h4>
						<b><p ><font color="green">Login to purchase these items</font></p></b>
						<ul class="items">
							<li>
                                                             <img src="images/lemongrass.jpg" alt="Img" height="200" width="180"> 
							</li>
							<li>
						     <img src="images/ship.jpg" alt="Img" height="200" width="180"> 
							</li>
							<li>
							    <img src="images/wheat2.jpg" alt="Img" height="200" width="180"> 
							</li>
							<li>
							   <img src="images/imagesCAYGMGG3.jpg" alt="Img" height="200" width="180"> 
							</li>
						</ul>
					</div>
					
				</div>
			</div>
			<div id="footer">
				<div class="background">
					<p class="footnote">
						&copy; Copyright &copy; 2013. <a href="index.jsp">Online Farming system</a> all rights reserved.
					</p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
