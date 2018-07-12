package com.webscraper;

public class Coin {
	
	private int numberOrder;
	private String symbol;
	private String name;
	private String price;
	private String percentChange;
	private String marketCap;
	private String volumeCurrency;
	private String circulatingSupply;
	
	public Coin(int numberOrder, String symbol, String name, String price, String percentChange, String marketCap,
			String volumeCurrency, String circulatingSupply) {
		super();
		this.numberOrder = numberOrder;
		this.symbol = symbol;
		this.name = name;
		this.price = price;
		this.percentChange = percentChange;
		this.marketCap = marketCap;
		this.volumeCurrency = volumeCurrency;
		this.circulatingSupply = circulatingSupply;
	}

	public int getNumberOrder() {
		return numberOrder;
	}

	public void setNumberOrder(int numberOrder) {
		this.numberOrder = numberOrder;
	}

	public String getSymbol() {
		return symbol;
	}

	public void setSymbol(String symbol) {
		this.symbol = symbol;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getPercentChange() {
		return percentChange;
	}

	public void setPercentChange(String percentChange) {
		this.percentChange = percentChange;
	}

	public String getMarketCap() {
		return marketCap;
	}

	public void setMarketCap(String marketCap) {
		this.marketCap = marketCap;
	}

	public String getVolumeCurrency() {
		return volumeCurrency;
	}

	public void setVolumeCurrency(String volumeCurrency) {
		this.volumeCurrency = volumeCurrency;
	}

	public String getCirculatingSupply() {
		return circulatingSupply;
	}

	public void setCirculatingSupply(String circulatingSupply) {
		this.circulatingSupply = circulatingSupply;
	}
	
}
