package service;

import java.sql.Connection;
import java.sql.SQLException;

import dao.BoundariesDefinitionDAO;
import db.jdbcUtil;
import vo.BoundariesDefinitionListVO;

public class BoundariesDefinitionService {
	
	public void registerBoundaries(BoundariesDefinitionListVO bdl) throws Exception {
		
		Connection conn = jdbcUtil.getConnection();
		BoundariesDefinitionDAO dao = new BoundariesDefinitionDAO();
		BoundariesDefinitionListVO new_bdl = null;
		
		try {
			new_bdl = dao.selectBoundariesDefinition(conn, bdl.getProjactName());
			
			if(new_bdl != null) {
				System.out.println(new_bdl.getProjactName());
				throw new Exception("해당 프로젝트 정보가 이미 있습니다.");
				
			}
			
			dao.insertBoundariesDefinition(conn, bdl);
			
			
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			jdbcUtil.close(conn);
		}
		
		
		
		
		
	}
	

}
