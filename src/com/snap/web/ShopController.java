package com.snap.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.snap.beans.ShopBean;
import com.snap.dao.DAO;
import com.snap.dao.DAOImpl2;




@Controller
public class ShopController {
	
private static AbstractApplicationContext fac;
	
	static{
		fac=new ClassPathXmlApplicationContext("beanshib.xml");
		
	}
	
	@RequestMapping(value="searchByCategoryArea.htm",method=RequestMethod.GET)
	public String processShopCategoryArea(HttpServletRequest req,Model model){
		
		
		
	int sector =Integer.parseInt(req.getParameter("sector"));
		String category=req.getParameter("cat");
		DAO dao = fac.getBean("mydao", DAOImpl2.class);
		List<ShopBean> lst = dao.getShopByCategoryArea(category, sector);
		//shoplist=getShopByCategoryArea(category,area);
		
		model.addAttribute("slist",lst);
		
		return "ShopListing.jsp";
	}
	
	
	@RequestMapping(value="SearchByCategory.htm",method=RequestMethod.GET)
	public String processShopCategory(HttpServletRequest req,Model model){
		
		String category=req.getParameter("cat");
		DAO dao = fac.getBean("mydao", DAOImpl2.class);
		List<ShopBean> shoplist=null;
		shoplist=dao.getShopByCategory(category);
		
		model.addAttribute("slist",shoplist);
		
		return "ShopListing.jsp";
	}
	
	
	@RequestMapping(value="shopviewAll.htm",method=RequestMethod.GET)
	public String processShop(Model model){
		
		List<ShopBean> shoplist=null;
		//shoplist=getAllShops();
		
		model.addAttribute("shops",shoplist);
		
		return "ShopResult";
	}
	
}

