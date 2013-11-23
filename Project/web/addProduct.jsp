<%-- 
    Document   : index
    Created on : 27 Feb 2013, 7:36:59 PM
    Author     : Student
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- Online farming system -->
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
                            <li>
                                <a href="report.jsp">Report</a>	
                            </li>
                            <li>
                                <a href="admin.jsp">Administrator</a>
                            </li>
                            <li >
                                <a href="addProduct.jsp" class="selected">Add new Product</a>
                            </li>

                        </ul>
                        <ul>
                            <li >
                                <a href="connectToDelete.jsp">Delete</a>
                            </li>
                       
                            <li class="selected">
                            <a href="logoutServlet">Logout(Admin)</a>
                        </li>
                        </ul>
                    </div>

                </div>
                <font bgcolor="green">
                <form action="product.do" method="post">
                    <table class="gridtable"  align="center" bgcolor="#5F9EA0" >
                        <tr >
                            <th colspan="6">Add new Product</th>
                        </tr>
                        <tr>
                            <td colspan="6"> Item Name</td>
                            <td colspan="3"><input type="text" name="txtItemName" title="Enter Item Name" /></td>
                        </tr>
                        <tr>
                            <td colspan="6">Item Price</td>
                            <td colspan="3"><input type="text" name="txtItemPrice" title="Enter Item Price"/></td>
                        </tr>
                        <tr>
                            <td colspan="6">Quantity </td>
                            <td colspan="3"><input type="text" name="txtQuantity" title="Enter Quantity" onKeyPress="return checkIt(event)"/></td>
                        </tr>
                        <tr>
                            <td colspan="6">Product type</td>
                            <td><input type="radio" name="type" value="Fruit" />Fruit
                                <input type="radio" name="type" value="Vegetable" />Vegetable
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">Product type</td>
                            <td><input type="radio" name="type" value="livestock" />Live Stock
                                <input type="radio" name="type" value="livestock" />Dairy Product
                            </td>
                        </tr>

                        <tr>
                            <td colspan="6">Image Path</td>
                            <td><input type="text" name="txtImagePath" title="Enter The Path of Image" /></td>
                        </tr>
                        <tr>
                            <td colspan="6">Email</td>
                            <td><input type="text" name="email" title="Enter email address" /></td>
                        </tr>

                        <tr>
                            <td colspan="6"><input type="submit" value="Register new Product"  id="createaccount" name="decision" 
                                                   onsubmit="return nameValidation();"  /></td>
                        </tr>

                    </table>
                </form>
                </font>

            </div>
            <div align="center">
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

