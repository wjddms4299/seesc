package com.esc.booking;

import java.sql.*;
import java.util.ArrayList;

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
	public int booking(int thema_idx,int count_idx,int user_idx,String booking_name,String booking_tel,String booking_pwd,String time_date,int booking_pay,String booking_msg,int booking_num,int booking_money) {
		try {
			conn=com.esc.db.EscDB.getConn();
			String sql="insert into booking values(booking_booking_idx.nextval,?,?,?,?,?,?,sysdate,?,?,?,1,?,?,?)";
			ps=conn.prepareStatement(sql);
			
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
}
