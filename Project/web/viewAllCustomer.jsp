<%-- 
    Document   : index
    Created on : 27 Feb 2013, 7:36:59 PM
    Author     : Student
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="POJO.CustomerRigistration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- Online farming system -->
<%

    String role = (String) session.getAttribute("Role");
    if (role != null) {

        if (role.equals("Admin")) {
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
                            <li class="selected">
                                <a href="index.jsp">Home</a>
                            </li>
                            <li>
                                <a href="report.jsp">Report</a>	
                            </li>
                            <li >
                                <a href="addProduct.jsp">Add new Product</a>
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
                                <a href="logoutServlet">Logout</a>
                            </li>
                        </ul>
                    </div>
                    <div>
                        <table border="1">

                            <tr>
                                <td>
                                    select to Delete
                                </td>
                                <td>
                                    Customer Names
                                </td>
                            </tr>
                            <form action="test" method="post">
                                <%
                                    ArrayList<CustomerRigistration> all = (ArrayList<CustomerRigistration>) session.getAttribute("customers");
                                    if (!all.isEmpty()) {
                                        CustomerRigistration cust = null;
                                        for (int i = 0; i < all.size(); i++) {
                                            cust = all.get(i);
                                %>

                                <tr>

                                    <td>
                                        <input type="radio" name="radioButton" value="<%=cust.getCustomer_id()%>">
                                        <span class="icon"></span><span><font color="red" style="text-align: justify;">Select to Delete</font></span><br/>
                                    </td>
                                    <td> 
                                        <b></b> <br/>
                                        <b ><font color="green"><%=cust.getName()%></font></b> <br/>

                                    </td>
                                </tr>

                                <%
                                        }
                                    }
                                %>
                                <input type="submit" name="decision" value="delete Customer">
                            </form>
                        </table>

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
<%
        } else {
            response.sendRedirect("index.jsp");
        }
    } else {
        response.sendRedirect("index.jsp");
    }

%>

