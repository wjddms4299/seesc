package com.esc.thema;

public class ThemaDTO {

	private int thema_idx;
	private String thema_name;
	private int thema_level;
	private int thema_price;
	
	
	public ThemaDTO(int thema_idx, String thema_name, int thema_level, int thema_price) {
		super();
		this.thema_idx = thema_idx;
		this.thema_name = thema_name;
		this.thema_level = thema_level;
		this.thema_price = thema_price;
	}


	public ThemaDTO() {
		super();
	}


	public int getThema_idx() {
		return thema_idx;
	}


	public void setThema_idx(int thema_idx) {
		this.thema_idx = thema_idx;
	}


	public String getThema_name() {
		return thema_name;
	}


	public void setThema_name(String thema_name) {
		this.thema_name = thema_name;
	}


	public int getThema_level() {
		return thema_level;
	}


	public void setThema_level(int thema_level) {
		this.thema_level = thema_level;
	}


	public int getThema_price() {
		return thema_price;
	}


	public void setThema_price(int thema_price) {
		this.thema_price = thema_price;
	}
	
	
	
	
}
