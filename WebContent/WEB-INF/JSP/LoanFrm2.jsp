<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
   <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<h1>EMI Calucaltion</h1>
<hr>

<form:form action="loan.htm" commandName="loanemi" method="post">
<table cellpadding="10" bgcolor="e3e3e3">
	<tr>
		<td>Name</td>
		<td><form:input path="name"/></td>
	</tr>
		
	<tr>
		<td>Loan Amount</td>
		<td><form:input path="amt"/></td>
	</tr>
	
	<tr>
		<td>year</td>
		<td>
			<form:select path="years">
				<form:option value="10">10</form:option>
				<form:option value="15">15</form:option>
				<form:option value="20">20</form:option>
				<form:option value="25">25</form:option>
				<form:option value="30">30</form:option>
			</form:select>
		</td>
	</tr>
	
	<tr>
		<td colspan="2" align="center"><input type="submit" value="Calulate EMI"></td>
	</tr>

</table>

</form:form>
	

</body>
</html>