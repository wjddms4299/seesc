package com.esc.userinfo;

import java.sql.*;
import java.util.ArrayList;


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
	/**회원가입*/
	public int memberJoin(UserinfoDTO dto,String user_birth,String user_tel) {
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
			ps.setString(7, user_tel);
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
	/**아이디 중복확인*/
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
	/**닉네임 중복 확인*/
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
	/**로그인 아이디 비밀번호 확인*/
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
	/**회원번호 가져오기*/
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
	/**관리자 가져오기*/
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
	
	/**내정보 불러오기*/
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
	/**내정보 업데이트*/
	public int userUpdate(String user_id,String user_nic,String user_name,String tel,String user_email,String user_pwd) {
		try {
			conn=com.esc.db.EscDB.getConn();
			String sql="update userinfo set user_nic=? , user_name=? ,user_tel=?,user_email=?,user_pwd=? where user_id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, user_nic);
			ps.setString(2, user_name);
			ps.setString(3, tel);
			ps.setString(4, user_email);
			ps.setString(5, user_pwd);
			ps.setString(6, user_id);
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
	/**모든 회원정보 가져오기*/
	public ArrayList<UserinfoDTO> alluserinfo(){
		try {
			conn=com.esc.db.EscDB.getConn();
			String sql="select * from userinfo order by user_idx asc";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			ArrayList<UserinfoDTO> arr=new ArrayList<UserinfoDTO>();
			while(rs.next()) {
				int user_idx=rs.getInt("user_idx");
				int manager=rs.getInt("manager");
				String user_id=rs.getString("user_id");
				String user_pwd=rs.getString("user_pwd");
				String user_nic=rs.getString("user_nic");
				int user_se=rs.getInt("user_se");
				String user_name=rs.getString("user_name");
				Date user_birth=rs.getDate("user_birth");
				String user_tel=rs.getString("user_tel");
				String user_email=rs.getString("user_email");
				Date user_date=rs.getDate("user_date");
				UserinfoDTO dto=new UserinfoDTO(user_idx, manager, user_id, user_pwd, user_nic, user_se, user_name, user_birth, user_tel, user_email, user_date);
				arr.add(dto);
			}
			return arr;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				
			}catch(Exception e2) {}
		}
	}
	/**회원권한 관리*/
	public int managepower(int manager,int user_idx) {
		try {
			conn=com.esc.db.EscDB.getConn();
			String sql="update userinfo set manager=? where user_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, manager);
			ps.setInt(2, user_idx);
			int count=ps.executeUpdate();
			return count;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				
			}catch(Exception e2) {}
		}
	}
	
	/**예약시 로그인 정보 불러오기*/
	public UserinfoDTO bookingUserinfo(Integer user_idx) {
		try {
			conn=com.esc.db.EscDB.getConn();
			
			String sql="select user_name,user_tel from userinfo where user_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, user_idx);
			rs=ps.executeQuery();
			
			UserinfoDTO dto=null;
			if(rs.next()) {
				String user_name=rs.getString("user_name");
				String user_tel=rs.getString("user_tel");
				dto=new UserinfoDTO(user_name,user_tel);
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
	
	/**회원번호로 관리자 여부 가져오기*/
	public int mngnum(int user_idx) {
		try {
			conn=com.esc.db.EscDB.getConn();
			String sql="select manager from userinfo where user_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, user_idx);
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
	/**아이디 찾기*/
	public String findId(String user_name,String tel) {
		try {
			conn=com.esc.db.EscDB.getConn();
			String sql="select user_id from userinfo where user_name=? and user_tel=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, user_name);
			ps.setString(2, tel);
			rs=ps.executeQuery();
			String user_id=null;
			if(rs.next()) {
				user_id=rs.getString(1);
			}
			return user_id;
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
	/**비밀번호 찾기*/
	public int findPwd(String user_name,String user_id,String user_birth) {
		try {
			conn=com.esc.db.EscDB.getConn();
			String sql="select user_pwd from userinfo where user_name=? and user_id=? and user_birth=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, user_name);
			ps.setString(2, user_id);
			ps.setString(3, user_birth);
			rs=ps.executeQuery();
			int result=0;
			if(rs.next()) {
				result=1;
			}
			return result;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {}
		}
	}
	/**비밀번호 변경하기*/
	public int pwdUpdate(String user_pwd,String user_id) {
		try {
			conn=com.esc.db.EscDB.getConn();
			String sql="update userinfo set user_pwd=? where user_id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, user_pwd);
			ps.setString(2, user_id);
			int count =ps.executeUpdate();
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

}
