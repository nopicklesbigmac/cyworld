package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class profileDAO {


	private Connection con;

	public profileDAO() {
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
	
	public void insert( String id, String pro , String content) {
         String sql = "INSERT INTO  CYFPROFILE VALUES(?,?,?)";
         
         PreparedStatement ps = null;
         try {
            ps = con.prepareStatement(sql);
            ps.setString(1, id);
            ps.setString(2, pro);
            ps.setString(3, content);
            
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
	public profileDTO select(String id) {
		String sql = "SELECT * FROM CYFPROFILE WHERE userId=?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				profileDTO ppp = new profileDTO();
				ppp.setUserid(rs.getString("USERID"));
				ppp.setPro(rs.getString("pro"));
				ppp.setContent(rs.getString("content"));
				return ppp;
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
	public void updateC(String id,String story) {
		String sql = "UPDATE CYFPROFILE SET content = ? WHERE userid =?";
		
		PreparedStatement ps = null;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, story); 
			ps.setString(2, id);
			
			
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
	public void updateP(String id,String story) {
		String sql = "UPDATE CYFPROFILE SET pro = ? WHERE userid =?";
		
		PreparedStatement ps = null;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, story); 
			ps.setString(2, id);
			
			
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
