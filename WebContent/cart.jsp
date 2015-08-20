<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Cart | E-Shopping</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/price-range.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
	<link href="css/responsive.css" rel="stylesheet">
	
	<script type="text/javascript">
	function myfunction(price,pid) {
		
	//	alert(price+" "+pid);
		
		qty=document.getElementById(pid).value;
		total=qty*price;
		//alert(total);
		document.getElementById("total"+pid).innerHTML=total;
		
		
	}
	
	</script>

</head>

<body>

<c:if test="${sessionScope.username ne null }">
<%@include file="header1.jsp" %>	

	<section id="cart_items">
		<div class="container">
			<div class="table-responsive cart_info">
				<table class="table table-condensed">
					<thead>
						<tr class="cart_menu">
							<td class="image">Item</td>
							<td class="description"></td>
							<td class="price">Price &#8377;</td>
							<td class="quantity">Quantity</td>
							<td class="total">Total &#8377;</td>
							<td></td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${sessionScope.cart}" var="product">
						<tr>
							<td class="cart_product">
								<a href=""><img src="images/bag.png" width="100px" alt=""></a>
							</td>
							<td class="cart_description">
								<h4><a href="">${product.product_name}</a></h4>
								<%-- <p>${product.product_id}</p> --%>
							</td>
							<td class="cart_price">
								<p>&#8377; ${product.price}</p>
							</td>
							<td class="cart_quantity">
								<div class="cart_quantity_button">
									<input class="cart_quantity_input" type="text" name="quantity" value=1  size="2" id="${product.product_id}" onKeyUp="myfunction(${product.price},${product.product_id})">
								</div>
							</td>
							<td class="cart_total">
								<p class="cart_total_price" id="total${product.product_id}"> ${product.price}</p>
							</td>
							<!-- <td class="cart_delete">
								<a class="cart_quantity_delete" href=""><i class="fa fa-times"></i></a>
							</td> -->
						</tr>

						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</section>
	
	
	<section id="do_action">
		<div class="container">
			<div class="heading">
				<h3>Check the shopping basket and proceed.</h3>
			</div>
			
				<div class="col-sm-6" >
					<div class="total_area" >
						<ul>
							<li>Cart Sub Total <span>&#8377; 0</span></li>
							<li>Eco Tax <span>&#8377; 2</span></li>
							<li>Shipping Cost <span>Free</span></li>
							<li>Total <span>&#8377; 0</span></li>
						</ul>
							<a class="btn btn-default update" href="">Update</a>
							<a class="btn btn-default check_out" href="">Get Total</a>
					</div>
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