package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import db.jdbcUtil;
import vo.ImprovementOpinionVO;

public class ImprovementOpinionDAO {
	
	public void insertOpinion(Connection conn, ImprovementOpinionVO io) throws Exception {
		
		PreparedStatement pstmt = null;
		String sql = "insert into ImprovementOpinion values(?, ?) ";
		System.out.println("ImprovementOpinionDAO" + io.getName());
		System.out.println("ImprovementOpinionDAO" + io.getOpinion());
		try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, io.getName());
		pstmt.setString(2, io.getOpinion());
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
