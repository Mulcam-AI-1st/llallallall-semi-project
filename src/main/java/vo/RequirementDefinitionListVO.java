package vo;

import java.util.ArrayList;

public class RequirementDefinitionListVO {
	
	private String projectName;
	
	private ArrayList<RequirementDefinitionVO> req_def_list = new ArrayList<RequirementDefinitionVO>();
	
	public RequirementDefinitionListVO() {};
	
	
	public RequirementDefinitionListVO(String projectName, ArrayList<RequirementDefinitionVO> req_def_list) {
		super();
		this.projectName = projectName;
		this.req_def_list = req_def_list;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public ArrayList<RequirementDefinitionVO> getReq_def_list() {
		return req_def_list;
	}

	public void setReq_def_list(ArrayList<RequirementDefinitionVO> req_def_list) {
		this.req_def_list = req_def_list;
	}
	
	
	
	
	
	

}
