package service;

import java.sql.Connection;

import dao.RequirementDefinitionDAO;
import db.jdbcUtil;
import vo.RequirementDefinitionListVO;


public class RequirementDefinitionService {
	
	
	public void registerRequirement(RequirementDefinitionListVO rdl) throws Exception {
		
		Connection conn = jdbcUtil.getConnection();
		RequirementDefinitionDAO dao = new RequirementDefinitionDAO();
		RequirementDefinitionListVO new_rdl = null;
		
		try {
			new_rdl = dao.selectRequirementDefinition(conn, rdl.getProjectName());
			
			if (new_rdl != null) {
				System.out.println(new_rdl.getProjectName());
				throw new Exception("해당 프로젝트 정보가 이미 있습니다.");
			}

			dao.insertRequirementDefinition(conn, rdl);

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			jdbcUtil.close(conn);

		}
		
	}	
	
	//BoundariesServlet 에서 사용 
	public RequirementDefinitionListVO searchRequirement(String pname) throws Exception {
		
		Connection conn = jdbcUtil.getConnection();
		RequirementDefinitionDAO dao = new RequirementDefinitionDAO();
		RequirementDefinitionListVO rlist = null;
		
		try {
			rlist = dao.selectAllRequirementDefinition(conn, pname);
				
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			jdbcUtil.close(conn);

		}
		return rlist;
	}	

}
