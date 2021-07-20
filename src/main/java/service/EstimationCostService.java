package service;

import java.sql.Connection;

import dao.EstimationCostDAO;
import db.jdbcUtil;
import vo.CorrectionFactorsVO;

public class EstimationCostService {
	
	
	public CorrectionFactorsVO searchEstimationCost(String pname) throws Exception {
		CorrectionFactorsVO cf = null;
		Connection conn = jdbcUtil.getConnection();
		
		EstimationCostDAO dao = new EstimationCostDAO();
		
		try {
			cf = dao.selectEstimationCost(conn, pname);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			jdbcUtil.close(conn);

		}
		
				
		return cf;
		
		
	}
	
	
	
	

}
