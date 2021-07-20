package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.jdbcUtil;
import vo.WeightedFPVO;

public class WeightedFPDAO {
	
	public WeightedFPVO selectTotWeightFactors(Connection conn, String pname) throws Exception {
		WeightedFPVO wfp = new WeightedFPVO();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		//프로젝트명 
		wfp.setProjectName(pname);
		
		//ILF_RETs
		String sql_ilf_rets = " select nvl(max(ILF_RETS_low),0) ILF_RETS_low, nvl(max(ILF_RETS_mid),0) ILF_RETS_mid, nvl(max(ILF_RETS_high),0) ILF_RETS_high from (\n"
						+ "select projectname, null as ILF_RETS_low, null as ILF_RETS_mid, RETS as ILF_RETS_high  from DataFPMeasure where DATA_FP_TYPE='ILF' and RETS_STATUS='high'\n"
						+ "union\n"
						+ "select projectname, null as ILF_RETS_low, RETS as ILF_RETS_mid, null as ILF_RETS_high  from DataFPMeasure where DATA_FP_TYPE='ILF' and RETS_STATUS='mid'\n"
						+ "union\n"
						+ "select projectname, RETS as ILF_RETS_low, null as ILF_RETS_mid, null as ILF_RETS_high  from DataFPMeasure where DATA_FP_TYPE='ILF' and RETS_STATUS='low'\n"
						+ ") where projectname=? ";
						
		try {
			pstmt = conn.prepareStatement(sql_ilf_rets);
			pstmt.setString(1, pname);
			rset = pstmt.executeQuery();
			if(rset != null) {
				if( rset.next()) {
					wfp.setIlf_rets_low(rset.getInt(1));
					wfp.setIlf_rets_mid(rset.getInt(2));
					wfp.setIlf_rets_high(rset.getInt(3));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			jdbcUtil.close(pstmt);
		}
		
		//ILF_dETs
				String sql_ilf_dets = "select nvl(max(ILF_dETS_low),0) ILF_dETS_low, nvl(max(ILF_dETS_mid),0) ILF_dETS_mid, nvl(max(ILF_dETS_high),0) ILF_dETS_high from (\n"
						+"select projectname, null as ILF_dETS_low, null as ILF_dETS_mid, DETS as ILF_dETS_high  from DataFPMeasure where DATA_FP_TYPE='ILF' and RETS_STATUS='high'\n"
						+"union \n"
						+"select projectname, null as ILF_dETS_low, DETS as ILF_dETS_mid, null as ILF_dETS_high  from DataFPMeasure where DATA_FP_TYPE='ILF' and RETS_STATUS='mid' \n"
						+"union \n"
						+"select projectname, DETS as ILF_dETS_low, null as ILF_dETS_mid, null as ILF_dETS_high  from DataFPMeasure where DATA_FP_TYPE='ILF' and RETS_STATUS='low' \n"
						+") where projectname=? ";
								
				try {
					pstmt = conn.prepareStatement(sql_ilf_dets);
					pstmt.setString(1, pname);
					rset = pstmt.executeQuery();
					if(rset != null) {
						if( rset.next()) {
							wfp.setIlf_dets_low(rset.getInt(1));
							wfp.setIlf_dets_mid(rset.getInt(2));
							wfp.setIlf_dets_high(rset.getInt(3));
						}
					}
				} catch (SQLException e) {
					e.printStackTrace();
					throw e;
				} finally {
					jdbcUtil.close(pstmt);
				}
		
		//EIF_rets
		String sql_eif_rets = "select nvl(max(EIF_RETs_low),0) EIF_RETs_low, nvl(max(EIF_RETs_mid),0) EIF_RETs_mid, nvl(max(EIF_RETs_high),0) EIF_RETs_high from (\n"
				+ "select projectname, null as EIF_RETs_low, null as EIF_RETs_mid, RETS as EIF_RETs_high  from DataFPMeasure where DATA_FP_TYPE='EIF' and RETS_STATUS='high'\n"
				+ "union\n"
				+ "select projectname, null as EIF_RETs_low, RETS as EIF_RETs_mid, null as EIF_RETs_high  from DataFPMeasure where DATA_FP_TYPE='EIF' and RETS_STATUS='mid'\n"
				+ "union\n"
				+ "select projectname, RETS as EIF_RETs_low, null as EIF_RETs_mid, null as EIF_RETs_high  from DataFPMeasure where DATA_FP_TYPE='EIF' and RETS_STATUS='low'\n"
				+ ") where projectname=? ";
		try {
			pstmt = conn.prepareStatement(sql_eif_rets);
			pstmt.setString(1, pname);
			rset = pstmt.executeQuery();
			if(rset != null) {
				if( rset.next()) {
					wfp.setEif_rets_low(rset.getInt(1));
					wfp.setEif_rets_mid(rset.getInt(2));
					wfp.setEif_rets_high(rset.getInt(3));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			jdbcUtil.close(pstmt);
		}
		
		
		//EIF_dets
				String sql_eif_dets = "select nvl(max(EIF_DETs_low),0) EIF_DETs_low, nvl(max(EIF_DETs_mid),0) EIF_DETs_mid, nvl(max(EIF_DETs_high),0) EIF_DETs_high from (\n"
						+ "select projectname, null as EIF_DETs_low, null as EIF_DETs_mid, DETS as EIF_DETs_high  from DataFPMeasure where DATA_FP_TYPE='EIF' and RETS_STATUS='high'\n"
						+ "union\n"
						+ "select projectname, null as EIF_DETs_low, DETS as EIF_DETs_mid, null as EIF_DETs_high  from DataFPMeasure where DATA_FP_TYPE='EIF' and RETS_STATUS='mid'\n"
						+ "union\n"
						+ "select projectname, DETS as EIF_DETs_low, null as EIF_DETs_mid, null as EIF_DETs_high  from DataFPMeasure where DATA_FP_TYPE='EIF' and RETS_STATUS='low'\n"
						+ ") where projectname=? " ;
				try {
					pstmt = conn.prepareStatement(sql_eif_dets);
					pstmt.setString(1, pname);
					rset = pstmt.executeQuery();
					if(rset != null) {
						if( rset.next()) {
							wfp.setEif_dets_low(rset.getInt(1));
							wfp.setEif_dets_mid(rset.getInt(2));
							wfp.setEif_dets_high(rset.getInt(3));
						}
					}
				} catch (SQLException e) {
					e.printStackTrace();
					throw e;
				} finally {
					jdbcUtil.close(pstmt);
				}
				
				
		
		//EI_ftrs
		String sql_ei_ftrs = "select nvl(max(EI_FTRS_low),0) EI_FTRS_low, nvl(max(EI_FTRS_mid),0) EI_FTRS_mid, nvl(max(EI_FTRS_high),0) EI_FTRS_high from (\n"
				+ "select projectname, null as EI_FTRS_low, null as EI_FTRS_mid, FTRS as EI_FTRS_high  from TransactionFPMeasure where TRANS_FP_TYPE='EI' and FTRS_STATUS='high'\n"
				+ "union\n"
				+ "select projectname, null as EI_FTRS_low, FTRS as EI_FTRS_mid, null as EI_FTRS_high  from TransactionFPMeasure where TRANS_FP_TYPE='EI' and FTRS_STATUS='mid'\n"
				+ "union\n"
				+ "select projectname, FTRS as EI_FTRS_low, null as EI_FTRS_mid, null as EI_FTRS_high  from TransactionFPMeasure where TRANS_FP_TYPE='EI' and FTRS_STATUS='low'\n"
				+ ") where projectname=? " ;
		try {
			pstmt = conn.prepareStatement(sql_ei_ftrs);
			pstmt.setString(1, pname);
			rset = pstmt.executeQuery();
			if(rset != null) {
				if( rset.next()) {
					wfp.setEi_ftrs_low(rset.getInt(1));
					wfp.setEi_ftrs_mid(rset.getInt(2));
					wfp.setEi_ftrs_high(rset.getInt(3));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			jdbcUtil.close(pstmt);
		}
		
		//EI_dets
				String sql_ei_dets = "select nvl(max(EI_DETs_low),0) EI_DETs_low, nvl(max(EI_DETs_mid),0) EI_DETs_mid, nvl(max(EI_DETs_high),0) EI_DETs_high from (\n"
						+ "select projectname, null as EI_DETs_low, null as EI_DETs_mid, DETS as EI_DETs_high  from TransactionFPMeasure where TRANS_FP_TYPE='EI' and DETS_STATUS='high'\n"
						+ "union\n"
						+ "select projectname, null as EI_DETs_low, DETS as EI_DETs_mid, null as EI_DETs_high  from TransactionFPMeasure where TRANS_FP_TYPE='EI' and DETS_STATUS='mid'\n"
						+ "union\n"
						+ "select projectname, DETS as EI_DETs_low, null as EI_DETs_mid, null as EI_DETs_high  from TransactionFPMeasure where TRANS_FP_TYPE='EI' and DETS_STATUS='low'\n"
						+ ") where projectname=? " ;
				try {
					pstmt = conn.prepareStatement(sql_ei_dets);
					pstmt.setString(1, pname);
					rset = pstmt.executeQuery();
					if(rset != null) {
						if( rset.next()) {
							wfp.setEi_dets_low(rset.getInt(1));
							wfp.setEi_dets_mid(rset.getInt(2));
							wfp.setEi_dets_high(rset.getInt(3));
						}
					}
				} catch (SQLException e) {
					e.printStackTrace();
					throw e;
				} finally {
					jdbcUtil.close(pstmt);
				}
		
		//EO_ftrs
		String sql_eo_ftrs = "select nvl(max(EO_FTRS_low),0) EO_FTRS_low, nvl(max(EO_FTRS_mid),0) EO_FTRS_mid, nvl(max(EO_FTRS_high),0) EO_FTRS_high from (\n"
				+ "select projectname, null as EO_FTRS_low, null as EO_FTRS_mid, FTRS as EO_FTRS_high  from TransactionFPMeasure where TRANS_FP_TYPE='EO' and FTRS_STATUS='high'\n"
				+ "union\n"
				+ "select projectname, null as EO_FTRS_low, FTRS as EO_FTRS_mid, null as EO_FTRS_high  from TransactionFPMeasure where TRANS_FP_TYPE='EO' and FTRS_STATUS='mid'\n"
				+ "union\n"
				+ "select projectname, FTRS as EO_FTRS_low, null as EO_FTRS_mid, null as EO_FTRS_high  from TransactionFPMeasure where TRANS_FP_TYPE='EO' and FTRS_STATUS='low'\n"
				+ ") where projectname=? ";
		try {
			pstmt = conn.prepareStatement(sql_eo_ftrs);
			pstmt.setString(1, pname);
			rset = pstmt.executeQuery();
			if(rset != null) {
				if( rset.next()) {
					wfp.setEo_ftrs_low(rset.getInt(1));
					wfp.setEo_ftrs_mid(rset.getInt(2));
					wfp.setEo_ftrs_high(rset.getInt(3));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			jdbcUtil.close(pstmt);
		}
		
		//EO_dets
				String sql_eo_dets = "select nvl(max(EO_DETs_low),0) EO_DETs_low, nvl(max(EO_DETs_mid),0) EO_DETs_mid, nvl(max(EO_DETs_high),0) EO_DETs_high from (\n"
						+ "select projectname, null as EO_DETs_low, null as EO_DETs_mid, DETS as EO_DETs_high  from TransactionFPMeasure where TRANS_FP_TYPE='EO' and DETS_STATUS='high'\n"
						+ "union\n"
						+ "select projectname, null as EO_DETs_low, DETS as EO_DETs_mid, null as EO_DETs_high  from TransactionFPMeasure where TRANS_FP_TYPE='EO' and DETS_STATUS='mid'\n"
						+ "union\n"
						+ "select projectname, DETS as EO_DETs_low, null as EO_DETs_mid, null as EO_DETs_high  from TransactionFPMeasure where TRANS_FP_TYPE='EO' and DETS_STATUS='low'\n"
						+ ") where projectname=?" ;
				try {
					pstmt = conn.prepareStatement(sql_eo_dets);
					pstmt.setString(1, pname);
					rset = pstmt.executeQuery();
					if(rset != null) {
						if( rset.next()) {
							wfp.setEo_dets_low(rset.getInt(1));
							wfp.setEo_dets_mid(rset.getInt(2));
							wfp.setEo_dets_high(rset.getInt(3));
						}
					}
				} catch (SQLException e) {
					e.printStackTrace();
					throw e;
				} finally {
					jdbcUtil.close(pstmt);
				}
		
		//EQ_ftrs
		String sql_eq_ftrs = "select nvl(max(EQ_FTRS_low),0) EQ_FTRS_low, nvl(max(EQ_FTRS_mid),0) EQ_FTRS_mid, nvl(max(EQ_FTRS_high),0) EQ_FTRS_high from (\n"
				+ "select projectname, null as EQ_FTRS_low, null as EQ_FTRS_mid, FTRS as EQ_FTRS_high  from TransactionFPMeasure where TRANS_FP_TYPE='EQ' and FTRS_STATUS='high'\n"
				+ "union\n"
				+ "select projectname, null as EQ_FTRS_low, FTRS as EQ_FTRS_mid, null as EQ_FTRS_high  from TransactionFPMeasure where TRANS_FP_TYPE='EQ' and FTRS_STATUS='mid'\n"
				+ "union\n"
				+ "select projectname, FTRS as EQ_FTRS_low, null as EQ_FTRS_mid, null as EQ_FTRS_high  from TransactionFPMeasure where TRANS_FP_TYPE='EQ' and FTRS_STATUS='low'\n"
				+ ") where projectname=? " ;
		try {
			pstmt = conn.prepareStatement(sql_eq_ftrs);
			pstmt.setString(1, pname);
			rset = pstmt.executeQuery();
			if(rset != null) {
				if( rset.next()) {
					wfp.setEq_ftrs_low(rset.getInt(1));
					wfp.setEq_ftrs_mid(rset.getInt(2));
					wfp.setEq_ftrs_high(rset.getInt(3));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			jdbcUtil.close(pstmt);
		}
		
		//EQ_defs
				String sql_eq_defs = "select nvl(max(EQ_DETs_low),0) EQ_DETs_low, nvl(max(EQ_DETs_mid),0) EQ_DETs_mid, nvl(max(EQ_DETs_high),0) EQ_DETs_high from (\n"
						+ "select projectname, null as EQ_DETs_low, null as EQ_DETs_mid, DETS as EQ_DETs_high  from TransactionFPMeasure where TRANS_FP_TYPE='EQ' and DETS_STATUS='high'\n"
						+ "union\n"
						+ "select projectname, null as EQ_DETs_low, DETS as EQ_DETs_mid, null as EQ_DETs_high  from TransactionFPMeasure where TRANS_FP_TYPE='EQ' and DETS_STATUS='mid'\n"
						+ "union\n"
						+ "select projectname, DETS as EQ_DETs_low, null as EQ_DETs_mid, null as EQ_DETs_high  from TransactionFPMeasure where TRANS_FP_TYPE='EQ' and DETS_STATUS='low'\n"
						+ ") where projectname=? ";
				try {
					pstmt = conn.prepareStatement(sql_eq_defs);
					pstmt.setString(1, pname);
					rset = pstmt.executeQuery();
					if(rset != null) {
						if( rset.next()) {
							wfp.setEq_dets_low(rset.getInt(1));
							wfp.setEq_dets_mid(rset.getInt(2));
							wfp.setEq_dets_high(rset.getInt(3));
						}
					}
				} catch (SQLException e) {
					e.printStackTrace();
					throw e;
				} finally {
					jdbcUtil.close(pstmt);
				}
				
				
				//Data FP TOT
				String sql_data_tot = "select max(ILF_TOT) as ILF_TOT, max(EIF_TOT) as EIF_TOT from \n"
						+ "(\n"
						+ "select PROJECTNAME, sum(COMPLEXITY)  as ILF_TOT , null as EIF_TOT from  DataFPMeasure where projectname=? and DATA_FP_TYPE='ILF' group by PROJECTNAME	\n"
						+ "union all\n"
						+ "select PROJECTNAME, null  as ILF_TOT , sum(COMPLEXITY) as EIF_TOT from  DataFPMeasure where projectname=? and DATA_FP_TYPE='EIF' group by PROJECTNAME	\n"
						+ ")";
				try {
					pstmt = conn.prepareStatement(sql_data_tot);
					pstmt.setString(1, pname);
					pstmt.setString(2, pname);
					rset = pstmt.executeQuery();
					if(rset != null) {
						if( rset.next()) {
							wfp.setIlf_tot(rset.getInt(1));
							wfp.setEif_tot(rset.getInt(2));
						}
					}
					
					System.out.println("Data FP TOT "+wfp.getIlf_tot());
					System.out.println("Data FP TOT "+wfp.getEif_tot());
					
				} catch (SQLException e) {
					e.printStackTrace();
					throw e;
				} finally {
					jdbcUtil.close(pstmt);
				}
				
				
				//Transaction FP TOT
				String sql_trans_tot = "select max(EI_TOT) as EI_TOT , max(EO_TOT) as EO_TOT, max(EQ_TOT) as EQ_TOT\n"
						+ "from (\n"
						+ "select PROJECTNAME, sum(COMPLEXITY) as EI_TOT, null as EO_TOT , null as EQ_TOT from TransactionFPMeasure where projectname=? and TRANS_FP_TYPE='EI' group by PROJECTNAME\n"
						+ "union \n"
						+ "select PROJECTNAME, null as EI_TOT, sum(COMPLEXITY) as EO_TOT , null as EQ_TOT from TransactionFPMeasure where projectname=? and TRANS_FP_TYPE='EO' group by PROJECTNAME\n"
						+ "union\n"
						+ "select PROJECTNAME, null as EI_TOT, null as EO_TOT , sum(COMPLEXITY) as EQ_TOT from TransactionFPMeasure where projectname=? and TRANS_FP_TYPE='EQ' group by PROJECTNAME\n"
						+ ")";
				try {
					pstmt = conn.prepareStatement(sql_trans_tot);
					pstmt.setString(1, pname);
					pstmt.setString(2, pname);
					pstmt.setString(3, pname);
					rset = pstmt.executeQuery();
					if(rset != null) {
						if( rset.next()) {
							wfp.setEi_tot(rset.getInt(1));
							wfp.setEo_tot(rset.getInt(2));
							wfp.setEq_tot(rset.getInt(3));
						}
					}
				} catch (SQLException e) {
					e.printStackTrace();
					throw e;
				} finally {
					jdbcUtil.close(pstmt);
				}	
		
			
		
		return wfp;
	}

	public WeightedFPVO selectWeightedFPResult(Connection conn, String pname) throws Exception {
		WeightedFPVO wfp = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "select projectname from WeightedFPResult where projectname = ? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pname);
			rset = pstmt.executeQuery();
			
			if (rset != null) {
				if (rset.next()) {
					wfp = new WeightedFPVO();
					wfp.setProjectName(pname);
				}
					
			}

		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			jdbcUtil.commit(conn);
			jdbcUtil.close(pstmt);
		}
		return wfp;
	}
	
	
	public void insertWeightedFPResult(Connection conn, WeightedFPVO wfp) throws Exception {
		
		PreparedStatement pstmt = null;
		String sql = "insert into WeightedFPResult  values (?, ?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, wfp.getProjectName());
			pstmt.setInt(2, wfp.getIlf_tot());
			pstmt.setInt(3, wfp.getEif_tot());
			pstmt.setInt(4, wfp.getEi_tot());
			pstmt.setInt(5, wfp.getEo_tot());
			pstmt.setInt(6, wfp.getEq_tot());
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
