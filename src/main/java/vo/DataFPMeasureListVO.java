package vo;

import java.util.ArrayList;

public class DataFPMeasureListVO {
	
	private String projectName;
	private ArrayList<DataFPMeasureVO> data_fp_list =  new ArrayList<DataFPMeasureVO>();
	
	public DataFPMeasureListVO() {};
	
	public DataFPMeasureListVO(String projectName, ArrayList<DataFPMeasureVO> data_fp_list) {
		super();
		this.projectName = projectName;
		this.data_fp_list = data_fp_list;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public ArrayList<DataFPMeasureVO> getData_fp_list() {
		return data_fp_list;
	}

	public void setData_fp_list(ArrayList<DataFPMeasureVO> data_fp_list) {
		this.data_fp_list = data_fp_list;
	}
	
	
	
	

}
