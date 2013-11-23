<%-- 
    Document   : index
    Created on : 27 Feb 2013, 7:36:59 PM
    Author     : Student
--%>

<%@page import="MODEL.overallReport"%>
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
    <style type="text/css">
        table.gridtable {
            font-family: verdana,arial,sans-serif;
            font-size:11px;
            color:#333333;
            border-width: 1px;
            border-color: #666666;
            border-collapse: collapse;
        }
        table.gridtable th {
            border-width: 1px;
            padding: 8px;
            border-style: solid;
            border-color: #666666;
            background-color: #dedede;
        }
        table.gridtable td {
            border-width: 1px;
            padding: 8px;
            border-style: solid;
            border-color: #666666;
            background-color: #ffffff;
        }
    </style>
    <body>
        <div id="background">
            <div id="page">
                <div id="header">
                    <div id="logo">
                        <a href="index.jsp"><img src="images/logo.png" alt="LOGO"></a>
                    </div>
                    <div id="navigation">
                        <ul id="primary">
                            <li >
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
                            
                           
                        </ul>
                        <li >
                            <a href="logoutServlet">Logout(Admin)</a>
                        </li>
                        </ul>
                    </div> 
                    </div>
            <font bgcolor="green">
              <table class="gridtable"  align="center"  >
                    <tr>
                        <th>Customer name</th>
                        <th>Item name</th>
                        <th>Number of items</th>
                        <th>Date and Time</th>
                    </tr>
            <%
                                ArrayList<overallReport> report = (ArrayList<overallReport>) request.getAttribute("report");

                                          overallReport overall=null;
                                            for(int x=0;x<report.size();x++)
                                           {
                                                overall=report.get(x);
                    %>
                 
              
                        
                            <tr>
                                
                                <td><%=overall.getCutsName()%></td>
                                <td><%=overall.getItemName()%></td>
                                <td><%=overall.getNumberOfProducts()%></td>
                                <td><%=overall.getDate()%></td>
                            </tr>
                        

                    
                
                    <%
                                  }
                                                 
%>
           </table> </font>
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

