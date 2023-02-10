package com.esc.booking;

import java.sql.*;
import java.util.ArrayList;


public class BookingDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;

	/**마이페이지 예약정보 페이징*/
	public int getTotalCnt(int user_idx) {
		try {
			conn=com.esc.db.EscDB.getConn();
			String sql="select count(*) from booking where user_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, user_idx);
			rs=ps.executeQuery();
			rs.next();
			int count =rs.getInt(1);
			return count==0?1:count;
		}catch(Exception e) {
			e.printStackTrace();
			return 1;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {}
		}
		
	}
	/**마이페이지 예약정보불러오기*/
	public ArrayList<BookingDTO> myBooking(int user_idx,int ls,int cp){
		try {
			conn=com.esc.db.EscDB.getConn();
			int start=(cp-1)*ls+1;
			int end=cp*ls;
			String sql="select * from (select rownum as rnum, a.* from (select * from booking where user_idx=? order by booking_idx desc)a)b where rnum>=? and rnum<=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, user_idx);
			ps.setInt(2, start);
			ps.setInt(3, end);
			rs=ps.executeQuery();
			ArrayList<BookingDTO> arr=new ArrayList<BookingDTO>();
			while(rs.next()) {
				int booking_idx=rs.getInt("booking_idx");
				java.sql.Date booking_time=rs.getDate("booking_time");
				int booking_pay_ok=rs.getInt("booking_pay_ok");
				int booking_num=rs.getInt("booking_num");
				int booking_money=rs.getInt("booking_money");
				int booking_pay=rs.getInt("booking_pay");
				BookingDTO dto=new BookingDTO(booking_idx, booking_time, booking_pay_ok, booking_num,booking_money,booking_pay);
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
			String time_date,int time_ptime,int booking_pay,int booking_pay_ok,String booking_msg,int booking_num,int booking_money) {
		try {
			conn=com.esc.db.EscDB.getConn();
				
			String sql="insert into booking values(booking_booking_idx.nextval,?,?,?,?,?,?,sysdate,?,?,?,?,?,?,?)";
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
			ps.setInt(13,booking_money);
			
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

	/**예약취소(+예약여부 확인)에 필요한 예약번호 찾기*/
	public int bookingIdx(int thema_idx,String time_date,int time_ptime) {
		try {
			conn=com.esc.db.EscDB.getConn();
				
			String sql="select booking_idx from booking where thema_idx=? and time_date=? and time_ptime=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1,thema_idx);
			ps.setString(2,time_date);
			ps.setInt(3,time_ptime);
			rs=ps.executeQuery();
			
			int booking_idx=0;
			if(rs.next()) {
				booking_idx=rs.getInt("booking_idx");
			}
			return booking_idx;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {
				
			}
		}
	}
	
	/**예약취소시 예약번호로 쿠폰번호 불러오기*/
	public int bookingCouponIdx(int booking_idx){
		try {
			
			String sql="select coupon_idx from booking where booking_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, booking_idx);
			rs=ps.executeQuery();
			
			int coupon_idx=0;
			if(rs.next()) {
				coupon_idx=rs.getInt("coupon_idx");
			}
			return coupon_idx;
		}catch(Exception e) {
			e.printStackTrace();
			return 0;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
			}catch(Exception e2) {
				
			}
		}
	}
	
	/**예약취소시 쿠폰 사용여부 변경하기*/
	public void bookingCouponUse_R(int coupon_idx){
		try {
			String sql="update coupon set coupon_use=1 where coupon_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, coupon_idx);
			
			ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps!=null)ps.close();
			
			}catch(Exception e2) {
				
			}
		}
	}
	
	/**예약번호로 전달메시지 불러오기*/
	public String bookingMsg(int booking_idx){
		try {
			conn=com.esc.db.EscDB.getConn();
			
			String sql="select booking_msg from booking where booking_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, booking_idx);
			rs=ps.executeQuery();
			
			String booking_msg="";
			if(rs.next()) {
				booking_msg=rs.getString("booking_msg");
			}
			return booking_msg;
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
			int couidx=bookingCouponIdx(booking_idx);
			if(couidx!=0) {
			bookingCouponUse_R(couidx);
			}
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
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
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
	/**관리자 취소조회*/
	public ArrayList<CancelDTO> cancelmng(){
		try {
			conn = com.esc.db.EscDB.getConn();
			String sql="select * from cancel order by cancel_ok desc, cancel_idx desc";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			ArrayList<CancelDTO> arr=new ArrayList<CancelDTO>();
			CancelDTO dto=null;
			while(rs.next()) {
				int cancel_idx=rs.getInt("cancel_idx");
				int booking_idx=rs.getInt("booking_idx");
				int user_idx=rs.getInt("user_idx");
				String booking_name=rs.getString("booking_name");
				String booking_tel=rs.getString("booking_tel");
				int booking_pay=rs.getInt("booking_pay");
				int booking_pay_ok=rs.getInt("booking_pay_ok");
				String cancel_banknum=rs.getString("cancel_banknum");
				Date cancel_time=rs.getDate("cancel_time");
				int booking_money=rs.getInt("booking_money");
				int cancel_ok=rs.getInt("cancel_ok"); 
				dto=new CancelDTO(cancel_idx, booking_idx, user_idx, booking_name, booking_tel, booking_pay, booking_pay_ok, cancel_banknum, cancel_time, booking_money, cancel_ok);
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
	/**환불정보업데이트*/
	public int payUpdate(int booking_idx) {
		try {
			conn = com.esc.db.EscDB.getConn();
			String sql="update cancel set cancel_ok=1 where booking_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, booking_idx);
			int count=ps.executeUpdate();
			return count;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2){}
		}
	}
}
