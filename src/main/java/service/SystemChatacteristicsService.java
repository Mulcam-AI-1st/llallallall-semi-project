package service;

import java.sql.Connection;

import dao.SystemChatacteristicsDAO;
import db.jdbcUtil;
import vo.SystemChatacteristicsVO;

public class SystemChatacteristicsService {
	
	public void registerSystemChatacteristics(SystemChatacteristicsVO sc) throws Exception {
		
		Connection conn = jdbcUtil.getConnection();
		SystemChatacteristicsDAO dao = new SystemChatacteristicsDAO();
		SystemChatacteristicsVO new_sc = null;
		
		try {
			new_sc = dao.selectSystemChatacteristics(conn, sc.getProjectName());
			
			if (new_sc != null) {
				System.out.println(new_sc.getProjectName());
				throw new Exception("해당 프로젝트 정보가 이미 있습니다.");
			}

			dao.insertSystemChatacteristics(conn, sc);

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			jdbcUtil.commit(conn);
			jdbcUtil.close(conn);

		}
		
	}
	
	// CorrectionController 에서 사용 
	public SystemChatacteristicsVO searchSystemChatacteristics(String projectName) throws Exception {
		
		Connection conn = jdbcUtil.getConnection();
		SystemChatacteristicsDAO dao = new SystemChatacteristicsDAO();
		SystemChatacteristicsVO sc = null;
		
		try {
			sc = dao.selectSystemChatacteristics(conn, projectName);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			jdbcUtil.commit(conn);
			jdbcUtil.close(conn);

		}
		return sc;
		
	}
	

}
