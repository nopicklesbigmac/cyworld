package shop;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import member.CyUserDTO;


public class CyitemshopDAO {


	private Connection con; 

	public CyitemshopDAO() {
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
	
	public void insert(CyitemshopDTO cart,String id) {
		String sql = "INSERT INTO cycart VALUES(?,?,?,?,?,?,?)";
		
		PreparedStatement ps = null;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, cart.getItemName());
			ps.setInt(3, cart.getItemPrice());
			ps.setString(4, cart.getType());
			ps.setString(5, cart.getSaveFileName());
			ps.setString(6, cart.getOriginalFileName());
			ps.setInt(7, cart.getNum());
			
			
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
	
	public void byitem(CyitemshopDTO cart,String id) {
		String sql = "INSERT INTO CYMYITEM VALUES(?,?,?,?,?,?,?)";
		
		PreparedStatement ps = null;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, cart.getType());
			ps.setString(3, cart.getSaveFileName());
			ps.setString(4, cart.getOriginalFileName());
			ps.setString(5, null);
			ps.setInt(6, cart.getNum());
			ps.setString(7, id);
			
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
	public ArrayList<CyitemshopDTO> mylist(String id ,String type) {
		ArrayList<CyitemshopDTO> list = new ArrayList<CyitemshopDTO>();
		String sql = "SELECT * FROM CYMYITEM WHERE userid = ?and TYPE=?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, type);
			rs = ps.executeQuery();
			while(rs.next()) {
				CyitemshopDTO cyitemshop = new CyitemshopDTO();
				cyitemshop.setSaveFileName(rs.getString("SAVEFILENAME"));
				cyitemshop.setOriginalFileName(rs.getString("ORIGINALFILENAME"));
				list.add(cyitemshop);
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
	public void dotory(String id,int price) {
		String sql = "UPDATE cyuser SET userdotory = userdotory - ? WHERE userid =?";
		
		PreparedStatement ps = null;
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, price);
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
	public ArrayList<CyitemshopDTO> selectlist(String type) {
		ArrayList<CyitemshopDTO> list = new ArrayList<CyitemshopDTO>();
		String sql = "SELECT * FROM cyitemshop WHERE TYPE=?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, type);
			rs = ps.executeQuery();
			while(rs.next()) {
				CyitemshopDTO cyitemshop = new CyitemshopDTO();
				cyitemshop.setNum(rs.getInt("NUM"));
				cyitemshop.setItemName(rs.getString("ITEMNAME"));
				cyitemshop.setType(rs.getString("TYPE"));
				cyitemshop.setSaveFileName(rs.getString("SAVEFILENAME"));
				cyitemshop.setOriginalFileName(rs.getString("ORIGINALFILENAME"));
				cyitemshop.setItemPrice(rs.getInt("ITEMPRICE"));
				list.add(cyitemshop);
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
	public CyitemshopDTO selectbuy( int num) {
		
		String sql = "SELECT * FROM cyitemshop WHERE num=?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			if(rs.next()) {
				CyitemshopDTO cyitemshop = new CyitemshopDTO();
				cyitemshop.setNum(rs.getInt("NUM"));
				cyitemshop.setItemName(rs.getString("ITEMNAME"));
				cyitemshop.setType(rs.getString("TYPE"));
				cyitemshop.setSaveFileName(rs.getString("SAVEFILENAME"));
				cyitemshop.setOriginalFileName(rs.getString("ORIGINALFILENAME"));
				cyitemshop.setItemPrice(rs.getInt("ITEMPRICE"));
				return cyitemshop;
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
	public int selectcart(String id,int num) {
		
		String sql = "SELECT * FROM cycart WHERE userid=? and num=?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setInt(2, num);
			rs = ps.executeQuery();
			if(rs.next()) {
				
				return 1;
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
		return 0;
	}
	public void deletecart(String id,int num) {
	String sql = "delete from cycart where userid =? and num=?";
		
		PreparedStatement ps = null;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
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
public boolean selectmyitem(String id,int num) {
		String sql = "SELECT * FROM cymyitem WHERE userid=? and num=?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setInt(2, num);
			rs = ps.executeQuery();
			if(rs.next()) {
				
				return true;
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
		return false;
	}
	public ArrayList<CyCartDTO> cartuser(String id) {
		ArrayList<CyCartDTO> cartlist = new ArrayList<CyCartDTO>();
		String sql = "SELECT * FROM cycart WHERE userid=? ";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			while(rs.next()) {
				CyCartDTO cart = new CyCartDTO();
				cart.setNum(rs.getInt("NUM"));
				cart.setUserId(rs.getString("userid"));
				cart.setItemName(rs.getString("ITEMNAME"));
				cart.setType(rs.getString("TYPE"));
				cart.setSaveFileName(rs.getString("SAVEFILENAME"));
				cart.setOriginalFileName(rs.getString("ORIGINALFILENAME"));
				cart.setItemPrice(rs.getInt("ITEMPRICE"));
				cartlist.add(cart);
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
		return cartlist;
	}
	public CyitemshopDTO selectnum(int num) {
		
		String sql = "SELECT * FROM cyitemshop WHERE num=?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			if(rs.next()) {
				CyitemshopDTO cyitemshop = new CyitemshopDTO();
				cyitemshop.setNum(rs.getInt("NUM"));
				cyitemshop.setItemName(rs.getString("ITEMNAME"));
				cyitemshop.setType(rs.getString("TYPE"));
				cyitemshop.setSaveFileName(rs.getString("SAVEFILENAME"));
				cyitemshop.setOriginalFileName(rs.getString("ORIGINALFILENAME"));
				cyitemshop.setItemPrice(rs.getInt("ITEMPRICE"));
				return cyitemshop;
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
	public ArrayList<CyitemshopDTO> selectall() {
		ArrayList<CyitemshopDTO> list = new ArrayList<CyitemshopDTO>();
		String sql = "SELECT * FROM cyitemshop";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				CyitemshopDTO cyitemshop = new CyitemshopDTO();
				cyitemshop.setNum(rs.getInt("NUM"));
				cyitemshop.setItemName(rs.getString("ITEMNAME"));
				cyitemshop.setType(rs.getString("TYPE"));
				cyitemshop.setSaveFileName(rs.getString("SAVEFILENAME"));
				cyitemshop.setOriginalFileName(rs.getString("ORIGINALFILENAME"));
				cyitemshop.setItemPrice(rs.getInt("ITEMPRICE"));
				list.add(cyitemshop);
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
