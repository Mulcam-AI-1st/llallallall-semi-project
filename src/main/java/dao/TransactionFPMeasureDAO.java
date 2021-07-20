package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.jdbcUtil;
import vo.TransactionFPMeasureListVO;

public class TransactionFPMeasureDAO {
	
	
	public TransactionFPMeasureListVO selectTransactionFP(Connection conn, String pname) throws Exception {
		TransactionFPMeasureListVO tfpl = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "select projectname from TransactionFPMeasure where projectname = ?";
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pname);
			rset = pstmt.executeQuery();

			if (rset != null) {

				if (rset.next()) {
					tfpl = new TransactionFPMeasureListVO();
					tfpl.setProjectName(pname);
					tfpl.setTrans_fp_list(null);

				}

			}

		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			jdbcUtil.close(pstmt);
			jdbcUtil.close(rset);
		}
		
		return tfpl;
	}
	
	public void insertTransactionFP(Connection conn, TransactionFPMeasureListVO tfpl)  throws Exception {
		
		
		PreparedStatement pstmt = null;
		System.out.println("insertTransactionFP");
		String sql="insert into TransactionFPMeasure (projectname, trans_fp_num, uni_pro, trans_fp_type, FTRs, FTRs_status, dets, dets_status, complexity)  values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			System.out.println("insertTransactionFP try start");
				for (int i=0; i < tfpl.getTrans_fp_list().size() ; i++) {
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, tfpl.getProjectName());
					pstmt.setInt(2, tfpl.getTrans_fp_list().get(i).getTrans_fp_num() );
					pstmt.setInt(3,  tfpl.getTrans_fp_list().get(i).getUni_pro_num());
					pstmt.setString(4, tfpl.getTrans_fp_list().get(i).getTrans_fp_type());
					pstmt.setDouble(5, tfpl.getTrans_fp_list().get(i).getFtrs());
					pstmt.setString(6, tfpl.getTrans_fp_list().get(i).getFtrs_status());
					pstmt.setDouble(7, tfpl.getTrans_fp_list().get(i).getDets());
					pstmt.setString(8, tfpl.getTrans_fp_list().get(i).getDets_status());
					pstmt.setDouble(9, tfpl.getTrans_fp_list().get(i).getComplexity());
					pstmt.executeUpdate();
				}	
				
		} catch (SQLException e) {
			System.out.println("insertTransactionFP try error ");
			e.printStackTrace();
			throw e;
		} finally {
			System.out.println("insertTransactionFP try end ");
			jdbcUtil.commit(conn);
			jdbcUtil.close(pstmt);
		}
		
		
		
	}

	
	
	
}
