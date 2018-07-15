package com.webscraper;

import java.util.ArrayList;
import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

public class CoinDataUtil {

	public static List<Coin> getCoins() {
		
		List<Coin> coins = new ArrayList<Coin>();
		
		System.setProperty("webdriver.chrome.driver", "/Users/israelmesa/Desktop/ChromeDriver/chromedriver");

        WebDriver driver = new ChromeDriver();

        driver.get("https://finance.yahoo.com/cryptocurrencies?count=120");

        //Symbol

        String xpathSymbol = "//*[@id=\"scr-res-table\"]/table/tbody/tr[*]/td[1]";
        
        List<WebElement> symbol = new ArrayList<WebElement>();

        symbol = driver.findElements(By.xpath(xpathSymbol));

        //Name

        String xpathName = "//*[@id=\"scr-res-table\"]/table/tbody/tr[*]/td[2]";
        
        List<WebElement> name = new ArrayList<WebElement>();

        name = driver.findElements(By.xpath(xpathName));

        //Price

        String xpathPrice = "//*[@id=\"scr-res-table\"]/table/tbody/tr[*]/td[3]";
        
        List<WebElement> price = new ArrayList<WebElement>();

        price = driver.findElements(By.xpath(xpathPrice));

        //Percent Change

        String xpathPercentChange = "//*[@id=\"scr-res-table\"]/table/tbody/tr[*]/td[5]";
        
        List<WebElement> percentChange = new ArrayList<WebElement>();

        percentChange = driver.findElements(By.xpath(xpathPercentChange));

        //Market Cap

        String xpathMarketCap = "//*[@id=\"scr-res-table\"]/table/tbody/tr[*]/td[6]";
        
        List<WebElement> marketCap = new ArrayList<WebElement>();

        marketCap = driver.findElements(By.xpath(xpathMarketCap));

        //Volume in Currency(24hr)

        String xpathVolumeCurrency = "//*[@id=\"scr-res-table\"]/table/tbody/tr[*]/td[8]";
        
        List<WebElement> volumeCurrency = new ArrayList<WebElement>();

        volumeCurrency = driver.findElements(By.xpath(xpathVolumeCurrency));

        //Circulating Supply

        String xpathCirculatingSupply = "//*[@id=\"scr-res-table\"]/table/tbody/tr[*]/td[10]";
        
        List<WebElement> circulatingSupply = new ArrayList<WebElement>();

        circulatingSupply = driver.findElements(By.xpath(xpathCirculatingSupply));

        int size = symbol.size();

        for (int i = 0; i < size; i++) {
            coins.add(new Coin((i + 1), symbol.get(i).getText(),
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
	
}