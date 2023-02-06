package com.esc.thema;

import java.sql.*;
import java.util.*;

public class ThemaDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	/**테마 정보 불러오기*/
	public ThemaDTO themaInfo(int thema_idx){
		try {
			conn=com.esc.db.EscDB.getConn();
			String sql="select * from thema where thema_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1,thema_idx);
			rs=ps.executeQuery();
			ThemaDTO dto=null;
			if(rs.next()) {
				String thema_name=rs.getString("thema_name");
				int thema_level=rs.getInt("thema_level");
				int thema_people_min=rs.getInt("thema_people_min");
				int thema_people_max=rs.getInt("thema_people_max");
				int thema_time=rs.getInt("thema_time");
				int thema_price=rs.getInt("thema_price");
				String thema_tag1=rs.getString("thema_tag1");
				String thema_tag2=rs.getString("thema_tag2");
				String thema_tag3=rs.getString("thema_tag3");
				String thema_intro1=rs.getString("thema_intro1");
				String thema_intro2=rs.getString("thema_intro2");
				String thema_intro3=rs.getString("thema_intro3");
				dto=new ThemaDTO(thema_idx,thema_name,thema_level,thema_people_min,thema_people_max,thema_time,thema_price,thema_tag1,thema_tag2,thema_tag3,thema_intro1,thema_intro2,thema_intro3);
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
			}catch(Exception e2) {
				
			}
		}
	}
	/**테마번호 불러오기:이름순*/
	public ArrayList<Integer> themaInfo_Name(){
		try {
			conn=com.esc.db.EscDB.getConn();
			String sql="select thema_idx from thema order by thema_name";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			ArrayList<Integer> arr=new ArrayList<Integer>();
			while(rs.next()) {
				int thema_idx=rs.getInt("thema_idx");
				arr.add(thema_idx);
			}
			return arr;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {
				
			}
		}
	}
	/**테마번호 불러오기:난이도순*/
	public ArrayList<Integer> themaInfo_Level(){
		try {
			conn=com.esc.db.EscDB.getConn();
			String sql="select thema_idx from thema order by thema_level";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			ArrayList<Integer> arr=new ArrayList<Integer>();
			while(rs.next()) {
				int thema_idx=rs.getInt("thema_idx");
				arr.add(thema_idx);
			}
			return arr;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {
				
			}
		}
	}
	/**테마번호 불러오기:인기순*/
	public ArrayList<Integer> themaInfo_Booking(){
		try {
			conn=com.esc.db.EscDB.getConn();
			String sql="select thema.thema_idx from thema,booking where thema.thema_idx=booking.thema_idx(+) group by thema.thema_idx order by count(booking.thema_idx) desc";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			ArrayList<Integer> arr=new ArrayList<Integer>();
			while(rs.next()) {
				int thema_idx=rs.getInt("thema_idx");
				arr.add(thema_idx);
			}
			return arr;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {
				
			}
		}
	}
	
	/**테마 정보 등록하기*/
	public int themaInsert(String thema_name,int thema_level,int thema_people_min,int thema_people_max,int thema_time,int thema_price,String thema_tag1,String thema_tag2,String thema_tag3,String thema_intro1,String thema_intro2,String thema_intro3){
		try {
			conn=com.esc.db.EscDB.getConn();
			String sql="insert into thema values(thema_thema_idx.nextval,?,?,?,?,?,?,?,?,?,?,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1,thema_name);
			ps.setInt(2,thema_level);
			ps.setInt(3,thema_people_min);
			ps.setInt(4,thema_people_max);
			ps.setInt(5,thema_time);
			ps.setInt(6,thema_price);
			ps.setString(7,thema_tag1);
			ps.setString(8,thema_tag2);
			ps.setString(9,thema_tag3);
			ps.setString(10,thema_intro1);
			ps.setString(11,thema_intro2);
			ps.setString(12,thema_intro3);
			
			int count=ps.executeUpdate();
			return count;
		}catch(Exception e) {
			e.printStackTrace();
			return 0;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {
				
			}
		}
	}
	
	/**테마 정보 수정하기*/
	public int themaUpdate(int thema_idx,String thema_name,int thema_level,int thema_people_min,int thema_people_max,int thema_time,int thema_price,String thema_tag1,String thema_tag2,String thema_tag3,String thema_intro1,String thema_intro2,String thema_intro3){
		try {
			conn=com.esc.db.EscDB.getConn();
			String sql="update thema set thema_name=?,thema_level=?,thema_people_min=?,thema_people_max=?,thema_time=?,thema_price=?,thema_tag1=?,thema_tag2=?,thema_tag3=?,thema_intro1=?,thema_intro2=?,thema_intro3=? where thema_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1,thema_name);
			ps.setInt(2,thema_level);
			ps.setInt(3,thema_people_min);
			ps.setInt(4,thema_people_max);
			ps.setInt(5,thema_time);
			ps.setInt(6,thema_price);
			ps.setString(7,thema_tag1);
			ps.setString(8,thema_tag2);
			ps.setString(9,thema_tag3);
			ps.setString(10,thema_intro1);
			ps.setString(11,thema_intro2);
			ps.setString(12,thema_intro3);
			ps.setInt(13,thema_idx);
			
			int count=ps.executeUpdate();
			return count;
		}catch(Exception e) {
			e.printStackTrace();
			return 0;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {
				
			}
		}
	}
	
	/**테마 정보 삭제하기*/
	public int themaDelete(int thema_idx){
		try {
			conn=com.esc.db.EscDB.getConn();
			String sql="delete from thema where thema_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1,thema_idx);
			
			int count=ps.executeUpdate();
			return count;
		}catch(Exception e) {
			e.printStackTrace();
			return 0;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {
				
			}
		}
	}
	
	/**테마 이름만 불러오기*/
	public String themaName(int thema_idx) {
		try {
			conn=com.esc.db.EscDB.getConn();
			String sql="select thema_name from thema where thema_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1,thema_idx);
			rs=ps.executeQuery();
			rs.next();
			String thema_name = rs.getString(1);
			return thema_name;
			
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {
				
			}
		}
	}

}
