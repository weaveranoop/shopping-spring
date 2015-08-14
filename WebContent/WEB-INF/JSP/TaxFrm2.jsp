<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<h1>Tax Form</h1>
<hr/>
<form:form action="taxview.htm" commandName="taxbean" method="get">

	<table cellpadding="10">
		<tr>
			<td><spring:message code="name"></spring:message></td>
			<td><form:input path="name"/></td>
		</tr>
		
		<tr>
			<td><spring:message code="income"></spring:message></td>
			<td><form:input path="income"/></td>
		</tr>
		
		<tr>
			<td><input type="submit"/></td>
			<td></td>
		
		</tr>
		
	
	</table>

</form:form>

</body>
</html>