package com.esc.userinfo;

import java.sql.*;


public class UserinfoDAO {
	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	
	static public final int NOT_ID=1;
	public static final int NOT_PWD=2;
	final public static int LOGIN_OK=3;
	static public final int ERROR=-1;
	
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
	public int loginCheck(String userid,String userpwd) {
		try {
			conn=com.esc.db.EscDB.getConn();
			String sql="select user_pwd from userinfo where user_id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, userid);
			rs=ps.executeQuery();
			if(rs.next()) {
				String db_pwd=rs.getString(1);
				if(db_pwd.equals(userpwd)) {
					return LOGIN_OK;
				}else {
					return NOT_PWD;
				}
			}else {
				return NOT_ID;
			}
		}catch(Exception e) {
			e.printStackTrace();
			return ERROR;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {
				
			}
		}
	}
	public int userNum(String userid) {
		try {
			conn=com.esc.db.EscDB.getConn();
			String sql="select user_idx from userinfo where user_id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, userid);
			rs=ps.executeQuery();
			rs.next();
			int user_idx=rs.getInt("user_idx");
			return user_idx;
		}catch(Exception e) {
			e.printStackTrace();
			return 0;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {}
		}
	}
	public int mngnum(String userid) {
		try {
			conn=com.esc.db.EscDB.getConn();
			String sql="select manager from userinfo where user_id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, userid);
			rs=ps.executeQuery();
			rs.next();
			int manager=rs.getInt("manager");
			return manager;
		}catch(Exception e) {
			e.printStackTrace();
			return 0;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {}
		}
	}
	
	
	public UserinfoDTO userInfo(String userid) {
		try {
			conn=com.esc.db.EscDB.getConn();
			String sql="select * from userinfo where user_id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, userid);
			rs=ps.executeQuery();
			UserinfoDTO dto=null;
			if(rs.next()) {
				int user_idx=rs.getInt("user_idx");
				String user_pwd=rs.getString("user_pwd");
				String user_nic=rs.getString("user_nic");
				int user_se=rs.getInt("user_se");
				String user_name=rs.getString("user_name"); 
				Date user_birth=rs.getDate("user_birth"); 
				String user_tel=rs.getString("user_tel"); 
				String user_email=rs.getString("user_email"); 
				Date user_date=rs.getDate("user_date");
				dto=new UserinfoDTO(user_idx, user_idx, user_email, user_pwd, user_nic, user_se, user_name, user_birth, user_tel, user_email, user_date);
			}
			return dto;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {}
		}
	}
	
	public int userUpdate(String user_id,String user_nic,String user_name,String tel,String user_email,String user_pwd) {
		try {
			conn=com.esc.db.EscDB.getConn();
			String sql="update";
			ps=conn.prepareStatement(sql);
			
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

}
