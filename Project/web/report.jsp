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
                                <a href="report.jsp">Report</a>	
                            </li>
                            <li>
                                <a href="admin.jsp">Administrator</a>
                            </li>
                            <li >
                                <a href="addProduct.jsp">Add new Product</a>
                            </li>
                            <li >
                                <a href="deleteCustOrProduc.jsp">Delete</a>
                            </li>
                            <li >
                                <a href="viewReport.jsp">Overall Report</a>
                            </li>
                        </ul>
                        <ul id="secondary">
                            <li >
                                <a href="product.do" title="Login first">Cart</a>
                            </li>
                            <li>
                                <a href="login.jsp">Login</a>
                            </li>
                        </ul>
                    </div>
                    <form action="product.do" method="post">
                    </form>>
                </div>

            </div>
            <div>
                <image src="images/imagesCA4H0VC6.jpg" width="150" height="90"/>
                <image src="images/imagesCA4WYVWM.jpg" width="150" height="90"/>
                <image src="images/fg.jpg" width="150" height="90"/>
                <image src="images/kale.jpg" width="150" height="90"/>
                <image src="images/imagesCA1QGY57.jpg" width="150" height="90"/>
                <image src="images/image1.jpg" width="150" height="90"/>
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

