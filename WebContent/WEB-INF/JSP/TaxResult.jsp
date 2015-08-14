<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>Tax Result</h1>
	<table cellpadding="10" bgcolor="#e3e3e3">
		<tr>
			<td>Name</td>
			<td>${param.txtname}</td>
		</tr>
        <tr>
			<td>Annual Income</td>
			<td>${param.income}</td>
		</tr>
		<tr>
			<td>Tax to be paid</td>
			<td>${taxresult}</td>
		</tr>
	</table>
</body>
</html>



