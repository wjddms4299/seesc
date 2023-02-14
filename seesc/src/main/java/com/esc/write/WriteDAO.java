package com.esc.write;


import java.sql.*;
import java.util.*;
import com.oreilly.servlet.MultipartRequest;

public class WriteDAO {

	Connection conn;
	PreparedStatement ps;
	ResultSet rs;

	public WriteDAO() {
		// TODO Auto-generated constructor stub
	}

	/** 자유게시판 보이는 메서드 */
	public ArrayList<WriteDTO> selWrite(int ls, int cp, int sort) {
		try {
			conn = com.esc.db.EscDB.getConn();
			// String sql = "select * from write order by write_idx desc";
			int start = (cp - 1) * ls + 1;
			int end = cp * ls;
			String sql="";
			switch(sort) {
			case 0: sql = "select * from (select rownum as rnum, a.* from  "
					+ " (select * from write where write_cate='free' order by write_idx desc)a)  where rnum>=? and rnum<=? ";
					ps=conn.prepareStatement(sql);
					break;
			case 1: sql = "select * from (select rownum as rnum, a.* from  "
					+ " (select * from write where write_cate='free' order by write_readnum desc)a)  where rnum>=? and rnum<=? ";
					ps=conn.prepareStatement(sql);
					break;
			default : sql = "select * from (select rownum as rnum, a.* from  "
						+ " (select * from write where write_cate='free' order by write_idx desc)a)  where rnum>=? and rnum<=? ";
						ps=conn.prepareStatement(sql);
			}
			
			
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
	public int insertWrite(MultipartRequest mr) {
		try {
			conn = com.esc.db.EscDB.getConn();
			int max=getMaxRef();
			String sql = "insert into write values(write_write_idx.nextval,0,?,?,?,?,sysdate,?,?,0,?,0,0,1,0)";
			ps = conn.prepareStatement(sql);
			String cate=mr.getParameter("write_cate");
			String writer=mr.getParameter("write_writer");
			String pwd=mr.getParameter("write_pwd");
			String title=mr.getParameter("write_title");
			String member=mr.getParameter("member");
			if(member==null) {
				title=""+title;
			}else if(member.equals("[멤버모집]")){
				title=member+title;
			}
			
			String filename=mr.getFilesystemName("write_filename");
			String content=mr.getParameter("write_content");
			
		
			ps.setString(1, cate);
			ps.setString(2, title);
			ps.setString(3, writer);
			ps.setString(4, pwd);
			ps.setString(5,filename);
			ps.setString(6, content); 
			ps.setInt(7, max+1);
		
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
			String sql = "select * from write where write_idx=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, idx);
			rs = ps.executeQuery();
			WriteDTO dto = new WriteDTO();

			if (rs.next()) {
				int userid=rs.getInt("user_idx");
				String cate=rs.getString("write_cate");
				String pwd=rs.getString("write_pwd");
				String filename=rs.getString("write_filename");
				String title = rs.getString("write_title");
				String writer = rs.getString("write_writer");
				java.sql.Date date = rs.getDate("write_wdate");
				String content = rs.getString("write_content");
				int readnum = rs.getInt("write_readnum");
				int ref=rs.getInt("write_ref");
				int lev=rs.getInt("write_lev");
				int step=rs.getInt("write_step");
				int open=rs.getInt("write_open");
				int notice=rs.getInt("write_notice");
				readnum(idx, readnum + 1);

				
				dto=new WriteDTO(idx, userid, cate, title, writer, pwd, date, filename, content, readnum, ref, lev, step, open, notice);
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
	public int updateWrite(MultipartRequest mr) {
		try {
			conn = com.esc.db.EscDB.getConn();
			String sql = "update write set write_title=?, write_content=?,write_wdate=sysdate,write_filename=? where write_idx=?";
			ps = conn.prepareStatement(sql);
			String title=mr.getParameter("title");
			String filename=mr.getFilesystemName("filename");
			String content=mr.getParameter("content");
			String idx_s=mr.getParameter("idx");
			int idx=Integer.parseInt(idx_s);
			ps.setString(1, title);
			ps.setString(2, content);
			ps.setString(3, filename);
			ps.setInt(4, idx);
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

	/** 자유게시판 보기 관련 메서드 안쓰는 DAO */
	/*public ArrayList<WriteDTO> freeWrite() {
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
	}*/

	/** 총게시물수 관련 메서드 */
	public int getTotalCnt() {
		try {
			conn = com.esc.db.EscDB.getConn();
			String sql = "select count(*) from write";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			int count=0;
			if(rs.next()) {
				 count = rs.getInt(1);
				
			}
			return count == 0 ? 1 : count;
		} catch (Exception e) {
			e.printStackTrace();
			return 1;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if(conn!=null)
					conn.close();
			} catch (Exception e2) {}
		}
	}
	
	/**자유게시판에 보여줄 게시물 수 */
	public int freegetTotalCnt() {
		try {
			conn=com.esc.db.EscDB.getConn();
			String sql="select count(*) from write where write_cate='free'";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			int count=0;
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
			return count==0?1:count;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {}
		}
	}
	/***멤버게시판에 보여줄 게시물 수 관련 메서드*/
	public int membergetTotalCnt() {
		try {
			conn=com.esc.db.EscDB.getConn();
			String sql="select count(*) from write where write_title like '[멤버모집]%'";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			rs.next();
			int count=rs.getInt(1);
			return count==0?1:count;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {}
		}
	}
	/** 조회수 증가 관련 메서드 */
	public int readnum(int idx, int readnum) {
		try {
			String sql = "update write set write_readnum=? where write_idx=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, readnum);
			ps.setInt(2, idx);
			int count = ps.executeUpdate();

			return count;

		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				if(ps!=null)ps.close();
			} catch (Exception e2) {
			}
		}
	}

	/* 게시글 삭제 관련 메서드 **/
	public int delete(int idx,String pwd) {
		try {
			conn = com.esc.db.EscDB.getConn();
			String sql = "delete from write where write_idx=? and write_pwd=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, idx);
			ps.setString(2, pwd);
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
	/**멤버모집만 보여주는 게시판 관련 메서드*/
	public ArrayList<WriteDTO> member(int ls, int cp, int sort){
		try {
			conn=com.esc.db.EscDB.getConn();
			String mem="[멤버모집]%";
			int start = (cp - 1) * ls + 1;
			int end = cp * ls;
			String sql="";
			switch(sort) {
			case 0 : sql = "select * from (select rownum as rnum, a.* from  "
						+ "(select * from write where  write_title like ? order by write_idx desc)a)b  " + "where rnum>=? and rnum<=? ";
					break;
				
			case 1 : sql= "select * from (select rownum as rnum, a.* from  "
						+ "(select * from write where  write_title like ? order by write_readnum desc)a)b  " + "where rnum>=? and rnum<=? ";
					break;
			default : sql= "select * from (select rownum as rnum, a.* from "
						+ "(select * from write where  write_title like ? order by write_idx desc)a)b "
						+ "where rnum>=? and rnum<=?";
			}
						ps=conn.prepareStatement(sql);
			ps.setString(1, mem);
			ps.setInt(2, start);
			ps.setInt(3, end);
		
			rs=ps.executeQuery();
			ArrayList<WriteDTO> arr=new ArrayList<WriteDTO>();
			while(rs.next()){
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
				
				WriteDTO dto=new WriteDTO(idx, uidx, cate, title, writer, pwd, wdate, filename, content, readnum, ref, lev, step, open, notice);
				
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
		/**마지막 ref 구하기 관련 메서드*/
	public int getMaxRef() { 
		try {
			String sql="select max(write_ref) from write";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			int max=0;
			if(rs.next()) {
				max=rs.getInt(1);
			}
			return max;
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
	/*댓글 등록 관련 메서드**/
	public int underWrite(MultipartRequest mr) {
		try {
			conn=com.esc.db.EscDB.getConn();
			String sql="insert into write values(write_write_idx.nextval,0,'comments','댓글',?,?,sysdate,0,?,0,?,?,?,?,0)";
			setUpdatestep(Integer.parseInt(mr.getParameter("write_ref")), Integer.parseInt(mr.getParameter("write_step"))+1);
			String writer=mr.getParameter("write_writer");
			String pwd=mr.getParameter("write_pwd");
			String content=mr.getParameter("write_content");
			String ref_s=mr.getParameter("write_ref");
			int ref=Integer.parseInt(ref_s);
			String lev_s=mr.getParameter("write_lev");
			int lev=Integer.parseInt(lev_s);
			String step_s=mr.getParameter("write_step");
			int step=Integer.parseInt(step_s);
			String open_s=mr.getParameter("write_open");
			if(open_s==null) {
				open_s="1";
			}
			int open=Integer.parseInt(open_s);
			ps=conn.prepareStatement(sql);
			ps.setString(1, writer);
			ps.setString(2, pwd);
			ps.setString(3, content);
			ps.setInt(4, ref);
			ps.setInt(5, lev+1);
			ps.setInt(6, step+1);
			ps.setInt(7, open);
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
	/**순서 변경 관련 메서드*/
	public void setUpdatestep(int ref, int step) {
		try {
			String sql="update write set write_step=write_step+1 where write_ref=? and write_step>=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, ref);
			ps.setInt(2,  step);
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
	;
	/**댓글 보여주기 관련 메서드*/
	public ArrayList<WriteDTO> underList(int ref, int ls, int cp){
		try {
			conn=com.esc.db.EscDB.getConn();
			//String sql="select * from write where write_cate=? and write_ref=? order by write_ref desc , write_step asc , write_lev asc";
			int start = (cp - 1) * ls + 1;
			int end = cp * ls;
			String sql= "select * from (select rownum as rnum, a.* from (select * from write where write_cate=? and write_ref=? order by write_ref desc, write_step asc, write_lev asc )a)  where rnum>=? and rnum<=? ";
			ps=conn.prepareStatement(sql);
			ps.setString(1, "comments");
			ps.setInt(2, ref);
			ps.setInt(3, start);
			ps.setInt(4, end);
			rs=ps.executeQuery();
			ArrayList<WriteDTO> arr=new ArrayList<WriteDTO>();
			while(rs.next()){
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
				int lev = rs.getInt("write_lev");
				int step = rs.getInt("write_step");
				int open = rs.getInt("write_open");
				int notice = rs.getInt("write_notice");
				
				WriteDTO dto=new WriteDTO(idx, uidx, cate, title, writer, pwd, wdate, filename, content, readnum, ref, lev, step, open, notice);
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
	/**댓글 삭제하기 관련 메서드*/
	public int underDel(int idx, String pwd) {
		try{
			conn=com.esc.db.EscDB.getConn();
			String sql="delete from write where write_idx=? and write_pwd=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, idx);
			ps.setString(2, pwd);
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
	/**대댓글 등록 관련 메서드*/
	public int underanswer(MultipartRequest mr) {
		try {
			conn=com.esc.db.EscDB.getConn();
			String sql="insert into write values(write_write_idx.nextval,0,'comments','댓글',?,?,sysdate,0,?,0,?,?,?,?,0)";
			setUpdatestep(Integer.parseInt(mr.getParameter("write_ref")), Integer.parseInt(mr.getParameter("write_step"))+1);
			String writer=mr.getParameter("write_writer");
			String pwd=mr.getParameter("write_pwd");
			String content=mr.getParameter("write_content");
			String ref_s=mr.getParameter("write_ref");
			int ref=Integer.parseInt(ref_s);
			String lev_s=mr.getParameter("write_lev");
			int lev=Integer.parseInt(lev_s);
			String step_s=mr.getParameter("write_step");
			int step=Integer.parseInt(step_s);
			String open_s=mr.getParameter("write_open");
			if(open_s==null || open_s=="") {
				open_s="1";
			}
			int open=Integer.parseInt(open_s);
			ps=conn.prepareStatement(sql);
			ps.setString(1, writer);
			ps.setString(2, pwd);
			ps.setString(3, content);
			ps.setInt(4, ref);
			ps.setInt(5, lev+1);
			ps.setInt(6, step+1);
			ps.setInt(7, open);
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
	/**관리자 일때 게시글을 삭제하는 관련 메서드*/
	public int contentdel(int write_ref) {
		try {
			conn=com.esc.db.EscDB.getConn();
			String spl="delete from write where write_ref=?";
			ps=conn.prepareStatement(spl);
			ps.setInt(1, write_ref);
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
	/**게시글과 게시글에 속해있는 댓글을 검색하는 관련 메서드*/
	public WriteDTO contentsel(int idx) {
		try {
			conn=com.esc.db.EscDB.getConn();
			String sql="select write_ref from write where write_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, idx);
			rs=ps.executeQuery();
			WriteDTO dto=new WriteDTO();
			if(rs.next()) {
				int write_ref=rs.getInt("write_ref");
				
				dto.setWrite_ref(write_ref);
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
			}catch(Exception e2) {}
		}
	}
	/** 현재게시물에 있는 댓글의 총량을 알려주는 메서드*/
	public int  getUnderTotal(int write_ref) {
		try {
			conn=com.esc.db.EscDB.getConn();
			String sql="select count(write_idx) from write where write_ref=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, write_ref);
			rs=ps.executeQuery();
			rs.next();
			int write_idx=rs.getInt(1);
			
			return write_idx;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {}
		}
	
	}
	/**write_idx로 작성자 찾기*/
	public String  nodel(int idx) {
		try {
			conn=com.esc.db.EscDB.getConn();
			String sql="select write_writer from write where write_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, idx);
			rs=ps.executeQuery();
			rs.next();
			String write_writer=rs.getString("write_writer");
			
			return write_writer;
		}catch(Exception e) {
			return null;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {}
		}
	}
	/**댓글의 가자 큰 lev를 판별*/
	public int findlev(int ref) {
		try {
			conn=com.esc.db.EscDB.getConn();
			String sql="select max(write_lev) from write where write_ref=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, ref);
			rs=ps.executeQuery();
			rs.next();
				int lev=rs.getInt("write_lev");
			return lev;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {}
		}
	}
	/**게시물의 댓글 수량 알기 관련 메서드*/
		public int findref(int ref) {
			try {
				conn=com.esc.db.EscDB.getConn();
				String sql="select count(write_ref) from write  where write_ref=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, ref);
				rs=ps.executeQuery();
				rs.next();
				int countref=rs.getInt(1);
				
				return countref-1;
			}catch(Exception e) {
				e.printStackTrace();
				return -1;
			}finally {
				try {
					if(rs!=null)rs.close();
					if(ps!=null)ps.close();
					if(conn!=null)conn.close();
				}catch(Exception e2) {}
			}
		}
	/**비밀글 확인하기*/
		public WriteDTO showopen(int idx) {
			try {
				conn=com.esc.db.EscDB.getConn();
				String sql="select * from write where write_idx=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, idx);
				rs=ps.executeQuery();
				WriteDTO dto=null;
				if(rs.next()) {
					int uidx = rs.getInt("user_idx");
					String pwd=rs.getString("write_pwd");
					String cate = rs.getString("write_cate");
					String title = rs.getString("write_title");
					String writer = rs.getString("write_writer");
					java.sql.Date wdate = rs.getDate("write_wdate");
					String filename = rs.getString("write_filename");
					String content = rs.getString("write_content");
					int readnum = rs.getInt("write_readnum");
					int ref = rs.getInt("write_ref");
					int lev = rs.getInt("write_lev");
					int step = rs.getInt("write_step");
					int open = rs.getInt("write_open");
					int notice = rs.getInt("write_notice");
					
					dto=new WriteDTO(idx, uidx, cate, title, writer, pwd, wdate, filename, content, readnum, ref, lev, step, open, notice);
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
				}catch(Exception e2) {}
			}
		}
		/**비밀글 들어가기*/
		public boolean underright(int idx, String pwd) {
			try{
				conn=com.esc.db.EscDB.getConn();
				String sql="select write_idx  from write where write_idx=? and write_pwd=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, idx);
				ps.setString(2, pwd);
				rs=ps.executeQuery();
				rs.next();
				
				return true;
				
			}catch(Exception e) {
				e.printStackTrace();
				return false;
			}finally {
				try {
					if(rs!=null)rs.close();
					if(ps!=null)ps.close();
					if(conn!=null)conn.close();
				}catch(Exception e2) {}
			}
		}
		/**게시물 번호로 수정할려고하는 게시물 들어가기*/
		public boolean idxcheck(int idx, String pwd) {
			try {
				conn=com.esc.db.EscDB.getConn();
				String sql="select write_idx from write where write_idx=? and write_pwd=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, idx);
				ps.setString(2, pwd);
				rs=ps.executeQuery();
				rs.next();
				
				return true;
			}catch(Exception e) {
				e.printStackTrace();
				return false;
			}finally {
				try {
					if(rs!=null)rs.close();
					if(ps!=null)ps.close();
					if(conn!=null)conn.close();
				}catch(Exception e2) {}
			}
			
		}
}
