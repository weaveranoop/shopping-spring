package com.snap.web;

import java.util.List;


import javax.servlet.http.HttpServletRequest;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.snap.beans.CatalogTableBean;
import com.snap.beans.ShopBean;
import com.snap.dao.DAO;

import com.snap.dao.DAOImpl2;

//this is called controller , it is controlled by dispatcher servlet

@Controller
public class ProductController {
	
private static AbstractApplicationContext fac;
	
	static{
		fac=new ClassPathXmlApplicationContext("beanshib.xml");
		
	}
	

	@RequestMapping(value="product.htm",method=RequestMethod.GET)
	public String checklogin(HttpServletRequest request,Model model){
		
		int shop_id = Integer.parseInt(request.getParameter("shop_id")); 
			DAO dao=fac.getBean("mydao",DAOImpl2.class);
			List<CatalogTableBean> lst=dao.listItems(shop_id);
			model.addAttribute("plist",lst);
			
						
			return "ProductList.jsp";

		}
	
	
	@RequestMapping(value="prod.htm",method=RequestMethod.POST)
	public String search(HttpServletRequest request,Model model){
		
		String item=request.getParameter("item");
			DAO dao=fac.getBean("mydao",DAOImpl2.class);
			List<ShopBean> lst=dao.getAllShops(item);
			model.addAttribute("slist",lst);
						
			return "ShopListing.jsp";

		}
		
}
