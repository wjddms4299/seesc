package com.esc.cancle;

public class CancleDTO {
	private int booking_idx;
	private int user_idx;
	private String booking_name;
	private int booking_pay;
	private int booking_pay_ok;
	private String cancel_banknum;
	private int booking_money;
	private int cancel_ok;
	
	public CancleDTO() {
		super();
	}

	public CancleDTO(int booking_idx, int user_idx, String booking_name, int booking_pay, int booking_pay_ok,
			String cancel_banknum, int booking_money, int cancel_ok) {
		super();
		this.booking_idx = booking_idx;
		this.user_idx = user_idx;
		this.booking_name = booking_name;
		this.booking_pay = booking_pay;
		this.booking_pay_ok = booking_pay_ok;
		this.cancel_banknum = cancel_banknum;
		this.booking_money = booking_money;
		this.cancel_ok = cancel_ok;
	}

	public int getBooking_idx() {
		return booking_idx;
	}

	public void setBooking_idx(int booking_idx) {
		this.booking_idx = booking_idx;
	}

	public int getUser_idx() {
		return user_idx;
	}

	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}

	public String getBooking_name() {
		return booking_name;
	}

	public void setBooking_name(String booking_name) {
		this.booking_name = booking_name;
	}

	public int getBooking_pay() {
		return booking_pay;
	}

	public void setBooking_pay(int booking_pay) {
		this.booking_pay = booking_pay;
	}

	public int getBooking_pay_ok() {
		return booking_pay_ok;
	}

	public void setBooking_pay_ok(int booking_pay_ok) {
		this.booking_pay_ok = booking_pay_ok;
	}

	public String getCancel_banknum() {
		return cancel_banknum;
	}

	public void setCancel_banknum(String cancel_banknum) {
		this.cancel_banknum = cancel_banknum;
	}

	public int getBooking_money() {
		return booking_money;
	}

	public void setBooking_money(int booking_money) {
		this.booking_money = booking_money;
	}

	public int getCancel_ok() {
		return cancel_ok;
	}

	public void setCancel_ok(int cancel_ok) {
		this.cancel_ok = cancel_ok;
	}

}
