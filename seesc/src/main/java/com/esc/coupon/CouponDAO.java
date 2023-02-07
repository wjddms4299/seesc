package com.esc.coupon;
import java.util.*;
import java.util.Date;
import java.sql.*;

public class CouponDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public ArrayList<CouponDTO> myCoupon(int user_idx){
		try {
			conn=com.esc.db.EscDB.getConn();
			String sql="select * from coupon where user_idx=? order by coupon_idx desc";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, user_idx);
			rs=ps.executeQuery();
			ArrayList<CouponDTO> arr=new ArrayList<CouponDTO>();
			while(rs.next()) {
				int coupon_idx=rs.getInt("coupon_idx");
				String coupon_name=rs.getString("coupon_name");
				int coupon_dc=rs.getInt("coupon_dc");
				java.sql.Date coupon_start= rs.getDate("coupon_start");
				java.sql.Date coupon_end=rs.getDate("coupon_end");
				int coupon_use=rs.getInt("coupon_use");
				CouponDTO dto=new CouponDTO(coupon_idx,user_idx, coupon_name, coupon_dc, coupon_start,coupon_end, coupon_use);
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
	
	/**예약시 쿠폰 정보 불러오기*/
	public ArrayList<CouponDTO> bookingCoupon(Integer user_idx){
		try {
			conn=com.esc.db.EscDB.getConn();
			
			String sql="select coupon_idx,coupon_name,coupon_dc from coupon where user_idx=? and coupon_use=1";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, user_idx);
			rs=ps.executeQuery();
			
			ArrayList<CouponDTO> arr=new ArrayList<CouponDTO>();
			while(rs.next()) {
				int coupon_idx=rs.getInt("coupon_idx");
				String coupon_name=rs.getString("coupon_name");
				int coupon_dc=rs.getInt("coupon_dc");
				
				CouponDTO dto=new CouponDTO(coupon_idx,coupon_name,coupon_dc);
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
	
	/**예약완료시 쿠폰 사용여부 변경하기*/
	public void bookingCouponUse(int coupon_idx){
		try {
			conn=com.esc.db.EscDB.getConn();
			
			String sql="update coupon set coupon_use=0 where coupon_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, coupon_idx);
			
			ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {
				
			}
		}
	}
	
	/**예약확인시 쿠폰번호로 쿠폰이름 불러오기*/
	public String bookingCouponName(int coupon_idx){
		try {
			conn=com.esc.db.EscDB.getConn();
			
			String sql="select coupon_name from coupon where coupon_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, coupon_idx);
			rs=ps.executeQuery();
			
			String coupon_name=null;
			if(rs.next()) {
				coupon_name=rs.getString("coupon_name");
			}
			return coupon_name;
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
	/**기간 지난 쿠폰 삭제*/
	public int couponEnd(int user_idx) {
		try {
			conn=com.esc.db.EscDB.getConn();
			String sql="delete from coupon where user_idx=? and coupon_end<sysdate";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, user_idx);
			int result=ps.executeUpdate();
			return result;
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
	/**관리자페이지에서 쿠폰 생성하기*/
	public int couponCre(int coupon_dc,int user_idx) {
		try {
			conn=com.esc.db.EscDB.getConn();
			String sql="insert into coupon values (coupon_coupon_idx.nextval,?,'선물',?,sysdate,sysdate+100,1)";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, user_idx);
			ps.setInt(2, coupon_dc);
			int result=ps.executeUpdate();
			return result;
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
