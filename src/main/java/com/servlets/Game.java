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
		
		// Page to redirect the client
		String gameOver ="/GameOver.jsp";
		String gameStart = "/Play.jsp";
		String errorPage = "/ErrorPage.jsp";
		
		// Dice attributes
		String diceNum = request.getParameter("selectdice");
		Random rn = new Random();
		int res = 1 + rn.nextInt(6);

		// Dice instance
		Dice dice = new Dice(diceNum, res);

		// add dice to a list in the session
		HttpSession session = request.getSession();
		ArrayList<Dice> dicelist;
		
		// Checking if the list does not exist so we create it. Otherwise, we call it from the session
		if (session.getAttribute("dicelist") == null) {

			dicelist = new ArrayList<Dice>();
			session.setAttribute("dicelist", dicelist);

		} else {
			dicelist = (ArrayList<Dice>) session.getAttribute("dicelist");
		}
		dicelist.add(dice);

		// The session user
		User u = (User) session.getAttribute("user");
		
		// Object to manage the exceptions
		Message msg = new Message("", 0);
		
		// Game on action
		
		// Checking that the dice number is not null
		if (diceNum != null) {
			// The case of the user did not select any dice 
			if("none".equals(diceNum)) {
				// The error message 
				msg.setMsg("Please select a Dice");
				// Indicated that an attribute is missing
				msg.setCode(106);
				
				// Storing the error message in the context
				getServletContext().setAttribute("error", msg);
				// Redirect the user to the error page & deleting the dice list from the session
				getServletContext().getRequestDispatcher(errorPage).forward(request, response);
				session.removeAttribute("dicelist");
				return;
			}
			
			// The case of lancing the same dice more than one time
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
			
			// The score calculation cases
			} else if(dicelist.size() == 3) {
				// if the result of the dice 1 < dice 2 < dice 3 (the number of dice is irrelevant)
				if(dicelist.get(0).getDiceRes() < dicelist.get(1).getDiceRes() && dicelist.get(1).getDiceRes() < dicelist.get(2).getDiceRes()) {
					int result = dicelist.get(0).getDiceRes() + dicelist.get(1).getDiceRes() + dicelist.get(2).getDiceRes();
					u.setScore(result);
					if (result > u.getBestScore()) {
						u.setBestScore(result);
					}
					getServletContext().getRequestDispatcher(gameOver).forward(request, response);
					session.removeAttribute("dicelist");
					return;
				// if the result of the dice 1 < dice 2 < dice 3
				} else if(dicelist.get(0).getDiceRes() > dicelist.get(1).getDiceRes() && dicelist.get(1).getDiceRes() > dicelist.get(2).getDiceRes()) {
					int result = dicelist.get(0).getDiceRes() * dicelist.get(1).getDiceRes() * dicelist.get(2).getDiceRes();
					u.setScore(result);
					if (result > u.getBestScore()) {
						u.setBestScore(result);
					}
					getServletContext().getRequestDispatcher(gameOver).forward(request, response);
					session.removeAttribute("dicelist");
					return;
				// if non of the last cases
				} else {
					session.removeAttribute("dicelist");
					u.setScore(0);
					if (0 >= u.getBestScore()) {
						u.setBestScore(0);
					}
					getServletContext().getRequestDispatcher(gameOver).forward(request, response);
					return;
				}
			// If there is no need to wait for the third shot to get the score
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
				// We still lancing the dices we keep the user in the same play page
				getServletContext().getRequestDispatcher(gameStart).forward(request, response);
				return;
			}
		}
		// If game over when the player press "REPLAY" the game should initialize  
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
