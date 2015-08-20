<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Area | R-Shopping</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/price-range.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
	<link href="css/responsive.css" rel="stylesheet">

</head>
<script type="text/javascript">

var sec = "22";

function selectionChanged(val1){
	
	//alert(val1);
	sec = val1;
}


function getSuggests(val)
{
	
	
	var req=null;
    
	if(window.XMLHttpRequest)
		   {
		     req=new XMLHttpRequest();	//Firefox,chrome,safari ,IE7  
		   }
	   
	   else
		   {
		   
		     req=ActiveXObject("Microsoft.XMLHTTP");//less than IE7..i.e.IE6,IE4,IE5
		   }
	   
	     req.open("GET","AutoServer.jsp?cname="+val,true);
	     req.send();
	     
	     req.onreadystatechange=function()
	     {
	    	 if(req.readyState==4 && req.status==200)
	    		 {
	    		    var resp=req.responseText;
	    		    
	    		    var arr=resp.split("-");
	    		    
	    		    var res="";
	    		    for(var i=0;i<arr.length;++i)
    			    {   			      
    			       res+="<a href='searchByCategoryArea.htm?cat="+arr[i]+"&sector="+sec+"'>"+arr[i]+"</a><br/>";    			       
    			    }
    		         
    		        document.getElementById("div1").innerHTML=res;	 
	    		  }
	    		 
	    	 
	    	 	
        }
}
</script>


<body>

<c:if test="${sessionScope.username ne null }">
<%@include file="header1.jsp" %>


						
		<section><!--form-->
		<div class="container" >
			<div class="row" >
				<div class="col-sm-4 col-sm-offset-1">
					<div class="login-form"><!--login form-->
						<h2 align="center">Enter the area</h2>
						<form action="#">
							
							<select id="sect" onchange="selectionChanged(this.options[this.selectedIndex].text);">
                            	
                            	<option value="" disabled selected >Select Sector</option>
    								<c:forEach items="${requestScope.slist}" var="s" varStatus="myIndex">
    								    <c:choose>
    										<c:when test="${ myIndex.index <= 0}">
       												<option value="${s}" selected>${s}</option>
    										</c:when>
    										
    										<c:otherwise>
        											<option value="${s}">${s}</option>
    										</c:otherwise>
										</c:choose>
    								    
    								    
    								</c:forEach>
                             </select>
                             
        					<div style="height: 10px"></div>
        					<input name="cat" type="text" placeholder="Category" onkeyup="getSuggests(this.value)">
        					<div id="div1" style="height:150px;width:150px">
						</form>
					</div><!--/login form-->
				</div>
				<div class="col-sm-1">
				</div>
				
			</div>
		</div>
	</section>

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