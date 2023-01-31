package com.esc.time;

import java.util.*;

public class TimeDTO {
	private int time_idx;
	private int booking_idx;
	private int thema_idx;
	private int user_idx2;
	private int time_ptime;
	private Date time_date;
	
	public TimeDTO() {
		super();
	}

	public TimeDTO(int time_idx, int booking_idx, int thema_idx, int user_idx2, int time_ptime, Date time_date) {
		super();
		this.time_idx = time_idx;
		this.booking_idx = booking_idx;
		this.thema_idx = thema_idx;
		this.user_idx2 = user_idx2;
		this.time_ptime = time_ptime;
		this.time_date = time_date;
	}

	public int getTime_idx() {
		return time_idx;
	}

	public void setTime_idx(int time_idx) {
		this.time_idx = time_idx;
	}

	public int getBooking_idx() {
		return booking_idx;
	}

	public void setBooking_idx(int booking_idx) {
		this.booking_idx = booking_idx;
	}

	public int getThema_idx() {
		return thema_idx;
	}

	public void setThema_idx(int thema_idx) {
		this.thema_idx = thema_idx;
	}

	public int getUser_idx2() {
		return user_idx2;
	}

	public void setUser_idx2(int user_idx2) {
		this.user_idx2 = user_idx2;
	}

	public int getTime_ptime() {
		return time_ptime;
	}

	public void setTime_ptime(int time_ptime) {
		this.time_ptime = time_ptime;
	}

	public Date getTime_date() {
		return time_date;
	}

	public void setTime_date(Date time_date) {
		this.time_date = time_date;
	}

}
