<%-- 
    Document   : index
    Created on : 27 Feb 2013, 7:36:59 PM
    Author     : Student
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- Online farming system -->
<html>
<head>
	<meta charset="UTF-8">
	<title>Online Farming System</title>
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
							<a href="#" title="Login first">Cart</a>
						</li>
						<li>
							<a href="login.jsp">Login</a> | <a href="signup.jsp">Sign up</a>
						</li>
					</ul>
				</div>
			</div>
			<div id="contents">
                            <center><div id="adbox" >
                                    <form action="login.do" method="post">
                                    <h1>Existing:Login below</h1>
                                    <hr/>
                                    <%
                                               String error=(String)session.getAttribute("login_error");
%>
                                    <p><font color="RED"><%=error%></font></p>
                                    <p></p>
                                    <p></p>
                                    <p>Username:<input type="text" name="username" size="20" placeholder="Enter Username"/></p>
                                    <p>Password:<input type="password" name="password" size="20" placeholder="Enter password" /></p>
                                    <p></p>
                                      <p></p>
                                       <p></p>
                                       <p>Not registered yet ?Click<a href="signup.jsp" color="red"> here</a> to Register</p>
                                       <input type="submit" value="Login" name="decision" style="font-size:16px; font-weight:bold;"/>
                                    </form>
                                </div></center>
			</div>
                    <div>
                        <image src="images/imagesCA4H0VC6.jpg" width="150" height="90"/>
                        <image src="images/imagesCA4WYVWM.jpg" width="150" height="90"/>
                        <image src="images/fg.jpg" width="150" height="90"/>
                        <image src="images/wheat2.jpg" width="150" height="90"/>
                        <image src="images/imagesCA1QGY57.jpg" width="150" height="90"/>
                        <image src="images/image1.jpg" width="150" height="90"/>
                    </div>
			<div id="footer">
				<div class="background">
					<p class="footnote">
						&copy; Copyright &copy; 2013. <a href="index.html">Online Farming system</a> all rights reserved.
					</p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

