package service;

import java.sql.Connection;

import dao.WeightedFPDAO;
import db.jdbcUtil;
import vo.WeightedFPVO;

public class WeightedFPService {

	public WeightedFPVO searchWeightedFP(String pname) throws Exception {

		Connection conn = jdbcUtil.getConnection();

		WeightedFPDAO dao = new WeightedFPDAO();

		WeightedFPVO wfp = new WeightedFPVO();

		try {
			wfp = dao.selectTotWeightFactors(conn, pname);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			jdbcUtil.close(conn);
		}

		return wfp;

	}

	public void registerWeightedFP(WeightedFPVO wfp) throws Exception {

		Connection conn = jdbcUtil.getConnection();
		WeightedFPDAO dao = new WeightedFPDAO();
		String pname = wfp.getProjectName();
		WeightedFPVO new_wfp = null;

		try {

			new_wfp = dao.selectWeightedFPResult(conn, pname);

			if (new_wfp != null) {
				System.out.println(pname);
				throw new Exception("해당 프로젝트 정보가 이미 있습니다.");
			}

			dao.insertWeightedFPResult(conn, wfp);

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			jdbcUtil.close(conn);
		}

	}

}
