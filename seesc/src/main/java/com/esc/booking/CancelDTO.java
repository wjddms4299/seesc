package com.esc.booking;
import java.sql.*;
public class CancelDTO {

	private int cancel_idx;
	private int booking_idx;
	private int user_idx;
	private String booking_name;
	private String booking_tel;
	private int booking_pay;
	private int booking_pay_ok;
	private String cancel_banknum;
	private Date cancel_time;
	private int booking_money;
	private int cancel_ok;
	public CancelDTO(int cancel_idx, int booking_idx, int user_idx, String booking_name, String booking_tel,
			int booking_pay, int booking_pay_ok, String cancel_banknum, Date cancel_time, int booking_money,
			int cancel_ok) {
		super();
		this.cancel_idx = cancel_idx;
		this.booking_idx = booking_idx;
		this.user_idx = user_idx;
		this.booking_name = booking_name;
		this.booking_tel = booking_tel;
		this.booking_pay = booking_pay;
		this.booking_pay_ok = booking_pay_ok;
		this.cancel_banknum = cancel_banknum;
		this.cancel_time = cancel_time;
		this.booking_money = booking_money;
		this.cancel_ok = cancel_ok;
	}
	public int getCancel_idx() {
		return cancel_idx;
	}
	public void setCancel_idx(int cancel_idx) {
		this.cancel_idx = cancel_idx;
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
	public String getBooking_tel() {
		return booking_tel;
	}
	public void setBooking_tel(String booking_tel) {
		this.booking_tel = booking_tel;
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
	public Date getCancel_time() {
		return cancel_time;
	}
	public void setCancel_time(Date cancel_time) {
		this.cancel_time = cancel_time;
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
