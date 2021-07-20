package service;

import java.sql.Connection;
import java.sql.SQLException;

import dao.ImprovementOpinionDAO;
import db.jdbcUtil;
import vo.ImprovementOpinionVO;

public class ImprovementOpinionService {

	
	public void registerOpinion(ImprovementOpinionVO io) throws Exception {
		Connection conn = jdbcUtil.getConnection();
		ImprovementOpinionDAO dao = new ImprovementOpinionDAO();
		
		try {
			dao.insertOpinion(conn, io);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
			
		} finally {
			jdbcUtil.close(conn);
		}
		
		
	}
}
