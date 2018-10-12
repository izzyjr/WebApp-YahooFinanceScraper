package com.webscraper;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import com.webscraper.user.User;
import com.webscraper.user.UserDataUtil;

/**
 * Servlet implementation class Servlet
 */
@WebServlet("/Servlet")
public class Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       	
		private CoinDataUtil coinDataUtil;
		private UserDataUtil userDataUtil;
		private boolean userLogged = false;
	
		@Resource(name="WebApp-YahooFinanceScraper")
		private DataSource dataSource;
		
		@Override
		public void init() throws ServletException {
			super.init();
			
			try {
				coinDataUtil = new CoinDataUtil(dataSource);
				userDataUtil = new UserDataUtil(dataSource);
			}
			catch (Exception exc) {
				throw new ServletException(exc);
			}
		}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			//current user
//			HttpSession session = request.getSession(false);
//			User currentUser = ((User) (session.getAttribute("currentSessionUser")));
			
			//read the "command" parameter
			String theCommand = request.getParameter("command");
			
			if (userLogged) {
				
				//route to the appropriate method
				switch(theCommand) {
					case "LIST":
						listCoins(request, response);
						break;
						
					case "LOGOUT":
						logout(request, response);
						break;

					default:
						listCoins(request, response);
						break;
				}
				
			} else {
				response.sendRedirect("home_page.jsp");
			}
			
		}
		catch (Exception exc) {
			throw new ServletException(exc);
		}
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			String theCommand = request.getParameter("command");
			switch(theCommand) {
			
			case "LOGIN":
				login(request, response);
				break;
				
			}
			
		} catch (Exception exc) {
			throw new ServletException(exc);
		}
		
	}
	
	private void listCoins(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
		
		// Place scraped Yahoo coins in list
		List<Coin> coins = coinDataUtil.coinScraper();
				
		try {
			// Clear database
			coinDataUtil.clearDb();
			
			// Send coin list "coins" to database
			coinDataUtil.listToDbTable(coins);
			
			// Get list of coins from database
			List<Coin> coinsDb = coinDataUtil.getCoinsDb();
			
			// add coinsDB to the request
			request.setAttribute("coin_list", coinsDb);
			
			// send to JSP (view)
			RequestDispatcher dispatcher = request.getRequestDispatcher("view_table.jsp");
			
			dispatcher.forward(request, response);
			
		} catch (Exception exc) {
			throw new ServletException(exc);
		}

		
		for (int i = 0; i < coins.size(); i++) {
            System.out.println(coins.get(i).getNumberOrder() + ": " + coins.get(i).getName());
        }
		
	}
	
	private void login(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
		
		try {	    
			
		     User user = new User();
		     user.setUserName(request.getParameter("un"));
		     user.setPassword(request.getParameter("pw"));
		
		     user = userDataUtil.login(user);
			   		    
		     if (user.isValid()) {
		          HttpSession session = request.getSession();	    
		          session.setAttribute("currentSessionUser",user);
		          userLogged = true;
		          response.sendRedirect("home_page_logged.jsp"); //logged-in page      		
		     } else {
		    	 response.sendRedirect("invalidLogin.jsp"); //error page
		     }
		          
		} catch (Throwable theException) {
			System.out.println(theException);
		}
	}
	
	private void logout(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
		
		try {
			
			HttpSession session = request.getSession();
			session.removeAttribute("currentSessionUser");
			userLogged = false;
			session.invalidate();
			response.sendRedirect("home_page.jsp");
			
		} catch (Throwable theException) {
			System.out.println(theException);
		}
		
		
	}
	
}
