<%@page import="java.util.Map"%>
<%@page import="java.util.Set"%>
<%@page import="com.snap.beans.CatalogTableBean"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
		int pid =Integer.parseInt(request.getParameter("pid"));
		double price =Double.parseDouble(request.getParameter("price"));
		 
		HttpSession sess = request.getSession();
		Set<CatalogTableBean> cart=(Set<CatalogTableBean>)sess.getAttribute("cart");
		Map<Integer,Integer> quantity=(Map<Integer,Integer>)sess.getAttribute("quantity");
		
		int newQuantity=Integer.parseInt(request.getParameter("qty"));
		int oldQuantity=quantity.get(pid);
		
		quantity.put(pid, newQuantity);
		
		sess.setAttribute("quantity", quantity);
		
		double amount=(Double)sess.getAttribute("amount");
		amount+=(newQuantity-oldQuantity)*price;
		
		sess.setAttribute("amount", amount);
		
		System.out.print(amount);
		out.print(amount);

%>
