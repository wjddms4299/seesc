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
}
