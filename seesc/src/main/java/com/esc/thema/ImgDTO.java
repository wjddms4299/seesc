package com.esc.thema;

public class ImgDTO {
	private int img_idx;
	private String img_name;
	
	public ImgDTO() {
		super();
	}

	public ImgDTO(int img_idx, String img_name) {
		super();
		this.img_idx = img_idx;
		this.img_name = img_name;
	}

	public int getImg_idx() {
		return img_idx;
	}

	public void setImg_idx(int img_idx) {
		this.img_idx = img_idx;
	}

	public String getImg_name() {
		return img_name;
	}

	public void setImg_name(String img_name) {
		this.img_name = img_name;
	}

}
