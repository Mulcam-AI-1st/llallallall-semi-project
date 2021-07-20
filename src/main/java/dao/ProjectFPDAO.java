package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.jdbcUtil;
import vo.ProjectInfoVO;

public class ProjectFPDAO {
	
	public ProjectInfoVO selectProjectInfo(Connection conn, String pname) {
		ProjectInfoVO pi = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "select * from projectInfo where projectname = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pname);
			rset = pstmt.executeQuery();
			
			if (rset != null) {
				if (rset.next()) {
					pi = new ProjectInfoVO();
					
					pi.setProjectName(rset.getString(1));
					pi.setProjectDesc(rset.getString(2));
					pi.setCodingLanguage(rset.getString(3));
					pi.setSystemType(rset.getString(4));
					
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			jdbcUtil.close(pstmt);
			jdbcUtil.close(rset);
		}
		
		return pi;
		
	}
	
	
	public ProjectInfoVO insertProjectInfo(Connection conn, ProjectInfoVO pi) {
		PreparedStatement pstmt = null;
		String sql = "insert into projectInfo values(?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pi.getProjectName());
			pstmt.setString(2, pi.getProjectDesc());
			pstmt.setString(3, pi.getCodingLanguage());
			pstmt.setString(4, pi.getSystemType());
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			jdbcUtil.close(pstmt);
			
		}
		//처음이므로 pi 값을 반환해 준다.
		return pi;
		
		
	}

}
