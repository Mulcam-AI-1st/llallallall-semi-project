package service;

import java.sql.Connection;
import java.sql.SQLException;

import dao.DataFPMeasureDAO;
import db.jdbcUtil;
import vo.DataFPMeasureListVO;

public class DataFPMeasureService {

	public void registerDataFP(DataFPMeasureListVO dfpl) throws Exception {

		Connection conn = jdbcUtil.getConnection();

		DataFPMeasureDAO dao = new DataFPMeasureDAO();
		String projectName = dfpl.getProjectName();
		DataFPMeasureListVO new_dfpl = null;

		try {
			new_dfpl = dao.selectDataFP(conn, projectName);

			if (new_dfpl != null) {
				System.out.println(new_dfpl.getProjectName());
				throw new Exception("해당 프로젝트 정보가 이미 있습니다.");
			}
			System.out.println("registerDataFP dao.insertDataFP 시작 ");
			dao.insertDataFP(conn, dfpl);
			System.out.println("registerDataFP dao.insertDataFP 종료 ");
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			jdbcUtil.close(conn);

		}
	}

}
