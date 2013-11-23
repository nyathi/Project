<!DOCTYPE html>
<!-- Online Farming System -->
<%

       String role=(String)session.getAttribute("Role");
       if(role!=null)
         {
           
           if(role.equals("Admin"))
           {
%>
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
                                <a href="viewReport.jsp">Report</a>
                            </li>

                        </ul>
                        <ul >
                        <li class="selected">
                            <a href="addProduct.jsp">Add new Products</a>
                        </li>
                        <li class="selected">
                            <a href="logoutServlet">Logout(Admin)</a>
                        </li>
                        </ul>
                    </div>
                </div>
                <div id="contents">
                    <h4><span>Administrator</span></h4>
                    <div id="stocks">
                        <ul>
                            <li>
                                <a href="addProduct.jsp" class="preview" title="Preview"> <img src="images/new product.bmp" alt="add Product"  width="200" height="200"> <span class="icon"></span></a> <span>Product</span><a href="addProduct.jsp" class="btn-cart">Add Product</a>
                            </li>
                            <li>
                                <a href="checkout.jsp" class="preview" title="Preview"> <img src="images/adding.bmp" alt="Img"  width="200" height="200"> <span class="icon"></span></a> <span>Customer</span><a href="checkout.jsp" class="btn-cart">Add Customer</a> 
                            </li>

                            <li>
                                <a href="connectToUpdate.jsp" class="preview" title="Preview"> <img src="images/updates2.bmp" alt="Update Product" width="200" height="200"> <span class="icon"></span></a> <span>product</span><a href="connectToUpdate.jsp" class="btn-cart">Update Product</a>
                            </li>
                            
                            <li>
                                <a href="ReportServlet" class="preview" title="Preview"> <img src="images/report.bmp" alt="View Report"  width="190" height="200"> <span class="icon"></span></a> <span>Report</span> <a href="ReportServlet" class="btn-cart">View Report</a> 
                            </li>
                            <li>
                                <a href="ReportServlet" class="preview" title="Preview"> <img src="images/Allreport.jpg" alt="Overall Report"  width="200" height="200"> <span class="icon"></span></a> <span>Report</span>   <a href="viewReport.jsp" class="btn-cart">Overall Report</a>
                            </li>
                            <li>
                                <a href="connectToDelete.jsp" class="preview" title="Preview"> <img src="images/imagesCAE1YIYE.jpg" alt=" Delete product"  width="200" height="200"> <span class="icon"></span></a> <span>product</span><a href="connectToDelete.jsp" class="btn-cart"> Delete product</a>
                            </li>
                            <li>
                                <a href="" class="preview" title="Preview"> <img src="images/deleteCustomer.jpg" alt="Delete Customer"  width="200" height="200"> <span class="icon"></span></a> <span>Customer</span><a href="#" class="btn-cart"> Delete Customer</a> 
                            </li>


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
<%
       }
         else{
          response.sendRedirect("index.jsp");
         }
     }
else{
          response.sendRedirect("index.jsp");
     }         

%>