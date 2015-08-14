<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<table cellpadding="10" bgcolor="#e3e3e3">
	<tr>
		<td>Name</td>
		<td>${loanemi.name}</td>              <!-- request scope -->
	</tr>
	
	<tr>
		<td>Loan Amount</td>
		<td>${loanemi.amt}</td>
	</tr>
	
	<tr>
		<td>years</td>
		<td>${loanemi.years}</td>
	</tr>


	
	
	<tr>
		<td>EMI</td>
		<td>${emi}</td>
	</tr>


</table>


</body>
</html>