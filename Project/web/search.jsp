<%-- 
    Document   : index
    Created on : 27 Feb 2013, 7:36:59 PM
    Author     : Student
--%>

<%@page import="java.util.List"%>
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
                                <a href="deleteCustOrProduc.jsp">Delete</a>
                            </li>
                            <li >
                                <a href="viewReport.jsp">Overall Report</a>
                            </li>
                        </ul>

                    </div>

                </div>

            </div>
             <h4 align="center"><span ><font color="#5F9EA0">Select the Product you want to Updaue</font></span></h4>
                <table border="1" class="gridtable" align="center">
                    <td>
                    </td>

                    <form action="GetProductServlet.do" method="post">
                        <tr>
                                    <%
                                                List myList = (java.util.List) request.getAttribute("allProduct");
                                                int count = 1;
                                                int strt = Integer.parseInt(request.getParameter("start"));
                                                int endd = Integer.parseInt(request.getParameter("end"));

                                                if (!myList.isEmpty()) {
                                                    for (int x = 0; x < myList.size(); x++) {

                                                        if (strt < endd && strt < (myList.size())) {
                                                            Products products = (Products) myList.get(x);
                                    %>

                                    <td > <img  src="<%=products.getImagePath()%>" alt="Img"  width="150" height="150"><br/>
                                        <b ><font color="green"><%=products.getItemName()%></font></b> <br/>
                                        <input type="radio" name="radioButton" value="<%=products.getId()%>">
                                        <span class="icon"></span><span><font color="blue" style="text-align: justify;">Select to Update</font></span><br/>

                                        </td>
                                    <%
                                                    strt++;
                                                }

                                            }
                                    %>
                                </tr>
                                <tr>
                                <%
                                        endd = endd + 5;
                                        for (int i = strt; i < myList.size(); i++) {

                                            if (strt < endd && strt < (myList.size() - 1)) {
                                                Products products = (Products) myList.get(i);
                                %>
                                <td> <img src="<%=products.getImagePath()%>" alt="Img"  width="150" height="150"><br/>
                                    <b><font color="green"><%=products.getItemName()%></font></b> <br/>
                                    <input type="radio" name="radioButton" value="<%=products.getId()%>">
                                    <span class="icon"></span><span><font color="blue" style="text-align: justify;">Select to Update</font></span><br/>

                                </td>
                                <%
                                                        strt++;
                                                    }

                                                }
                                            }
                                %>
                                </tr>

                                <tr>

                                    <td colspan="3"><input type="submit" name="decision" value="get one Product" style="font-size:16px; font-weight:bold;"/></td>
                                </tr>
                    </form>
                </table>
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
    
</body>
</html>

