<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<%
//System.out.println("hello");
	String str = request.getParameter("cname");
	String res = "";
	if (str.equals("e")){
		res="electronics";
	}else if (str.equals("c")){
		res="clothing";
	}else if (str.equals("s")){
		res="sports";
	}
	else if (str.equals("d")){
		res="departmental";
	}
	else if (str.equals("f")){
		res="food-footwear";
	}
	else if (str.equals("fo")){
		res="food-footwear";
	}
	else if (str.equals("foo")){
		res="food-footwear";
	}
	else if (str.equals("food")){
		res="food";
	}
	else if (str.equals("foot")){
		res="footwear";
	}
	out.println(res);

%>