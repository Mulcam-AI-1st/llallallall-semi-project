package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import db.jdbcUtil;
import vo.SystemChatacteristicsVO;

public class SystemChatacteristicsDAO {
	
	
	public SystemChatacteristicsVO selectSystemChatacteristics(Connection conn, String pname) {
		SystemChatacteristicsVO sc = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "select * from SystemChatacteristics where ProjectName = ? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pname);
			rset = pstmt.executeQuery();
			
			if ( rset != null ) {
				if(rset.next()) {
					sc = new SystemChatacteristicsVO();
					sc.setProjectName(rset.getString(1));
					sc.setLinkageComplexity(rset.getDouble(2));
					sc.setPerformance(rset.getDouble(3));
					sc.setOperationalCompatibility(rset.getDouble(5));
					sc.setSecurity(rset.getDouble(5));
					
				}
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			jdbcUtil.close(rset);
			jdbcUtil.close(pstmt);
		}
		
		
		return sc;
		
	}
	
	
	public void insertSystemChatacteristics(Connection conn, SystemChatacteristicsVO sc) {
		PreparedStatement pstmt = null;
		String sql = "insert into SystemChatacteristics values(?,?,?,?,?)";
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sc.getProjectName());
			pstmt.setDouble(2, sc.getLinkageComplexity());
			pstmt.setDouble(3, sc.getPerformance());
			pstmt.setDouble(4,  sc.getOperationalCompatibility());
			pstmt.setDouble(5, sc.getSecurity());
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			jdbcUtil.close(pstmt);
			
		}
		
		
	}

}
