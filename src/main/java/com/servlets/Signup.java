package com.servlets;

import com.info.Message;
import com.info.User;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/signup")
public class Signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String loginPage = "/Login.jsp";
		String errorPage = "/ErrorPage.jsp";
		
		String name = request.getParameter("name");
		String login = request.getParameter("login");
		String code = request.getParameter("code");
		
		User user = new User(name, login, code, 0, 0);
		Message msg = new Message("", 0);
		
		ServletContext contx = getServletContext();
		
		
		ArrayList<User> listuser;
		if (contx.getAttribute("listuser") == null) {
			
			listuser = new ArrayList<User>();
			contx.setAttribute("listuser", listuser);
			
		} else {
			listuser = (ArrayList<User>) contx.getAttribute("listuser");
		}
		// Checking if user already sign up
		for(User u : listuser) {
			if((user.getLogin().equals(u.getLogin()) && user.getCode().equals(u.getCode())) || user.getName().equals(u.getName())) {
				msg.setMsg("User Already Exist");
				msg.setCode(403);
				contx.setAttribute("error", msg);
				contx.getRequestDispatcher(errorPage).forward(request, response);
				return;
			}
		}
		listuser.add(user);

		contx.getRequestDispatcher(loginPage).forward(request, response);
		
	}

}
