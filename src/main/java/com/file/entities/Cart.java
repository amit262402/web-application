package com.file.entities;

public class Cart
{
	private int cid;
	private int bid;
	private int userId;
	private String bookname;
	private String author;
	private double price;
	private double totalprice;
	
	public Cart() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	



	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public int getBid() {
		return bid;
	}

	public void setBid(int bid) {
		this.bid = bid;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getBookname() {
		return bookname;
	}

	public void setBookname(String bookname) {
		this.bookname = bookname;
	}

	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}



	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public double getTotalprice() {
		return totalprice;
	}

	public void setTotalprice(double totalprice) {
		this.totalprice = totalprice;
	}

	@Override
	public String toString() {
		return "Cart [cid=" + cid + ", bid=" + bid + ", userId=" + userId + ", bookname=" + bookname + ", price="
				+ price + ", totalprice=" + totalprice + "]";
	}
	
	
}
