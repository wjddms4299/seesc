package com.esc.userinfo;
import java.sql.*;

public class UserinfoDTO {
	private int user_idx;
	private int manager;
	private String user_id;
	private String user_pwd;
	private String user_nic;
	private int user_se;
	private String user_name;
	private Date user_birth;
	private String user_tel;
	private String user_email;
	private Date user_date;
	
	public UserinfoDTO() {
		super();
	}

	public UserinfoDTO(int user_idx, int manager, String user_id, String user_pwd, String user_nic, int user_se,
			String user_name, Date user_birth, String user_tel, String user_email, Date user_date) {
		super();
		this.user_idx = user_idx;
		this.manager = manager;
		this.user_id = user_id;
		this.user_pwd = user_pwd;
		this.user_nic = user_nic;
		this.user_se = user_se;
		this.user_name = user_name;
		this.user_birth = user_birth;
		this.user_tel = user_tel;
		this.user_email = user_email;
		this.user_date = user_date;
	}
	
	public UserinfoDTO(String user_name,String user_tel) {
		super();
		this.user_name = user_name;
		this.user_tel = user_tel;
	}

	public int getUser_idx() {
		return user_idx;
	}

	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}

	public int getManager() {
		return manager;
	}

	public void setManager(int manager) {
		this.manager = manager;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pwd() {
		return user_pwd;
	}

	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}

	public String getUser_nic() {
		return user_nic;
	}

	public void setUser_nic(String user_nic) {
		this.user_nic = user_nic;
	}

	public int getUser_se() {
		return user_se;
	}

	public void setUser_se(int user_se) {
		this.user_se = user_se;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public Date getUser_birth() {
		return user_birth;
	}

	public void setUser_birth(Date user_birth) {
		this.user_birth = user_birth;
	}

	public String getUser_tel() {
		return user_tel;
	}

	public void setUser_tel(String user_tel) {
		this.user_tel = user_tel;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public Date getUser_date() {
		return user_date;
	}

	public void setUser_date(Date user_date) {
		this.user_date = user_date;
	}
	
}
