package shop;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CyUsingSongsDAO {
	private Connection con; 

	public CyUsingSongsDAO() {
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
	
	public ArrayList<CyUsingSongsDTO> selectlist(String type) {
		ArrayList<CyUsingSongsDTO> list = new ArrayList<CyUsingSongsDTO>();
		String sql = "SELECT * FROM CYUSINGSONGS WHERE userId=?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, type);
			rs = ps.executeQuery();
			while(rs.next()) {
				CyUsingSongsDTO song = new CyUsingSongsDTO();
				song.setUserId(rs.getString("userId"));
				song.setSongOrder(rs.getInt("songOrder"));
				song.setSaveFileName(rs.getString("SAVEFILENAME"));
				song.setOriginalFileName(rs.getString("ORIGINALFILENAME"));
				list.add(song);
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
