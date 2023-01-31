package com.esc.booking;

import java.util.*;

public class BookingDTO {
	private int booking_idx;
	private int time_idx;
	private int thema_idx;
	private int coupon_idx;
	private int user_idx;
	private String booking_name;
	private String booking_tel;
	private String booking_pwd;
	private Date booking_time;
	private Date time_date;
	private int time_ptime;
	private int booking_pay;
	private int booking_pay_ok;
	private String booking_msg;
	private int booking_num;
	private int booking_money;
	
	public BookingDTO() {
		super();
	}

	public BookingDTO(int booking_idx, int time_idx, int thema_idx, int coupon_idx, int user_idx, String booking_name,
			String booking_tel, String booking_pwd, Date booking_time, Date time_date, int time_ptime, int booking_pay,
			int booking_pay_ok, String booking_msg, int booking_num, int booking_money) {
		super();
		this.booking_idx = booking_idx;
		this.time_idx = time_idx;
		this.thema_idx = thema_idx;
		this.coupon_idx = coupon_idx;
		this.user_idx = user_idx;
		this.booking_name = booking_name;
		this.booking_tel = booking_tel;
		this.booking_pwd = booking_pwd;
		this.booking_time = booking_time;
		this.time_date = time_date;
		this.time_ptime = time_ptime;
		this.booking_pay = booking_pay;
		this.booking_pay_ok = booking_pay_ok;
		this.booking_msg = booking_msg;
		this.booking_num = booking_num;
		this.booking_money = booking_money;
	}

	public int getBooking_idx() {
		return booking_idx;
	}

	public void setBooking_idx(int booking_idx) {
		this.booking_idx = booking_idx;
	}

	public int getTime_idx() {
		return time_idx;
	}

	public void setTime_idx(int time_idx) {
		this.time_idx = time_idx;
	}

	public int getThema_idx() {
		return thema_idx;
	}

	public void setThema_idx(int thema_idx) {
		this.thema_idx = thema_idx;
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

	public String getBooking_name() {
		return booking_name;
	}

	public void setBooking_name(String booking_name) {
		this.booking_name = booking_name;
	}

	public String getBooking_tel() {
		return booking_tel;
	}

	public void setBooking_tel(String booking_tel) {
		this.booking_tel = booking_tel;
	}

	public String getBooking_pwd() {
		return booking_pwd;
	}

	public void setBooking_pwd(String booking_pwd) {
		this.booking_pwd = booking_pwd;
	}

	public Date getBooking_time() {
		return booking_time;
	}

	public void setBooking_time(Date booking_time) {
		this.booking_time = booking_time;
	}

	public Date getTime_date() {
		return time_date;
	}

	public void setTime_date(Date time_date) {
		this.time_date = time_date;
	}

	public int getTime_ptime() {
		return time_ptime;
	}

	public void setTime_ptime(int time_ptime) {
		this.time_ptime = time_ptime;
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

	public String getBooking_msg() {
		return booking_msg;
	}

	public void setBooking_msg(String booking_msg) {
		this.booking_msg = booking_msg;
	}

	public int getBooking_num() {
		return booking_num;
	}

	public void setBooking_num(int booking_num) {
		this.booking_num = booking_num;
	}

	public int getBooking_money() {
		return booking_money;
	}

	public void setBooking_money(int booking_money) {
		this.booking_money = booking_money;
	}

}
