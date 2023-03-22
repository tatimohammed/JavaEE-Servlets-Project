package com.servlets;

import java.io.IOException;
import java.util.ArrayList;

import com.info.*;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Page to redirect the client
		String userHome = "/UserHome.jsp";
		String errorPage = "/ErrorPage.jsp";

		// User attributes
		String login = request.getParameter("login");
		String code = request.getParameter("code");
		
		// Servlet context
		ServletContext contx = getServletContext();

		// Object to manage the exceptions
		Message msg = new Message("", 0);
		
		// List of users
		@SuppressWarnings("unchecked")
		ArrayList<User> listuser = (ArrayList<User>) contx.getAttribute("listuser");

		// Checking if the list not null
		if (listuser != null) {
			// Checking if there is a user inside the list
			if (!listuser.isEmpty()) {
				for (User u : listuser) {
					// Checking user data to authentify 
					if (login.equals(u.getLogin()) && code.equals(u.getCode())) {
						
						// if the user exist we create a session and add it into it
						HttpSession session = request.getSession();
						session.setAttribute("user", u);
						
						// Redirect the user to User home page
						contx.getRequestDispatcher(userHome).forward(request, response);
						return;
					}
				}
				// The case of user not exist
				for (User u : listuser) {
					if (!login.equals(u.getLogin()) && !code.equals(u.getCode())) {
						
						msg.setMsg("User Not Found");
						msg.setCode(404);
						contx.setAttribute("error", msg);
						contx.getRequestDispatcher(errorPage).forward(request, response);
						return;
					}
				}
				// The case of Login or Password is incorrect
				for (User u : listuser) {
					if (!login.equals(u.getLogin()) || !code.equals(u.getCode())) {

						msg.setMsg("Login or Password is incorrect");
						msg.setCode(401);
						contx.setAttribute("error", msg);
						contx.getRequestDispatcher(errorPage).forward(request, response);
						return;
					}
				}
				
			}
			// List is null so the user not exist
		} else {
			msg.setMsg("User Not Found");
			msg.setCode(404);
			contx.setAttribute("error", msg);
			contx.getRequestDispatcher(errorPage).forward(request, response);
			return;
		}

	}

}
