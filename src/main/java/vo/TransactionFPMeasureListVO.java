package vo;

import java.util.ArrayList;

public class TransactionFPMeasureListVO {

	private String projectName;
	
	private ArrayList<TransactionFPMeasureVO> trans_fp_list = new ArrayList<TransactionFPMeasureVO>();

	public TransactionFPMeasureListVO() {};
	
	public TransactionFPMeasureListVO(String projectName, ArrayList<TransactionFPMeasureVO> trans_fp_list) {
		super();
		this.projectName = projectName;
		this.trans_fp_list = trans_fp_list;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public ArrayList<TransactionFPMeasureVO> getTrans_fp_list() {
		return trans_fp_list;
	}

	public void setTrans_fp_list(ArrayList<TransactionFPMeasureVO> trans_fp_list) {
		this.trans_fp_list = trans_fp_list;
	}
	
	
	
	
}
