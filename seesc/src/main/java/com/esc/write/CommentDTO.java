package com.esc.write;
import java.sql.*;
public class CommentDTO {
	private int comm_idx;
	private int write_idx;
	private int user_idx;
	private String comm_writer;
	private String comm_pwd;
	private String comm_content;
	private Date comm_date;
	private int comm_like;
	private int comm_ref;
	private int comm_lev;
	private int comm_step;
	
	
	public CommentDTO() {
		super();
	}


	public CommentDTO(int comm_idx, int write_idx, int user_idx, String comm_writer, String comm_pwd,
			String comm_content, Date comm_date, int comm_like, int comm_ref, int comm_lev, int comm_step) {
		super();
		this.comm_idx = comm_idx;
		this.write_idx = write_idx;
		this.user_idx = user_idx;
		this.comm_writer = comm_writer;
		this.comm_pwd = comm_pwd;
		this.comm_content = comm_content;
		this.comm_date = comm_date;
		this.comm_like = comm_like;
		this.comm_ref = comm_ref;
		this.comm_lev = comm_lev;
		this.comm_step = comm_step;
	}


	public int getComm_idx() {
		return comm_idx;
	}


	public void setComm_idx(int comm_idx) {
		this.comm_idx = comm_idx;
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


	public String getComm_writer() {
		return comm_writer;
	}


	public void setComm_writer(String comm_writer) {
		this.comm_writer = comm_writer;
	}


	public String getComm_pwd() {
		return comm_pwd;
	}


	public void setComm_pwd(String comm_pwd) {
		this.comm_pwd = comm_pwd;
	}


	public String getComm_content() {
		return comm_content;
	}


	public void setComm_content(String comm_content) {
		this.comm_content = comm_content;
	}


	public Date getComm_date() {
		return comm_date;
	}


	public void setComm_date(Date comm_date) {
		this.comm_date = comm_date;
	}


	public int getComm_like() {
		return comm_like;
	}


	public void setComm_like(int comm_like) {
		this.comm_like = comm_like;
	}


	public int getComm_ref() {
		return comm_ref;
	}


	public void setComm_ref(int comm_ref) {
		this.comm_ref = comm_ref;
	}


	public int getComm_lev() {
		return comm_lev;
	}


	public void setComm_lev(int comm_lev) {
		this.comm_lev = comm_lev;
	}


	public int getComm_step() {
		return comm_step;
	}


	public void setComm_step(int comm_step) {
		this.comm_step = comm_step;
	}
	
	
	
	
}
