package com.esc.write;

import java.sql.*;
import com.oreilly.servlet.MultipartRequest;

public class ImgDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public ImgDAO() {
		// TODO Auto-generated constructor stub
	}
	
	/** 이벤트 게시글 등록 관련 메서드 */
	public int eventwriteupload(MultipartRequest mr) {
		try {
			conn = com.esc.db.EscDB.getConn();
			String sql = "insert into write values(write_write_idx.nextval,?,'event',?,?,?,sysdate,?,?,0,0,0,0,?,0)";
			ps = conn.prepareStatement(sql);

			String filename = mr.getFilesystemName("write_filename");
			String user_idx_s = mr.getParameter("user_idx");
			if (user_idx_s == null || user_idx_s.equals("")) {
				user_idx_s = "0";
			}
			int user_idx = Integer.parseInt(user_idx_s);
			int write_open = Integer.parseInt(mr.getParameter("write_open"));
			int notice = Integer.parseInt(mr.getParameter("write_notice"));

			ps.setInt(1, user_idx);
			ps.setString(2, mr.getParameter("write_title"));
			ps.setString(3, mr.getParameter("write_writer"));
			ps.setString(4, mr.getParameter("write_pwd"));
			ps.setString(5, filename);
			ps.setString(6, mr.getParameter("write_content"));
			ps.setInt(7, write_open);

			int count = ps.executeUpdate();
			return count;

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return -1;
		} finally {
			try {
				if (ps != null)ps.close();
				if (conn != null)conn.close();
			} catch (Exception e2) {

			}
		}
}
}
