<%@page import="java.text.DecimalFormat"%>
<!DOCTYPE html>
<%@page import="java.util.List,POJO.Products;" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>Customer</title>
	<link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<SCRIPT LANGUAGE="JavaScript">
function checkIt(evt) {
    
    document.apply['select'].disabled =(document.apply['select'].disabled)? false : true;
    document.apply['decision'].disabled =(document.apply['decision'].disabled)? false : true;
    return true
}
</SCRIPT>
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
                            <TABLE ALIGN=CENTER width=100%%  CELLSPACING=0 border=0 CELLPADDING=0 BGCOLOR="#CCCCCC">
                                <TR>
                                    <TD colspan=2></TD>
                                </TR>

                                <TR>
                                    <TD valign=absMiddle align=left BGCOLOR=#458B00 colspan=2 >&nbsp;&nbsp; <span><b>Purchased item(s).</b></span>
                                </TR>
                                <TR>
                                    <TD colspan=2></TD>
                                </TR>
                            </TABLE>
                            
				<div id="stocks">
                                    <form  name="apply" action="invoiceServlet" method="Get">
                                        <%
String message=(String)request.getAttribute("mssg"); 
String msg=(String)request.getAttribute("error");
                 if(message!=null)
              {                                                          
%>
<h1><%=message%></h1>
<%
             }
%>
                                
                                             
<center>
    <%
     if(msg!=null)
 {            
%>
    <%=msg%><br/>
    <%
     }
    %>
                                           
    <input type="submit" name="select" value="Print Invoice" class="btn-cart"/></center>
                                    
                                    
                                    </form>
                                    <form method="POST" action="sendEmailServlet"> 
                                        <input type="text" name="email" value=""/><br/> 
                                           <center>
                                      <input type="submit" name="decision" value="Send invoice to email" class="btn-cart"  /></center>
                                    
                                    </form>
                                    
                                    <table border="0"  width=100%% align="center">
                                        
                                        
                                    <%
                                        List allItems=(List) session.getAttribute("shopcart");
                                       List quantity=(List) session.getAttribute("quantity");
                                       int qty=0;
                                       DecimalFormat decimalFormat=new DecimalFormat("0.00");
                                       double totalcost=0.0;
                                           if(!allItems.isEmpty())
                                           {
                                            %>
                                                    <tr>
                                                    <th align=left class="style28"> &nbsp; Added Item(s) <hr>
                                                    <th align=left class="style28">Quantity<hr>
                                                   <th colspan=2 align=left class="style28">Cost<hr>
                                            
                                            <%  for(int i=0;i<allItems.size();i++)
                                               {


                                                       Products prod=(Products)allItems.get(i);
                                                       qty=((Integer)quantity.get(i)).intValue();
                                    %>
                                      <tr>
                                      
                                          <td>
                                              <input type="hidden" name="removeId" value="<%=i%>"/>
                                              <%=prod.getItemName()%></td>
                                        <td><%=qty%></td>
                                        <%
                                            double cost=qty*prod.getItemPrice();   
                                            totalcost+=cost;
%>
                                        <td>R <%=decimalFormat.format(cost)%></td>
                                        
                                      </tr>
                                        <%


                                               }
                                               session.setAttribute("shopcart", allItems);
                                               session.setAttribute("quantity", quantity);
                                               
                                        %>
                                       

                                 
                                        
                                        <tr>
                                            <td><hr/>
                                                <td><hr/>
                                                    <td><hr/>
                                        </tr>
                                        <tr>
                                            <td colspan="2"><b>Grand Total</b></td>
                                            <td><b>R <%=decimalFormat.format(totalcost)%></b></td>
                                        </tr>
                                        <tr>
                                            <td colspan="4"><hr/></td>
                                            
                                        </tr>
                                    </table>
                                       
                                    </form>
                                        <em></em>
                                        
                                         <%
                                            }else
                                             {
                                        %>
                                        <center><h2>Shopping cart is empty. add item(s).</h2></center>
                                        <p></p>
                                        <p></p>
                                        <p></p>
                                        <p></p>
                                        <p></p>
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
         }  else
        {
              response.sendRedirect("index.jsp");
       }
%>
</body>
</html>

