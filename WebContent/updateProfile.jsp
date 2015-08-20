<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Login | R-Shopping</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/price-range.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
	<link href="css/responsive.css" rel="stylesheet">
</head>
<script type="text/javascript">

     function validate()
   		{  
    	 		var address=document.getElementById("addr").value;
		  		 var contact=document.getElementById("contact").value;
    		   var pass=document.getElementById("newpass").value; 	
    		   var oldpass=document.getElementById("oldpass").value; 
    		   var status = pass.localeCompare(oldpass);
    		   var contactpatt=/^[0-9]{10}$/;
     		   var res=contactpatt.test(contact);
     		   if(status == 0)
     		   {
     			  alert("old and new password must be Different ");
 		    	  return false;
         		}
 		    	if (pass.length < 8)
 		    	{
 		    	  alert("password length should be atleast 8 ");
 		    	  return false;
 		    	}
 		    	 var hasUpperCase = /[A-Z]/.test(pass);
 		    	var hasLowerCase = /[a-z]/.test(pass);
 		    	var hasNumbers = /\d/.test(pass);
 		    	var hasNonalphas = /\W/.test(pass);
 		    	if (hasUpperCase + hasLowerCase + hasNumbers + hasNonalphas < 4)
 		    		{
 		    	       alert("bad password:must have at least one uppercase,one lowercase,one numeric and one non alpha numeric");
 		    	       return false;
 		    		} 
 		    
 		    if(address=="")
 		    {
			      alert("address should not be empty");	   
			      return false;
			   }
 		    
 		    if(!res)
 			   {
 			      alert("contact number should be of 10 digits");	   
 			      return false;
 			   }
 		   return true;     		   
 		}  

</script>
<body>

<c:if test="${sessionScope.username ne null }">
<%@include file="header1.jsp" %>

		<div class="container">
			<div class="row">
				<div class="col-sm-4 col-sm-offset-1">
					<div class="login-form" ><!--login form-->
						<h2>Update your Profile</h2>
						<form action="update.htm" onsubmit="return validate();" method="post" >
							<input type="password" placeholder="Old Password" name="oldpassword" id="oldpass">
							<input type="password" placeholder="New Password" name="newpassword" id="newpass">
							<input type="text" placeholder="Address" name="address" id="addr">
							<input type="text" placeholder="Contact No." name="mobile" id="contact">
							<button type="submit" class="btn btn-default">Update</button>
						</form>
					</div>
				</div>	
			</div>
		</div>	
</c:if>
<c:if test="${sessionScope.username eq null }">
	<%@include file="header.jsp" %>	
	<div align="center">
		<h3 style="color: red; ">You are not authenticated user.</h3>
		<h4 >Please Login to view the contents of the Page.</h4>
		<a href="SignupPage.jsp">Login</a>
	</div>
</c:if>
</body>
</html>