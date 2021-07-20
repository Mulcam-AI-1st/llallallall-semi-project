package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.jdbcUtil;
import vo.CorrectionFactorsVO;

public class EstimationCostDAO {
	
	
	public CorrectionFactorsVO selectEstimationCost(Connection conn, String pname) {
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
					cf.setFp_tot(rset.getInt(2));
					cf.setFp_unitcost(rset.getInt(3));
					cf.setFp_cost_before_correction(rset.getInt(4));
					cf.setScalCorrectionFactor(rset.getDouble(5));
					cf.setLinkageComplexity(rset.getDouble(6));
					cf.setPerformance(rset.getDouble(7));
					cf.setOperarionalCompatibility(rset.getDouble(8));
					cf.setSecurity(rset.getDouble(9));
					cf.setFp_cost_after_correction(rset.getInt(10));
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
}