<!DOCTYPE html>
<%@page import="java.util.ArrayList,POJO.Products;" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Sale Items</title>
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
                            <li>
                                <a href="index.jsp">Home</a>
                            </li>
                            <li>
                                <a href="livestock.jsp">LiveStock</a>
                            </li>
                            <li class="highlight selected">
                                <a href="product.do">Sale Items</a>
                            </li>
                        </ul>
                        <ul id="secondary">
                            <li>
                                <a href="index.jsp">Cart</a>
                            </li>
                            <li>
                                <a href="login.jsp.jsp">Login</a> | <a href="signup.jsp">Signup</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div id="contents">
                    <h4><span><a href="product.do">Vegetables and Fruits</a> |
                            <a href="login.do">Live Stocks</a></span></h4>
                    <div id="stocks">
                        <table border="1" class="gridtable" align="center">
                            
                            <tr>
                                <%
                                    ArrayList<Products> allItems = (ArrayList<Products>) request.getAttribute("livestock");
                                    int count = 1;
                                    int strt = Integer.parseInt(request.getParameter("start"));
                                    int endd = Integer.parseInt(request.getParameter("end"));
                                    if (!allItems.isEmpty()) {
                                        for (int i = 0; i < allItems.size(); i++) {

                                            if (strt < endd && strt < (allItems.size())) {
                                                Products prod = allItems.get(i);
                                %>
                                <td> <img src="<%=prod.getImagePath()%>" alt="Img"  width="150" height="150"><br/>
                                    <b><%=prod.getItemName()%></b> <br/>
                                    <span class="icon"></span><span><font color="black" style="text-align: justify;">R<%=prod.getItemPrice()%>(Each)</font></span><br/> 
                                    <em></em>
                                    <p></p>
                                    <p></p>
                                    <p></p>
                                    <p></p>
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
                                    for (int i = strt; i < allItems.size(); i++) {

                                        if (strt < endd && strt < (allItems.size() - 1)) {
                                            Products prod = allItems.get(i);
                                %>
                                <td> <img src="<%=prod.getImagePath()%>" alt="Img"  width="150" height="150"><br/>
                                    <b><%=prod.getItemName()%></b> <br/>
                                    <span class="icon"></span><span><font color="black" style="text-align: justify;">R<%=prod.getItemPrice()%>(per case)</font></span><br/> 
                                    <em></em>
                                    <p></p>
                                    <p></p>
                                    <p></p>
                                    <p></p>
                                   </td>
                                
                        
                                    




                                <%
                                                strt++;
                                            }

                                        }
                                    }
                                %>
                                
                            </tr>
                            </form>
                        </table> 
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
