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

	/** 마지막 ref구하기 관련 메서드 */
	public int getMaxWrite_Ref() {
		try {
			String sql = "select max(write_ref) from write";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			int max = 0;
			if (rs.next()) {
				max = rs.getInt(1);
			}
			return max;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
			} catch (Exception e2) {

			}
		}

	}

	/** QnA게시글 등록 관련 메서드 */
	public int writeQnAupload(MultipartRequest mr) {
		try {
			conn = com.esc.db.EscDB.getConn();
			int maxref = getMaxWrite_Ref();
			String filename = mr.getFilesystemName("write_filename");
			String user_idx_s = mr.getParameter("user_idx");
			if (user_idx_s == null || user_idx_s.equals("")) {
				user_idx_s = "0";
			}
			int user_idx = Integer.parseInt(user_idx_s);
			int write_open = Integer.parseInt(mr.getParameter("write_open"));
			int notice = Integer.parseInt(mr.getParameter("write_notice"));

			String sql = "insert into write values(write_write_idx.nextval,?,'qna',?,?,?,sysdate,?,?,0,?,0,0,?,?)";
			ps = conn.prepareStatement(sql);

			ps.setInt(1, user_idx);
			ps.setString(2, mr.getParameter("write_title"));
			ps.setString(3, mr.getParameter("write_writer"));
			ps.setString(4, mr.getParameter("write_pwd"));
			ps.setString(5, filename);
			ps.setString(6, mr.getParameter("write_content"));
			ps.setInt(7, maxref + 1);
			ps.setInt(8, write_open);
			ps.setInt(9, notice);

			int count = ps.executeUpdate();
			return count;

		} catch (Exception e) {
			// TODO Auto-generated catch block
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

	/** 순서 변경 관련 메서드 */

	public void setUpdate_step(int write_ref, int write_step) {
		try {
			String sql = "update write set write_step = write_step+1 where write_ref=? and write_step>=?";

			ps = conn.prepareStatement(sql);
			ps.setInt(1, write_ref);
			ps.setInt(2, write_step);

			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			try {
				if (ps != null)
					ps.close();
			} catch (Exception e2) {
			}
		}
	}

	/** 답변 글쓰기 관련 메서드 */
	public int qna_repwrite(MultipartRequest mr) {
		try {
			conn = com.esc.db.EscDB.getConn();

			int user_idx = mr.getParameter("user_idx") == null || mr.getParameter("user_idx").equals("") ? 0
					: Integer.parseInt(mr.getParameter("user_idx"));

			int write_ref = mr.getParameter("write_ref") == null || mr.getParameter("write_ref").equals("") ? 0
					: Integer.parseInt(mr.getParameter("write_ref"));

			String write_step_s = mr.getParameter("write_step");
			if (write_step_s == null || write_step_s.equals("")) {
				write_step_s = "0";
			}
			int write_step = Integer.parseInt(write_step_s);

			int write_lev = mr.getParameter("write_lev") == null || mr.getParameter("write_lev").equals("") ? 0
					: Integer.parseInt(mr.getParameter("write_lev"));

			int write_open = mr.getParameter("write_open") == null || mr.getParameter("write_open").equals("") ? 0
					: Integer.parseInt(mr.getParameter("write_open"));

			setUpdate_step(write_ref, write_step + 1);

			String sql = "insert into write values(write_write_idx.nextval,?,'qna',?,?,?,sysdate,?,?,0,?,?,?,?,0)";
			ps = conn.prepareStatement(sql);

			ps.setInt(1, user_idx);
			ps.setString(2, mr.getParameter("write_title"));
			ps.setString(3, mr.getParameter("write_writer"));
			ps.setString(4, mr.getParameter("write_pwd"));
			ps.setString(5, mr.getFilesystemName("write_filename"));
			ps.setString(6, mr.getParameter("write_content"));
			ps.setInt(7, write_ref);
			ps.setInt(8, write_lev + 1);
			ps.setInt(9, write_step + 1);
			ps.setInt(10, write_open);

			int count = ps.executeUpdate();
			return count;

		} catch (Exception e) {
			// TODO Auto-generated catch block
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

	/** QnA 총 게시글 수 관련 메서드 */
	public int getTotalCnt(String Listname, String content) {
		try {
			conn = com.esc.db.EscDB.getConn();
			String sql = "";
			int count = 1;
			switch (Listname) {
			case "0":
				sql = "select count(*) from write where write_cate = 'qna' and write_notice = 0";
				ps = conn.prepareStatement(sql);
				rs = ps.executeQuery();
				rs.next();
				count = rs.getInt(1)==0?1:rs.getInt(1);
				break;
			case "1"://제목
				sql = "select count(*) from write where write_cate = 'qna' and write_title like ? and write_notice = 0";
				ps = conn.prepareStatement(sql);
				ps.setString(1, "%" + content + "%");
				rs = ps.executeQuery();
				rs.next();
				count = rs.getInt(1)==0?1: rs.getInt(1);
				break;
			case "2"://내용
				sql = "select count(*) from write where write_cate = 'qna' and write_content like ? and write_notice = 0";
				ps = conn.prepareStatement(sql);
				ps.setString(1, "%" + content + "%");

				rs = ps.executeQuery();
				rs.next();
				count = rs.getInt(1)==0?1:rs.getInt(1);
				break;
			case "3"://작성자
				sql = "select count(*) from write where write_cate = 'qna' and write_writer like ? and write_notice = 0";
				ps = conn.prepareStatement(sql);
				ps.setString(1, "%" + content + "%");

				rs = ps.executeQuery();
				rs.next();
				count = rs.getInt(1)==0?1: rs.getInt(1);
				break;

			case "4"://제목 본문
				sql = "select count(*) from write where write_cate = 'qna' and write_notice = 0 and (write_title like ? or write_content like ?) ";
				ps = conn.prepareStatement(sql);
				ps.setString(1, "%" + content + "%");
				ps.setString(2, "%" + content + "%");

				rs = ps.executeQuery();
				rs.next();
				
				count = rs.getInt(1)==0?1:rs.getInt(1);
				break;
			}

			return count;

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 1;
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

	/** QnA 게시글 리스트 출력 메서드 */
	public ArrayList<WriteDTO> writeQnAList(int userpage, int writeList, String Listname, String content) {
		try {
			conn = com.esc.db.EscDB.getConn();
			int start = (userpage - 1) * writeList + 1;
			int end = userpage * writeList;

			String sql = "";
			int list = Integer.parseInt(Listname);
			switch (list) {
			case 0://기본
				sql = "select * from(select rownum r,a.* from (select * from write where write_cate = 'qna'and write_notice = 0 order by write_ref desc,write_step asc)a) where r >=? and r<=?";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, start);
				ps.setInt(2, end);
				break;
			case 1://제목
				sql = "select * from(select rownum r,a.* from (select * from write where write_cate = 'qna' and write_notice = 0 and write_title like ? order by write_idx desc)a) where r >=? and r<=?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, "%" + content + "%");
				ps.setInt(2, start);
				ps.setInt(3, end);
				break;
			case 2://본문
				sql = "select * from(select rownum r,a.* from (select * from write where write_cate = 'qna' and write_notice = 0 and write_content like ? order by write_idx desc)a) where r >=? and r<=?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, "%" + content + "%");
				ps.setInt(2, start);
				ps.setInt(3, end);
				break;
			case 3://작성자
				sql = "select * from(select rownum r,a.* from (select * from write where write_cate = 'qna' and write_notice = 0 and write_writer like ? order by write_idx desc)a) where r >=? and r<=?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, "%" + content + "%");
				ps.setInt(2, start);
				ps.setInt(3, end);
				break;
			case 4://제목+본문
				sql = "select * from(select rownum r,a.* from (select * from write where write_notice = 0 and write_cate = 'qna' and write_title like ? or write_content like ? order by write_idx desc)a) where r >=? and r<=? and write_notice = 0";
				ps = conn.prepareStatement(sql);
				ps.setString(1, "%" + content + "%");
				ps.setString(2, "%" + content + "%");
				ps.setInt(3, start);
				ps.setInt(4, end);
				break;
			}

			rs = ps.executeQuery();
			ArrayList<WriteDTO> arr = new ArrayList<WriteDTO>();

			while (rs.next()) {
				int write_idx = rs.getInt("write_idx");
				int user_idx = rs.getInt("user_idx");
				String write_cate = rs.getString("write_cate");
				String write_title = rs.getString("write_title");
				String write_writer = rs.getString("write_writer");
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

				WriteDTO dto = new WriteDTO(write_idx, user_idx, write_cate, write_title, write_writer, write_pwd,
						write_wdate, write_filename, write_content, write_readnum, write_ref, write_lev, write_step,
						write_open, write_notice);

				arr.add(dto);
			}

			return arr;

		} catch (Exception e) {
			// TODO Auto-generated catch block
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

	/** qna조회수 관련 메서드 */
	public void readnumUpdate(int write_idx) {
		try {
			String sql = "update write set write_readnum = write_readnum+1 where write_idx =? ";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, write_idx);
			ps.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (ps != null)
					ps.close();
			} catch (Exception e2) {

			}

		}

	}

	/** 공지글 출력 관련 메서드 */
	public ArrayList<WriteDTO> qna_noticelist() {
		try {
			conn = com.esc.db.EscDB.getConn();
			String sql = "select * from write where write_cate = 'qna' and write_notice=1 order by write_idx desc";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			ArrayList<WriteDTO> arr = new ArrayList<WriteDTO>();

			while (rs.next()) {
				int write_idx = rs.getInt("write_idx");
				int user_idx = rs.getInt("user_idx");
				String write_cate = rs.getString("write_cate");
				String write_title = rs.getString("write_title");
				String write_writer = rs.getString("write_writer");
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

				WriteDTO dto = new WriteDTO(write_idx, user_idx, write_cate, write_title, write_writer, write_pwd,
						write_wdate, write_filename, write_content, write_readnum, write_ref, write_lev, write_step,
						write_open, write_notice);

				arr.add(dto);
			}

			return arr;
		} catch (Exception e) {
			// TODO Auto-generated catch block
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

	/** qna글 본문보기 관련 메서드 */
	public WriteDTO writeQnAContent(int write_idx) {
		try {
			conn = com.esc.db.EscDB.getConn();
			readnumUpdate(write_idx);
			
			String sql = "select * from write where write_idx = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, write_idx);
			rs = ps.executeQuery();
			WriteDTO dto = null;

			if (rs.next()) {
				int user_idx = rs.getInt("user_idx");
				String write_cate = rs.getString("write_cate");
				String write_title = rs.getString("write_title");
				String write_writer = rs.getString("write_writer");
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
				dto = new WriteDTO(write_notice, user_idx, write_cate, write_title, write_writer, write_pwd,
						write_wdate, write_filename, write_content, write_readnum, write_ref, write_lev, write_step,
						write_open, write_notice);
			}
			return dto;

		} catch (Exception e) {
			// TODO Auto-generated catch block
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

	/** qna게시물 삭제 관련 메서드 */
	public int qna_delete(int write_idx) {
		try {
			conn = com.esc.db.EscDB.getConn();
			String sql = "delete from write where write_idx = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, write_idx);
			int count = ps.executeUpdate();
			return count;

		} catch (Exception e) {
			// TODO Auto-generated catch block
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

	/** qna 게시물 수정 관련 메서드 */
	public int qna_update(WriteDTO dto) {
		try {
			conn = com.esc.db.EscDB.getConn();
			String sql = "update write set write_title = ?, write_content =?,write_open = ? where write_idx = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getWrite_title());
			ps.setString(2, dto.getWrite_content());
			ps.setInt(3, dto.getWrite_open());
			ps.setInt(4, dto.getWrite_idx());
			int count = ps.executeUpdate();
			return count;

		} catch (Exception e) {
			// TODO Auto-generated catch block
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

	/*----------------------------댓글---------------------------------------------------------------*/
	
	/**댓글 ref 그룹구하기 관련 메서드 */
	public int getCommMaxRef() {
		try {
			String sql = "select max(comm_ref) from comments";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			int max =0;
			if(rs.next()) {
				max = rs.getInt(1);
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
	/**댓글 순서 변경 관련 메서드*/
	public void setUpdateCommStep(int write_ref,int write_step) {
		try {
			String sql = "update comments set comm_step = comm_step+1 where comm_ref=? and comm_step>=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, write_ref);
			ps.setInt(2, write_step);
			
			ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
			
		}finally {
			try {
				if(rs!=null)rs.close();
			}catch(Exception e2) {
			}
			
		}
		
	}
	/** 댓글 등록 관련 메서드 */
	public int comment_write(CommentDTO dto) {
		try {
			conn = com.esc.db.EscDB.getConn();
			int maxref = getCommMaxRef();
			String sql = "insert into comments values(comments_comm_idx.nextval,?,?,?,?,?,sysdate,0,?,0,0)";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, dto.getWrite_idx());
			ps.setInt(2, dto.getUser_idx());
			ps.setString(3, dto.getComm_writer());
			ps.setString(4, dto.getComm_pwd());
			ps.setString(5, dto.getComm_content());
			ps.setInt(6, maxref+1);

			int count = ps.executeUpdate();
			return count;

		} catch (Exception e) {
			// TODO Auto-generated catch block
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
/**대댓글 등록 관련 메서드*/
	public int comment_repwrite(CommentDTO dto) {
		try {
			conn = com.esc.db.EscDB.getConn();
			setUpdateCommStep(dto.getComm_ref(), dto.getComm_step()+1);
			String sql = "insert into comments values(comments_comm_idx.nextval,?,?,?,?,?,sysdate,0,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, dto.getWrite_idx());
			ps.setInt(2, dto.getUser_idx());
			ps.setString(3, dto.getComm_writer());
			ps.setString(4, dto.getComm_pwd());
			ps.setString(5, dto.getComm_content());
			ps.setInt(6, dto.getComm_ref());
			ps.setInt(7, dto.getComm_lev()+1);
			ps.setInt(8, dto.getComm_step()+1);

			int count = ps.executeUpdate();
			return count;

		} catch (Exception e) {
			// TODO Auto-generated catch block
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

	
	
	/** 댓글 출력 관련 메서드 */
	public ArrayList<CommentDTO> commentList(int write_idx) {
		try {
			conn = com.esc.db.EscDB.getConn();
			String sql = "select * from comments where write_idx = ? order by comm_ref desc,comm_step asc";

			ps = conn.prepareStatement(sql);
			ps.setInt(1, write_idx);

			rs = ps.executeQuery();
			ArrayList<CommentDTO> arr = new ArrayList<CommentDTO>();
			while (rs.next()) {
				int comm_idx = rs.getInt("comm_idx");
				int user_idx = rs.getInt("user_idx");
				String comm_writer = rs.getString("comm_writer");
				String comm_pwd = rs.getString("comm_pwd");
				String comm_content = rs.getString("comm_content");
				Date comm_date = rs.getDate("comm_date");
				int comm_like = rs.getInt("comm_like");
				int comm_ref = rs.getInt("comm_ref");
				int comm_lev = rs.getInt("comm_lev");
				int comm_step = rs.getInt("comm_step");

				CommentDTO dto = new CommentDTO(comm_idx, write_idx, user_idx, comm_writer, comm_pwd, comm_content,
						comm_date, comm_like, comm_ref, comm_lev, comm_step);

				arr.add(dto);
			}
			return arr;

		} catch (Exception e) {
			// TODO Auto-generated catch block
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
	
	/**댓글 개수 파악 관련 메서드*/
	public int commentNum(int write_idx) {
		try {
			conn = com.esc.db.EscDB.getConn();
			String sql = "select count(*) from comments where write_idx = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1,write_idx);
			rs = ps.executeQuery();
			rs.next();
			int count = rs.getInt(1);
			return count;
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			}catch(Exception e2) {
				
			}
		}
		
	}
	
	/**댓글 삭제 관련 메서드*/
	public int comment_Delete(int comm_idx) {
		try {
			conn = com.esc.db.EscDB.getConn();
			String sql = "delete from comments where comm_idx = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, comm_idx);
			
			int count = ps.executeUpdate();
			return count;
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			}catch(Exception e2) {
				
			}
		}
	}
	

	/*---------------------------------------관리자--------------------------------------------------------------*/

	/** 관리자 공지글 등록관련 메서드 */
	public int qna_noticeUpload(MultipartRequest mr) {
		try {
			conn = com.esc.db.EscDB.getConn();
			int maxref = getMaxWrite_Ref();
			String filename = mr.getFilesystemName("write_filename");
			String user_idx_s = mr.getParameter("user_idx");
			if (user_idx_s == null || user_idx_s.equals("")) {
				user_idx_s = "0";
			}
			int user_idx = Integer.parseInt(user_idx_s);

			String sql = "insert into write values(write_write_idx.nextval,?,'qna',?,'관리자',?,sysdate,?,?,0,?,0,0,1,1)";
			ps = conn.prepareStatement(sql);

			ps.setInt(1, user_idx);
			ps.setString(2, mr.getParameter("write_title"));
			ps.setString(3, mr.getParameter(""));
			ps.setString(4, filename);
			ps.setString(5, mr.getParameter("write_content"));
			ps.setInt(6, maxref + 1);

			int count = ps.executeUpdate();
			return count;

		} catch (Exception e) {
			// TODO Auto-generated catch block
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

	/**답글이 있으면 삭제 못하게 하는 기능*/
	public int refcount(int write_idx) {
		try {
			conn=com.esc.db.EscDB.getConn();
			String sql = "select count(write_lev) from write where write_ref = (select write_ref from write where write_idx =?) and write_lev!=0";
			
			ps=conn.prepareStatement(sql);
			ps.setInt(1, write_idx);
			rs = ps.executeQuery();
			int count = 0;
			if(rs.next()) {
			count = rs.getInt(1);}
			
			 return count;
			 
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
	/**글 작성 시간 가져오기*/
	public String writetime(int write_idx) {
		try {
			conn=com.esc.db.EscDB.getConn();
			String sql = "select to_char(write_wdate,'hh24:mm')from write where write_idx =?";
			
			ps=conn.prepareStatement(sql);
			ps.setInt(1, write_idx);
			rs = ps.executeQuery();
			String writetime="";
			if(rs.next()) {
			writetime = rs.getString(1);}
			
			 return writetime;
			 
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

	/**내가 작성한 글 가져오기 관리자 답변까지*/
	public ArrayList<WriteDTO> userWriteList(int user_idx) {
		try {
			conn = com.esc.db.EscDB.getConn();
			
				String sql =
				
				"select * from write where write_notice =0 and user_idx =? or write_ref in(select write_ref from write where user_idx=?) order by write_ref desc,write_step asc";	
						
				ps = conn.prepareStatement(sql);
				ps.setInt(1, user_idx);
				ps.setInt(2, user_idx);
			
				rs = ps.executeQuery();
				ArrayList<WriteDTO> arr = new ArrayList<WriteDTO>();

				while (rs.next()) {
					user_idx = rs.getInt("user_idx");
					int write_idx = rs.getInt("write_idx");
				String write_cate = rs.getString("write_cate");
				String write_title = rs.getString("write_title");
				String write_writer = rs.getString("write_writer");
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

				WriteDTO dto = new WriteDTO(write_idx, user_idx, write_cate, write_title, write_writer, write_pwd,
						write_wdate, write_filename, write_content, write_readnum, write_ref, write_lev, write_step,
						write_open, write_notice);

				arr.add(dto);
			}

			return arr;

		} catch (Exception e) {
			// TODO Auto-generated catch block
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
	
}
