package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.jdbcUtil;
import vo.BoundariesDefinitionListVO;

public class BoundariesDefinitionDAO {

	public BoundariesDefinitionListVO selectBoundariesDefinition(Connection conn, String pname) throws Exception {
		BoundariesDefinitionListVO bdl = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "select projectname from BoundariesDefinition where projectname=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pname);
			rset = pstmt.executeQuery();

			if (rset != null) {

				if (rset.next()) {
					bdl = new BoundariesDefinitionListVO();
					bdl.setProjactName(rset.getString(1));
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			jdbcUtil.close(rset);
			jdbcUtil.close(pstmt);
		}

		return bdl;

	}

	public void insertBoundariesDefinition(Connection conn, BoundariesDefinitionListVO bdl) throws Exception {
		
		
		PreparedStatement pstmt = null;
		String sql = " insert into BoundariesDefinition values (?,?,?)";
		
		for (int i=0; i < bdl.getBoundariesDefList().size(); i++) {
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, bdl.getProjactName());
				pstmt.setInt(2, bdl.getBoundariesDefList().get(i).getReq_def_num());
				pstmt.setInt(3, bdl.getBoundariesDefList().get(i).getUni_pro_num());
				pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
				throw e;
			} finally {
				jdbcUtil.commit(conn);
				jdbcUtil.close(pstmt);
			}
		}
	}

}
