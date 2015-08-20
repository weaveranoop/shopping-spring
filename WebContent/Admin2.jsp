<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Admin Only | E-Shopping</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/price-range.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
	<link href="css/responsive.css" rel="stylesheet">

</head>
<body>

<%@include file="headerAdmin.jsp" %>

	<section><!--form-->
		<div class="container">
			<div class="row">
				<div class="col-sm-4 col-sm-offset-1">
					<div class="login-form"><!--login form-->
						<h2>Add a new Product</h2>
						<form action="addprod.htm" method="post">
							
							<select name="shopname">
							 		<option value="" disabled selected>Select a Shop Name</option>
                					<option value="electronics" selected="selected">Electronics</option>
                					<option value="clothing">Clothing</option>
                					<option value="sports">Sports</option>
                					<option value="footwear">Footwear</option>
                					<option value="food">Food</option>
                					<option value="departmental">Departmental</option>
        					</select>
        					<div style="height: 10px"></div>
        					<input type="text" placeholder="Shop ID" name="sid">
							<input type="text" placeholder="Product Name" name="pname">
							<input type="text" placeholder="Price" name="pprice">
							<input type="text" placeholder="Details" name="pdetails">
							 
							<button type="submit" class="btn btn-default">Add Product</button>
						</form>
					</div><!--/login form-->
				</div>
				<div class="col-sm-1">
				</div>
				
			</div>
		</div>
	</section>

</body>
</html>