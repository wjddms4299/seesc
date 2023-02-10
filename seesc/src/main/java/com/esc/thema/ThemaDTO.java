package com.esc.thema;

public class ThemaDTO {

	private int thema_idx;
	private int img_idx;
	private String thema_name;
	private int thema_level;
	private int thema_people_min;
	private int thema_people_max;
	private int thema_time;
	private int thema_price;
	private String thema_tag1;
	private String thema_tag2;
	private String thema_tag3;
	private String thema_intro1;
	private String thema_intro2;
	public ThemaDTO(String thema_name) {
		super();
		this.thema_name = thema_name;
	}

	private String thema_intro3;
	
	public ThemaDTO(int thema_idx, int img_idx, String thema_name, int thema_level, int thema_people_min, int thema_people_max,int thema_time, int thema_price,
			String thema_tag1, String thema_tag2, String thema_tag3, String thema_intro1, String thema_intro2, String thema_intro3) {
		super();
		this.thema_idx = thema_idx;
		this.img_idx = img_idx;
		this.thema_name = thema_name;
		this.thema_level = thema_level;
		this.thema_people_min = thema_people_min;
		this.thema_people_max = thema_people_max;
		this.thema_time = thema_time;
		this.thema_price = thema_price;
		this.thema_tag1 = thema_tag1;
		this.thema_tag2 = thema_tag2;
		this.thema_tag3 = thema_tag3;
		this.thema_intro1 = thema_intro1;
		this.thema_intro2 = thema_intro2;
		this.thema_intro3 = thema_intro3;
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
	
	
	public int getImg_idx() {
		return img_idx;
	}

	public void setImg_idx(int img_idx) {
		this.img_idx = img_idx;
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
	
	public String getThema_tag1() {
		return thema_tag1;
	}

	public void setThema_tag1(String thema_tag1) {
		this.thema_tag1 = thema_tag1;
	}
	
	public String getThema_tag2() {
		return thema_tag2;
	}

	public void setThema_tag2(String thema_tag2) {
		this.thema_tag2 = thema_tag2;
	}
	
	public String getThema_tag3() {
		return thema_tag3;
	}

	public void setThema_tag3(String thema_tag3) {
		this.thema_tag3 = thema_tag3;
	}
	
	public String getThema_intro1() {
		return thema_intro1;
	}

	public void setThema_intro1(String thema_intro1) {
		this.thema_intro1 = thema_intro1;
	}
	
	public String getThema_intro2() {
		return thema_intro2;
	}

	public void setThema_intro2(String thema_intro2) {
		this.thema_intro2 = thema_intro2;
	}
	
	public String getThema_intro3() {
		return thema_intro3;
	}

	public void setThema_intro3(String thema_intro3) {
		this.thema_intro3 = thema_intro3;
	}
}
