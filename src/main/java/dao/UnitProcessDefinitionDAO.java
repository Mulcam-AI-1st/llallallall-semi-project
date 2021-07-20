package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.jdbcUtil;
import vo.UnitProcessDefinitionListVO;
import vo.UnitProcessDefinitionVO;

public class UnitProcessDefinitionDAO {

	public UnitProcessDefinitionListVO selectUnitProcessDefinition(Connection conn, String pname) {
		UnitProcessDefinitionListVO upl = null;

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "select * from UnitProcessDefinition where ProjectName = ? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pname);
			rset = pstmt.executeQuery();

			// 프로젝트 이름만 필요하니 Uni_pro_def_list 리스트는 null로 보낸다.
			if (rset != null) {
				if (rset.next()) {
					upl = new UnitProcessDefinitionListVO();
					upl.setProjectName(rset.getString(1));
					upl.setUni_pro_def_list(null);
				}

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			jdbcUtil.close(rset);
			jdbcUtil.close(pstmt);
		}

		return upl;
	}

	public void insertUnitProcessDefinition(Connection conn, UnitProcessDefinitionListVO upl) {

		PreparedStatement pstmt = null;
		String sql = "insert into UnitProcessDefinition values(?,?,?,?)";

		// 요구사항 개수만큼 반복문 실행
		for (int i = 0; i < upl.getUni_pro_def_list().size(); i++) {

			try {

				pstmt = conn.prepareStatement(sql);
				// 프로젝트 명칭, key값으로 사용
				pstmt.setString(1, upl.getProjectName());
				// 단위업무 순번 넣기
				pstmt.setInt(2, upl.getUni_pro_def_list().get(i).getUni_pro_num());
				// 단위업무 가져오기 .get()
				pstmt.setString(3, upl.getUni_pro_def_list().get(i).getUni_pro());
				// 단위업무 상세 가져오기 .get()
				pstmt.setString(4, upl.getUni_pro_def_list().get(i).getUni_pro_desc());
				pstmt.executeUpdate();

			} catch (SQLException e) {
				e.printStackTrace();

			} finally {
				jdbcUtil.commit(conn);
				jdbcUtil.close(pstmt);

			}

		}

	}

	// BoundariesServlet 에서 사용

	public UnitProcessDefinitionListVO selectUnitAllProcessDefinition(Connection conn, String pname) {
		UnitProcessDefinitionListVO upl = new UnitProcessDefinitionListVO();
		UnitProcessDefinitionVO upd = null;
		PreparedStatement pstmt = null;

		ResultSet rset = null;
		String sql = "select UNITPROCESSNUM, UNITPROCESS from UnitProcessDefinition where ProjectName = ? order by UNITPROCESSNUM";
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, pname);
			rset = pstmt.executeQuery();

			upl = new UnitProcessDefinitionListVO();

			
			while (rset.next()) {
				upd = new UnitProcessDefinitionVO(rset.getInt(1), rset.getString(2));
				upl.setProjectName(pname);
				upl.getUni_pro_def_list().add(upd);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			jdbcUtil.close(rset);
			jdbcUtil.close(pstmt);
		}

		return upl;
	}

}
