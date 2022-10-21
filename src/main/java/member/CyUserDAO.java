package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import shop.CyCartDTO;

public class CyUserDAO {
	

		private Connection con;

		public CyUserDAO() {
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
		
		public void insert(CyUserDTO cyuser) {
	         String sql = "INSERT INTO cyuser VALUES(?,?,?,?,?,?,?,?,?,?)";
	         
	         PreparedStatement ps = null;
	         try {
	            ps = con.prepareStatement(sql);
	            ps.setString(1, cyuser.getUserId());
	            ps.setString(2, cyuser.getUserPw());
	            ps.setString(3, cyuser.getUserName());
	            ps.setString(4, cyuser.getUserGender());
	            ps.setInt(5, cyuser.getUserDotory());
	            ps.setString(6, cyuser.getUserBirth());
	            ps.setInt(7, cyuser.getToDay());
	            ps.setInt(8, cyuser.getTotalDay());
	            ps.setString(9, cyuser.getCheckDay());
	            ps.setString(10, cyuser.getUserId());
	            
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
		public CyUserDTO selectId(String id) {
			String sql = "SELECT * FROM cyuser WHERE userId=?";
			PreparedStatement ps = null;
			ResultSet rs = null;
			try {
				ps = con.prepareStatement(sql);
				ps.setString(1, id);
				rs = ps.executeQuery();
				if(rs.next()) {
					CyUserDTO cyuser = new CyUserDTO();
					cyuser.setUserId(rs.getString("USERID"));
					cyuser.setUserPw(rs.getString("USERPW"));
					cyuser.setUserName(rs.getString("USERNAME"));
					cyuser.setUserDotory(rs.getInt("USERDOTORY"));
					cyuser.setTotalDay(rs.getInt("totalday"));
					cyuser.setToDay(rs.getInt("today"));
					cyuser.setUserGender(rs.getString("usergender"));
					cyuser.setUserBirth(rs.getString("USERBIRTH"));
					return cyuser;
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
	
		   public String findId(String userName, String userBirth) {
		         String mid = null;
		         PreparedStatement ps = null;
		         ResultSet rs = null;
		         try {
		            String sql = "select userId from cyuser where userName=? and userBirth=? ";
		            ps = con.prepareStatement(sql);
		            ps.setString(1, userName);
		            ps.setString(2, userBirth);
		            
		            rs = ps.executeQuery();
		            
		            if(rs.next()) {
		               mid = rs.getString("userId");
		            }
		               
		         } catch (Exception e) {
		            e.printStackTrace();
		         }
		         return mid;
		      }
		      
		      public String findPw(String userId, String userName) {
		         String mpw = null;
		         PreparedStatement ps = null;
		         ResultSet rs = null;
		         try {
		            String sql = "select userPw from cyuser where userId=? and userName=? ";
		            ps = con.prepareStatement(sql);
		            ps.setString(1, userId);
		            ps.setString(2, userName);
		            
		            rs = ps.executeQuery();
		            
		            if(rs.next()) {
		               mpw = rs.getString("userPw");
		            }
		               
		         } catch (Exception e) {
		            e.printStackTrace();
		         }
		         return mpw;
		      }

}
