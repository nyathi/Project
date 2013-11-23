<%--
    Document   : connectToUpdate
    Created on : 2013/04/05, 11:49:15
    Author     : Miehleketo
--%>
<!DOCTYPE html>
<!-- Online Farming System -->
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
                            <li>
                                <a href="index.jsp">Home</a>
                            </li>
                            <!--li>
                                    <a href="viewCustomer.jsp">View Customer</a>
                            </li-->
                            <li>
                                <a href="viewAllCustomer.jsp">Customers</a>
                            </li>
                            <li class="selected">
                                <a href="updateProduct.jsp">Update Product</a>
                            </li>
                            <li>
                                <a href="ReportServlet">Report</a>
                            </li>
                           <li >
                            <a href="logoutServlet">Logout(Admin)</a>
                        </li>
                        </ul>
                        <!--ul id="secondary">
                        <li class="selected">
                            <a href="addProduct.jsp">Add new Products</a>
                        </li>
                        <li class="selected">
                            <a href="index.jsp">Login</a>
                        </li-->

                    </div>
                </div>
                <div id="contents">
                    <h4><span>Administrator</span></h4>
                    <div id="stocks">
                        <body>

                            <form action="test" method="post" >
                                <ul>
                                    <li>
                                        <input type="submit" name="decision" value="Update Product" class="btn-cart" align="middle" >
                                    </li>
                                </ul>

                            </form>
                            <ul>

                                <li>
                                    <a class="preview" title="Preview"> <img src="images/imagesCABPEDUK.jpg" alt="Update Product"  width="800" height="300"> <span class="icon"></span></a> <span>Customer</span>                           </li>

                            </ul>
                    </div>

                </div>
                <div id="footer">
                    <div class="background">
                        <div id="connect">
                            <h5>Get Social With us!</h5>
                            <ul>
                                <li>
                                    <a href="http://OnlineFarmingSystem.com/go/facebook/" target="_blank" class="facebook"></a>
                                </li>
                                <li>
                                    <a href="http://OnlineFarmingSystem.com/go/twitter/" target="_blank" class="twitter"></a>
                                </li>

                            </ul>
                        </div>

                        <p class="footnote">
                            &copy; Copyright &copy; 2013. <a href="index.jsp">Online Farming system</a> all rights reserved.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
