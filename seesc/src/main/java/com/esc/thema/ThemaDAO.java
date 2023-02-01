package com.esc.thema;

import java.sql.*;

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
				dto=new ThemaDTO(thema_idx,thema_name,thema_level,thema_people_min,thema_people_max,thema_time,thema_price);
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

}
