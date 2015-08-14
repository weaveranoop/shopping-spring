package com.snap.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.coyote.http11.Http11AprProcessor;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.snap.beans.UserBean;

import com.snap.dao.DAO;

import com.snap.dao.DAOImpl2;

import sun.misc.Contended;
  
//this is called controller , it is controlled by dispatcher servlet

@Controller
public class LoginController {
	
private static AbstractApplicationContext fac;
	
	static{
		fac=new ClassPathXmlApplicationContext("beanshib.xml");
		
	}
	

	@RequestMapping(value="login.htm",method=RequestMethod.GET)
	public String checklogin(HttpServletRequest request,Model model){
		
		
		System.out.println("hii login");	
		String email = request.getParameter("lemail");
			String password =request.getParameter("lpwd");
	
			String view = null;
			DAO dao=fac.getBean("mydao",DAOImpl2.class);
			
			UserBean user = dao.getUser(email);
			System.out.println(user.getPassword());
			if(user != null){
				String pwd = (String) user.getPassword();
				if(pwd.equals(password)){
					HttpSession sess = request.getSession();
					sess.setAttribute("username", user.getName());
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
	HttpSession sess = request.getSession();
	DAO dao = fac.getBean("mydao", DAOImpl2.class);
	UserBean user = dao.getUser(email);
	
	if(user == null){
		/*System.out.println("in");
		System.out.println(address);
		System.out.println(password);
		System.out.println("out");*/
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
}
	
	

