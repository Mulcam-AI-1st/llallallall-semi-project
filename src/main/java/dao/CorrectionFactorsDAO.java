package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.jdbcUtil;
import vo.CorrectionFactorsVO;

public class CorrectionFactorsDAO {
	
	public CorrectionFactorsVO selectCorrectionFactors(Connection conn, String pname) {
		CorrectionFactorsVO cf = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "select * from CorrectionFactors where projectname = ?";
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pname);
			rset = pstmt.executeQuery();
			
			if (rset != null) {
				if (rset.next()) {
					cf = new CorrectionFactorsVO();
					cf.setProjectName(rset.getString(1));
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			jdbcUtil.close(pstmt);
			jdbcUtil.close(rset);
		}
		
		
		return cf;
	}
	
	
	
	public void insertCorrectionFactors(Connection conn, CorrectionFactorsVO cf) {
		
		PreparedStatement pstmt = null;
		String sql = "insert into CorrectionFactors values(?,?,?,?,?,?,?,?,?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, cf.getProjectName());
			
			pstmt.setInt(2, cf.getFp_tot());
			pstmt.setInt(3, cf.getFp_unitcost());
			pstmt.setInt(4, cf.getFp_cost_before_correction());
					
			pstmt.setDouble(5, cf.getScalCorrectionFactor());
			pstmt.setDouble(6, cf.getLinkageComplexity());
			pstmt.setDouble(7, cf.getPerformance());
			pstmt.setDouble(8, cf.getOperarionalCompatibility());
			pstmt.setDouble(9, cf.getSecurity());
			
			pstmt.setInt(10, cf.getFp_cost_after_correction());
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			jdbcUtil.commit(conn);
			jdbcUtil.close(pstmt);
			
		}
		
	}

}
