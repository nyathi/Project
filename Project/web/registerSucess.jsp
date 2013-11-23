<%--
    Document   : index
    Created on : 27 Feb 2013, 7:36:59 PM
    Author     : Student
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- Online farming system -->
<html>
<head>
	<meta charset="UTF-8">
	<title>Online Farming System</title>
	<link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<SCRIPT LANGUAGE="JavaScript">
function checkIt(evt) {
    evt = (evt) ? evt : window.event
    var charCode = (evt.which) ? evt.which : evt.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        status = "This field accepts numbers only."
        alert(status);
        return false
    }
    status = ""
    return true
}
var errors="";
var textOnly =  /^[A-Za-z \.]+$/;
function nameValidation()
{

   var firstname = document.forms["signup"]["txtName"].value;
   var surname = document.forms["signup"]["txtSurname"].value;

   if(firstname.toString()="" && surname.toString()=="")
   {
        errors+="Name and surname can't be Empty\r\n";



   }

   var pass=document.forms["signup"]["txtPassword2"].value;
   var pass1=document.forms["signup"]["txtPassword"].value;
   if(pass!=pass1)
       {
           errors+="Password doesn't match.\r\n";
       }
   /*else  if (firstname != textOnly){

        errors += "Name is Invalid\r\n";

        }

    if(surname!=textOnly)
    {
         errors += "Surname is Invalid\r\n";

      }*/

       alert(errors);
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
						<li class="selected">
							<a href="index.jsp">Home</a>
						</li>
						<li>
						    <a href="product.do">Sale Items</a>
						</li>
						<li>
							<a href="womens.html">Contact us</a>
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
							<a href="login.jsp">Login</a> | <a href="signup.jsp">Sign up</a>
						</li>
					</ul>
				</div>
			</div>
			<div id="contents">
                            <center><div id="adbox" >
                                    <img src="images/Confirm.png"> Successfully registered...
                                    <hr/>
                                </div></center>
			</div>
                    <div>
                        <image src="images/imagesCA4H0VC6.jpg" width="150" height="90"/>
                        <image src="images/imagesCA4WYVWM.jpg" width="150" height="90"/>
                        <image src="images/fg.jpg" width="150" height="90"/>
                        <image src="images/wheat.jpg" width="150" height="90"/>
                        <image src="images/wheat2.jpg" width="150" height="90"/>
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



