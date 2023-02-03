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
	public int booking(int thema_idx,int coupon_idx,Integer user_idx,String booking_name,String booking_tel,String booking_pwd,
			String time_date,int time_ptime,int booking_pay,int booking_pay_ok,String booking_msg,int booking_num) {
		try {
			conn=com.esc.db.EscDB.getConn();
				
			String sql="insert into booking values(booking_booking_idx.nextval,?,?,?,?,?,?,sysdate,?,?,?,?,?,?,10000)";
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
			ps.setInt(10,booking_pay_ok);
			ps.setString(11,booking_msg);
			ps.setInt(12,booking_num);
			//ps.setInt(13,booking_money);
			
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

	/**비회원 예약 조회 관련 메서드 */
	public ArrayList<BookingDTO> b_BookingCheck(String booking_name,String booking_tel,String booking_pwd){
		try {
			conn=com.esc.db.EscDB.getConn();
			String sql="select * from booking where booking_name =? and booking_tel=? and booking_pwd=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1,booking_name);
			ps.setString(2,booking_tel);
			ps.setString(3,booking_pwd);
			
			rs=ps.executeQuery();
			ArrayList<BookingDTO> arr=new ArrayList<BookingDTO>();
			
			while(rs.next()) {
				int booking_idx = rs.getInt("booking_idx");
				int thema_idx=rs.getInt("thema_idx");
				int coupon_idx = rs.getInt("coupon_idx");
				int user_idx=rs.getInt("user_idx");
				String bookint_pwd = rs.getString("booking_pwd");
				Date booking_time=rs.getDate("booking_time");
				Date time_date=rs.getDate("time_date");
				int time_ptime=rs.getInt("time_ptime");
				int booking_pay=rs.getInt("booking_pay");
				int booking_pay_ok=rs.getInt("booking_pay_ok");
				String booking_msg=rs.getString("booking_msg");
				int booking_num=rs.getInt("booking_num");
				int booking_money=rs.getInt("booking_money");
				BookingDTO dto=new BookingDTO(booking_idx, thema_idx, coupon_idx, user_idx, booking_name, booking_tel, booking_tel, booking_time, time_date, time_ptime, booking_pay, booking_pay_ok, booking_msg, booking_num, booking_money);
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
			}catch(Exception e2) {
				
			
			}
		}
	}
	/**예약 취소시 db에 추가 메서드 */
	public void input_CancelList(int booking_idx,BookingDTO dto,String cancel_banknum) {
		try {
			String sql = "insert into cancel values(cancel_cancel_idx.nextval,?,?,?,?,?,?,?,sysdate,?,?)";
			
			ps = conn.prepareStatement(sql);
			ps.setInt(1, dto.getBooking_idx());
			ps.setInt(2, dto.getUser_idx());
			ps.setString(3, dto.getBooking_name());
			ps.setString(4, dto.getBooking_tel());
			ps.setInt(5, dto.getBooking_pay());
			ps.setInt(6, dto.getBooking_pay_ok());
			ps.setString(7, cancel_banknum);
			ps.setInt(8, dto.getBooking_money());
			ps.setInt(9, dto.getBooking_pay_ok());
			ps.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if(ps!=null)ps.close();
			}catch(Exception e2) {
				
			}
		}
		
		
	}
	
	/**예약 취소 관련 메서드 */
	public int bookingDelete(int booking_idx,BookingDTO dto,String cancel_banknum) {
		try {
			conn = com.esc.db.EscDB.getConn();
			input_CancelList(booking_idx, dto, cancel_banknum);
			String sql = "delete from booking where booking_idx = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, booking_idx);
			
			int count = ps.executeUpdate();
			return count;
					
					
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return -1;
		}finally {
			try {
				
			}catch(Exception e2) {
				
			}
		}
	}
	
	
	/**선택한 회원 예약 정보 조회하기*/
	public BookingDTO one_bookingList(int booking_idx) {
		try {
			conn = com.esc.db.EscDB.getConn();
			String sql = "select * from booking where booking_idx = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, booking_idx);
			rs =ps.executeQuery();
			
			BookingDTO dto=null;
			
			if(rs.next()) {
				int thema_idx=rs.getInt("thema_idx");
				int coupon_idx = rs.getInt("coupon_idx");
				int user_idx=rs.getInt("user_idx");
				String booking_name=rs.getString("booking_name");
				String booking_tel=rs.getString("booking_tel");
				String booking_pwd = rs.getString("booking_pwd");
				Date booking_time=rs.getDate("booking_time");
				Date time_date=rs.getDate("time_date");
				int time_ptime=rs.getInt("time_ptime");
				int booking_pay=rs.getInt("booking_pay");
				int booking_pay_ok=rs.getInt("booking_pay_ok");
				String booking_msg=rs.getString("booking_msg");
				int booking_num=rs.getInt("booking_num");
				int booking_money=rs.getInt("booking_money");
				dto=new BookingDTO(booking_idx, thema_idx, coupon_idx, user_idx, booking_name, booking_tel, booking_pwd, booking_time, time_date, time_ptime, booking_pay, booking_pay_ok, booking_msg, booking_num, booking_money);
			}
			return dto;
		} catch (Exception e) {
			// TODO Auto-generated catch block
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
