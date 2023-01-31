package com.esc.write;

import java.sql.*;		
import java.sql.Date;
import java.util.*;
import com.oreilly.servlet.MultipartRequest;

public class QnADAO {
	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	
	public QnADAO() {
		// TODO Auto-generated constructor stub
	}
	/**QnA게시글 등록 관련 메서드*/
	public int writeQnAupload(MultipartRequest mr ) {
		try {
			conn = com.esc.db.EscDB.getConn();
			String sql = "insert into write values(write_write_idx.nextval,?,'qna',?,?,?,sysdate,?,?,0,0,0,0,?,?)";
			ps = conn.prepareStatement(sql);
			
			String filename = mr.getFilesystemName("write_filename");
			String user_idx_s = mr.getParameter("user_idx");
			if(user_idx_s==null || user_idx_s.equals("")){
				user_idx_s = "0";
			}
			int user_idx = Integer.parseInt(user_idx_s);
			
			int write_open = Integer.parseInt(mr.getParameter("write_open"));
			int notice = Integer.parseInt(mr.getParameter("write_notice"));
			
			ps.setInt(1,user_idx);
			ps.setString(2, mr.getParameter("write_title"));
			ps.setString(3, mr.getParameter("write_writer"));
			ps.setString(4, mr.getParameter("write_pwd"));
			ps.setString(5, filename);
			ps.setString(6, mr.getParameter("write_content"));
			ps.setInt(7, write_open);
			ps.setInt(8, notice);
			
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
	/**QnA 게시글 리스트 출력 메서드*/
	public ArrayList<WriteDTO> writeQnAList(){
		try {
			conn = com.esc.db.EscDB.getConn();
			String sql = "select * from write where write_cate = 'qna' order by write_idx desc";
			ps = conn.prepareStatement(sql);
			rs= ps.executeQuery();
			
			ArrayList <WriteDTO>arr = new ArrayList<WriteDTO>();
			
			while(rs.next()) {
				int write_idx = rs.getInt("write_idx");
				int user_idx = rs.getInt("user_idx");
				String write_cate= rs.getString("write_cate");
				String write_title= rs.getString("write_title");
				String write_writer= rs.getString("write_writer");
				String write_pwd = rs.getString("write_pwd");
				Date write_wdate = rs.getDate("write_wdate");
				String write_filename = rs.getString("write_filename");
				String write_content = rs.getString("write_content");
				int write_readnum = rs.getInt("write_readnum");
				int write_ref = rs.getInt("write_ref");
				int write_lev = rs.getInt("write_lev");
				int write_step = rs.getInt("write_step");
				int write_open = rs.getInt("write_open");
				int write_notice = rs.getInt("write_notice");
				
				WriteDTO dto =
				new WriteDTO(write_idx, user_idx, write_cate, write_title, 
						write_writer, write_pwd, write_wdate, write_filename, 
						write_content, write_readnum, write_ref, write_lev, 
						write_step, write_open, write_notice);
				
				arr.add(dto);
			}
			
			return arr;
			
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
	
	/**글 본문보기 관련 메서드*/
	public WriteDTO writeQnAContent(int idx) {
	try {
		conn = com.esc.db.EscDB.getConn();
		String sql = "select * from write where idx = ?";
		ps = conn.prepareStatement(sql);
		ps.setInt(1, idx);
		rs = ps.executeQuery();
		WriteDTO dto = null;
		
		if(rs.next()) {
			int user_idx = rs.getInt("user_idx");
			String write_cate= rs.getString("write_cate");
			String write_title= rs.getString("write_title");
			String write_writer= rs.getString("write_writer");
			String write_pwd = rs.getString("write_pwd");
			Date write_wdate = rs.getDate("write_wdate");
			String write_filename = rs.getString("write_filename");
			String write_content = rs.getString("write_content");
			int write_readnum = rs.getInt("write_readnum");
			int write_ref = rs.getInt("write_ref");
			int write_lev = rs.getInt("write_lev");
			int write_step = rs.getInt("write_step");
			int write_open = rs.getInt("write_open");
			int write_notice = rs.getInt("write_notice");
			dto = new WriteDTO(write_notice, user_idx, write_cate, write_title, 
					write_writer, write_pwd, write_wdate, write_filename, write_content, 
					write_readnum, write_ref, write_lev, write_step, write_open, 
					write_notice);
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
