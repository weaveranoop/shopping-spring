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
public class LogoutController {
	
private static AbstractApplicationContext fac;
	
	static{
		fac=new ClassPathXmlApplicationContext("beanshib.xml");
		
	}
	

	@RequestMapping(value="logout.htm",method=RequestMethod.POST)
	public String Logout(HttpServletRequest request,Model model){
		
		HttpSession sess = request.getSession(false);
		if(sess!=null) {
			sess.invalidate();
		}
		return "SignupPage.jsp";
		}
	
	
}
