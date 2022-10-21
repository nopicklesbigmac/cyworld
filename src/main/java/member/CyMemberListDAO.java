package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CyMemberListDAO {


	private Connection con;

	public CyMemberListDAO() {
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
	//일촌추가 메소드 아직수
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
	public ArrayList<memberDTO> selectmember1(String id,int type) {
		String sql = "SELECT * FROM CYMEMBERLIST  WHERE userId1=?  and type = ?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<memberDTO> list = new ArrayList<memberDTO>();
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setInt(2, type);
			rs = ps.executeQuery();
			while(rs.next()) {
				memberDTO member = new memberDTO();
				member.setUserId(rs.getString("USERID2"));
				member.setUserValue(rs.getString("USERVALUE2"));
				member.setUserName(rs.getString("USERNAME2"));
				member.setUserMessege(rs.getString("USERMESSEGE"));
				list.add(member);
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
	public ArrayList<memberDTO> selectmember2(String id,int type) {
		String sql = "SELECT * FROM CYMEMBERLIST  WHERE userId2=?  and type = ?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<memberDTO> list = new ArrayList<memberDTO>();
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setInt(2, type);
			rs = ps.executeQuery();
			while(rs.next()) {
				memberDTO member = new memberDTO();
				member.setUserId(rs.getString("USERID1"));
				member.setUserValue(rs.getString("USERVALUE1"));
				member.setUserName(rs.getString("USERNAME1"));
				member.setUserMessege(rs.getString("USERMESSEGE"));
				list.add(member);
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



}
