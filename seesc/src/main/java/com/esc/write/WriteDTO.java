package com.esc.write;
import java.sql.*;

public class WriteDTO {
	private int write_idx;
	private int user_idx;
	private String write_cate;
	private String write_title;
	private String write_writer;
	private String write_pwd;
	private Date write_wdate;
	private String write_filename;
	private String write_content;
	private int write_readnum;
	private int write_ref;
	private int write_lev;
	private int write_step;
	private int write_open;
	private int write_notice;
	
	public WriteDTO() {
		super();
	}

	public WriteDTO(int write_idx, int user_idx, String write_cate, String write_title, String write_writer,
			String write_pwd, Date write_wdate, String write_filename, String write_content, int write_readnum,
			int write_ref, int write_lev, int write_step, int write_open, int write_notice) {
		super();
		this.write_idx = write_idx;
		this.user_idx = user_idx;
		this.write_cate = write_cate;
		this.write_title = write_title;
		this.write_writer = write_writer;
		this.write_pwd = write_pwd;
		this.write_wdate = write_wdate;
		this.write_filename = write_filename;
		this.write_content = write_content;
		this.write_readnum = write_readnum;
		this.write_ref = write_ref;
		this.write_lev = write_lev;
		this.write_step = write_step;
		this.write_open = write_open;
		this.write_notice = write_notice;
	}

	public int getWrite_idx() {
		return write_idx;
	}

	public void setWrite_idx(int write_idx) {
		this.write_idx = write_idx;
	}

	public int getUser_idx() {
		return user_idx;
	}

	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}

	public String getWrite_cate() {
		return write_cate;
	}

	public void setWrite_cate(String write_cate) {
		this.write_cate = write_cate;
	}

	public String getWrite_title() {
		return write_title;
	}

	public void setWrite_title(String write_title) {
		this.write_title = write_title;
	}

	public String getWrite_writer() {
		return write_writer;
	}

	public void setWrite_writer(String write_writer) {
		this.write_writer = write_writer;
	}

	public String getWrite_pwd() {
		return write_pwd;
	}

	public void setWrite_pwd(String write_pwd) {
		this.write_pwd = write_pwd;
	}

	public Date getWrite_wdate() {
		return write_wdate;
	}

	public void setWrite_wdate(Date write_wdate) {
		this.write_wdate = write_wdate;
	}

	public String getWrite_filename() {
		return write_filename;
	}

	public void setWrite_filename(String write_filename) {
		this.write_filename = write_filename;
	}

	public String getWrite_content() {
		return write_content;
	}

	public void setWrite_content(String write_content) {
		this.write_content = write_content;
	}

	public int getWrite_readnum() {
		return write_readnum;
	}

	public void setWrite_readnum(int write_readnum) {
		this.write_readnum = write_readnum;
	}

	public int getWrite_ref() {
		return write_ref;
	}

	public void setWrite_ref(int write_ref) {
		this.write_ref = write_ref;
	}

	public int getWrite_lev() {
		return write_lev;
	}

	public void setWrite_lev(int write_lev) {
		this.write_lev = write_lev;
	}

	public int getWrite_step() {
		return write_step;
	}

	public void setWrite_step(int write_step) {
		this.write_step = write_step;
	}

	public int getWrite_open() {
		return write_open;
	}

	public void setWrite_open(int write_open) {
		this.write_open = write_open;
	}

	public int getWrite_notice() {
		return write_notice;
	}

	public void setWrite_notice(int write_notice) {
		this.write_notice = write_notice;
	}
}
