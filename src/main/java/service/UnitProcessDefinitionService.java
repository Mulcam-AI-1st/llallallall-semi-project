package service;

import java.sql.Connection;

import dao.UnitProcessDefinitionDAO;
import db.jdbcUtil;
import vo.UnitProcessDefinitionListVO;

public class UnitProcessDefinitionService {

	public void registerUnitProcess(UnitProcessDefinitionListVO upl) throws Exception {

		Connection conn = jdbcUtil.getConnection();
		UnitProcessDefinitionDAO dao = new UnitProcessDefinitionDAO();
		UnitProcessDefinitionListVO new_upd = null;

		try {
			new_upd = dao.selectUnitProcessDefinition(conn, upl.getProjectName());

			if (new_upd != null) {
				System.out.println(new_upd.getProjectName());
				throw new Exception("해당 프로젝트 정보가 이미 있습니다.");
			}

			dao.insertUnitProcessDefinition(conn, upl);

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			jdbcUtil.close(conn);

		}

	}
	
	//BoundariesServlet 에서 사용 
	public UnitProcessDefinitionListVO searchUnitProcess(String pname) throws Exception {

		Connection conn = jdbcUtil.getConnection();
		UnitProcessDefinitionDAO dao = new UnitProcessDefinitionDAO();
		UnitProcessDefinitionListVO ulist = null;

		try {
			ulist = dao.selectUnitAllProcessDefinition(conn, pname);

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			jdbcUtil.commit(conn);
			jdbcUtil.close(conn);

		}
		return ulist;
	}

}
