package com.esc.hof;

import java.sql.*;
import java.util.*;
import com.oreilly.servlet.*;


public class HofDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public int addRecord(MultipartRequest mr) {
		try {
			conn=com.esc.db.EscDB.getConn();
			String sql="insert into hof values(hof_idx.nextval,?,sysdate,?,?,?)";
			ps=conn.prepareStatement(sql);
			String name=mr.getParameter("name");
			String imgname=mr.getFilesystemName("img");
			String record=mr.getParameter("record");
			int hof_record=Integer.parseInt(record);
			String thema=mr.getParameter("thema");
			ps.setString(1, name);
			ps.setInt(2, hof_record);
			ps.setString(3, imgname);
			ps.setString(4, thema);
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
	
	public ArrayList<HofDTO> hofList(String thema){
		try {
			conn=com.esc.db.EscDB.getConn();
			String sql="select hof_name,hof_date,hof_record,hof_imgname from hof where hof_thema=? order by hof_record asc";
			ps=conn.prepareStatement(sql);
			ps.setString(1, thema);
			rs=ps.executeQuery();
			ArrayList<HofDTO> arr=new ArrayList<HofDTO>();
			while(rs.next()) {
				String hof_name=rs.getString("hof_name");
				java.sql.Date hof_date=rs.getDate("hof_date");
				int hof_record=rs.getInt("hof_record");
				String hof_imgname=rs.getString("hof_imgname");
				HofDTO dto=new HofDTO(hof_name, hof_date, hof_record, hof_imgname);
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
