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

		String userHome = "/UserHome.jsp";
		String errorPage = "/ErrorPage.jsp";

		String login = request.getParameter("login");
		String code = request.getParameter("code");

		ServletContext contx = getServletContext();
		Message msg = new Message("", 0);
		@SuppressWarnings("unchecked")
		ArrayList<User> listuser = (ArrayList<User>) contx.getAttribute("listuser");

		if (listuser != null) {
			if (!listuser.isEmpty()) {
				for (User u : listuser) {
					if (login.equals(u.getLogin()) && code.equals(u.getCode())) {

						HttpSession session = request.getSession();
						session.setAttribute("user", u);

						contx.getRequestDispatcher(userHome).forward(request, response);
						return;
					}
				}
				for (User u : listuser) {
					if (!login.equals(u.getLogin()) && !code.equals(u.getCode())) {

						msg.setMsg("User Not Found");
						msg.setCode(404);
						contx.setAttribute("error", msg);
						contx.getRequestDispatcher(errorPage).forward(request, response);
						return;
					}
				}
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

		} else {
			msg.setMsg("User Not Found");
			msg.setCode(404);
			contx.setAttribute("error", msg);
			contx.getRequestDispatcher(errorPage).forward(request, response);
			return;
		}

	}

}
