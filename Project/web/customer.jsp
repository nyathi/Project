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
                    <h4><span>Available Products</span></h4>
                    <div id="stocks">
                        <center><h2>Vegetables and Fruits</h2></center><hr/>
                        <table border="1" class="gridtable" align="center">
                            
                                <tr>
                                    <%
                                        ArrayList<Products> allItems = (ArrayList<Products>) session.getAttribute("items");
                                        int count = 1;
                                        int strt = Integer.parseInt(request.getParameter("start"));
                                        int endd = Integer.parseInt(request.getParameter("end"));
                                        if (!allItems.isEmpty()) {
                                            for (int i = 0; i < allItems.size(); i++) {

                                                if (strt < endd && strt < (allItems.size())) {
                                                    Products prod = allItems.get(i);
                                    %>
                                        <form method="Post" action="shoppingCart">
                                    <td> <img src="<%=prod.getImagePath()%>" alt="Img"  width="150" height="150"><br/>
                                        <b><%=prod.getItemName()%></b> <br/>
                                        <span class="icon"></span></a><span><font color="black" style="text-align: justify;">R<%=prod.getItemPrice()%>(per case)</font></span><br/> 
                                        <em></em>
                                        <input type="hidden" name="itemID" value="<%=prod.getId()%>"/>
                                        <input type="hidden" name="itemQty" value="<%=prod.getNumberOfItems()%>"/>
                                        <p></p>
                                        <p></p>
                                        <p></p>
                                        <p></p>
                                        Quantity:<input type="text" name="txtQuantity" value="" size="5" onKeyPress="return checkIt(event)"/>
                                        <br/>
                                        <br/>

                                        <input type="submit" name="decision" class="btn-cart" value="Add to Cart"/>


                                    </td>
                                        </form>



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

                                            if (strt < endd && strt < (allItems.size())) {
                                                Products prod = allItems.get(i);
                                    %>
                                     <form method="Post" action="shoppingCart">
                                    <td> <img src="<%=prod.getImagePath()%>" alt="Img"  width="150" height="150"><br/>
                                        <b><%=prod.getItemName()%></b> <br/>
                                        <span class="icon"></span></a><span><font color="black" style="text-align: justify;">R<%=prod.getItemPrice()%>(per case)</font></span><br/> 
                                        <em></em>
                                        <input type="hidden" name="itemID" value="<%=prod.getId()%>"/>
                                        <input type="hidden" name="itemQty" value="<%=prod.getNumberOfItems()%>"/>
                                        <p></p>
                                        <p></p>
                                        <p></p>
                                        <p></p>
                                        Quantity:<input type="text" name="txtQuantity" value="" size="5" onKeyPress="return checkIt(event)"/>
                                        <br/>
                                        <br/>

                                        <input type="submit" name="decision" class="btn-cart" value="Add to Cart"/>


                                    </td>
                                        </form>

                                    <%
                                                    strt++;
                                                }

                                            }
                                        }
                                    %>

                                </tr>
                        </table> <br/>
                         <!--LIVE STOCKS-->
                         <center><h2>Live Stocks</h2></center><hr/>
                                   <table border="1" class="gridtable" align="center">
                                        <tr>
                                    <%
                                        ArrayList<Products> all=(ArrayList<Products>) session.getAttribute("livestock");
                                        
                                        int s=Integer.parseInt(request.getParameter("start"));
                                        int e=Integer.parseInt(request.getParameter("end"));
                                           if(!all.isEmpty()) 
                                           {        
                                               for(int i=0;i<all.size();i++)
                                               {
                                                   
                                                   if(s<e && s<(all.size()))
                                                   {
                                                       Products prod=all.get(i);
                                    %>
                                            <form method="Post" action="shoppingCart">
                                    <td> <img src="<%=prod.getImagePath()%>" alt="Img"  width="150" height="150"><br/>
                                            <b><%=prod.getItemName()%></b> <br/>
                                            <span class="icon"></span></a><span><font color="black" style="text-align: justify;">R<%=prod.getItemPrice()%>(Each)</font></span><br/> 
                                            <em></em>
                                           <input type="hidden" name="itemID" value="<%=prod.getId()%>"/>
                                        <input type="hidden" name="itemQty" value="<%=prod.getNumberOfItems()%>"/>
                                        <p></p>
                                        <p></p>
                                        <p></p>
                                        <p></p>
                                        Quantity:<input type="text" name="txtQuantity" value="" size="5" onKeyPress="return checkIt(event)"/>
                                        <br/>
                                        <br/>
                                             <input type="submit" name="decision" class="btn-cart" value="Add to Cart"/>
                                    </td>               
                                            </form>	
                                    	
					
                                        <%
                                                    s++;
                                                        }
                                                   
                                               }
                                            
                                        %>
                                        </tr>
                                        
                                        
                                        
                                         <tr>
                                    <%
                                    e=e+5;
                                            for(int i=s;i<all.size();i++)
                                               {
                                                   
                                                   if(s<e && s<(all.size()-1))
                                                   {
                                                       Products prod=all.get(i);
                                    %>
                                            <form method="Post" action="shoppingCart">
                                    <td> <img src="<%=prod.getImagePath()%>" alt="Img"  width="150" height="150"><br/>
                                            <b><%=prod.getItemName()%></b> <br/>
                                            <span class="icon"></span><span><font color="black" style="text-align: justify;">R<%=prod.getItemPrice()%>(per case)</font></span><br/>
                                            <em></em>
                                            <p></p>
                                            <input type="hidden" name="itemID" value="<%=prod.getId()%>"/>
                                        <input type="hidden" name="itemQty" value="<%=prod.getNumberOfItems()%>"/>
                                            <p></p>
                                            <p></p>
                                            <p></p>
                                            Quantity:<input type="text" name="txtQuantity" value="" size="5" onKeyPress="return checkIt(event)"/>
                                             <br/>
                                             <input type="submit" name="decision" class="btn-cart" value="Add to Cart"/>
                                    </td>
                                                            
                                            </form>					
                                        <%
                                                    s++;
                                                        }
                                                   
                                               }
                                            }
                                        %>
                                        
                                        </tr>
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
        <%
            } else {
                response.sendRedirect("index.jsp");
            }
        %>
    </body>
</html>
