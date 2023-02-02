package com.esc.coupon;

import java.util.*;

public class CouponDTO {
	private int coupon_idx;
	private int user_idx;
	private String coupon_name;
	private int coupon_dc;
	private Date coupon_start;
	private Date coupon_end;
	private int coupon_use;
	
	public CouponDTO() {
		super();
	}

	public CouponDTO(int coupon_idx, int user_idx, String coupon_name, int coupon_dc, Date coupon_start,
			Date coupon_end, int coupon_use) {
		super();
		this.coupon_idx = coupon_idx;
		this.user_idx = user_idx;
		this.coupon_name = coupon_name;
		this.coupon_dc = coupon_dc;
		this.coupon_start = coupon_start;
		this.coupon_end = coupon_end;
		this.coupon_use = coupon_use;
	}
	
	public CouponDTO(String coupon_name, int coupon_dc, int coupon_use) {
		super();
		this.coupon_name = coupon_name;
		this.coupon_dc = coupon_dc;
		this.coupon_use = coupon_use;
	}

	public int getCoupon_idx() {
		return coupon_idx;
	}

	public void setCoupon_idx(int coupon_idx) {
		this.coupon_idx = coupon_idx;
	}

	public int getUser_idx() {
		return user_idx;
	}

	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}

	public String getCoupon_name() {
		return coupon_name;
	}

	public void setCoupon_name(String coupon_name) {
		this.coupon_name = coupon_name;
	}

	public int getCoupon_dc() {
		return coupon_dc;
	}

	public void setCoupon_dc(int coupon_dc) {
		this.coupon_dc = coupon_dc;
	}

	public Date getCoupon_start() {
		return coupon_start;
	}

	public void setCoupon_start(Date coupon_start) {
		this.coupon_start = coupon_start;
	}

	public Date getCoupon_end() {
		return coupon_end;
	}

	public void setCoupon_end(Date coupon_end) {
		this.coupon_end = coupon_end;
	}

	public int getCoupon_use() {
		return coupon_use;
	}

	public void setCoupon_use(int coupon_use) {
		this.coupon_use = coupon_use;
	}

}
