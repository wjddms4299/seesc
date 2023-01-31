package com.esc.cafeorder;

public class CafeorderDTO {
	private int cafe_idx;
	private String cafe_menu;
	private int cafe_price;
	private int cafe_in;
	
	public CafeorderDTO() {
		super();
	}

	public CafeorderDTO(int cafe_idx, String cafe_menu, int cafe_price, int cafe_in) {
		super();
		this.cafe_idx = cafe_idx;
		this.cafe_menu = cafe_menu;
		this.cafe_price = cafe_price;
		this.cafe_in = cafe_in;
	}

	public int getCafe_idx() {
		return cafe_idx;
	}

	public void setCafe_idx(int cafe_idx) {
		this.cafe_idx = cafe_idx;
	}

	public String getCafe_menu() {
		return cafe_menu;
	}

	public void setCafe_menu(String cafe_menu) {
		this.cafe_menu = cafe_menu;
	}

	public int getCafe_price() {
		return cafe_price;
	}

	public void setCafe_price(int cafe_price) {
		this.cafe_price = cafe_price;
	}

	public int getCafe_in() {
		return cafe_in;
	}

	public void setCafe_in(int cafe_in) {
		this.cafe_in = cafe_in;
	}
	
	
}
