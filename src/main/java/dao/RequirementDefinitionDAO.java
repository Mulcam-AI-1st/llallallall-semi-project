package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.jdbcUtil;
import vo.RequirementDefinitionListVO;
import vo.RequirementDefinitionVO;

public class RequirementDefinitionDAO {

	public RequirementDefinitionListVO selectRequirementDefinition(Connection conn, String pname) {
		RequirementDefinitionListVO rdl = null;
		System.out.println("selectRequirementDefinition");
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "select * from RequirementDefinition where ProjectName = ? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pname);
			rset = pstmt.executeQuery();
			// 프로젝트 이름만 필요하니 리스트는 null로 보낸다.
			if (rset != null) {
				if (rset.next()) {
					rdl = new RequirementDefinitionListVO();
					rdl.setProjectName(rset.getString(1));
				}

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			jdbcUtil.close(rset);
			jdbcUtil.close(pstmt);
		}

		return rdl;

	}

	public void insertRequirementDefinition(Connection conn, RequirementDefinitionListVO rdl) {
//		System.out.println("insertRequirementDefinition");
		PreparedStatement pstmt = null;
		String sql = "insert into RequirementDefinition values(?,?,?,?)";
//		System.out.println("RequirementDefinitionListVO" + rdl);
		// 요구사항 개수만큼 반복문 실행
//		System.out.println("rdl.getReq_def_list().size()" + rdl.getReq_def_list().size());
		for (int i = 0; i < rdl.getReq_def_list().size(); i++) {

			try {

				pstmt = conn.prepareStatement(sql);
				// 프로젝트 명칭, key값으로 사용
				pstmt.setString(1, rdl.getProjectName());
				// 요구사항 순번 넣기
//				System.out.println("insertRequirementDefinition 프로젝트 명칭" + rdl.getProjectName());
				pstmt.setInt(2, rdl.getReq_def_list().get(i).getReq_def_num());
//				System.out.println("insertRequirementDefinition 요구사항 순번 " + rdl.getReq_def_list().get(i).getReq_def_num());
				// 요구사항 가져오기 .get()
				pstmt.setString(3, rdl.getReq_def_list().get(i).getReq_def());
//				System.out.println("insertRequirementDefinition 요구사항 "+ rdl.getReq_def_list().get(i).getReq_def());
				// 요구사항 상세 가져오기 .get()
				pstmt.setString(4, rdl.getReq_def_list().get(i).getReq_def_desc());
//				System.out.println("insertRequirementDefinition 요구사항 상세 " + rdl.getReq_def_list().get(i).getReq_def_desc());
				pstmt.executeUpdate();

			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println("insertRequirementDefinition 에러");
			} finally {
				jdbcUtil.commit(conn);
				jdbcUtil.close(pstmt);
				System.out.println("insertRequirementDefinition 종료 ");
			}

		}

	}

	// BoundariesServlet 에서 사용

	public RequirementDefinitionListVO selectAllRequirementDefinition(Connection conn, String pname) {
		RequirementDefinitionListVO rdl = null;
		RequirementDefinitionVO rd = null;
		System.out.println("selectAllRequirementDefinition");
		PreparedStatement pstmt = null;

		ResultSet rset = null;
		System.out.println("projectname " + pname);
		String sql = "select REQUIREMENTNUM, REQUIREMENT  from RequirementDefinition where ProjectName = ? order by REQUIREMENTNUM";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pname);
			rset = pstmt.executeQuery();

			rdl = new RequirementDefinitionListVO();
			rdl.setProjectName(pname);
			
			while (rset.next()) {
				rd = new RequirementDefinitionVO(rset.getInt(1), rset.getString(2));
				rdl.getReq_def_list().add(rd);
			}


		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			jdbcUtil.close(rset);
			jdbcUtil.close(pstmt);
		}

		return rdl;

	}

}
