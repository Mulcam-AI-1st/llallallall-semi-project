package vo;

import java.util.ArrayList;

public class UnitProcessDefinitionListVO {

	private String projectName;
	
	private ArrayList<UnitProcessDefinitionVO> uni_pro_def_list = new ArrayList<UnitProcessDefinitionVO> ();
	
	public UnitProcessDefinitionListVO() { }
	

	public UnitProcessDefinitionListVO(String projectName, ArrayList<UnitProcessDefinitionVO> uni_pro_def_list) {
		super();
		this.projectName = projectName;
		this.uni_pro_def_list = uni_pro_def_list;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public ArrayList<UnitProcessDefinitionVO> getUni_pro_def_list() {
		return uni_pro_def_list;
	}

	public void setUni_pro_def_list(ArrayList<UnitProcessDefinitionVO> uni_pro_def_list) {
		this.uni_pro_def_list = uni_pro_def_list;
	};
	
		
	
	
}
