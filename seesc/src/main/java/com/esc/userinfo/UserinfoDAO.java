package com.esc.userinfo;

import java.sql.*;


public class UserinfoDAO {
	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	
	public UserinfoDAO() {
		// TODO Auto-generated constructor stub
	}
	public int memberJoin(UserinfoDTO dto,String user_birth) {
		try {
			conn=com.esc.db.EscDB.getConn();
			String sql="insert into userinfo values (userinfo_user_idx.nextval,0,?,?,?,?,?,?,?,?,sysdate)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, dto.getUser_id());
			ps.setString(2, dto.getUser_pwd());
			ps.setString(3, dto.getUser_nic());
			ps.setInt(4, dto.getUser_se());
			ps.setString(5, dto.getUser_name());
			ps.setString(6, user_birth);
			ps.setString(7, dto.getUser_tel());
			ps.setString(8, dto.getUser_email());
			int count=ps.executeUpdate();
			return count;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {}
		}
	}
	
	public boolean idCheck(String id) {
	try {
		conn=com.esc.db.EscDB.getConn();
		String sql="select user_id from userinfo where user_id=?";
		ps=conn.prepareStatement(sql);
		ps.setString(1, id);
		rs=ps.executeQuery();
		return rs.next();
	}catch(Exception e) {
		e.printStackTrace();
		return false;
	}finally {
		try {
			if(rs!=null)rs.close();
			if(ps!=null)ps.close();
			if(conn!=null)conn.close();
	}catch(Exception e2) {}
	}	
	
	}
	
	public boolean nicCheck(String nicname) {
	try {
		conn=com.esc.db.EscDB.getConn();
		String sql="select user_nic from userinfo where user_nic=?";
		ps=conn.prepareStatement(sql);
		ps.setString(1, nicname);
		rs=ps.executeQuery();
		return rs.next();
	}catch(Exception e) {
		e.printStackTrace();
		return false;
	}finally {
		try {
			if(rs!=null)rs.close();
			if(ps!=null)ps.close();
			if(conn!=null)conn.close();
		}catch(Exception e2) {}
	}
			
	}

}
