package com.esc.hof;
import java.sql.*;
public class HofDTO {

	private int hof_idx;
	private String hof_name;
	private Date hof_date;
	private int hof_record;
	private String hof_imgname;
	private String hof_thema;
	public String getHof_thema() {
		return hof_thema;
	}
	public void setHof_thema(String hof_thema) {
		this.hof_thema = hof_thema;
	}
	public int getHof_idx() {
		return hof_idx;
	}
	public void setHof_idx(int hof_idx) {
		this.hof_idx = hof_idx;
	}
	public String getHof_name() {
		return hof_name;
	}
	public void setHof_name(String hof_name) {
		this.hof_name = hof_name;
	}
	public Date getHof_date() {
		return hof_date;
	}
	public HofDTO(String hof_name, Date hof_date, int hof_record, String hof_imgname) {
		super();
		this.hof_name = hof_name;
		this.hof_date = hof_date;
		this.hof_record = hof_record;
		this.hof_imgname = hof_imgname;
	}
	public HofDTO(int hof_idx, String hof_name, Date hof_date, int hof_record, String hof_imgname, String hof_thema) {
		super();
		this.hof_idx = hof_idx;
		this.hof_name = hof_name;
		this.hof_date = hof_date;
		this.hof_record = hof_record;
		this.hof_imgname = hof_imgname;
		this.hof_thema = hof_thema;
	}
	public void setHof_date(Date hof_date) {
		this.hof_date = hof_date;
	}
	
	public int getHof_record() {
		return hof_record;
	}
	public void setHof_record(int hof_record) {
		this.hof_record = hof_record;
	}
	public String getHof_imgname() {
		return hof_imgname;
	}
	public void setHof_imgname(String hof_imgname) {
		this.hof_imgname = hof_imgname;
	}
}
