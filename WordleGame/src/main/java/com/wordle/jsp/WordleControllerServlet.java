package com.wordle.jsp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

public class WordleControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public WordleControllerServlet() {
		super();
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String wordOftheDay = "";
		String counter = request.getParameter("counter");
		if (Integer.parseInt(counter) == 100) {// when counter=100,generate wordOfThe Day
			wordOftheDay = WordleGameLogic.generateWordleWord();
			// set the word as session object for further comparison
			request.getSession().setAttribute("wordOftheDay", wordOftheDay);
		} else {
			String wordToBeChecked = request.getParameter("word");
			// Retrieve the wordOfTheDay for comparison
			String generatedWord = (String) request.getSession().getAttribute("wordOftheDay");
			if (generatedWord.equals(wordToBeChecked)) {
				PrintWriter out = response.getWriter();
				out.println("W");// send String 'W' indicating the user input word is correct- GAME WIN
			} else {
				boolean result = WordleGameLogic.checkWordinList(wordToBeChecked);// check if user input word is valid
				if (!result) {
					PrintWriter out = response.getWriter();
					out.println("N");// send String'N' indicating word is not valid
				} else {

					// below method is to handle the color coding for words
					String processedString = WordleGameLogic.processWord(wordToBeChecked, generatedWord);
					PrintWriter out = response.getWriter();
					out.println(processedString);// response will be in the form - "GYZZY"
					/*
					 * 'G'-The letter is in correct position 'Y'-The letter exists in word,but is in
					 * wrong position 'Z'-The letter does not exist in wordOfTheDay
					 */

				}
			}
		}
	}

}
