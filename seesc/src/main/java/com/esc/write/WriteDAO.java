package com.esc.write;

import java.sql.*;
import java.util.*;

public class WriteDAO {

	Connection conn;
	PreparedStatement ps;
	ResultSet rs;

	public WriteDAO() {
		// TODO Auto-generated constructor stub
	}

	/** 커뮤니티 게시판 보이는 메서드 */
	public ArrayList<WriteDTO> selWrite(int ls,int cp) {
		try {
			conn = com.esc.db.EscDB.getConn();
			//String sql = "select * from write order by write_idx desc";
			int start=(cp-1)*ls+1;
			int end=cp*ls;
			String sql="select * from (select rownum as rnum, a.* from  "
					+ "(select * from write order by write_idx desc)a)b  "
					+ "where rnum>=? and rnum<=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			rs = ps.executeQuery();
			ArrayList<WriteDTO> arr = new ArrayList<WriteDTO>();
			while (rs.next()) {
				int idx = rs.getInt("write_idx");
				int uidx = rs.getInt("user_idx");
				String cate = rs.getString("write_cate");
				String title = rs.getString("write_title");
				String writer = rs.getString("write_writer");
				String pwd = rs.getString("write_pwd");
				java.sql.Date wdate = rs.getDate("write_wdate");
				String filename = rs.getString("write_filename");
				String content = rs.getString("write_content");
				int readnum = rs.getInt("write_readnum");
				int ref = rs.getInt("write_ref");
				int lev = rs.getInt("write_lev");
				int step = rs.getInt("write_step");
				int open = rs.getInt("write_open");
				int notice = rs.getInt("write_notice");

				WriteDTO dto = new WriteDTO(idx, uidx, cate, title, writer, pwd, wdate, filename, content, readnum, ref,
						lev, step, open, notice);
				arr.add(dto);
			}
			return arr;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}

	/** 커뮤니티 게시글 등록 메서드 */
	public int insertWrite(WriteDTO dto) {
		try {
			conn = com.esc.db.EscDB.getConn();
			String sql = "insert into write values(write_write_idx.nextval,0,?,?,?,?,sysdate,'0',?,0,0,0,0,?,0)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getWrite_cate());
			ps.setString(2, dto.getWrite_title());
			ps.setString(3, dto.getWrite_writer());
			ps.setString(4, dto.getWrite_pwd());
			ps.setString(5, dto.getWrite_content());
			ps.setInt(6, dto.getWrite_open());

			int count = ps.executeUpdate();

			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
			}
		}
	}

	/** 커뮤니티 본문 보기 메서드 */
	public WriteDTO contentWrite(int idx) {
		try {
			conn = com.esc.db.EscDB.getConn();
			String sql = "select write_title,write_writer,write_wdate,write_content,write_readnum from write where write_idx=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, idx);
			rs = ps.executeQuery();
			WriteDTO dto = null;
			
			if (rs.next()) {
				String title = rs.getString("write_title");
				String writer = rs.getString("write_writer");
				java.sql.Date date = rs.getDate("write_wdate");
				String content = rs.getString("write_content");
				int readnum=rs.getInt("write_readnum");
				readnum(idx, readnum+1);
				
				dto = new WriteDTO();
				dto.setWrite_idx(idx);
				dto.setWrite_content(content);
				dto.setWrite_title(title);
				dto.setWrite_wdate(date);
				dto.setWrite_writer(writer);
				dto.setWrite_readnum(readnum);
			}
			return dto;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
			}

		}
	}

	/** 본문 수정하기 관련 메서드 */
	public int updateWrite(int idx, String title, String content) {
		try {
			conn = com.esc.db.EscDB.getConn();
			String sql = "update write set write_title=?, write_content=?,write_wdate=sysdate where write_idx=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, title);
			ps.setString(2, content);
			ps.setInt(3, idx);
			int count = ps.executeUpdate();
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {

			}
		}
	}

	/** 자유게시판 보기 관련 메서드 안쓰는 DAO*/  
	public ArrayList<WriteDTO> freeWrite() {
		try {
			conn = com.esc.db.EscDB.getConn();
			String sql = "select * from write where write_cate='자유게시판'";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			ArrayList<WriteDTO> arr = new ArrayList<WriteDTO>();
			while (rs.next()) {
				int idx = rs.getInt("write_idx");
				int uidx = rs.getInt("user_idx");
				String cate = rs.getString("write_cate");
				String title = rs.getString("write_title");
				String writer = rs.getString("write_writer");
				String pwd = rs.getString("write_pwd");
				java.sql.Date wdate = rs.getDate("write_wdate");
				String filename = rs.getString("write_filename");
				String content = rs.getString("write_content");
				int readnum = rs.getInt("write_readnum");
				int ref = rs.getInt("write_ref");
				int lev = rs.getInt("write_lev");
				int step = rs.getInt("write_step");
				int open = rs.getInt("write_open");
				int notice = rs.getInt("write_notice");

				WriteDTO dto = new WriteDTO(idx, uidx, cate, title, writer, pwd, wdate, filename, content, readnum, ref,
						lev, step, open, notice);

				arr.add(dto);
			}
			return arr;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
			}
		}
	}

	
	/**총게시물수 관련 메서드*/
	public int getTotalCnt() {
		try {
			conn=com.esc.db.EscDB.getConn();
			String sql="select count(*) from write";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			rs.next();
			int count=rs.getInt(1);
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
	/**조회수 증가 관련 메서드*/
	public int readnum(int idx,int readnum) {
		try {
			String sql="update write set write_readnum=? where write_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, readnum);
			ps.setInt(2, idx);
			int count=ps.executeUpdate();
			
			return count;
			
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				
			}catch(Exception e2) {}
		}
	}
	/**멤버모집 게시글만 보여주는 게시판 관련 메서드*/
	public WriteDTO member() {
		
	}
}
