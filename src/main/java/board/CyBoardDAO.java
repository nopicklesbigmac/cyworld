package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class CyBoardDAO {

	private Connection con;
	private static CyBoardDAO boardDao = null;

	
	public static CyBoardDAO getInstance() {
		if(boardDao == null)
			boardDao = new CyBoardDAO();
		
		return boardDao; 
	}

	public CyBoardDAO() {
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "oracle";
		String password = "oracle";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void insert(CyBoardDTO cyuser) {
         String sql = "INSERT INTO cyuser VALUES";
         
         PreparedStatement ps = null;
         try {
            ps = con.prepareStatement(sql);
          
            
            ps.executeUpdate();
         } catch (SQLException e) {
            e.printStackTrace();
         }finally {
            try {
               if(ps != null) ps.close();
            } catch (SQLException e) {
               e.printStackTrace();
            }
         }
      }
	public ArrayList<CyBoardDTO> selectb(String id) {
		String sql = "SELECT * FROM CYBOARD  WHERE userId=? order by num desc";
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<CyBoardDTO> list = new ArrayList<CyBoardDTO>();
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			int i =5;
			while(rs.next()) {
				i++;
				CyBoardDTO board = new CyBoardDTO();
				board.setSubject(rs.getString("Subject"));
				board.setType(rs.getString("type"));
				list.add(board);
				if (i<=5) {
					break;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(ps != null) ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	public CyBoardDTO selectid(String id) {
		String sql = "SELECT * FROM cyboard where userid=? ";
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<CyBoardDTO> list = new ArrayList<>();
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			while(rs.next()) {
				CyBoardDTO board = new CyBoardDTO();
				
				board.setNum(rs.getInt("num"));
				board.setSubject(rs.getString("subject")); 
				board.setUserId(rs.getString("userid")); 
				board.setUserName(rs.getString("username")); 
				board.setCreated(rs.getString("created"));  
				board.setHitCount(rs.getInt("hitcount"));
			
				list.add(board);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(ps != null) ps.close();
			} catch (SQLException e) {
				e.printStackTrace(); 
			}
		} 
		return null;
	}
	
	public ArrayList<CyBoardDTO> selectAll(String id) {
		String sql = "SELECT * FROM cyboard where userid = ? ORDER BY num DESC";
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<CyBoardDTO> list = new ArrayList<>();
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			while(rs.next()) {
				CyBoardDTO board = new CyBoardDTO();
				
				board.setNum(rs.getInt("num"));
				board.setSubject(rs.getString("subject")); 
				board.setUserName(rs.getString("username")); 
				board.setCreated(rs.getString("created"));  
				board.setHitCount(rs.getInt("hitcount"));
			
				list.add(board);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(ps != null) ps.close();
			} catch (SQLException e) {
				e.printStackTrace(); 
			}
		} 
		return list;
	}
	
	public void write(CyBoardDTO board) {
		String sql = "INSERT INTO cyboard VALUES(cyboard_seq.nextval,?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement ps = null;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, board.getUserId());
			ps.setString(2, board.getUserName()); 
			ps.setString(3, board.getSubject());
			ps.setString(4, board.getFolderName());
			ps.setString(5, board.getContent());
			ps.setString(6, board.getSaveFileName());
			ps.setString(7, board.getOriginalFileName());
			ps.setString(8, board.getCreated());
			ps.setInt(9, 1);
			ps.setInt(10,1);
			ps.setString(11, "게시판");
			
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps != null) 
					ps.close(); 
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public CyBoardDTO getContent (int num) {
		
		String sql = "SELECT * FROM cyboard WHERE num=?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			if(rs.next()) {
				CyBoardDTO board = new CyBoardDTO();
				board.setNum(rs.getInt("num"));
				board.setOriginalNum(rs.getInt("originalnum"));
				board.setUserId(rs.getString("userid"));
				board.setUserName(rs.getString("username"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setOriginalFileName(rs.getString("originalfilename"));
				board.setCreated(rs.getString("created"));
				board.setHitCount(rs.getInt("hitcount"));
				return board;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(ps != null) ps.close();
				if(con != null) con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	public CyBoardDTO selectNum(int num) {
		String sql = "SELECT * FROM cyboard WHERE num=?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			if(rs.next()) {
				CyBoardDTO board = new CyBoardDTO();
				board.setNum(rs.getInt("num"));
				board.setOriginalNum(rs.getInt("originalnum"));
				board.setUserId(rs.getString("userid"));
				board.setUserName(rs.getString("username"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setOriginalFileName(rs.getString("originalfilename"));
				board.setSaveFileName(rs.getString("savefilename")); 
				board.setCreated(rs.getString("created"));
				board.setHitCount(rs.getInt("hitcount"));
				return board;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(ps != null) ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	public void incrementHit(int num, int hitcount) {
		String sql = "UPDATE cyboard SET hitcount=? WHERE num=?";
		
		PreparedStatement ps = null;
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, hitcount);
			ps.setInt(2, num);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps != null) ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	public void deleteb(int num) {
		String sql = "delete from cyboard WHERE num=?";
		
		PreparedStatement ps = null;
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps != null) ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
		
	}

