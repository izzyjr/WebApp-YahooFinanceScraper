package com.webscraper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

public class CoinDataUtil {
	
	private DataSource dataSource;	
	
	public CoinDataUtil(DataSource dataSource) {
		super();
		this.dataSource = dataSource;
	}

	public List<Coin> coinScraper() {
		
		List<Coin> coins = new ArrayList<Coin>();
		
		System.setProperty("webdriver.chrome.driver", "/Users/israelmesa/Desktop/ChromeDriver/chromedriver");

        WebDriver driver = new ChromeDriver();

        driver.get("https://finance.yahoo.com/cryptocurrencies?count=120");

        //Symbol

        String xpathSymbol = "//*[@id=\"scr-res-table\"]/div[2]/table/tbody/tr[*]/td[1]";
        
        List<WebElement> symbol = new ArrayList<WebElement>();

        symbol = driver.findElements(By.xpath(xpathSymbol));

        //Name

        String xpathName = "//*[@id=\"scr-res-table\"]/div[2]/table/tbody/tr[*]/td[2]";
        
        List<WebElement> name = new ArrayList<WebElement>();

        name = driver.findElements(By.xpath(xpathName));

        //Price

        String xpathPrice = "//*[@id=\"scr-res-table\"]/div[2]/table/tbody/tr[*]/td[3]";
        
        List<WebElement> price = new ArrayList<WebElement>();

        price = driver.findElements(By.xpath(xpathPrice));

        //Percent Change

        String xpathPercentChange = "//*[@id=\"scr-res-table\"]/div[2]/table/tbody/tr[*]/td[5]";
        
        List<WebElement> percentChange = new ArrayList<WebElement>();

        percentChange = driver.findElements(By.xpath(xpathPercentChange));

        //Market Cap

        String xpathMarketCap = "//*[@id=\"scr-res-table\"]/div[2]/table/tbody/tr[*]/td[6]";
        
        List<WebElement> marketCap = new ArrayList<WebElement>();

        marketCap = driver.findElements(By.xpath(xpathMarketCap));

        //Volume in Currency(24hr)

        String xpathVolumeCurrency = "//*[@id=\"scr-res-table\"]/div[2]/table/tbody/tr[*]/td[8]";
        
        List<WebElement> volumeCurrency = new ArrayList<WebElement>();

        volumeCurrency = driver.findElements(By.xpath(xpathVolumeCurrency));

        //Circulating Supply

        String xpathCirculatingSupply = "//*[@id=\"scr-res-table\"]/div[2]/table/tbody/tr[*]/td[10]";
        
        List<WebElement> circulatingSupply = new ArrayList<WebElement>();

        circulatingSupply = driver.findElements(By.xpath(xpathCirculatingSupply));

        int size = name.size();

        for (int i = 0; i < size; i++) {
            coins.add(new Coin((i + 1), 
            			symbol.get(i).getText(),
            			name.get(i).getText(), 
            			price.get(i).getText(), 
            			percentChange.get(i).getText(), 
            			marketCap.get(i).getText(), 
            			volumeCurrency.get(i).getText(), 
            			circulatingSupply.get(i).getText()));
        }
        
//        driver.quit();
        
        return coins;
		
	}
	
	private void close(Connection myConn, Statement myStmt, ResultSet myRs) {
		
		try {
			if (myRs != null) {
				myRs.close();
			}
			
			if (myStmt != null) {
				myStmt.close();
			}
			
			if (myConn != null) {
				myConn.close(); // Doesn't really close it...just puts back in connection pool
			}
		}
		catch(Exception exc) {
			exc.printStackTrace();
		}
		
	}
	
	public void listToDbTable(List<Coin> scrapedCoinList) throws Exception{
		
		Connection myConn = null;
		PreparedStatement myStmt = null;
		
		System.out.println(scrapedCoinList.size());
		
		for (int i = 0; i < scrapedCoinList.size(); i++) {
			
			try {
				//get db connection
				myConn = dataSource.getConnection();
				
				//create sql for insert
				String sql = "insert into coin " 
						+ "(number_order, symbol, name, price, percent_change, market_cap, volume_currency, circulating_supply) "
						+ "values (?, ?, ?, ?, ?, ?, ?, ?)";
				myStmt = myConn.prepareStatement(sql);
				
				//set the param values for the students
				myStmt.setInt(1, scrapedCoinList.get(i).getNumberOrder());
				myStmt.setString(2, scrapedCoinList.get(i).getSymbol());
				myStmt.setString(3, scrapedCoinList.get(i).getName());
				myStmt.setString(4, scrapedCoinList.get(i).getPrice());
				myStmt.setString(5, scrapedCoinList.get(i).getPercentChange());
				myStmt.setString(6, scrapedCoinList.get(i).getMarketCap());
				myStmt.setString(7, scrapedCoinList.get(i).getVolumeCurrency());
				myStmt.setString(8, scrapedCoinList.get(i).getCirculatingSupply());
				
				//execute sql insert
				myStmt.execute();
			}
			finally {
				//clean up JDBC	objects
				close(myConn, myStmt, null);
			}
			
		}
		
	}
	
	public void clearDb() throws Exception {
		
		Connection myConn = null;
		PreparedStatement myStmt = null;
		
		try {
			//get db connection
			myConn = dataSource.getConnection();
			
			//create sql for insert
			String sql = "delete from coin ";
			myStmt = myConn.prepareStatement(sql);			
			
			//execute sql insert
			myStmt.execute();
		}
		finally {
			//clean up JDBC	objects
			close(myConn, myStmt, null);
		}
		
	}
	
	public List<Coin> getCoinsDb() throws Exception {
		
		List<Coin> coinsDb = new ArrayList<>();
		
		Connection myConn = null;
		Statement myStmt = null;
		ResultSet myRs = null;
		
		try {
			// get a connection 
			myConn = dataSource.getConnection();
			
			// create sql statement
			String sql = "select * from coin";
			
			myStmt = myConn.createStatement();
			
			// execute query
			myRs = myStmt.executeQuery(sql);
			
			// process result set
			while(myRs.next()) {
				
				// retrieve data from result set row
				int numberOrder = myRs.getInt("number_order");
				String symbol = myRs.getString("symbol");
				String name = myRs.getString("name");
				String price = myRs.getString("price");
				String percentChange = myRs.getString("percent_change");
				String marketCap = myRs.getString("market_cap");
				String volumeCurrency = myRs.getString("volume_currency");
				String circulatingSupply = myRs.getString("circulating_supply");
				
				// create new student object
				Coin coin = new Coin(numberOrder, symbol, name, price, percentChange, marketCap, volumeCurrency, circulatingSupply);
				
				// add it to the list of students
				coinsDb.add(coin);
				
			}
			
			// close JDBC objects
			
			return coinsDb;
			
		} finally {
			// close JDBC objects
			close(myConn, myStmt, myRs);
		}
		
	}
	
}