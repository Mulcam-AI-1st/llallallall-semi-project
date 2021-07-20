package vo;

public class RequirementDefinitionVO {
	
	private int req_def_num;

	private String req_def;

	private String req_def_desc;
	
	
	
	public RequirementDefinitionVO() {}


	public RequirementDefinitionVO(int req_def_num, String req_def) {
		super();
		this.req_def_num = req_def_num;
		this.req_def = req_def;
	}

	public RequirementDefinitionVO(int req_def_num, String req_def, String req_def_desc) {
		super();
		this.req_def_num = req_def_num;
		this.req_def = req_def;
		this.req_def_desc = req_def_desc;
	}



	public int getReq_def_num() {
		return req_def_num;
	}



	public void setReq_def_num(int req_def_num) {
		this.req_def_num = req_def_num;
	}



	public String getReq_def() {
		return req_def;
	}



	public void setReq_def(String req_def) {
		this.req_def = req_def;
	}



	public String getReq_def_desc() {
		return req_def_desc;
	}



	public void setReq_def_desc(String req_def_desc) {
		this.req_def_desc = req_def_desc;
	}


	

	
	
	

}
