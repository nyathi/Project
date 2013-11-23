<%-- 
    Document   : index
    Created on : 27 Feb 2013, 7:36:59 PM
    Author     : Student
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.util.ArrayList,java.util.List,POJO.Products;" %>
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
                                <a href="product.do">Sale Items</a>	
                            </li>
                            <li>
                                <a href="contactUs.html">Contact us</a>
                            </li>
                            <li >
                                <a href="aboutUs.jsp">About us</a>
                            </li>
                        </ul>
                        <ul id="secondary">
                            <li >
                                <a href="checkout.jsp" title="Login first">Cart</a>
                            </li>
                            <li>
                                <a href="login.jsp">Login</a> | <a href="signup.jsp">Signup</a>
                            </li>
                        </ul>
                    </div>
                </div>
                
                    <center><div id="adbox" >
                           <font color="green"> <h1>Pay Slip </h1>
                            <h3><font color="green">USER DATA</font> </h3>
                             <tr>
                                    <%
                                        List allItems = (java.util.List) request.getAttribute("product");
                                        int count = 1;
                                        int strt = Integer.parseInt(request.getParameter("start"));
                                        int endd = Integer.parseInt(request.getParameter("end"));
                                        if (!allItems.isEmpty()) {
                                            for (int i = 0; i < allItems.size(); i++) {

                                                if (strt < endd && strt < (allItems.size())) {
                                                    Products prod = (Products) allItems.get(i);
                                    %>
                                    <td> <img src="<%=prod.getImagePath()%>" alt="Img"  width="150" height="150">
                                <tr>

                                    <th>Quantity</th>

                                </tr> 
                                <input type="text" name="<%=i%>" class="txtfield"><br/>
                                <b><%=prod.getItemName()%></b> <br/>
                                <span class="icon"></span><span><font color="black" style="text-align: justify;">R<%=prod.getItemPrice()%>(Each)</font></span><br/>
                                <em></em>
                                <p></p>
                                <p></p>
                                <p></p>
                                <p></p>
                                <input type="checkbox" name="itemID" value="<%=prod.getId()%>" ><font color="green">Add to Cart</font><br>
                                <input type="checkbox" name="itemID" value="<%=prod.getId()%>" ><font color="green">Remove from Cart</font><br></td>


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
                                                Products prod = (Products) allItems.get(i);
                                    %>
                                    <td> <img src="<%=prod.getImagePath()%>" alt="Img"  width="150" height="150">
                                

                                    <th>Quantity</th>

                                 
                                <input type="text" name="<%=i%>" class="txtfield"><br/>
                                <b><%=prod.getItemName()%></b> <br/>
                                <span class="icon"></span><span><font color="black" style="text-align: justify;">R<%=prod.getItemPrice()%>(per case)</font></span><br/>
                                <em></em>
                                <p></p>
                                <p></p>
                                <p></p>
                                <p></p>
                                <input type="checkbox" name="itemID" value="<%=prod.getId()%>" ><font color="green">Add to Cart</font><br>
                                <input type="checkbox" name="itemID" value="<%=prod.getId()%>" ><font color="green">Remove from Cart</font><br></td>






                                <%
                                                strt++;
                                            }

                                        }
                                    }
                                %>

                                </tr>




                            
                        </center>
                <form method="post" action="ChangeQuantityServlet.do">
                    <input type="submit" name="selection" value="Print slip">
                    <a href="login.jsp" class="btn-cart">
                </form>
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


