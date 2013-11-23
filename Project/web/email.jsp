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
                                <a href="login.jsp">Login</a>
                            </li>
                            <li class="highlight selected">
                                <a href="index.jsp">Sale Items</a>
                            </li>
                        </ul>
                        <ul id="secondary">
                            <li>
                                <a href="signup.jsp">Sing up
                
                            </li>
                            <li>
                                <a href="aboutUs.jsp">About us</a> 
                            </li>
                        </ul>
                    </div>
                </div>
                <div id="contents">
                    <h4><span>User details</span></h4>
                    <div id="stocks">
                      <%
          String ms=(String)request.getAttribute("emailMsg");
           if(ms!=null)
          {                                  
%>
                 <p>you have been logged out.....<br/>
                     <%=ms%></p>        
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
       
    </body>
</html>

