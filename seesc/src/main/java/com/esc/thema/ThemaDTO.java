package com.esc.thema;

public class ThemaDTO {

	private int thema_idx;
	private String thema_name;
	private int thema_level;
	private int thema_people_min;
	private int thema_people_max;
	private int thema_time;
	private int thema_price;
	
	
	public ThemaDTO(int thema_idx, String thema_name, int thema_level, int thema_people_min, int thema_people_max, int thema_time, int thema_price) {
		super();
		this.thema_idx = thema_idx;
		this.thema_name = thema_name;
		this.thema_level = thema_level;
		this.thema_people_min = thema_people_min;
		this.thema_people_max = thema_people_max;
		this.thema_time = thema_time;
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
	
	public int getThema_people_min() {
		return thema_people_min;
	}


	public void setThema_people_min(int thema_people_min) {
		this.thema_people_min = thema_people_min;
	}
	
	public int getThema_people_max() {
		return thema_people_max;
	}


	public void setThema_people_max(int thema_people_max) {
		this.thema_people_max = thema_people_max;
	}
	
	public int getThema_time() {
		return thema_time;
	}


	public void setThema_time(int thema_time) {
		this.thema_time = thema_time;
	}


	public int getThema_price() {
		return thema_price;
	}


	public void setThema_price(int thema_price) {
		this.thema_price = thema_price;
	}
	
	
	
	
}
