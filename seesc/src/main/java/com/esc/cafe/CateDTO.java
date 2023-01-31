package com.esc.cafe;

public class CateDTO {

	private int cafeorder_idx;
	private int useridx;
	private int cafe_idx;
	private int coupon_idx;
	private int cafeorder_num;
	private int cafeorder_price;
	private int cafeorder_pay;
	private int cafeorder_qt;
	
	public CateDTO() {
		super();
	}

	public CateDTO(int cafeorder_idx, int useridx, int cafe_idx, int coupon_idx, int cafeorder_num, int cafeorder_price,
			int cafeorder_pay, int cafeorder_qt) {
		super();
		this.cafeorder_idx = cafeorder_idx;
		this.useridx = useridx;
		this.cafe_idx = cafe_idx;
		this.coupon_idx = coupon_idx;
		this.cafeorder_num = cafeorder_num;
		this.cafeorder_price = cafeorder_price;
		this.cafeorder_pay = cafeorder_pay;
		this.cafeorder_qt = cafeorder_qt;
	}

	public int getCafeorder_idx() {
		return cafeorder_idx;
	}

	public void setCafeorder_idx(int cafeorder_idx) {
		this.cafeorder_idx = cafeorder_idx;
	}

	public int getUseridx() {
		return useridx;
	}

	public void setUseridx(int useridx) {
		this.useridx = useridx;
	}

	public int getCafe_idx() {
		return cafe_idx;
	}

	public void setCafe_idx(int cafe_idx) {
		this.cafe_idx = cafe_idx;
	}

	public int getCoupon_idx() {
		return coupon_idx;
	}

	public void setCoupon_idx(int coupon_idx) {
		this.coupon_idx = coupon_idx;
	}

	public int getCafeorder_num() {
		return cafeorder_num;
	}

	public void setCafeorder_num(int cafeorder_num) {
		this.cafeorder_num = cafeorder_num;
	}

	public int getCafeorder_price() {
		return cafeorder_price;
	}

	public void setCafeorder_price(int cafeorder_price) {
		this.cafeorder_price = cafeorder_price;
	}

	public int getCafeorder_pay() {
		return cafeorder_pay;
	}

	public void setCafeorder_pay(int cafeorder_pay) {
		this.cafeorder_pay = cafeorder_pay;
	}

	public int getCafeorder_qt() {
		return cafeorder_qt;
	}

	public void setCafeorder_qt(int cafeorder_qt) {
		this.cafeorder_qt = cafeorder_qt;
	}
	
	
}
