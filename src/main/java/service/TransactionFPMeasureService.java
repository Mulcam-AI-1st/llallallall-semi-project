package service;

import java.sql.Connection;
import java.sql.SQLException;

import dao.TransactionFPMeasureDAO;
import db.jdbcUtil;
import vo.TransactionFPMeasureListVO;

public class TransactionFPMeasureService {
	
	
	public void registerTransactionFP(TransactionFPMeasureListVO tfpl) throws Exception {

		Connection conn = jdbcUtil.getConnection();

		TransactionFPMeasureDAO dao = new TransactionFPMeasureDAO();
		String projectName = tfpl.getProjectName();
		TransactionFPMeasureListVO new_tfpl = null;

		try {
			new_tfpl = dao.selectTransactionFP(conn, projectName);

			if (new_tfpl != null) {
				System.out.println(new_tfpl.getProjectName());
				throw new Exception("해당 프로젝트 정보가 이미 있습니다.");
			}
			
			dao.insertTransactionFP(conn, tfpl);
			
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			jdbcUtil.close(conn);

		}
	}
	
	

}
