package com.servlets;

import com.info.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Random;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/Game")
public class Game extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String gameOver ="/GameOver.jsp";
		String gameStart = "/Play.jsp";
		String errorPage = "/ErrorPage.jsp";
		
		// Dice attributes
		String diceNum = request.getParameter("selectdice");
		Random rn = new Random();
		int res = 1 + rn.nextInt(6);

		// Dice instance
		Dice dice = new Dice(diceNum, res);

		// add dice to list
		HttpSession session = request.getSession();
		ArrayList<Dice> dicelist;
		if (session.getAttribute("dicelist") == null) {

			dicelist = new ArrayList<Dice>();
			session.setAttribute("dicelist", dicelist);

		} else {
			dicelist = (ArrayList<Dice>) session.getAttribute("dicelist");
		}
		dicelist.add(dice);

		// Compute
		User u = (User) session.getAttribute("user");
		Message msg = new Message("", 0);
		
		if (diceNum != null) {
			if("none".equals(diceNum)) {
				msg.setMsg("Please select a Dice");
				msg.setCode(106);
				getServletContext().setAttribute("error", msg);
				getServletContext().getRequestDispatcher(errorPage).forward(request, response);
				session.removeAttribute("dicelist");
				return;
			}
			else if (dicelist.size() >= 2 && diceNum.equals(dicelist.get(0).getDiceNum())) {
				u.setScore(-1);
				u.setBestScore(-1);
				getServletContext().getRequestDispatcher(gameOver).forward(request, response);
				session.removeAttribute("dicelist");
				return;
			} else if(dicelist.size() == 3 && diceNum.equals(dicelist.get(1).getDiceNum())) {
				u.setScore(-1);
				u.setBestScore(-1);
				getServletContext().getRequestDispatcher(gameOver).forward(request, response);
				session.removeAttribute("dicelist");
				return;
			} else if(dicelist.size() == 3) {
				if(dicelist.get(0).getDiceRes() < dicelist.get(1).getDiceRes() && dicelist.get(1).getDiceRes() < dicelist.get(2).getDiceRes()) {
					int result = dicelist.get(0).getDiceRes() + dicelist.get(1).getDiceRes() + dicelist.get(2).getDiceRes();
					u.setScore(result);
					if (result > u.getBestScore()) {
						u.setBestScore(result);
					}
					getServletContext().getRequestDispatcher(gameOver).forward(request, response);
					session.removeAttribute("dicelist");
					return;
				} else if(dicelist.get(0).getDiceRes() > dicelist.get(1).getDiceRes() && dicelist.get(1).getDiceRes() > dicelist.get(2).getDiceRes()) {
					int result = dicelist.get(0).getDiceRes() * dicelist.get(1).getDiceRes() * dicelist.get(2).getDiceRes();
					u.setScore(result);
					if (result > u.getBestScore()) {
						u.setBestScore(result);
					}
					getServletContext().getRequestDispatcher(gameOver).forward(request, response);
					session.removeAttribute("dicelist");
					return;
				} else {
					session.removeAttribute("dicelist");
					u.setScore(0);
					if (0 >= u.getBestScore()) {
						u.setBestScore(0);
					}
					getServletContext().getRequestDispatcher(gameOver).forward(request, response);
					return;
				}
			} else if(dicelist.size() == 2 && dicelist.get(1).getDiceRes() == 6) {
				session.removeAttribute("dicelist");
				u.setScore(0);
				if (0 >= u.getBestScore()) {
					u.setBestScore(0);
				}
				getServletContext().getRequestDispatcher(gameOver).forward(request, response);
				return;
			} else if(dicelist.size() == 2 && dicelist.get(1).getDiceRes() == 1) {
				session.removeAttribute("dicelist");
				u.setScore(0);
				if (0 >= u.getBestScore()) {
					u.setBestScore(0);
				}
				getServletContext().getRequestDispatcher(gameOver).forward(request, response);
				return;
			} else if(dicelist.size() == 2 && dicelist.get(1).getDiceRes() == dicelist.get(0).getDiceRes()) {
				session.removeAttribute("dicelist");
				u.setScore(0);
				if (0 >= u.getBestScore()) {
					u.setBestScore(0);
				}
				getServletContext().getRequestDispatcher(gameOver).forward(request, response);
				return;
			}else {
				getServletContext().getRequestDispatcher(gameStart).forward(request, response);
				return;
			}
		}

		else {
			String replay = request.getParameter("replay");
			if("REPLAY".equals(replay)) {
				session.removeAttribute("dicelist");
				u.setScore(0);
				getServletContext().getRequestDispatcher(gameStart).forward(request, response);
				return;
			}
		}
	}
}
