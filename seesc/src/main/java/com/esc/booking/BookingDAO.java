package com.esc.booking;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;

public class BookingDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	/**마이페이지 예약정보불러오기*/
	public ArrayList<BookingDTO> myBooking(int user_idx){
		try {
			conn=com.esc.db.EscDB.getConn();
			String sql="select * from booking where user_idx=? order by booking_idx desc";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, user_idx);
			rs=ps.executeQuery();
			ArrayList<BookingDTO> arr=new ArrayList<BookingDTO>();
			while(rs.next()) {
				int booking_idx=rs.getInt("booking_idx");
				java.sql.Date booking_time=rs.getDate("booking_time");
				int booking_pay_ok=rs.getInt("booking_pay_ok");
				int booking_num=rs.getInt("booking_num");
				BookingDTO dto=new BookingDTO(booking_idx, booking_time, booking_pay_ok, booking_num);
				arr.add(dto);
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
			}catch(Exception e2) {}
		}
	}
	
	/**예약하기 관련 메서드*/
	public int booking(int thema_idx,int coupon_idx,int user_idx,String booking_name,String booking_tel,String booking_pwd,
			String time_date,int time_ptime,int booking_pay,String booking_msg,int booking_num,int booking_money) {
		try {
			conn=com.esc.db.EscDB.getConn();
			String sql="insert into booking values(booking_booking_idx.nextval,?,?,?,?,?,?,sysdate,to_date(?,'yy-mm-dd'),?,?,1,?,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setInt(1,thema_idx);
			ps.setInt(2,coupon_idx);
			ps.setInt(3,user_idx);
			ps.setString(4,booking_name);
			ps.setString(5,booking_tel);
			ps.setString(6,booking_pwd);
			ps.setString(7,time_date);
			ps.setInt(8,time_ptime);
			ps.setInt(9,booking_pay);
			ps.setString(10,booking_msg);
			ps.setInt(11,booking_num);
			ps.setInt(12,booking_money);
			
			int count=ps.executeUpdate();
			return count;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {
				
			}
		}
	}
	/**모든 내역 불러오기 관리자*/
	public ArrayList<BookingDTO> boomanage(){
		try {
			conn=com.esc.db.EscDB.getConn();
			String sql="select * from booking";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			ArrayList<BookingDTO> arr=new ArrayList<BookingDTO>();
			while(rs.next()) {
				int booking_idx=rs.getInt("booking_idx");
				int thema_idx=rs.getInt("thema_idx");
				int user_idx=rs.getInt("user_idx");
				String booking_name=rs.getString("booking_name");
				String booking_tel=rs.getString("booking_tel");
				Date booking_time=rs.getDate("booking_time");
				Date time_date=rs.getDate("time_date");
				int time_ptime=rs.getInt("time_ptime");
				int booking_pay=rs.getInt("booking_pay");
				int booking_pay_ok=rs.getInt("booking_pay_ok");
				String booking_msg=rs.getString("booking_msg");
				int booking_num=rs.getInt("booking_num");
				int booking_money=rs.getInt("booking_money");
				BookingDTO dto=new BookingDTO(booking_idx, thema_idx, user_idx, booking_name, booking_tel, booking_time, time_date, time_ptime, booking_pay, booking_pay_ok, booking_msg, booking_num, booking_money);
				arr.add(dto);
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
			}catch(Exception e2) {}
		}
		
		
	}
}
