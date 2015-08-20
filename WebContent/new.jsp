<%@page import="java.util.Set"%>
<%@page import="com.snap.beans.CatalogTableBean"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%	int pid =Integer.parseInt(request.getParameter("pid"));
	String pname=request.getParameter("pname");
	double price =Double.parseDouble(request.getParameter("price"));
	int shopid =Integer.parseInt(request.getParameter("shopid"));
	 
	HttpSession sess = request.getSession();
	Set<CatalogTableBean> cart=(Set<CatalogTableBean>)sess.getAttribute("cart");
	CatalogTableBean obj=new CatalogTableBean();
	System.out.println(pname+" "+pid+" "+price);
	obj.setPrice(price);
	obj.setProduct_id(pid);
	obj.setShop_id(shopid);
	obj.setProduct_name(pname);
	System.out.println(obj.getPrice());
	cart.add(obj);

 	sess.setAttribute("cart",cart);
  
%>
