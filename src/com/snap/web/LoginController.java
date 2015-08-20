package com.snap.web;

import java.util.HashSet;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.snap.beans.CatalogTableBean;
import com.snap.beans.UserBean;
import com.snap.dao.DAO;
import com.snap.dao.DAOImpl2;

  
//this is called controller , it is controlled by dispatcher servlet

@Controller
public class LoginController {
	
private static AbstractApplicationContext fac;
	
	static{
		fac=new ClassPathXmlApplicationContext("beanshib.xml");
		
	}
	

	@RequestMapping(value="login.htm",method=RequestMethod.POST)
	public String checklogin(HttpServletRequest request,Model model){

			String email = request.getParameter("lemail");
			String password =request.getParameter("lpwd");
	
			String view = null;
			DAO dao=fac.getBean("mydao",DAOImpl2.class);
			UserBean user = dao.getUser(email);
			if(user != null){
				String pwd = (String) user.getPassword();
				if(pwd.equals(password)){
					HttpSession sess = request.getSession();
					sess.setAttribute("username", user.getName());
					sess.setAttribute("useremail", user.getEmail());
					Set<CatalogTableBean> cart=new HashSet<CatalogTableBean>();
					sess.setAttribute("cart", cart);
					view = "Page2.jsp";
				}
				else{
					view ="SignupPage.jsp";
				}
			}
			return view;
		}
	
	
	@RequestMapping(value="signup.htm",method=RequestMethod.POST)
	public String signup(HttpServletRequest request,Model model){
		
	String username = request.getParameter("name");
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	String address = request.getParameter("address");
	String phoneno = request.getParameter("contact");

	String view = null;
	DAO dao = fac.getBean("mydao", DAOImpl2.class);
	UserBean user = dao.getUser(email);
	
	if(user == null){
		int status = dao.saveUser(username,email,password,address,phoneno);
		if(status == 1){
			view ="Sucess.jsp";
		}
	}
	else{
		view ="SignupPage.jsp";
	}
		return view;
	}
	
	
	
	
	@RequestMapping(value="update.htm",method=RequestMethod.POST)
	public String UpdateProfile(HttpServletRequest request,Model model){
		
		String password = request.getParameter("newpassword");
		String phoneno = request.getParameter("mobile");
		String address = request.getParameter("address");
		DAO dao = fac.getBean("mydao", DAOImpl2.class);
		HttpSession sess = request.getSession();
		String email = (String) sess.getAttribute("useremail");
		dao.updateProfile(email,password,phoneno,address);
		String view = "UpdateSucess.jsp";
		return view;
	}
	
	
	@RequestMapping(value="admin.htm",method=RequestMethod.POST)
	public String admin(HttpServletRequest request,Model model){
		
		String user = request.getParameter("admin");
		String password = request.getParameter("pass");
		String view = null;
		if(user.equals("admin") && password.equals("snapdeal")){
			HttpSession sess = request.getSession();
			sess.setAttribute("admin", user);
			view = "Admin1.jsp";
		}
		else{
			view = "admin.jsp";
		}
		return view;
	}
}
	
	

