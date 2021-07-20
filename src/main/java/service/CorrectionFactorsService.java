package service;

import java.sql.Connection;

import dao.CorrectionFactorsDAO;
import db.jdbcUtil;
import vo.CorrectionFactorsVO;

public class CorrectionFactorsService {

	
	public void registerCorrectionFactors(CorrectionFactorsVO cf) throws Exception {
		
		Connection conn = jdbcUtil.getConnection();
		CorrectionFactorsDAO dao = new CorrectionFactorsDAO();
		String pname = cf.getProjectName();
		CorrectionFactorsVO new_cf = null;

		try {

			new_cf = dao.selectCorrectionFactors(conn, pname);

			if (new_cf != null) {
				System.out.println(pname);
				throw new Exception("해당 프로젝트 정보가 이미 있습니다.");
			}

			dao.insertCorrectionFactors(conn, cf);

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			jdbcUtil.close(conn);
		}
		
		
		
		
	}
}
