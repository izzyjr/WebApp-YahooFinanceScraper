package com.webscraper;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 * Servlet implementation class Servlet
 */
@WebServlet("/Servlet")
public class Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       	
		private CoinDataUtil coinDataUtil;
	
		@Resource(name="WebApp-YahooFinanceScraper")
		private DataSource dataSource;
		
		@Override
		public void init() throws ServletException {
			super.init();
			
			try {
				coinDataUtil = new CoinDataUtil(dataSource);
			}
			catch (Exception exc) {
				throw new ServletException(exc);
			}
		}
		

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Place scraped Yahoo coins in list
		List<Coin> coins = coinDataUtil.coinScraper();
				
		try {
			// Clear database
			coinDataUtil.clearDb();
			
			//Send coin list "coins" to database
			coinDataUtil.listToDbTable(coins);
			
		} catch (Exception exc) {
			throw new ServletException(exc);
		}

		
		for (int i = 0; i < coins.size(); i++) {
            System.out.println(coins.get(i).getNumberOrder() + ": " + coins.get(i).getName());
        }
//		
//		request.setAttribute("coin_list", coins);
//		
//		RequestDispatcher dispatcher = request.getRequestDispatcher("view_table.jsp");
//		
//		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
