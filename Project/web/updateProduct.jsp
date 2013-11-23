<%-- 
    Document   : index
    Created on : 27 Feb 2013, 7:36:59 PM
    Author     : Student
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="POJO.Products"%>

<%@page import="java.util.ArrayList,POJO.Products;" %>
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
                                <a href="ReportServlet">Overall Report</a>
                            </li>
                        </ul>
                        <li class="selected">
                            <a href="logoutServlet">Logout(Admin)</a>
                        </li>
                        </ul>
                    </div>


                </div>

            </div>
            <font bgcolor="green">
                <table class="gridtable"  align="center" bgcolor="#5F9EA0" >
                    <%
                                Products products = (POJO.Products) request.getAttribute("product");


                    %>
                    <form action="updateProduct.do" method="post">
                        <div id="stocks">
                            <ul>
                                <tr >
                                    <th colspan="6">Update Products</th>
                                </tr>



                                <tr>
                                    <td colspan="6">Quantity </td>
                                    <td colspan="3"><input type="text" name="txtQuantity" value="<%=products.getNumberOfItems()%>" title="Enter Quantity" onKeyPress="return checkIt(event)"/></td>
                                </tr>
                                <tr>
                                    <td colspan="6">Item Name</td>
                                    <td colspan="3"><input type="text" name="txtItemName" value="<%=products.getItemName()%>" title="Enter Item Name" /></td>


                                </tr>
                                <tr>
                                    <td colspan="6">Item Price</td>
                                    <td colspan="3"><input type="text" name="txtItemPrice" value="<%=products.getItemPrice()%>" title="Enter Item Name" /></td>


                                </tr>
                                <tr>
                                    <td colspan="6">Item Code</td>
                                    <td colspan="3"><input type="text" name="txtItemCode" value="<%=products.getId()%>" title="Enter Item Name" /></td>


                                </tr>
                                <tr>
                                    <td colspan="6">Product type</td>
                                    <td><input type="radio" name="type" value="Live stock" />Live Stock
                                        <input type="radio" name="type" value="Live stock" />Dairy Product
                                        <input type="radio" name="type" value="Vegetable" />Vegetables
                                        <input type="radio" name="type" value="Fruit" />Fruit
                                    </td>

                                </tr>

                                <tr>
                                    <td colspan="6">Image Path</td>
                                    <td><input type="text" name="txtImagePath"  value="<%=products.getImagePath()%>" title="Enter The Path of Image" /></td>
                                </tr>

                                <tr>

                                    <td colspan="3"><input type="submit" value="Update Product" name="decision" class="btn-cart" style="font-size:16px; font-weight:bold;"/></td>
                                </tr>
                            </ul>
                        </div>

                    </form>
                </table>
            </font>
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

