<%@page import="java.text.DecimalFormat"%>
<!DOCTYPE html>
<%@page import="java.util.List,POJO.Products;" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>Customer</title>
	<link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<style type="text/css">
.style28 {
font-style: inherit;
clip: inherit;
text-decoration: inherit;
font-family: Geneva, Arial, Helvetica, sans-serif;
font-size: 13px;
background-position: center center;
color: #00668C;
font-weight: bold;
}
.style12 {
background-position: center center;
font-style: inherit;
clip: inherit;
color: #000033;
text-decoration: inherit;
font-family: Geneva, Arial, Helvetica, sans-serif;
font-size: 13px;
}

</style>
<%
        String role=(String)session.getAttribute("Role");
        if(role!=null && role.equalsIgnoreCase("User"))
       {
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
							<a href="livestock.do">Life Stock</a>
						</li>
						<li class="highlight selected">
							<a href="product.do">Sale Items</a>
						</li>
					</ul>
					<ul id="secondary">
						<li>
							<a href="checkout.jsp">Cart</a>
						</li>
						<li>
							<a href="login.jsp">Logout</a>
						</li>
					</ul>
				</div>
			</div>
			<div id="contents">
                            
				<div id="stocks">
                               <TABLE ALIGN=CENTER width=100%%  CELLSPACING=0 border=0 CELLPADDING=0 BGCOLOR="#CCCCCC">
                                <TR>
                                    <TD colspan=2></TD>
                                </TR>

                                <TR>
                                    <TD valign=absMiddle align=left BGCOLOR=#458B00 colspan=2 >&nbsp;&nbsp; <span><b>Order Details</b></span>
                                </TR>
                                <TR>
                                    <TD colspan=2></TD>
                                </TR>
                            </TABLE>
                                    <form action="invoiceServlet" method="get">
                                    <table width=100%% border="0" align="center">
                                         <tr>
                                        <th align=left class="style28"> &nbsp; Purchase Item(s) <hr>
                                        <th align=left class="style28">Quantity<hr>
		                       <th colspan=2 align=left class="style28">Cost<hr>
	                           
                                    <%
                                        List allItems=(List) session.getAttribute("shopcart");
                                       List quantity=(List) session.getAttribute("quantity");
                                       int qty=0;
                                       DecimalFormat decimalFormat=new DecimalFormat("0.00");
                                       double totalcost=0.0;
                                           if(!allItems.isEmpty())
                                           {
                                               for(int i=0;i<allItems.size();i++)
                                               {


                                                       Products prod=(Products)allItems.get(i);
                                                       qty=((Integer)quantity.get(i)).intValue();
                                    %>
                                      <tr>
                                      
                                          <td>
                                              
                                              <input type="hidden" name="item" value="<%=prod.getId()%>"/><%=prod.getItemName()%></td>
                                        <td><%=qty%></td>
                                        <%
                                            double cost=qty*prod.getItemPrice();   
                                            totalcost+=cost;
%>
                                        <td>R <%=decimalFormat.format(cost)%></td>
                                        
                                      </tr>
                                        <%


                                               }

                                        %>
                                       

                                  <%
                                            }
                                        %>
                                        <tr>
                                            <td><hr/>
                                                <td><hr/>
                                                    <td><hr/>
                                        </tr>
                                        <tr>
                                            <td colspan="2"><b>Grand total</b></td>
                                            <td><b>: R <%=decimalFormat.format(totalcost)%></b></td>
                                        </tr>
                                        <tr>
                                            <td colspan="4"><hr/></td>
                                            
                                        </tr>
                                       
                                        <tr>
                                            
                                            <td colspan="4"><input type="submit" name="decision" value="Click to proceed" /></td>
                                        </tr>
                                    </table>
                                       </form>
                                        <em></em>
                                        
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
         }  else
        {
              response.sendRedirect("index.jsp");
       }
%>
</body>
</html>
