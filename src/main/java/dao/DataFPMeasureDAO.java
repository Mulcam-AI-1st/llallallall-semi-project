package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.jdbcUtil;
import vo.DataFPMeasureListVO;

public class DataFPMeasureDAO {

	public DataFPMeasureListVO selectDataFP(Connection conn, String pname) throws Exception {
		DataFPMeasureListVO dfpl = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "select projectname from DataFPMeasure where projectname = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pname);
			rset = pstmt.executeQuery();

			if (rset != null) {

				if (rset.next()) {
					dfpl = new DataFPMeasureListVO();
					dfpl.setProjectName(pname);
					dfpl.setData_fp_list(null);

				}

			}

		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			jdbcUtil.close(pstmt);
			jdbcUtil.close(rset);
		}

		return dfpl;
	}

	
	
	public void insertDataFP(Connection conn, DataFPMeasureListVO dfpl) throws Exception {
		
		PreparedStatement pstmt = null;
		System.out.println("insertDataFP");
		String sql="insert into DataFPMeasure (projectname, data_fp_num, uni_pro, data_fp_type, rets, rets_status, dets, dets_status, complexity)  values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			System.out.println("insertDataFP try start");
				for (int i=0; i < dfpl.getData_fp_list().size() ; i++) {
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, dfpl.getProjectName());
					pstmt.setInt(2, dfpl.getData_fp_list().get(i).getData_fp_num());
					pstmt.setInt(3,  dfpl.getData_fp_list().get(i).getUni_pro_num());
					pstmt.setString(4, dfpl.getData_fp_list().get(i).getData_fp_type());
					pstmt.setDouble(5, dfpl.getData_fp_list().get(i).getRets());
					pstmt.setString(6, dfpl.getData_fp_list().get(i).getRets_status());
					pstmt.setDouble(7, dfpl.getData_fp_list().get(i).getDets());
					pstmt.setString(8, dfpl.getData_fp_list().get(i).getDets_status());
					pstmt.setDouble(9, dfpl.getData_fp_list().get(i).getComplexity());
					pstmt.executeUpdate();
				}	
				
		} catch (SQLException e) {
			System.out.println("insertDataFP try error ");
			e.printStackTrace();
			throw e;
		} finally {
			System.out.println("insertDataFP try end ");
			jdbcUtil.commit(conn);
			jdbcUtil.close(pstmt);
		}

	}
}
