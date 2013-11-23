<%@page import="POJO.CustomerRigistration"%>
<!DOCTYPE html>
<%@page import="java.util.List,java.util.ArrayList,POJO.Products;" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Customer</title>
        <link rel="stylesheet" href="css/style.css" type="text/css">
    </head>
    <SCRIPT LANGUAGE="JavaScript">
function checkIt(evt) {
    evt = (evt) ? evt : window.event
    var charCode = (evt.which) ? evt.which : evt.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
       var status = "Quantity field accepts numbers only."
        alert(status);
        return false
    }
    
    return true
}
</SCRIPT>
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
    <%
        String role = (String) session.getAttribute("Role");
        if (role != null && role.equalsIgnoreCase("User")) {
    %>
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
                                <a href="userProfile.jsp">Profile</a>
                            </li>
                            <li class="highlight selected">
                                <a href="customer.jsp?start=0&end=5">Sale Items</a>
                            </li>
                        </ul>
                        <ul id="secondary">
                            <li>
                                <a href="viewShoppingCart">Cart
                                <%
                  List shopcart=(List) session.getAttribute("shopcart"); 
                  int num=0;
                  if(shopcart!=null)
                 {
                      for(int x=0;x<shopcart.size();x++)
                                                   {
                          num++;
                          
                      }
                      
}
%>
                           (<%=num%>)</a>
                            </li>
                            <li>
                                <a href="logoutServlet">Logout</a> 
                            </li>
                        </ul>
                    </div>
                </div>
                <div id="contents">
                    <h4><span>User details</span></h4>
                    <div id="stocks">
                        <%
CustomerRigistration cr=(CustomerRigistration)session.getAttribute("userInfo"); 
                          if(cr!=null)
                         {                                                   
%>
                        <table align="center">
                            <tr>
                                <td colspan="3">Name</td>
                                <td colspan="3"><%=cr.getName()%></td>
                                
                            </tr>
                             <tr>
                                <td colspan="3">Gender</td>
                                <td colspan="3"><%=cr.getGender()%></td>
                                
                            </tr>
                             <tr>
                                <td colspan="3">Id number</td>
                                <td colspan="3"><%=cr.getCustomer_id()%></td>
                                
                            </tr>
                        </table>
                        <%
                                                }
                        %>
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
        <%
            } else {
                response.sendRedirect("index.jsp");
            }
        %>
    </body>
</html>
