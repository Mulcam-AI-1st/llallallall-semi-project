package service;

import java.sql.Connection;

import dao.ProjectFPDAO;
import db.jdbcUtil;
import vo.ProjectInfoVO;


public class ProjectFPService {
	
		
	public ProjectInfoVO registerProjectInfo(ProjectInfoVO pi) throws Exception {
			
			Connection conn = jdbcUtil.getConnection();
			ProjectFPDAO dao = new ProjectFPDAO();
			ProjectInfoVO new_pi = null;
			ProjectInfoVO rst_pi = null;
			
			try {
				new_pi = dao.selectProjectInfo(conn, pi.getProjectName());
				
				if (new_pi != null) {
					System.out.println(new_pi.getProjectName());
					throw new Exception("프로젝트 중복 오류");
				}

				rst_pi = dao.insertProjectInfo(conn, pi);

			} catch (Exception e) {
				e.printStackTrace();
				throw e;
			} finally {
				jdbcUtil.commit(conn);
				jdbcUtil.close(conn);

			}
			
			return rst_pi;
			
	}		
}
