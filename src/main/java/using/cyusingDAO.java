package using;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class cyusingDAO {


	private Connection con; 

	public cyusingDAO() {
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
	
	public void insert(CyminimiDTO minimi) {
		String sql = "INSERT INTO CYUSINGMINIMI VALUES(?,?,?,?,?)";
		
		PreparedStatement ps = null;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, minimi.getUserid());
			ps.setString(2, minimi.getSaveFileName());
			ps.setString(3, minimi.getOriginalFileName());
			ps.setString(4, minimi.getImgx());
			ps.setString(5, minimi.getImgy());
			
			
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
	public void insertroom(CyminimiDTO minimi) {
		String sql = "INSERT INTO CYUSINGSTORYROOM VALUES(?,?,?)";
		
		PreparedStatement ps = null;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, minimi.getUserid());
			ps.setString(2, minimi.getSaveFileName());
			ps.setString(3, minimi.getOriginalFileName());
			
			
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
	public void insertbg(CyminimiDTO minimi) {
		String sql = "INSERT INTO  CYUSINGBG VALUES(?,?,?)";
		
		PreparedStatement ps = null;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, minimi.getUserid());
			ps.setString(2, minimi.getSaveFileName());
			ps.setString(3, minimi.getOriginalFileName());
			
			
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
	
public CyminimiDTO selectsr(String id) {
		
		String sql = "SELECT * FROM CYUSINGSTORYROOM WHERE userid=?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				CyminimiDTO minimi = new CyminimiDTO();
				minimi.setUserid(rs.getString("USERID"));
				minimi.setSaveFileName(rs.getString("SAVEFILENAME"));
				minimi.setOriginalFileName(rs.getString("ORIGINALFILENAME"));
				return minimi;
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

public CyminimiDTO selectbg(String id) {
		
		String sql = "SELECT * FROM CYUSINGBG WHERE userid=?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				CyminimiDTO minimi = new CyminimiDTO();
				minimi.setUserid(rs.getString("USERID"));
				minimi.setSaveFileName(rs.getString("SAVEFILENAME"));
				minimi.setOriginalFileName(rs.getString("ORIGINALFILENAME"));
				return minimi;
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
	public CyminimiDTO select(String id) {
		
		String sql = "SELECT * FROM CYUSINGMINIMI WHERE userid=?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				CyminimiDTO minimi = new CyminimiDTO();
				minimi.setUserid(rs.getString("USERID"));
				minimi.setSaveFileName(rs.getString("SAVEFILENAME"));
				minimi.setOriginalFileName(rs.getString("ORIGINALFILENAME"));
				minimi.setImgx(rs.getString("IMGX"));
				minimi.setImgy(rs.getString("IMGY"));
				return minimi;
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
	public void usingminimi(String id,String minimi,String x,String y) {
		String sql = "UPDATE CYUSINGMINIMI SET ORIGINALFILENAME = ? , SAVEFILENAME = ? , IMGX = ? , IMGY = ? WHERE userid = ?";
		
		PreparedStatement ps = null;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, minimi);
			ps.setString(2, minimi);
			ps.setString(3, x);
			ps.setString(4, y);
			ps.setString(5, id);
			
			
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
	public void usingstory(String id,String story) {
		String sql = "UPDATE CYUSINGSTORYROOM SET ORIGINALFILENAME = ? , SAVEFILENAME = ? WHERE userid =?";
		
		PreparedStatement ps = null;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, story);
			ps.setString(2, story); 
			ps.setString(3, id);
			
			
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
	}public void usingbg(String id,String story) {
		String sql = "UPDATE CYUSINGBG SET ORIGINALFILENAME = ? , SAVEFILENAME = ? WHERE userid =?";
		
		PreparedStatement ps = null;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, story);
			ps.setString(2, story); 
			ps.setString(3, id);
			
			
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
